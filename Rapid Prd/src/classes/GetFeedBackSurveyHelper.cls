/*
Modified Date : 10/17/2016
Modified Line : Added validation at line 27,35 
Modified Purpose : Send the Reminder mail after 15 days if no response has been returned for client funding Survey and 90-Days post funding survey
*/

public class GetFeedBackSurveyHelper
{   
    public static Boolean preventGetFeedBackSurveyHelperFromFire = False;
    static String templateName;
    public static void onGenerateSurvey(Map<id,Opportunity> oldOMap, Map<id,Opportunity> newOMap)
    {
        Set<id> oppIDSet_1Day=new Set<id>();
        Set<id> oppIDSet_90Day=new Set<id>();
        Set<id> oppIDSet_declined=new Set<id>();
        
        for(Id iTemp : newOMap.keyset()){
            System.debug('1 ==>old '+oldOMap.get(iTemp).Send_Client_Funding_Survey_On__c);
            System.debug('1 ==>new '+newOMap.get(iTemp).Send_Client_Funding_Survey_On__c);
            
            System.debug('2 ==>old '+oldOMap.get(iTemp).Send_90_Day_Post_Funding_Survey_On__c );
            System.debug('2 ==>new '+newOMap.get(iTemp).Send_90_Day_Post_Funding_Survey_On__c );
            
            System.debug('3 ==>old '+oldOMap.get(iTemp).Send_Declined_Survey_On__c);
            System.debug('3 ==>new '+newOMap.get(iTemp).Send_Declined_Survey_On__c);
        
            if(((oldOMap.get(iTemp).Send_Client_Funding_Survey_On__c ==null && newOMap.get(iTemp).Send_Client_Funding_Survey_On__c !=null) || 
                (oldOMap.get(iTemp).Client_Funding_Survey__c != newOMap.get(iTemp).Client_Funding_Survey__c && 
                newOMap.get(iTemp).Client_Funding_Survey__c == True && preventGetFeedBackSurveyHelperFromFire == False) ) &&
                newOMap.get(iTemp).StageName=='Closed Won' && newOMap.get(iTemp).Amount > 0  && newOMap.get(iTemp).Funded_by_WC__c !=  null )
                {
                    templateName=newOMap.get(iTemp).Client_Funding_Survey__c==false?'NPS_At_Funding_Survey_Email_First':'NPS_At_Funding_Survey_Email_Second';
                    oppIDSet_1Day.add(iTemp );
                }
            
            if(((oldOMap.get(iTemp).Send_90_Day_Post_Funding_Survey_On__c==null && newOMap.get(iTemp).Send_90_Day_Post_Funding_Survey_On__c!=null) || 
                (oldOMap.get(iTemp).X90_Days_Post_Funding_Survey__c !=  newOMap.get(iTemp).X90_Days_Post_Funding_Survey__c && 
                newOMap.get(iTemp).X90_Days_Post_Funding_Survey__c == True && preventGetFeedBackSurveyHelperFromFire == False)) &&
                newOMap.get(iTemp).StageName=='Closed Won' &&  newOMap.get(iTemp).Amount > 0 && newOMap.get(iTemp).Funded_by_WC__c !=  null )
                {
                    templateName=newOMap.get(iTemp).X90_Days_Post_Funding_Survey__c==false?'NPS_90_Day_Survey_Post_Funding_First':'NPS_90_Day_Survey_Post_Funding_Second';
                    oppIDSet_90Day.add(iTemp);
                }
                
            if((oldOMap.get(iTemp).Send_Declined_Survey_On__c==null && newOMap.get(iTemp).Send_Declined_Survey_On__c!=null) &&
                (newOMap.get(iTemp).StageName=='Unqualified - Will Reconsider Later' || newOMap.get(iTemp).StageName=='Unqualified' || 
                newOMap.get(iTemp).StageName=='Declined'|| newOMap.get(iTemp).StageName=='Declined - Pending Mgmt Review'))
                {
                    oppIDSet_declined.add(iTemp);
                }         
        }
        System.debug('oppIDSet_1Day ' +oppIDSet_1Day );
        System.debug('oppIDSet_90Day ' +oppIDSet_90Day );
        System.debug('oppIDSet_declined ' +oppIDSet_declined );
        System.debug('templateName ' +templateName);
        if(oppIDSet_1Day.size()>0)
            onSendSurveyMail(oppIDSet_1Day,templateName);
            
        if(oppIDSet_90Day.size()>0)
            onSendSurveyMail(oppIDSet_90Day,templateName);
        
        if(oppIDSet_declined.size()>0)
            onSendSurveyMail(oppIDSet_declined,'NPS_Funding_Declined_Survey');
    }
    
