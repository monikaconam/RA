/*
@Name            : BatchLeadNotificationAfter30Mins 
@Author          : DS-Conam
@Date            : Oct 27, 2015
@Description     : This class will filter out leads which have status 'Initial Call Needed' even after 30 mins of the creation 
                   and are assigned to the user(s) mentioned in the custom setting . The batch will be scheduled to execute from
                   9AM - 7 PM every other minute from Monday to Friday. Notifications will not be repeated i.e notification will
                   not be sent twice for the same lead.

@Note :  change to email for production
*/
global class BatchLeadNotificationAfter30Mins implements Database.Batchable <sObject>, Database.Stateful 
{
    global String emailBody;
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        emailBody='';
        List <EmailLeadswithInitialCallNeeded__c > callUser = EmailLeadswithInitialCallNeeded__c.getAll().values();
        List<String> query=new List<String>();
        String queryString='';
        String str='SELECT Id, Name, Company ,Owner.Name, OwnerId, CreatedDate FROM Lead WHERE Email_Sent__c=false and isConverted=false ';
        str+=' And STATUS =\'Initial Call Needed\' and Recordtype.name!=\'Partners\' and createddate>=Last_N_DAYS:2 and (';
        query.add(str);
        
        System.debug('Custom Setting Size >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+callUser.size());
        
        if(callUser.size()>0)
        {
            for(EmailLeadswithInitialCallNeeded__c eTemp : callUser)
            {
                query.add(' owner.name!=\''+eTemp.name+'\' ');
            }

            queryString=query.get(0) + query.get(1) ;
            
            if(callUser.size()>1)
            {
                for(Integer i=1;i<callUser.size(); i++)
                {
                    queryString+=' Or owner.name!=\''+callUser.get(i).name+'\' ';
                }
            }
            
            queryString+=') Order by CreatedDate ';
            System.debug('query>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+queryString);
        }
        else
        {
            System.debug('No User defined in the Custom Setting Email Leads with Initial Call Needed');
           
        }
         
        return Database.getQueryLocator(queryString);
    }

    global void execute(Database.BatchableContext BC, List <Lead> lList) 
    {
        System.debug('>>>>>>>>>>> lList '+lList.size());
        Set<Id> lID= new Set<Id>();
        List <EmailLeadswithInitialCallNeeded__c> callUser = EmailLeadswithInitialCallNeeded__c.getAll().values();
        List<Lead> updateList=new List<Lead>();
        
        List<String> userName=new List<String>();
        
        for(EmailLeadswithInitialCallNeeded__c eTemp : callUser)
        {
            userName.add(eTemp.name);
        }
               
        Map<Id, User> userMap=new Map<Id, User>([Select 
                                                            id, email
                                                    from
                                                            User
                                                    where 
                                                            name in :userName
                                                    and
                                                            isActive=true]);
        if(userMap.size()>0)
        {
                
            for(Lead lTemp : lList)
            {
                
                Long leadCtime = lTemp.CreatedDate.getTime();
                Long nowTime = DateTime.now().getTime();
                Long elapsedTime = (nowTime - leadCtime) / (1000 * 60);

                System.debug('>>>> '+lTemp.id +'  '+ elapsedTime);
                if(elapsedTime>=30 || Test.isRunningTest())
                {
                    lTemp.Email_Sent__c=true;
                    emailbody+=lTemp.name +'( ' +lTemp.id +' ) is having status as Initial Call Needed <br/><br/>';
                    updateList.add(lTemp);
                }
                
            }
            try
            {
                update updateList;
            }
            Catch(Exception e)
            {
                System.debug('An exception has occurred - ' +e.getLineNumber()+' - '+e.getMessage());
            }
        }
        else
        {
            System.debug('No matching user found');
        }
    }
    
    global void finish(Database.BatchableContext BC) 
    {
        List<String> toAddresses=new List<String>();
        List<Messaging.SingleEmailMessage> mailList=new List<Messaging.SingleEmailMessage>();
        try
        {
            if(emailBody!=null && emailBody!='')
            {
                List <EmailLeadswithInitialCallNeeded__c> callUser = EmailLeadswithInitialCallNeeded__c.getAll().values();
                List<String> userName=new List<String>();
                for(EmailLeadswithInitialCallNeeded__c eTemp : callUser)
                {
                    userName.add(eTemp.name);
                }
                Map<Id, User> userMap=new Map<Id, User>([Select 
                                                                id, email
                                                        from
                                                                User
                                                        where 
                                                                name in :userName
                                                        and
                                                                isActive=true]); 
                for(Id iTemp : userMap.keyset())
                {
                    toAddresses.add(userMap.get(iTemp).email);
                }
  
                toAddresses.add('deepak@conamtechnologies.com');                                                 
                Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
                mail.setSubject('List of Lead with status Initial Call Needed at '+ System.now());
                mail.setHtmlBody(emailbody);
                mail.setToAddresses(toAddresses);
                mailList.add(mail);
                Messaging.sendEmail(mailList);
            }
        }
        catch(Exception e)
        {
            System.debug('An exception has occurred - ' +e.getLineNumber()+' - '+e.getMessage());
        }

        
    }
}