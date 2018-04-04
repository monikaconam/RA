trigger MasterCampaignTrigger on Campaign (before insert,before update,after insert, after update) 
{
    if(trigger.isBefore)
    {
            if(trigger.isInsert)
            {
                CampaignTriggerHandler.biBeforeOwnerChange(trigger.new); 
                PopulateCampaignStageTriggerHandler.PopulatePartnerDateInsert(trigger.new);
                ParentCampaignTriggerHandler.checkMismatchFundingChannelIns(Trigger.new);
            }
            if(trigger.isUpdate)
            {
                CampaignTriggerHandler.bubeforeOwnerChange (trigger.new,trigger.oldMap);
                PopulateCampaignStageTriggerHandler.PopulatePartnerDateUpdate(trigger.New,trigger.oldMap);
                ParentCampaignTriggerHandler.checkMismatchFundingChannelUpd(Trigger.new, Trigger.oldMap);
            }
    }

    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
           CampaignTriggerHandler.aiCampaignCALC(trigger.new);  
          
        }
        if(trigger.isUpdate)
        {
           CampaignTriggerHandler.auCampaignCALC(trigger.new);  
        }
    }
}