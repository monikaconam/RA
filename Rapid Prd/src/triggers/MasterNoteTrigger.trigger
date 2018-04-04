trigger MasterNoteTrigger on Note__c (after insert, after update, before delete) {
    
    if(Trigger.isBefore)
    {
        if(Trigger.isDelete)
        {
            NoteTriggerHandler.bdUpdateNoteFieldsOnOpp(Trigger.old);
        }
    }
    
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            NoteTriggerHandler.aiUpdateNoteFieldsOnOpp(Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            NoteTriggerHandler.auUpdateNoteFieldsOnOpp(Trigger.new);
        }
    }

}