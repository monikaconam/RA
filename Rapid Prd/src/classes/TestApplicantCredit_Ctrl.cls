@isTest 
private class TestApplicantCredit_Ctrl  {
    static testMethod void applicantCredit_UnitTest() {
        Test.startTest(); 

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Contact con= new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        insert con;
        
        Contact anotherCon= new Contact();
        anotherCon.AccountId = acc.Id;
        anotherCon.LastName = 'test OTHER';
        insert anotherCon;
        
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
        
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = con.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 1'; 
        insert oppRole;
        
        OpportunityContactRole  opp2Role = new OpportunityContactRole();
        opp2Role.ContactId = anotherCon.Id;
        opp2Role.OpportunityId  = opp.Id;
        opp2Role.Role = 'Principal 2'; 
        insert opp2Role;
        
        
        PageReference p=Page.ApplicantCreditPage;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        
        ApplicantCredit_Ctrl appObj = new ApplicantCredit_Ctrl();
        appObj.doSave();
        Test.stopTest();
    }
    
    static testMethod void unitTest() {
        Test.startTest(); 
        
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
               
        PageReference p=Page.ApplicantCreditPage;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        
        ApplicantCredit_Ctrl appObj = new ApplicantCredit_Ctrl();
        appObj.doSave();
        insert opp;
        Test.stopTest();
    }
}