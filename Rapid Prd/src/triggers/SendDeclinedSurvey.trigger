trigger SendDeclinedSurvey on Opportunity ( AFTER update) {

    if(Trigger.isAfter)
    {
        Set<id> oppIDSet=new Set<id>();
        Map<id,Opportunity> oppMap=new Map<id,Opportunity>();
        for(Opportunity opp : Trigger.new)
        {
            System.debug(Trigger.oldMap.get(opp.id).Send_Declined_Survey_On__c);
            System.debug(opp.Send_Declined_Survey_On__c);
            if(((Trigger.oldMap.get(opp.id).Send_Declined_Survey_On__c!=opp.Send_Declined_Survey_On__c) &&
                opp.Send_Declined_Survey_On__c!=null) &&(opp.StageName=='Unqualified – Will Reconsider Later' || 
                opp.StageName=='Unqualified' || opp.StageName=='Declined'|| opp.StageName=='Declined - Pending Mgmt Review'))
            {
                oppIDSet.add(opp.id);
                oppMap.put(opp.Id, opp);
            }
        }
        
        if(oppIDSet.size()>0)
        {
            Set<id> conIDSet=new Set<id>();
            Map<id,Id> oppConMap=new Map<id,Id>();
            Map<id,Contact> conEmailOptOutMap=new Map<id,Contact>();
            
            for(OpportunityContactRole  opCR : [Select id, contactId,OpportunityId from OpportunityContactRole where OpportunityId in : oppIDSet])
            {
                conIDSet.add(opCR.contactID);
                oppConMap.put(opCR.OpportunityId ,opCR.contactID);
    
            }
            
            if(conIDSet.size()>0)
            {
                
                List<String> oppSurveyList=new List<String>();
                List<Opportunity> oppOwnerUpdate=new List<Opportunity>();
                for(Contact cTemp : [Select id,HasOptedOutOfEmail,email from Contact where id in : conIDSet])
                {
                    conEmailOptOutMap.put(cTemp.id, cTemp);
                }
                
                List<EmailTemplate> emailTemplate=[Select 
                                                         id, Body, HtmlValue, subject
                                                         
                                                     from
                                                             emailtemplate
                                                             
                                                     where
                                                             developername='Funding_Declined_Survey'
                                                     and
                                                             isactive=true Limit 1];
                ID emailAddressId=[Select 
                                        id, displayname, address 
                                    from 
                                        OrgWideEmailAddress
                                    where 
                                        displayname='RapidAdvance' Limit 1].id;
                                        
                for(Id idKey : oppConMap.keyset())
                {
                    System.debug((oppConMap.get(idKey)));
                    System.debug(conEmailOptOutMap.get(oppConMap.get(idKey)));
                    if(conEmailOptOutMap.get(oppConMap.get(idKey)).HasOptedOutOfEmail!=true || conEmailOptOutMap.get(oppConMap.get(idKey)).HasOptedOutOfEmail==null)
                    {
                        System.debug(emailTemplate.size());
                        if(emailTemplate.size()>0)
                        {
                            if(conEmailOptOutMap.get(oppConMap.get(idKey)).email!=null && conEmailOptOutMap.get(oppConMap.get(idKey)).email!='')
                            {
                                
                                Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
                                msg.setHtmlBody(emailTemplate.get(0).HtmlValue.replace('{opp.id}',idKey));
                                msg.setSubject(emailTemplate.get(0).subject);
                                
                                if(emailAddressId!=null)
                                    msg.setOrgWideEmailAddressId(emailAddressId);

                                msg.setWhatId(idKey );
                                msg.setSaveAsActivity(true);
                                msg.setOptOutPolicy('FILTER');
                                msg.setTargetObjectID(oppConMap.get(idKey));
                                msg.setReplyTo('noreplycstrsvc@rapidadvance.com');
                                
                                if(!Test.isRunningTest())
                                	Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{msg});
                            }
                        }
                    }
                }
            }
        }  
    }
}