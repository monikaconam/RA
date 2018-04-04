public class SendEmailToCampaignContact
{
    public static void sentOutEmail(List<BOOP__c> ListBoop, Map<Id,BOOP__c> OldBoopMap)
    {
        if(CheckRecursive.runOnce())
        {
            Map<Id,String> mapMarbleIdRecord = new Map<Id,String>();
            Set<Id> marbleId = new Set<Id>();
            for(BOOP__c boopTemp : ListBoop)
            {
                BOOP__c oldBoopRecord =  OldBoopMap.get(boopTemp.Id);
                if(oldBoopRecord.Status__c != boopTemp.Status__c)
                {
                    marbleId.add(boopTemp.Marble__c);
                }
            }
            if(marbleId.size() >0)
            {
                List<Marble__c> lstMarble = [Select Id,Opportunity_Reference__r.Campaign.Campaign_Contact_Email__c from Marble__c where Id IN : marbleId];
                List<String> StrList =  new List<String>();
                for(Marble__c marbleTemp : lstMarble)
                {
                    if(marbleTemp.Opportunity_Reference__r.Campaign.Campaign_Contact_Email__c != null){
                        mapMarbleIdRecord.put(marbleTemp.Id,marbleTemp.Opportunity_Reference__r.Campaign.Campaign_Contact_Email__c);
                    }
                }
                
                String msgbody ='';
                Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    
                for(BOOP__c boopTemp : ListBoop)
                {
                   
                    BOOP__c oldBoopRecord =  OldBoopMap.get(boopTemp.Id);
                    if(oldBoopRecord.Status__c != boopTemp.Status__c && mapMarbleIdRecord.ContainsKey(boopTemp.Marble__c))
                    {
                        system.debug('mapMarbleIdRecord.get(boopTemp.Marble__c)@@@'+mapMarbleIdRecord.get(boopTemp.Marble__c));
                        
                        String contactEmail = mapMarbleIdRecord.get(boopTemp.Marble__c);
                        
                        for(String str : contactEmail.split(';')){
                             
                            String emailRegex = '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})';
                            Pattern MyPattern = Pattern.compile(emailRegex);
                        
                            Matcher MyMatcher = MyPattern.matcher(str);
                        
                            if(MyMatcher.matches()){
                                StrList.add(str);
                            }  
                        }
                        system.debug('=======StrList.size()'+StrList.size());
                        if(mapMarbleIdRecord.get(boopTemp.Marble__c) != Null && mapMarbleIdRecord.get(boopTemp.Marble__c) != '' && StrList.size() > 0)
                        {
                            //message.toAddresses = new String[] { mapMarbleIdRecord.get(boopTemp.Marble__c)};
                            system.debug('=========insideemail');
                            message.setToAddresses(StrList);
                            message.subject = 'BOOP status has been changed';
                            msgbody +='Hi,<br/>';
                            msgbody += 'BOOP Status is updated from <b>'+oldBoopRecord.Status__c+'</b> to <b>'+boopTemp.Status__c+'</b><br/>';
                            msgbody += 'View BOOP <a href=https://na33.salesforce.com/'+boopTemp.Id+'>click here.</a>';
                            message.setHtmlBody(msgbody);
                            if(msgbody != Null && msgbody != '')
                            {
                                messages.add(message);
                            }
                            
                        }
                        system.debug('======messages'+messages);
                    }
                }
                if(messages.size() > 0)
                {
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                }
            }
        }
    }
    
    public static void emailValidation(List<BOOP__c> ListBoop, Map<Id,BOOP__c> OldBoopMap)
    {
        
        Map<Id,String> mapMarbleIdRecord = new Map<Id,String>();
        Set<Id> marbleId = new Set<Id>();
        for(BOOP__c boopTemp : ListBoop)
        {
            BOOP__c oldBoopRecord =  OldBoopMap.get(boopTemp.Id);
            if(oldBoopRecord.Status__c != boopTemp.Status__c)
            {
                marbleId.add(boopTemp.Marble__c);
            }
        }
        if(marbleId.size() >0)
        {
            List<Marble__c> lstMarble = [Select Id,Opportunity_Reference__r.Campaign.Campaign_Contact_Email__c from Marble__c where Id IN : marbleId];
            for(Marble__c marbleTemp : lstMarble)
            {
                mapMarbleIdRecord.put(marbleTemp.Id,marbleTemp.Opportunity_Reference__r.Campaign.Campaign_Contact_Email__c);
            }
            for(BOOP__c boopTemp : ListBoop)
            {
               
                BOOP__c oldBoopRecord =  OldBoopMap.get(boopTemp.Id);
                if(oldBoopRecord.Status__c != boopTemp.Status__c && mapMarbleIdRecord.ContainsKey(boopTemp.Marble__c))
                {
                    if(mapMarbleIdRecord.get(boopTemp.Marble__c) == Null || mapMarbleIdRecord.get(boopTemp.Marble__c) == '')
                    {
                        boopTemp.addError('In order to modify the status, please make sure that Marble should have Primary contact email.');
                    }
                }
            }
        }
    }
}