    private static void onSendSurveyMail(Set<id> oppIDSet , String eTemplateName)
    {
        try
        {
            Set<id> conIDSet=new Set<id>();
            Map<id,Id> oppConMap=new Map<id,Id>();
            Map<id,Contact> conEmailOptOutMap=new Map<id,Contact>();
            List<Messaging.SingleEmailMessage> mailList=new List<Messaging.SingleEmailMessage>();
            System.debug('======oppIDSet ' +oppIDSet );
            List<OpportunityContactRole> ocrList = [Select id, contactId,OpportunityId from OpportunityContactRole where OpportunityId in : oppIDSet and IsPrimary=true];
            
            if(ocrList.size()==0)
            {
                ocrList=[Select id, contactId,OpportunityId from OpportunityContactRole where OpportunityId in : oppIDSet order by createddate desc];
            }
            
            for(OpportunityContactRole  opCR : ocrList){
                conIDSet.add(opCR.contactID);
                oppConMap.put(opCR.OpportunityId ,opCR.contactID);
            }
            
            if(conIDSet.size()>0){
                List<String> oppSurveyList=new List<String>();
                List<Opportunity> oppOwnerUpdate=new List<Opportunity>();
                List<Contact> conList = [Select id,HasOptedOutOfEmail,email,ownerid from Contact where id in : conIDSet];
                
                for(Contact cTemp : conList){
                    conEmailOptOutMap.put(cTemp.id, cTemp);
                }
                
                List<EmailTemplate> emailTemplate=[Select 
                                                         id, Body, HtmlValue, subject,developername
                                                         
                                                     from
                                                             emailtemplate
                                                             
                                                     where
                                                             developername=: eTemplateName
                                                     and
                                                            isactive=true Limit 1];
                                                            
                                                     
                                                            
                ID emailAddressId=[Select 
                                        id, displayname, address 
                                    from 
                                        OrgWideEmailAddress
                                    where 
                                        displayname='RapidAdvance' Limit 1].id;
                               
                for(Id idKey : oppConMap.keyset()){
                    if(conEmailOptOutMap.get(oppConMap.get(idKey)).HasOptedOutOfEmail!=true || conEmailOptOutMap.get(oppConMap.get(idKey)).HasOptedOutOfEmail==null){
                        if(emailTemplate.size()>0){
                            if(conEmailOptOutMap.get(oppConMap.get(idKey)).email!=null && conEmailOptOutMap.get(oppConMap.get(idKey)).email!=''){
                                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                                msg.setHtmlBody(emailTemplate.get(0).HtmlValue.replace('{opp.id}',idKey));
                                msg.setSubject(emailTemplate.get(0).subject);
                                
                                if(emailAddressId!=null)
                                    msg.setOrgWideEmailAddressId(emailAddressId);
                                
                                msg.setWhatId(idKey);
                                msg.setSaveAsActivity(true);
                                msg.setOptOutPolicy('FILTER');
                                msg.setTargetObjectID(oppConMap.get(idKey));
                                msg.setReplyTo('customerservice@rapidadvance.com');
                                mailList.add(msg);
                            }
                        }
                    }
                }
                /*
                  Sending email in testing blocked due to Known issue
                  https://success.salesforce.com/issues_view?id=a1p300000008aRlAAI
                */
                if(!Test.isRunningTest())
                {
                    System.debug(mailList);
                    if(mailList.size()>0)
                        Messaging.sendEmail(mailList);
                }
            }
         }
         catch(Exception e)
         {
             System.debug('An exception has occurred: '+ e.getMessage() + ' - ' + e.getLineNumber());
         }
    }
}