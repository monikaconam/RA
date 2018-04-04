@isTest
public class TestOpportunityContactRole {
    public static testMethod void TestOpportunityContactRole_Method() {
        /*
        DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cam =  TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cam);
        Contact con = TestUtils.createContact(acc);
        OpportunityContactRole role = TestUtils.createOpportunityContactRole(con, opp);
        */
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        insert opp;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        insert con;
        
        Contact con2 = new Contact();
        con2.AccountId = acc.Id;
        con2.LastName = 'test2';
        insert con2;
        
        OpportunityContactRole role =new OpportunityContactRole();
        role.ContactId = con.Id;
        role.OpportunityId  = opp.Id;
        role.isPrimary=true;
        role.Role = 'Principal 1'; 
        insert role;
        
        OpportunityContactRole role2 =new OpportunityContactRole();
        role2.ContactId = con2.Id;
        role2.OpportunityId  = opp.Id;
        role2.Role = 'Principal 2'; 
        insert role2;
        
        OpportunityContactRoleCtlr opprole = new OpportunityContactRoleCtlr();
        opprole.save();
        opprole.cancel();
        
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.currentPage().getParameters().put('retURL', opp.Id);
        
        OpportunityContactRoleCtlr oppConRole = new OpportunityContactRoleCtlr();
        oppConRole.save();
        oppConRole.cancel();
        
        Test.stopTest();
        
    }    
}