@istest
public class TestBatchUpdateCmpInactiveDormantStatus
{
/*
    @istest
    public static void unitTest()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Partners';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        Test.setCreatedDate(opp.Id, System.now().addDays(-70));
        
        Test.startTest();
        Database.executebatch(new BatchUpdateCmpIDSStatus(),1);
        Test.stopTest();
    }
    */
    @istest
    public static void unitTestLeadGT120()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Partners';
        insert camp;
        
        Lead ld = new Lead(FirstName = 'Test', LastName  = 'Testofferson', Company   = 'Test Industries LLC',
            Email= 'test@test.com', Phone = '18005551111',Status = 'Test');
        insert ld;
        
        CampaignMember cm=new CampaignMember();
        cm.campaignId=camp.id;
        cm.leadId=ld.id;
        insert cm;
        
        Test.setCreatedDate(cm.Id, System.now().addDays(-131));
        
        Test.startTest();
        Database.executebatch(new BatchUpdateLeadCmpIDSStatus(),1);
        Test.stopTest();
    }
    @istest
    public static void unitTestLeadGT60()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Partners';
        insert camp;
        
        Lead ld = new Lead(FirstName = 'Test', LastName  = 'Testofferson', Company   = 'Test Industries LLC',
            Email= 'test@test.com', Phone = '18005551111',Status = 'Test');
        insert ld;
        
        CampaignMember cm=new CampaignMember();
        cm.campaignId=camp.id;
        cm.leadId=ld.id;
        insert cm;
        
        Test.setCreatedDate(cm.Id, System.now().addDays(-65));
        
        Test.startTest();
        Database.executebatch(new BatchUpdateLeadCmpIDSStatus(),1);
        Test.stopTest();
    }
    @istest
    public static void unitTestLeadLT30()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Partners';
        insert camp;
        
        Lead ld = new Lead(FirstName = 'Test', LastName  = 'Testofferson', Company   = 'Test Industries LLC',
            Email= 'test@test.com', Phone = '18005551111',Status = 'Test');
        insert ld;
        
        CampaignMember cm=new CampaignMember();
        cm.campaignId=camp.id;
        cm.leadId=ld.id;
        insert cm;
        
        Test.startTest();
        Database.executebatch(new BatchUpdateLeadCmpIDSStatus(),1);
        Test.stopTest();
    }
    @istest
    public static void unitTest120()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Partners';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        Test.setCreatedDate(opp.Id, System.now().addDays(-131));
        
        Test.startTest();
        Database.executebatch(new BatchUpdateCmpIDSStatus(),1);
        Test.stopTest();
    }
}