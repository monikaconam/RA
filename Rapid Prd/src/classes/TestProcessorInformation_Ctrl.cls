@isTest 

private class TestProcessorInformation_Ctrl  
{   
    static testMethod void ProcessorInformation_Ctrl_UnitTest() 
    {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        
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
        opp.closeDate = System.today() + 10;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 20;
        opp.accountId = acc.id;
        insert opp;
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ProcessorInformation_Ctrl bussObj1 = new ProcessorInformation_Ctrl();
        bussObj1.doSave();
        Test.stopTest();
    }
    
    static testMethod void ProcessorInformation_Ctrl_UnitTest1() 
    {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        
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
        insert opp;

        PageReference p=Page.ProcessorInformationPage;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        ProcessorInformation_Ctrl bussObj = new ProcessorInformation_Ctrl();
        bussObj.doSave();
        
        Test.stopTest();
    }
    
    static testMethod void unitTest3() 
    {
        Test.startTest();       
        // DS-CONAM CALC.apexTesting();
        
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
        
        
        PageReference p=Page.ProcessorInformationPage;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        ProcessorInformation_Ctrl bussObj = new ProcessorInformation_Ctrl();
        bussObj.doSave();
        
        Test.stopTest();
    }
    
}