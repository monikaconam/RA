@isTest 
private class TestMainBusiness_Ctrl {
    @testsetup static void setup()
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
        insert opp;
        Test.stopTest();
    
    }
    //mainBusiness_UnitTest needs to be removed once test class has been written for Previous_Balance_Ctrl and ProcessorInformation_Ctrl
/*    static testMethod void mainBusiness_UnitTest() {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
         DS-CONAM
       // Account acc = TestUtils.createAccount();
      //  Campaign cm = TestUtils.createCampaign();
       // Opportunity opp = TestUtils.createOpportunity(acc, cm);
       
        
        
        
        ProcessorInformation_Ctrl proObj = new ProcessorInformation_Ctrl();
        proObj.doSave();
        Previous_Balance_Ctrl  balObj1 = new Previous_Balance_Ctrl();
        balObj1.doSave();
       // MainBusiness_Ctrl bussObj1 = new MainBusiness_Ctrl();
        //bussObj1.doSave();
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
       // MainBusiness_Ctrl bussObj = new MainBusiness_Ctrl();
     //   bussObj.doSave();
        Previous_Balance_Ctrl  balObj = new Previous_Balance_Ctrl();
        balObj.doSave();
        ProcessorInformation_Ctrl proObj1 = new ProcessorInformation_Ctrl();
        proObj1.doSave();
        Test.stopTest();
    }
    
   
    
    static testMethod void unitTest3() {
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
        
        
        PageReference p=Page.MainBusinessPage;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        MainBusiness_Ctrl bussObj1 = new MainBusiness_Ctrl();
        bussObj1.doSave();
        
        
        
        
        ProcessorInformation_Ctrl proObj = new ProcessorInformation_Ctrl();
        proObj.doSave();
        Previous_Balance_Ctrl  balObj1 = new Previous_Balance_Ctrl();
        balObj1.doSave();
        
        
        MainBusiness_Ctrl bussObj = new MainBusiness_Ctrl();
        bussObj.doSave();
        Previous_Balance_Ctrl  balObj = new Previous_Balance_Ctrl();
        balObj.doSave();
        ProcessorInformation_Ctrl proObj1 = new ProcessorInformation_Ctrl();
        proObj1.doSave();
        Test.stopTest();
    }
    */ 
     static testMethod void unitTest() {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();

        Opportunity opp=[select
                                id
                        from 
                                opportunity
                        where
                                name='testOpportunity' Limit 1];
        
        PageReference p=Page.MainBusinessPage;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        MainBusiness_Ctrl bussObj1 = new MainBusiness_Ctrl();
        bussObj1.doSave();
        
        Test.stopTest();
     }
     
     static testMethod void unitTest2() {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
       
        Campaign  cm=[select
                                id
                        from 
                                Campaign  
                        where
                                name='Test' Limit 1];
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        insert opp;
        
        PageReference p=Page.MainBusinessPage;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        MainBusiness_Ctrl bussObj1 = new MainBusiness_Ctrl();
        bussObj1.doSave();
        
        Test.stopTest();
     }  
}