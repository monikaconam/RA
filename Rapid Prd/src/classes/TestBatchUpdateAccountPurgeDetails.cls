@isTest

private Class TestBatchUpdateAccountPurgeDetails
{
    static TestMethod void unitTest()
    {
        Test.startTest();
        CALC.ApexTesting();
        Account acc=new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        DataBase.executeBatch(new BatchUpdateAccountPurgeDetails());
        Test.stopTest();
    }
}