trigger MasterContactTrigger on Contact (before insert,after insert,before delete) 
{
   if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            //ContactTriggerHandler.biDuplicateContactBlocker(trigger.new);
        }
        if(trigger.isDelete){
             ContactTriggerHandler.PreventDelete(trigger.old);
        }
    } 
    
    if(trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
             ContactTriggerHandler.aiContactAfterInsertTrigger(trigger.new);
        }
    }
}