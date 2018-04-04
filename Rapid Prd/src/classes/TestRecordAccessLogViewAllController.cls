@isTest
private class TestRecordAccessLogViewAllController
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
        
        pPage=Page.AccountAccessLogViewAll;
        Test.setCurrentPage(pPage);
        ApexPages.CurrentPage().getParameters().put('id',acc.id);
        ApexPages.CurrentPage().getParameters().put('pSize','30');
        
        RecordAccessLogViewAllController racCtrl=new RecordAccessLogViewAllController(sc);
        racCtrl.getAccessHistory();
        
        racCtrl.first();
        racCtrl.last();
        racCtrl.previous();
        racCtrl.next();
        
        System.assertEquals(racCtrl.hasNext,false);
        System.assertEquals(racCtrl.hasPrevious,false);
        System.assertEquals(racCtrl.pageNumber ,1);
        System.assertEquals(racCtrl.recordCount,1);
        Test.stopTest();
    }
}