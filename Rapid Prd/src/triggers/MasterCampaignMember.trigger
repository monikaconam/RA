trigger MasterCampaignMember on CampaignMember (after insert) {
    
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            CampaignMemberTriggerHandler.afterInsert(Trigger.new, Trigger.old);
        }
    }
}