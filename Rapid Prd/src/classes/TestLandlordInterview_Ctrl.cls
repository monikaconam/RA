@isTest 
private class TestLandlordInterview_Ctrl  {
    static testMethod void OppLandlordInterview_UnitTest() {
        Test.startTest(); 
        /* COMMNENTED BY DS-CONAM 
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm); 
        */
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
        
        PageReference p=Page.LandlordInterviewPage;
        Test.setCurrentPage(p);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        LandlordInterview_Ctrl landInterviewObj = new LandlordInterview_Ctrl();
        landInterviewObj.doSave();
        
        /*COMMNENTED BY DS-CONAM 
        BusinessReview_Ctrl bussObj = new BusinessReview_Ctrl();
        bussObj.doSave();
        ContractValidation_Ctrl  ctObj = new ContractValidation_Ctrl();
        ctObj.doSave();
       
        Contact con = TestUtils.createContact(acc);
        Merchant__c  mc = TestUtils.createMerchant(opp);
         */
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        insert con;
        
        Merchant__c  mc = new Merchant__c ();
        mc.Opportunity__c = opp.Id;
        insert mc;
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        LandlordInterview_Ctrl landObj = new LandlordInterview_Ctrl();
        landObj.doSave();
        /*COMMNENTED BY DS-CONAM
        BusinessReview_Ctrl reviewObj = new BusinessReview_Ctrl(); 
        reviewObj.doSave();
        
        ContractValidation_Ctrl  ctvObj = new ContractValidation_Ctrl();
        ctObj.doSave();
        */
        Test.stopTest();
    }
    
     static testMethod void unitTest() {
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
        
        PageReference p=Page.LandlordInterviewPage;
        Test.setCurrentPage(p);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        LandlordInterview_Ctrl landInterviewObj = new LandlordInterview_Ctrl();
        landInterviewObj.doSave();
        
        //Merchant__c  mc = TestUtils.createMerchant(opp);
        Merchant__c  mc = new Merchant__c ();
        mc.Opportunity__c = opp.Id;
        insert mc;
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        LandlordInterview_Ctrl landObj = new LandlordInterview_Ctrl();
        landObj.doSave();
        Test.stopTest();
    }
    static testMethod void unitTest2() {
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
        
        PageReference p=Page.LandlordInterviewPage;
        Test.setCurrentPage(p);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        LandlordInterview_Ctrl landInterviewObj = new LandlordInterview_Ctrl();
        landInterviewObj.doSave();
        
        //Contact con = TestUtils.createContact(acc);
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        insert con;
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        LandlordInterview_Ctrl landObj = new LandlordInterview_Ctrl();
        landObj.doSave();
        Test.stopTest();
    }
}