@isTest
private class TestMasterOpportunityTriggerPart2
{
    @testSetup static void setup()
    {
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
        insert opp;
    }
    
    private static testmethod void unitTest2()
    {
        Test.startTest();
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='TestingOpp' Limit 1];
        opp.product__c='Loan';
        update opp;
        Test.stopTest();
    }
}