trigger MasterAccountTrigger on Account (before insert,before update,after insert,after update) 
{
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            AccountTriggerHandler.aIPartnerAccountCALC(trigger.new);
        }
        if(trigger.isUpdate)
        {
            AccountTriggerHandler.aUPartnerAccountCALC(trigger.new);
        }
    }
    
    if(Trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            PurgeNameHelper.cleanAccountName(Trigger.new);
        }
        if(trigger.isUpdate)
        {
            List<Account> newList=new List<Account>();
            for(Account acc : Trigger.new)
            {
                if(((acc.name!=Trigger.oldMap.get(acc.id).name) || (acc.Purged_Account_Name__c=='' || acc.Purged_Account_Name__c==null)) ||
                ((acc.dba__c!=Trigger.oldMap.get(acc.id).dba__c) || (acc.Legal_Name__c=='' || acc.Legal_Name__c==null)) ||
                ((acc.Purged_Legal_Name__c=='' || acc.Purged_Legal_Name__c==null) || (acc.Purged_DBA_Name__c=='' || acc.Purged_DBA_Name__c==null)))
                {
                    System.debug(acc.name+'----->'+ Trigger.oldMap.get(acc.id).name);
                    System.debug('acc.Purged_Account_Name__c----->'+ acc.Purged_Account_Name__c);
                    System.debug(acc.dba__c+'----->'+ Trigger.oldMap.get(acc.id).dba__c);
                    System.debug('acc.Legal_Name__c----->'+ acc.Legal_Name__c);
                    System.debug('acc.Purged_Legal_Name__c----->'+ acc.Purged_Legal_Name__c);
                    System.debug('acc.Purged_DBA_Name__c----->'+ acc.Purged_DBA_Name__c);
                    System.debug('new List----->'+newList);
                    newList.add(acc);
                }
            }
            PurgeNameHelper.cleanAccountName(newList);
        }
    }    
}