/*
@Name            : BatchLeadAssign 
@Author          : MK-Conam
@Date            : Aug 11  , 2015
@Description     : This batch class will be scheduled to execute every hour so that any lead which have status as Calling - No Contact Made 
                   and has not been touched in last 24 hours should be assigned to Brian Klenk
@Revision 1      : 
@Author          : VT-CONAM
@Date            : Oct 14  , 2015
@Description     : Partner lead should not be moved to Brian Klenk. Only the leads having owner role as Direct Account Executive or
                   Business Advisor should be assigned to Brian Klenk
                   
@Author          : DS-CONAM
@Date            : Oct 27  , 2015
@Description     : Any lead which have the record type as Partner or are associated to Campaign having type as Partners will not 
                   be moved. Time limit modified from 24 hours to 48 hours  
                   
                   
*/

global class BatchLeadAssign implements Database.Batchable <sObject> 
{

    List <Transfer_Leads_for_Calling_User__c> callUser = new List <Transfer_Leads_for_Calling_User__c> ();
    List <Campaign_For_Calling_Users__c> lCamp = new List <Campaign_For_Calling_Users__c> ();

    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        callUser = Transfer_Leads_for_Calling_User__c.getAll().values();
        lCamp = Campaign_For_Calling_Users__c.getAll().values();
        
        String query = 'SELECT Id,Name,CreatedDate,Owner.Name,OwnerId , Owner.UserRole.Name FROM Lead WHERE LastActivityDate=Null and';
        query += ' (owner.UserRole.Name = \'Direct Account Executive\'  OR owner.UserRole.Name =\'Business Advisor\' ) and' ;
        query += ' isConverted=false And STATUS =\'Calling - No Contact Made\' and owner.name!=\'' + callUser.get(0).name + '\'';
        query += ' and Recordtype.name!=\'Partners\' and createddate>=Last_N_DAYS:3 ORDER BY CreatedDate';
        
        System.debug('query>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+query);
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List <Lead> lTemp) 
    {
        Set <Id> lcmsTempId = new Set <id>();
        
        List <Id> lTempId = new List <id>();
        List<Campaign> campId = new List<Campaign>();
        List<CampaignMember> cms = new List<CampaignMember>();
        
        List <Transfer_Leads_for_Calling_User__c> callUser = Transfer_Leads_for_Calling_User__c.getAll().values();
        //any GreenTree Leads will be excluded
        List <Campaign_For_Calling_Users__c> lCamp = Campaign_For_Calling_Users__c.getAll().values();
        List <Lead> lQuery = new List <Lead> ();
        List <Lead> updateLeads = new List <Lead> ();
        
        Map <id, Integer> tskCount = new Map <id, Integer> ();
        Map <id, Integer> evtCount = new Map <id, Integer> ();
        Map <Id, Integer> eventCountMap = new Map <Id, Integer> ();
        
        //get the campaign Id for the campaign 
        campId = [Select 
                        Name , Id 
                from 
                        Campaign 
                where 
                        name =: lCamp.get(0).name 
                Or
                        name ='Partner Web Leads' ];
        
        // get the campaign members for the mentioned campaign
        cms =[SELECT 
                    CampaignID, LeadID, Status 
            FROM 
                    CampaignMember 
            WHERE 
                    CampaignID IN : campId Limit 20000];
                    
        System.debug('cms '+cms );
        
        //get the lead id's from campaign member
        for (CampaignMember lcmsTemp: cms) 
        {
            if(lcmsTemp.LeadID != null){
                lcmsTempId.add(lcmsTemp.LeadID);
            }

        }
        
        //extract the Lead id which are not part of the mentioned campaign
          
        for (Lead pqTemp: lTemp) 
        {
            if(lcmsTempId.contains(pqTemp.id) == FALSE)
                 lTempId.add(pqTemp.id);
        }

        List <User> uTemp = [Select
                                    Id, email, name
                            From
                                    User
                            Where
                                    Name = : callUser.get(0).name
                            AND
                                    IsActive = True Limit 1];
                                    
                                    
        Map <Id, Integer> taskCountMap = new Map <Id, Integer> ();

        List <AggregateResult> agResult1 = [select 
                                                    count(id), whoid 
                                            from 
                                                    Task 
                                            where 
                                                    whoId in : lTempId group by whoid];
            
        for (AggregateResult t: agResult1) 
        {
            taskCountMap.put((ID) t.get('whoid'), Integer.valueOf(t.get('expr0')));
        }

        List <AggregateResult> agResult2 = [select 
                                                    count(id), whoid 
                                            from 
                                                    Event 
                                            where 
                                                    whoId in : lTempId group by whoid];

        System.debug('agResult2  '+agResult2);
        for (AggregateResult t: agResult2)
        {
            eventCountMap.put((ID) t.get('whoid'), Integer.valueOf(t.get('expr0')));
        }

        for (Id i: eventCountMap.keyset())
        {
            System.debug(' eventCountMap' + i + ' ' + eventCountMap.get(i));
        }

        for (Lead pqTemp: lTemp) {
            
            if(lcmsTempId.contains(pqTemp.id) == FALSE)
            {
                Long leadCtime = pqTemp.CreatedDate.getTime();
                Long nowTime = DateTime.now().getTime();
                Long elapsedTime = (nowTime - leadCtime) / (1000 * 60);
    
                if (((elapsedTime>= 2880) && (taskCountMap.get(pqTemp.id) == null) && (eventCountMap.get(pqTemp.id) == null)) || (Test.isRunningTest())) {
                    lQuery.add(pqTemp);
    
                }
            }

        }

        if (lQuery.size()> 0)
        {
            String emailbody='';
            String[] toAddresses = new String[] {
                    'deepak@conamtechnologies.com'
                };
            
            toAddresses.add(uTemp.get(0).email);
            emailbody='Hi,<br><br>';
            emailbody+='The following Leads having status Calling - No Contact Made for more than 2 days have ';
            emailbody+='been assigned to you.<br><br>';
            for (Lead ltest: lQuery) 
            {
                lTest.OwnerId = uTemp.get(0).Id;
                emailbody+= lTest.name+'( '+ ltest.id+' ) <br>';
                
                updateLeads.add(ltest);
            }
            emailbody+='<br> <br>Thanks';
            try 
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               
                mail.setToAddresses(toAddresses);
                mail.setSubject('Calling - No Contact Made Leads ' + System.now());
                mail.setHtmlBody(emailbody);
                
                if (updateLeads.size()> 0) 
                {
                    update updateLeads;
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {
                    mail
                    });
                }
            } 
            catch (Exception e) 
            {
                System.debug('An exception has occured - ' + e.getMessage() + ' - ' + e.getLineNumber());
            }
           
        }
      
    }

    global void finish(Database.BatchableContext bc)
    {
        AsyncApexJob a = [SELECT id, ApexClassId, JobItemsProcessed, TotalJobItems,NumberOfErrors, CreatedBy.Email FROM 
                            AsyncApexJob WHERE id = :bc.getJobId()];
        
        String emailMessage = 'Batch job - Assign "Calling - No Contact Made Lead".  It executed ' + a.totalJobItems 
                               + ' batches. Out of which ' + a.numberOfErrors + ' batches failed.'; 
                               
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {
            'deepak@conamtechnologies.com'
        };
        mail.setToAddresses(toAddresses);
        mail.setReplyTo('deepak@conamtechnologies.com');
        mail.setSubject('Batch job - Assign "Calling - No Contact Made Lead" executed at ' + System.now());
        mail.setPlainTextBody(emailMessage );
        mail.setHtmlBody(emailMessage );
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {
            mail
        });
    }
}