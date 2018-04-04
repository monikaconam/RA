global class BatchUpdateAccountPurgeDetails implements Database.Batchable<sObject>
{
    global DataBase.QueryLocator start(DataBase.BatchableContext bc)
    {
        return Database.getQueryLocator('Select id from Account where (Purged_Legal_Name__c=\'\' or Purged_DBA_Name__c=\'\')');
    }
    
    global void execute(DataBase.BatchableContext  bc , List<Account > scope)
    {
        List<Account > upList=new List<Account >();
        for( Account lTemp : scope)
        {    
            
            upList.add(lTemp );
        }
        
        if(upList.size()>0)
            update upList;
    }
    
    global void finish(DataBase.BatchableContext  bc)
    {
    }
}