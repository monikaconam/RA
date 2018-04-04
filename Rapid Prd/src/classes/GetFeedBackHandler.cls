public  class GetFeedBackHandler
{    
    public static void getFeedbackList(List<GetFeedback_Survey__c> getFeedbackList )
    {
        List<Lead> leadList = new List<Lead>();
        try{
            Set<Id> opportunityId = new set<Id>();
            Set<String> companyName =  new Set<String>();
            Set<String> setFirstName =  new Set<String>();
            Set<String> setLastName =  new Set<String>();
            Set<String> setName =  new Set<String>();
            
            ID fSurvey=Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Funding Survey').getRecordTypeId();
            ID pfSurvey=Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Client Service Survey').getRecordTypeId();           
            
            for(GetFeedback_Survey__c  getSurvey : getFeedbackList ){
                if(getSurvey.RecordTypeID==fSurvey || getSurvey.RecordTypeID==pfSurvey){
                    if(getSurvey.opportunity__c != null && getsurvey.Reference_Name__c != null && 
                            getsurvey.Reference_Company_Name__c != null && getsurvey.Reference_Phone_Number__c != null){
                        
                        opportunityId.add(getSurvey.opportunity__c);
                        companyName.add(getSurvey.Reference_Company_Name__c);
                        
                        if(getSurvey.Reference_Name__c.contains(' ')){
                            setFirstName.add(getSurvey.Reference_Name__c.substringBefore(' '));
                            setLastName.add(getSurvey.Reference_Name__c.substringAfterLast(' '));
                        }
                        else{
                            setName.add(getSurvey.Reference_Name__c);
                        }
                    }
                }
            }
                
           if(opportunityId.size() > 0)
           {
               
               Map<Id,String> opportunityContactRoleMap = new Map<Id,String>();
               List<Campaign> campaignList = new List <Campaign>();
               List<CampaignMember> campaignMemList = new List<CampaignMember>();
               system.debug(opportunityId );
               
               Map<id,Opportunity> opportunityMap = new Map<id,Opportunity>([SELECT Id,Name,Accountid,Account.Name,OwnerId,Owner.IsActive,owner.email,
                                                                           (SELECT IsPrimary,Contactid,Contact.Name FROM OpportunityContactRoles where 
                                                                           IsPrimary = true)  FROM Opportunity WHERE Id in : opportunityId]);
               campaignList = [SELECT Id FROM Campaign WHERE Name = 'Referral Survey'];
               
               if(campaignList.isEmpty()){
                  Campaign camp = new Campaign();
                  camp.name = 'Referral Survey';
                  camp.Type = 'Rapid Advance Internal Campaign';
                  campaignList.add(camp);
                  if(!campaignList.isEmpty())
                      insert campaignList;
               }
                 
               for(opportunity opp : opportunityMap.values()){
                    for(OpportunityContactRole oppConRole : opp.OpportunityContactRoles){
                        opportunitycontactroleMap.put(opp.id,oppConRole.contact.Name);
                    }
                }
                
                List<Lead> leadListSize= [SELECT Id,Name,Company FROM  Lead WHERE(((FirstName =: setFirstName  OR  FirstName =: setLastName) AND (LastName =: setLastName OR LastName =: setFirstName))OR Name =: setName)  and  Company =: companyName];
                EmailTemplate eTemp=[Select id, body, subject from EmailTemplate where developername='Referral_Lead_Creation_Alert' and isactive=true];
                List <Messaging.SingleEmailMessage> mailList = new List <Messaging.SingleEmailMessage> ();
                Map<String,GetFeedback_Survey__c > ldSurveymap=new Map<String,GetFeedback_Survey__c > ();
                
                for(GetFeedback_Survey__c getsurvey : getFeedbackList )
                {
                    if((getsurvey.Reference_Name__c != opportunitycontactroleMap.get(getsurvey.opportunity__c)) && leadListSize.size() < 1 )
                    {
                        lead ld = new lead();
                        if(getsurvey .Reference_Name__c.contains(' '))
                        {
                            ld.FirstName = getsurvey .Reference_Name__c.substringBefore(' ');
                            ld.lastName =  getsurvey .Reference_Name__c.substringAfterLast(' ');
                        }
                        else
                        {
                            ld.lastName =  getsurvey .Reference_Name__c;
                        }
                        ld.Company = getsurvey.Reference_Company_Name__c;
                        ld.Phone  =getsurvey.Reference_Phone_Number__c;
                        ld.LeadSource = 'Referral';
                
                        if(opportunityMap.get(getsurvey.opportunity__c).accountid != null){
                            ld.Referral_Merchant_ID__c =opportunityMap.get(getsurvey.opportunity__c).Accountid;
                            ld.Referral_Merchant_Name__c = opportunityMap.get(getsurvey.opportunity__c).Account.Name;
                        }
                        
                        if(opportunityMap.get(getsurvey.opportunity__c).owner.isactive = true){
                            ld.ownerid = opportunityMap.get(getsurvey.opportunity__c).OwnerId;
                        }
                        
                        ld.Campaign_Name_Upload__c='Referral Survey';
                        ldSurveymap.put(ld.Company.toLowerCase(),getsurvey);                        
                        
                        leadList.add(ld);
                    }
                }
                
                if(leadList.size() > 0 )
                {
                    insert leadList;
                }
                
                for(Lead lTemp : leadList)
                {
                    Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                    String emailBody=eTemp.body.replace('[Clients Name]', lTemp.Company);
                    Id surveyId=ldSurveymap.get(lTemp.Company.toLowerCase()).id;
                    Id oppId=ldSurveymap.get(lTemp.Company.toLowerCase()).opportunity__c;
                    String urlx=URL.getSalesforceBaseUrl().toExternalform() +'/'+surveyId;
                    emailBody=emailBody.replace('[Survey referral information]',urlx);
                    emailBody=emailBody.replace('[Original Salesforce Console Link]','https://cs14.salesforce.com/console?tsid=02u390000013QqI/'+lTemp.id);
                    msg.setSubject(eTemp.subject);
                    msg.setHtmlBody(emailBody);
                    msg.setSaveAsActivity(false);
                    msg.setToAddresses(new List<String>{opportunityMap.get(oppId).owner.email});
                    mailList.add(msg);
                }
                
                Messaging.sendEmail(mailList);
                
                if(!leadList.isEmpty())
                {
                    for(lead ld : leadList ){
                        CampaignMember campMem = new CampaignMember();
                        campMem.campaignid = campaignList.get(0).Id;
                        campMem.leadid = ld.id;
                        campaignMemList.add(campMem);
                    }
                    if(campaignMemList.size() > 0)
                        insert campaignMemList;
                }
            }
        }
        catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage()+'-'+e.getLineNumber());   
        }
    }
}