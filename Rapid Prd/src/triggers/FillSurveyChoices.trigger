/*
Modified Date : 10/17/2016
Modified Line : Added Code line from line(9-55)
Modified Purpose : Send the Reminder mail after 15 days if no response has been returned for client funding Survey and 90-Days post funding survey
*/

trigger FillSurveyChoices on GetFeedback_Survey__c(before insert,after insert) {

    if(trigger.isAfter){
        Set<Id> opportunityIdSet = new Set<Id>();
        Set<Id> opportunityIdSet2 = new Set<Id>();
        Set<Opportunity> opportunitySet =  new Set<Opportunity>();
        List<opportunity> opportunityList =  new List<opportunity>();
        
        Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosById();
        
        for(GetFeedback_Survey__c getObj : Trigger.New){
            if(rtMap.containskey(getObj.recordtypeid)){
                if(getObj.Opportunity__c != null  && rtMap.get(getObj.RecordTypeId).getName() == 'Funding Survey')
                    opportunityIdSet.add(getObj.Opportunity__c);
            
                if(getObj.Opportunity__c != null  && rtMap.get(getObj.RecordTypeId).getName() == 'Client Service Survey')
                    opportunityIdSet2.add(getObj.Opportunity__c);
            }
        }
        
       if(opportunityIdSet.size() > 0 ){
            for(Opportunity opp : [SELECT Id,Name,Client_Funding_Survey__c,(SELECT Id,Name FROM GetFeedback_Survey__r) FROM Opportunity WHERE Id in :opportunityIdSet] ){
                for(GetFeedback_Survey__c getObj : opp.GetFeedback_Survey__r){
                    opp.Client_Funding_Survey__c = True;
                    opportunitySet.add(opp);
                }
            }
        }
        
        if(opportunityIdSet2.size() > 0 ){
            for(Opportunity opp : [SELECT Id,Name,X90_Days_Post_Funding_Survey__c,(SELECT Id,Name FROM GetFeedback_Survey__r) FROM Opportunity WHERE Id in :opportunityIdSet2] ){
                for(GetFeedback_Survey__c getObj : opp.GetFeedback_Survey__r){
                    opp.X90_Days_Post_Funding_Survey__c = True;
                    opportunitySet.add(opp);
                }
            }
        }
        
        if(opportunitySet.size() > 0){
            for(Opportunity opp : opportunitySet){
                opportunityList.add(opp);
            }
        }
        
        if(opportunityList.size() > 0){
            GetFeedBackSurveyHelper.preventGetFeedBackSurveyHelperFromFire = True;
            update opportunityList;
        }
    }

    if(trigger.isBefore){
        for(GetFeedback_Survey__c a : Trigger.New){          
            if(a.BA_Service_Rating_Comments__c!=null){
                String ratingChoice1 = 'I didn\'t feel that the business advisor was knowledgeable enough about the details of my ';
                String ratingChoice2 = 'I didn\'t get called back when promised.';
                String ratingChoice3 = 'My business advisor wasn\'t available to me when I tried to reach him/her.';
                String ratingChoice4 = 'My business advisor didn\'t set accurate expectations about the funding process.';
                          
                List<String> ratingCommentsList = new List<String>();
                
                if(a.BA_Service_Rating_Comments__c.contains(',')){
                    ratingCommentsList.addAll(a.BA_Service_Rating_Comments__c.split(','));
                }else{
                    ratingCommentsList.add(a.BA_Service_Rating_Comments__c);
                }
                
                String tmpRatingComment = a.BA_Service_Rating_Comments__c.replace('\'','');
                
                for(String s : ratingCommentsList){
                    if(s.trim().contains(ratingChoice1)){
                        a.BA_was_not_knowledgeable__c = true;
                        tmpRatingComment = tmpRatingComment.replaceAll(s.trim().replace('\'',''),'');
                    }
                    if(s.trim()==ratingChoice2){
                        a.BA_Did_not_get_called_back__c = true;
                        tmpRatingComment = tmpRatingComment.replaceAll(s.trim().replace('\'',''),'');
                    }
                    if(s.trim()==ratingChoice3){
                        a.BA_was_not_available__c = true;
                        tmpRatingComment = tmpRatingComment.replaceAll(s.trim().replace('\'',''),'');
                    }
                    if(s.trim()==ratingChoice4){
                        a.BA_did_not_set_expectation__c = true;
                        tmpRatingComment = tmpRatingComment.replaceAll(s.trim().replace('\'',''),'');
                    }               
                }
                
                ratingCommentsList = new List<String>();
                if(tmpRatingComment.trim().contains(',')){
                    ratingCommentsList.addAll(tmpRatingComment.trim().split(','));
                }else{
                    ratingCommentsList.add(tmpRatingComment.trim());
                }
                
                tmpRatingComment = '';
                for(String s : ratingCommentsList){
                    if(s.trim()!='' && s.trim()!=' '){
                        tmpRatingComment += s;
                    }
                }
                a.BA_Service_Rating_Comments__c = tmpRatingComment.trim();
            }   
            
            if(a.Overall_Satisfaction_Comments__c!=null){
                String ratingChoice1 = 'The application process was harder or more time consuming than I expected.';
                String ratingChoice2 = 'It took too long to get the approval decision from underwriting.';
                String ratingChoice3 = 'there were too many conditions prior to actually funding my account.';
                String ratingChoice4 = 'I experienced problems with customer service.';
                String ratingChoice5 = 'It took too long to get the decision from underwriting.';
                String ratingChoice6 = 'but the situation seemed to change in underwriting.';
                String ratingChoice7 = 'The underwriting process was overly intrusive and disruptive.'; 
        
                List<String> ratingCommentsList = new List<String>();
                
                if(a.Overall_Satisfaction_Comments__c.contains(',')){
                    ratingCommentsList.addAll(a.Overall_Satisfaction_Comments__c.split(','));
                }else{
                    ratingCommentsList.add(a.Overall_Satisfaction_Comments__c);
                }
                
                String tpRatingComment = a.Overall_Satisfaction_Comments__c;
                
                for(String s : ratingCommentsList){
                    if(s.trim()==ratingChoice1){
                        a.OS_app_process_harder__c = true;
                        tpRatingComment = tpRatingComment.replaceAll(s.trim(),'');
                    }
                    if(s.trim()==ratingChoice2){
                        a.OS_took_long_for_approval__c = true;
                        tpRatingComment = tpRatingComment.replaceAll(s.trim(),'');
                    }
                    if(s.trim()==ratingChoice3){
                        a.OS_many_conditions_prior_funding__c = true;
                        tpRatingComment = tpRatingComment.replaceAll(s.trim(),'');
                        tpRatingComment = tpRatingComment.replaceAll('Once I was approved,','');    
                        
                    }
                    if(s.trim()==ratingChoice4){
                        a.OS_problems_with_cust_serv__c = true;
                        tpRatingComment = tpRatingComment.replaceAll(s.trim(),'');
                        tpRatingComment = tpRatingComment.replaceAll('After funding my account,','');      
                    }
                    if(s.trim()==ratingChoice5){
                        a.OS_took_long_for_decision__c = true;
                        tpRatingComment = tpRatingComment .replaceAll(s.trim(),'');
                    }
                    if(s.trim()==ratingChoice6){
                        a.OS_Approval_Expectation_changed_in_UW__c = true;
                        tpRatingComment = tpRatingComment.replaceAll(s.trim(),'');
                        tpRatingComment = tpRatingComment.replaceAll('I was given the expectation I would be approved, ','');    
                    }
                    if(s.trim()==ratingChoice7){
                        a.OS_UW_Process_Intrusive_Disruptive__c = true;
                        tpRatingComment = tpRatingComment .replaceAll(s.trim(),'');
                    }
                }
                
                ratingCommentsList = new List<String>();
                if(tpRatingComment.trim().contains(',')){
                    ratingCommentsList.addAll(tpRatingComment.trim().split(','));
                }else{
                    ratingCommentsList.add(tpRatingComment.trim());
                }
                
                tpRatingComment = '';
                for(String s : ratingCommentsList){
                    if(s.trim()!='' && s.trim()!=' '){
                        tpRatingComment += s;
                    }
                }
                a.Overall_Satisfaction_Comments__c = tpRatingComment.trim();
            }
        }
    } 
}