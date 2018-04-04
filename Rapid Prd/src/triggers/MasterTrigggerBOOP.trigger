trigger MasterTrigggerBOOP on BOOP__c (before insert,after insert,before update,after update,after delete) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            UpdateBOOPStatus.populateMarbleOwnerId(Trigger.new);
            BOOPTriggerHandler.onBeforeInsert(Trigger.new);
        }
    }
    
    if(Trigger.isInsert && Trigger.isAfter)
    {
        UpdateBOOPStatus.updateStatus(Trigger.New);
    }
    
    
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
            ReviewStatusOnBOOP.reviewStatus(Trigger.New,Trigger.OldMap);
            BOOPTriggerHandler.onBeforeUpdate(Trigger.new,Trigger.oldMap); 
        }
        if(Trigger.isAfter)
        {
            sendEmailToCampaignContact.sentOutEmail(Trigger.new,Trigger.oldMap);
            UpdateBOOPStatus.updateStatus(Trigger.New);
        }  
    }
    
    if(Trigger.isDelete)
    {
        if(Trigger.isAfter)
        {
            UpdateBOOPStatus.BoopStatusField(Trigger.Old);
        }
    }
    
}