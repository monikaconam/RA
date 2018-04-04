trigger MasterTriggerOnMarble on Marble__c (after delete)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isDelete)
        {
            updateMarbleCheckboxOnOpp.deleteScanerio(Trigger.Old);
        }  
        
    }
}