@istest
private class MarbleControllerTest
{
    @istest public static void unitTEst()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
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
        
        Marble__c m = new Marble__c();
        m.Home_Based__c = 'Yes';
        m.Where_Did_You_Find_This_Client__c = 'Renewal';
        m.Name = 'abc';
        m.BOOP_Status__c = 'New';
        m.Opportunity_Reference__c = opp.Id;
        insert m;
        
        ApexPages.StandardController sc=new ApexPages.StandardController(m);
        MarbleController mc=new MarbleController(sc);
        mc.isNewAllowed();
                
        
        Test.stopTest();
    }
}