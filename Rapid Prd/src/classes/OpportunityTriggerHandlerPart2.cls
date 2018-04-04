public class OpportunityTriggerHandlerPart2
{
    public static void auSetUCCFiling(Map<id,Opportunity> oldOMap,Map<id,Opportunity> newOMap)
    {
        Set<id> iSet=new Set<id>();
        List<Opportunity> oppList=new List<Opportunity>();
                
        for(id iTemp : newOMap.keyset())
        {
            if((newOMap.get(iTemp).StageName!=oldOMap.get(iTemp).StageName) && (newOMap.get(iTemp).StageName=='Closed Won'))
            {
                if(newOMap.get(iTemp).Product__c!=null)
                {
                    if((String.valueOf(newOMap.get(iTemp).Product__c).indexOf('Loan')!=-1) && (newOMap.get(iTemp).Renewal__c==false))
                        iSet.add(iTemp);
                }             
            }
        }
        if(iSet.size()>0)
        {
            for(Opportunity oppTemp : [Select id, UCC_Filing__c, UCC_Filing_Reason__c,UCC_Date__c from opportunity where id in : iSet])
            {
                oppTemp.UCC_Filing__c='Full UCC-1';
                oppTemp.UCC_Filing_Reason__c='Loan';
                oppTemp.UCC_Date__c=System.today();
                oppList.add(oppTemp);
            }
            
            if(oppList.size()>0)
            {
                try
                {
                    Database.update(oppList,false);
                }
                catch(Exception e)
                {
                    System.debug('An exception has occurred - '+e.getMessage()+'-'+e.getLinenumber());
                }
            }
        }
    }
    
    public static void sendEmailNotifcationOnSignedDeal(Map<id,Opportunity> oldOMap,Map<id,Opportunity> newOMap)
    {
        //send email notification to campaign owner(s) when a deal is signed
        
        Map<Id,Opportunity> oppMap=new Map<Id,Opportunity>(); //k=>Opp.Id, V=> Opp
        Map<String,List<String>> notificationMap=new Map<String,List<String>>();
        Map<Id,id> campaignIdMap=new Map<Id,id>();
        Set<id> userId=new Set<id>();
        

        for(Deal_Signed_Email_Notification__c dTemp : [select Partner_Channel__c,Salesforce_User_Email__c from Deal_Signed_Email_Notification__c ])
        {
            if(notificationMap.containsKey(dTemp.Partner_Channel__c.toLowercase()))
                notificationMap.get(dTemp.Partner_Channel__c.toLowercase()).add(dTemp.Salesforce_User_Email__c );
            
            notificationMap.put(dTemp.Partner_Channel__c.toLowercase(),new List<String>{dTemp.Salesforce_User_Email__c });
        }

        for(Id iTemp : newOMap.keyset())
        {
            if((newOMap.get(iTemp).Signed_Contract_Received__c!=oldOmap.get(iTemp).Signed_Contract_Received__c) && newOMap.get(iTemp).Signed_Contract_Received__c!=null)
            {
                oppMap.put(iTemp,newOMap.get(iTemp));
                campaignIdMap.put(newOMap.get(iTemp).campaignID,iTemp);
                userId.add(newOMap.get(iTemp).ownerId);
            }
        }
        
        Map<id,Campaign> allCampaign=new Map<id, Campaign>([Select name,Additional_Owner__c,Additional_Owner__r.email,type from campaign where id in :campaignIdMap.keyset() and type='Partners']);
        System.debug(allCampaign);
        
        if(oppMap.size()>0)
        {
            Map<Id,User> userMap=new Map<Id,User>([Select id,name from user where id in :userId]);
            List<Messaging.SingleEmailMessage> msgList=new List<Messaging.SingleEmailMessage>();
            
            List<EmailTemplate> eId=[Select id,HtmlValue,subject from emailtemplate where IsActive=true and developername='Signed_Contract_Notification_for_BD_team'];
            if(eId!=null && eId.size()>0)
            {
                for(Id iTemp : oppMap.keyset())
                {
                    Opportunity opp=oppMap.get(iTemp);
                    System.debug(opp.Partner_Channel__c);
                    List<String> emailAddress=new List<String>();
                    
                    if(opp.Partner_Channel__c!=null)
                    {
                        if(notificationMap.get(opp.Partner_Channel__c.toLowerCase())!=null)
                        {
                            emailAddress=notificationMap.get(opp.Partner_Channel__c.toLowerCase());
                            if(allCampaign.containsKey(opp.campaignId))
                            {
                                System.debug(opp.campaignId);
                                System.debug(allCampaign.get(opp.campaignId));
                                System.debug(allCampaign.get(opp.campaignId).Additional_Owner__c);
                                System.debug(emailAddress);
                                
                                if(allCampaign.get(opp.campaignId).Additional_Owner__c!=null)
                                    emailAddress.add(allCampaign.get(opp.campaignId).Additional_Owner__c);
                            }
                        }
                        
                        if(emailAddress.size()>0)
                        {
                            String emailBody=eId.get(0).HtmlValue.replace('contractDate', opp.Signed_Contract_Received__c.format())
                                                                  .replace('opp.Name',opp.Name)
                                                                  .replace('opp.Amount',String.valueOf(opp.amount));
                            if(allCampaign.get(opp.campaignID)!=null)
                            {
                                emailBody=emailBody.replace('opp.LeadSource',opp.leadsource)
                                                    .replace('opp.Campaign',allCampaign.get(opp.campaignID).name)
                                                    .replace('opp.Renewal',opp.renewal__c==true?'Yes':'No')
                                                    .replace('Pay_Back_Amount__c',String.valueOf(opp.Pay_Back_Amount__c))
                                                    .replace('Salesrep',userMap.get(opp.ownerID).name)
                                                    .replace('Percent_Payback__c',String.valueOf(opp.Percent_Payback__c))
                                                    .replace(']]>','');
                                
                                Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
                                msg.setSubject(eId.get(0).subject.replace('{!Opportunity.Name}',opp.Name));
                                msg.setToAddresses(emailAddress);
                                msg.setWhatId(iTemp);
                                msg.setHtmlBody(emailBody);
                                msg.setSaveAsActivity(false);
                                msgList.add(msg);
                            }
                        }
                    }   
                }
            }
            
            if(msgList.size()>0)
                Messaging.sendEmail(msgList);
        }       
    }

    public static void updateCampaignWithLatestFunded(Map<id,Opportunity> oldOMap,Map<id,Opportunity> newOMap)
    {
        Map<Id,Id> campOppMap=new Map<Id,Id>();
        List<Campaign> campList=new List<Campaign>();
        
        for(id iTemp : newOMap.keyset())
        {
            if((newOMap.get(iTemp).StageName!=oldOMap.get(iTemp).StageName) && (newOMap.get(iTemp).StageName=='Closed Won'))
            {
                //populate campaign with the latest funded deal information
                if(newOMap.get(iTemp).CampaignId!=null)
                {
                    campOppMap.put(newOMap.get(iTemp).CampaignId,iTemp);
                }   
            }
        }
        
        if(campOppMap.size()>0)
        {
            for(Campaign cTemp : [Select id,Most_Recent_Funded_Deal__c from Campaign where id in : campOppMap.keyset()])
            {
                if(campOppMap.containsKey(cTemp.id))
                {
                    cTemp.Most_Recent_Funded_Deal__c=  campOppMap.get(cTemp.id);
                    campList.add(cTemp);
                }
            }
            
            if(campList.size()>0)
                update campList;
        }
    }
}