@istest
private class TestFundingInfoSignOff_Ctrl
{
    static testMethod void unitTest()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        
        PageReference p=Page.FundingInfoSignOff;
        Test.setCurrentPage(p);
        ApexPages.CurrentPage().getParameters().put('oppId',opp.id);
        ApexPages.CurrentPage().getParameters().put('Id',opp.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        FundingInfoSignOff_Ctrl fisc=new FundingInfoSignOff_Ctrl();
        fisc.doSave();
        insert opp;
        
        ApexPages.CurrentPage().getParameters().put('oppId',opp.id);
        ApexPages.CurrentPage().getParameters().put('Id',opp.id);
        sc=new ApexPages.StandardController(opp);
        fisc=new FundingInfoSignOff_Ctrl();
        fisc.doSave();
        
        Test.stopTest();
    }
}