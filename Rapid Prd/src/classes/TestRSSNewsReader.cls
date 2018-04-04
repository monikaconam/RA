@isTest 
private class TestRSSNewsReader 
{
    static testMethod void rssNewsReader_UnitTest1() 
    {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        PageReference p=Page.YahooRSSFeed;
        Test.setCurrentPage(p);
        Apexpages.currentpage().getparameters().put('Id', acc.Id);
        ApexPages.StandardController controller = new ApexPages.StandardController(acc);
        RSSNewsReader rssObj = new RSSNewsReader(controller);
        rssObj.getRSSFeed2();
        Test.stopTest();
    }
    
    static testMethod void rssNewsReader_UnitTest2() 
    {
        Test.startTest(); 
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        PageReference p=Page.YahooRSSFeed;
        Test.setCurrentPage(p);
        
        Apexpages.currentpage().getparameters().put('q', 'test OR TEST OR test');
        ApexPages.StandardController controller = new ApexPages.StandardController(acc);
        RSSNewsReader rssObj = new RSSNewsReader(controller);
        rssObj.getRSSFeed2();
        Test.stopTest();
    }
     
}