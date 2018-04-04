public with sharing class PopulateCampaignStageTriggerHandler
{
        
    public static void changeInSubmitting(List<Opportunity> opplist)
    {
       try{
           Set<Id> campaignIdSet =  new Set<Id>();
           List<Campaign> campaignList =  new List<Campaign>();
           for(Opportunity opp : opplist){
                if(opp.CampaignId != null){
                    campaignIdSet.add(opp.CampaignId);
                    //changeSubmittingToFundingFinal(opplist,campaignIdSet);
                }
           }
           
           for(Campaign objCamp : [SELECT Id,Activity__c,(SELECT  Id,Name FROM Opportunities where Renewal__c = false) FROM Campaign WHERE Id IN : campaignIdSet ]){
                    for( Opportunity opp : objCamp.Opportunities){
                        if(objCamp.Activity__c == 'Inactive' || objCamp.Activity__c == 'Dormant'){
                            objCamp.Activity__c = 'Submitting'; 
                            campaignList.add(objCamp);
                        }
                    }
            }
                
           if(!campaignList.isempty()){
               update campaignList ;
           }
           }
           Catch(Exception e) {
           System.debug('Exception caught: ' + e.getMessage());   
           }
    }
    
    public static void changeSubmittingToFunding(List<Opportunity> opplist)
    {
        Set<Id> campaignIdSet =  new Set<Id>();
        List<Campaign> campaignList =  new List<Campaign>();
        for(Opportunity opp : opplist){
            if(opp.CampaignId != null){
                campaignIdSet.add(opp.CampaignId);
                //changeSubmittingToFundingFinal(opplist,campaignIdSet);
            }
        }
        if(campaignIdSet.size()>0){
            changeSubmittingToFundingFinal(opplist,campaignIdSet);    
        }
    }
    
    public static void changeSubmittingToFundingOld(List<Opportunity> opplist, Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap)
    {
        Set<Id> campaignIdSetold =  new Set<Id>();
        List<Campaign> campaignList =  new List<Campaign>();
        for(Opportunity opp : opplist){
            if(opp.CampaignId != null){
                if(newMap.get(opp.id).CampaignId != oldMap.get(opp.id).CampaignId){
                    campaignIdSetold.add(oldMap.get(opp.id).CampaignId);
                    changeSubmittingToFundingFinal(opplist,campaignIdSetold );
                }
            }
        }
    }
    
    public static void changeSubmittingToFundingNew(List<Opportunity> opplist, Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap)
    {
        Set<Id> campaignIdSetNew =  new Set<Id>();
        //List<Campaign> campaignList =  new List<Campaign>();
        for(Opportunity opp : opplist){
            if(opp.CampaignId != null){
                if(newMap.get(opp.id).CampaignId != oldMap.get(opp.id).CampaignId){
                    campaignIdSetNew.add(newMap.get(opp.id).CampaignId);
                    changeSubmittingToFundingNew22(opplist,campaignIdSetNew );
                    changeSubmittingToFundingFinal(opplist,campaignIdSetNew );
                }
            }
        }
    }
    
    public static void changeSubmittingToFundingNew22(List<Opportunity> opplist, Set<Id> campaignSetFinal)
    {
        //Set<Id> campaignIdSetNew =  new Set<Id>();
        try{
            List<Campaign> campaignList =  new List<Campaign>();
            for(Campaign objCamp : [SELECT Id,Activity__c,(SELECT  Id,Name FROM Opportunities where Renewal__c = false) FROM Campaign WHERE Id IN : campaignSetFinal]){
                for( Opportunity opp : objCamp.Opportunities){
                    if(objCamp.Activity__c == 'Inactive' || objCamp.Activity__c == 'Dormant'){
                        objCamp.Activity__c = 'Submitting'; 
                        campaignList.add(objCamp);
                    }
                }
            }
                    
           if(!campaignList.isempty()){
               update campaignList ;
           }
       }
       Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
       }
    }
    
    
    public static void changeSubmittingToFundingFinal(List<Opportunity> opplist, Set<Id> campaignSetFinal)
    {
        try{
            List<Campaign> campaignList =  new List<Campaign>();
            
            for(Campaign objCamp : [SELECT Id,Activity__c,Funding_Partner_Date__c, (SELECT  Id,Name,CreatedDate FROM Opportunities WHERE StageName = 'Closed Won' and Renewal__c = false) FROM Campaign WHERE Id IN : campaignSetFinal]){
            Integer count = 0;
                for( Opportunity opp : objCamp.Opportunities){
                
                    if(objCamp.Activity__c == 'Submitting'){
                        count++;
                    }
                    
                    else if(objCamp.Activity__c == 'Funding'   && opp.CreatedDate >= objCamp.Funding_Partner_Date__c  && opp.CreatedDate <= objCamp.Funding_Partner_Date__c.addDays(30)){
                        count++;   
                    }
                    else if(objCamp.Activity__c == 'High Signing Activity'  && opp.CreatedDate >= objCamp.Funding_Partner_Date__c  && opp.CreatedDate <= objCamp.Funding_Partner_Date__c.addDays(30)){
                        count++;  
                    }
                    else if(objCamp.Activity__c == 'High Signing Activity'  && opp.CreatedDate >= objCamp.Funding_Partner_Date__c  && opp.CreatedDate <= objCamp.Funding_Partner_Date__c.addDays(60)){
                        count++;  
                    }
                    
                }
                
                if(count > 0 && objCamp.Activity__c == 'Submitting'){
                    objCamp.Activity__c = 'Funding'; 
                    campaignList.add(objCamp);
                }
              
                else if(count >= 5 && objCamp.Activity__c == 'Funding' ){
                    objCamp.Activity__c = 'High Signing Activity';
                    campaignList.add(objCamp); 
                }
                else if(count < 5 && count >= 1 && objCamp.Activity__c == 'High Signing Activity'){
                    objCamp.Activity__c = 'Funding'; 
                    objCamp.Funding_Partner_Flag__c = true;
                    campaignList.add(objCamp);
                }
                else if(count < 1 && objCamp.Activity__c == 'High Signing Activity'){
                    objCamp.Activity__c = 'Inactive'; 
                    campaignList.add(objCamp);
                }
            }
            
            if(!campaignList.isempty()){
                update campaignList ;
            }
        }
        
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }

    }
    
    /*
     public static void callApprovalProcess(List<Campaign> camplist,Map<Id,Campaign> oldMap)
     {
         try{
             for(Campaign camp : camplist){
                 if(camp.Status == 'Terminated' && camp.Status != oldMap.get(camp.id).Status ){
                      Approval.ProcessSubmitRequest req1 =
                      new Approval.ProcessSubmitRequest();
                      req1.setComments('Automatic submit.');
                      req1.setObjectId(camp.id);
        
                      // Submit the approval request for the account
                      Approval.ProcessResult result = Approval.process(req1);
                  }
             }
           }
         
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
     }
    
     public static void callApprovalProcessOnLead(List<Lead> leadlist,Map<Id,Lead> oldMap)
     {
         try{
             for(Lead lObject : leadlist){
                 if(lObject.Status == 'Denied' && lObject.Status != oldMap.get(lObject.id).Status ){
                      Approval.ProcessSubmitRequest req1 =
                      new Approval.ProcessSubmitRequest();
                      req1.setComments('Automatic submit.');
                      req1.setObjectId(lObject.id);
        
                      // Submit the approval request for the account
                      Approval.ProcessResult result = Approval.process(req1);
                  }
             }
           }
         
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
    */
    public static void PopulatePartnerDateInsert(List<Campaign> camplist)
    {
         try{
                for(Campaign objCamp : camplist){
                    if(objCamp.Activity__c == 'Inactive'  ){
                    objCamp.Inactive_Partner_Date__c =Date.today();
                    }
                    else if(objCamp.Activity__c == 'Dormant'  ){
                    objCamp.Dormant_Partner_Date__c=Date.today();
                    }
                    else if(objCamp.Activity__c == 'Submitting' ){
                    objCamp.Submitting_Partner_Date__c=Date.today();
                    }
                    else if(objCamp.Activity__c == 'Funding'   ){
                    objCamp.Funding_Partner_Date__c =Date.today();
                    }
                    else if(objCamp.Activity__c == 'High Signing Activity'){
                    objCamp.High_Activity_Partner_Date__c=Date.today();
                    }
                }
           }
         
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
    
    public static void PopulatePartnerDateUpdate(List<Campaign> camplist,Map<Id,Campaign> oldMap)
    {
         try{
             for(Campaign objCamp : camplist){
                    if(objCamp.Activity__c == 'Inactive' &&  objCamp.Activity__c != oldMap.get(objCamp.Id).Activity__c ){
                    objCamp.Inactive_Partner_Date__c =Date.today();
                    }
                    else if(objCamp.Activity__c == 'Dormant' &&  objCamp.Activity__c != oldMap.get(objCamp.Id).Activity__c ){
                    objCamp.Dormant_Partner_Date__c=Date.today();
                    }
                    else if(objCamp.Activity__c == 'Submitting'  && objCamp.Activity__c != oldMap.get(objCamp.Id).Activity__c ){
                    objCamp.Submitting_Partner_Date__c=Date.today();
                    }
                    else if(objCamp.Activity__c == 'Funding'  && objCamp.Activity__c != oldMap.get(objCamp.Id).Activity__c ){
                    objCamp.Funding_Partner_Date__c =Date.today();
                    }
                    else if(objCamp.Activity__c == 'High Signing Activity'  && objCamp.Activity__c != oldMap.get(objCamp.Id).Activity__c ){
                    objCamp.High_Activity_Partner_Date__c=Date.today();
                    }
                }
           }
         
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
}