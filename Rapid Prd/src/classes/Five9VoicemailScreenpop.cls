@RestResource(urlMapping='/F9VoiceMail/*')
global class Five9VoicemailScreenpop {
    @httpGet
    global static string leadCreater(){
        string ani = RestContext.request.params.get('ani');       
        string dnis = RestContext.request.params.get('dnis');       
        string leadSource = RestContext.request.params.get('leadSource');       
        string company = RestContext.request.params.get('company');       
        string lastName = RestContext.request.params.get('lastName');       
        string status = RestContext.request.params.get('status');       
        string ownerId = RestContext.request.params.get('ownerId');       
        
        system.debug('ani'+ ani);
        List<List<SObject>> queryData =[FIND :ani IN PHONE FIELDS RETURNING Account (Id, Name), Contact(Id, Name), Opportunity(Id, Name), Lead(Id, Name)];
        system.debug(queryData);
        if(queryData[3].size()==0 && queryData[0].size()==0 && queryData[1].size()==0 && queryData[2].size()== 0){ // empty  all
            try{
                
                
                Lead newLead = new Lead();
                newLead.LeadSource = leadSource;
                newLead.Company =company;
                newLead.LastName = lastName;
                if(ani != NULL)
                    newLead.phone = ani;
                
                Schema.PicklistEntry[] statuses = Lead.fields.Status.getDescribe().getpicklistvalues();
                for(Schema.PicklistEntry st: statuses)//set status to inital call needed
                {
                    if(st.isActive() && st.getValue() == status)
                    {
                        newLead.Status = st.getValue();
                        break;
                    }
                }
                List<User> sentOwner =[SELECT name FROM User where  id =:ownerId];
                if(sentOwner.size()>0)
                {
                    newLead.OwnerId = ownerId;
                }
                else
                {
                    ApexClass apexClassOwner =[SELECT Name, LastModifiedBy.id, LastModifiedDate FROM ApexClass WHERE name ='Five9VoicemailScreenpop' limit 1];
                    newLead.OwnerId = apexClassOwner.LastModifiedBy.id;
                }
                
                insert newLead;
                createCampaignMember(newLead.id,dnis);
                
            }
            catch(Exception ex)
            {
                sendEmail(ex.getStackTraceString());
                return ex.getStackTraceString();//'FAILURE';
            }    
            
            
        }
        else if((queryData[3].size()==1 && queryData[0].size()==0 && queryData[1].size()==0 && queryData[2].size()== 0) || (queryData[3].size()== 0 && queryData[0].size()==0 && queryData[1].size()==1 && queryData[2].size()== 0)) //1 lead and nothing else  or 1 contact  and nothing else
        {
            if(dnis != NULL)
            {
                createCampaignMember(((List<Lead>)queryData[3])[0].id,dnis);    
            }            
        }
        return 'SUCCESS';
    }  
    
    
    static void sendEmail(string bodyItem){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        Five9VoicemailScreenpopSettings__c five9VoiceMailScreenpopSetting = Five9VoicemailScreenpopSettings__c.getOrgDefaults();
        message.toAddresses = new String[] { five9VoiceMailScreenpopSetting.Salesforce_User_Email__c};
            Organization currentOrg =[select name from Organization limit 1]; 
        message.subject = 'Five9 Voicemail Lead Creation Failure for Salesforce Org :: ' +currentOrg.Name;
        message.plainTextBody ='A connector for call session Id was received with following error :: '+ bodyItem;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        if (results[0].success) 
        {
            System.debug('The email was sent successfully.');
        } 
        else 
        {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
    }
    public static void createCampaignMember(string leadId,string dnis){
        System.debug('Looking up Campaign for DNIS: '+dnis);
        String[] dp =dnis.split('');
        
        System.debug('formatted DNIS: '+dp);
        String formattedDNIS = '('+dp[0]+dp[1]+dp[2]+') '+dp[3]+dp[4]+dp[5]+'-'+dp[6]+dp[7]+dp[8]+dp[9];
        System.debug('formatted DNIS: '+formattedDNIS);
        Campaign[] clist = [SELECT Id FROM Campaign WHERE Five9_DNIS__C IN (:dnis, :formattedDNIS) LIMIT 1];
        System.debug('clist size: '+clist.size());
        if(clist.size() == 1)
        {
            System.debug('Campaign: '+clist[0]);
            CampaignMember[] cmlist = [SELECT id FROM campaignMember WHERE leadId = :leadId];
            if(cmlist.size()==0)
            {
                CampaignMember cm = new CampaignMember();
                cm.LeadId = leadId;
                cm.CampaignId = clist[0].Id;
                insert cm;  
            }            
        }        
    }    
}