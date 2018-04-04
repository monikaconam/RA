trigger MasterOpportunityTrigger on Opportunity (before insert, after insert, before update, 
                                                 after update, before delete, after delete, after undelete) {
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            OpportunityTriggerHandler.biUnderwritingOpprtunity(Trigger.new);
            OpportunityTriggerHandler.biUpdateOppStatusRule5bReviewingDocs(Trigger.new);
            OpportunityTriggerHandler.biUpdateProcessDates(Trigger.new);
            OpportunityTriggerHandler.biGenerateRenewalNumber(Trigger.new);
            OpportunityTriggerHandler.assignCountersForRoundRobinOnInsert(Trigger.new);
            PopulateLdSourceonOppHandler.populateLdSourceonRenewalOpps(Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            OpportunityTriggerHandler.buRiskAlert(Trigger.newMap,Trigger.oldMap); 
            OpportunityTriggerHandler.buUnderwritingOpprtunity(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandler.buUpdateOppStatusRule5bReviewingDocs(Trigger.new); 
            OpportunityTriggerHandler.buOpportunityStageChangeCALC(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandler.buNumberOfReferrals(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandler.buGenerateRenewalNumber(Trigger.oldMap, Trigger.newMap);
            OpportunityTriggerHandler.assignCountersForRoundRobinOnUpdate(Trigger.new, Trigger.oldMap);
            PreventOppStageChanges.onBeforeUpdate(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandlerPart2.sendEmailNotifcationOnSignedDeal(Trigger.oldMap,Trigger.newMap);
        }
    }
    else
    {
        if(Trigger.isInsert)
        {
            OpportunityTriggerHandler.aiContactRolesOppr(Trigger.newMap); 
            OpportunityTriggerHandler.aiOpportunityCampaignChosen(Trigger.newMap);
            OpportunityTriggerHandler.aiUpdateOpportunityForBiz2Credit(Trigger.new);
            OpportunityTriggerHandler.aiUpdateGTParentOpportunity(Trigger.newMap);
            OpportunityTriggerHandler.aiOpportunityStageChangeCALC(Trigger.newMap);

            PopulateCampaignStageTriggerHandler.changeInSubmitting(Trigger.new);
            PopulateCampaignStageTriggerHandler.changeSubmittingToFunding(trigger.new);
            
            PopulateLeadSourceOnClonedDeals.populateLeadSource(Trigger.new);

            CallCALCHelper.callAccount(Trigger.newMap);
        }
        if(Trigger.isUpdate)
        {
          
            OpportunityTriggerHandler.auOpportunityCampaignChosen(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandler.auUpdateOpportunityForBiz2Credit(Trigger.new);
            OpportunityTriggerHandler.auUpdateGTParentOpportunity(Trigger.newMap,Trigger.oldMap);
            OpportunityTriggerHandler.auOppInitialComAmtUpdateTrigger(Trigger.oldMap,Trigger.newMap);
            OpportunityTriggerHandlerPart2.auSetUCCFiling(Trigger.oldMap,Trigger.newMap);

            PopulateCampaignStageTriggerHandler.changeSubmittingToFunding(trigger.new);
            PopulateCampaignStageTriggerHandler.changeSubmittingToFundingOld(trigger.new,Trigger.oldMap,Trigger.newMap);
            PopulateCampaignStageTriggerHandler.changeSubmittingToFundingNew(trigger.new,Trigger.oldMap,Trigger.newMap);
            OpportunityTriggerHandlerPart2.updateCampaignWithLatestFunded(Trigger.oldMap,Trigger.newMap);
            
            if(CheckSurveyRecursive.runOnce())
               GetFeedBackSurveyHelper.onGenerateSurvey(Trigger.oldMap,Trigger.newMap);
        }  
    }
}