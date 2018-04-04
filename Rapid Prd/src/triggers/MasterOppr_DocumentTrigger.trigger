trigger MasterOppr_DocumentTrigger on Oppr_Document__c (after insert, after update) 
{
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
          Oppr_DocumentTriggerHandler.aiUpdateTriggerForOppDocuments(trigger.new);    
        }
        if(trigger.isUpdate)
        {
          Oppr_DocumentTriggerHandler.auUpdateTriggerForOppDocuments(trigger.new);   
        }
    }
}