@isTest
private class TestRecordAccessController
{
    static testmethod void unitTest()
    {
        Test.startTest();
        Account acc=new Account();
        acc.name='Test Account Record Log';
        acc.BusinessType__c='Bakery';
        insert acc;
       
        PageReference pPage=Page.AccountAccessLog;
        Test.setCurrentPage(pPage);
        ApexPages.CurrentPage().getParameters().put('id',acc.id);
        ApexPages.CurrentPage().getParameters().put('ipAddr','127.0.0.1');
        
        ApexPages.StandardController sc=new ApexPages.StandardController(acc);
        RecordAccessController rac=new RecordAccessController(sc);
        
        rac.setIPAddress();
        rac.getAccessHistory();
        rac.first();
        rac.last();
        rac.previous();
        rac.next();
        
        System.assertEquals(rac.hasNext,false);
        System.assertEquals(rac.hasPrevious,false);
        System.assertEquals(rac.pageNumber ,1);
        System.assertEquals(rac.recordCount,1);
        
        Test.stopTest();
    }
    static testmethod void unitTestException()
    {
        Test.startTest();
        Account acc=new Account();
        acc.name='Test Account Record Log';
        acc.BusinessType__c='Bakery';
        insert acc;
       
        PageReference pPage=Page.AccountAccessLog;
        Test.setCurrentPage(pPage);
        ApexPages.CurrentPage().getParameters().put('id',acc.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(acc);
        RecordAccessController rac=new RecordAccessController(sc);
        
        try
        {
            rac.setIPAddress();
        }
        catch(Exception e)
        {
        }
       
        
        Test.stopTest();
    }
}