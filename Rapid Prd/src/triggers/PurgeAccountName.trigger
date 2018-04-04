trigger PurgeAccountName on Account (before Insert, before update) {

    if(Trigger.isInsert)
    {
        PurgeNameHelper.cleanAccountName(Trigger.new);
    }
    else
    {
        List<Account> newList=new List<Account>();
        for(Account acc : Trigger.new)
        {
            if(((acc.name!=Trigger.oldMap.get(acc.id).name) || (acc.Purged_Account_Name__c=='' || acc.Purged_Account_Name__c==null)) ||
            ((acc.dba__c!=Trigger.oldMap.get(acc.id).dba__c) || (acc.Legal_Name__c=='' || acc.Legal_Name__c==null)) ||
            ((acc.Purged_Legal_Name__c=='' || acc.Purged_Legal_Name__c==null) || (acc.Purged_DBA_Name__c=='' || acc.Purged_DBA_Name__c==null)))
            {
                newList.add(acc);
            }
        }
        PurgeNameHelper.cleanAccountName(newList);
    }

}