@istest

private class TestSendDeclinedSurvey 
{
    static testmethod void unitTest()
    {
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
        opp.email_address__c='test@test.com';
        insert opp;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        con.email='test@test.com';
        insert con;
        
        OpportunityContactRole role =new OpportunityContactRole();
        role.ContactId = con.Id;
        role.OpportunityId  = opp.Id;
        role.isPrimary=true;
        role.Role = 'Principal 1'; 
        insert role;
        
        opp.send_declined_survey_on__c=system.now();
        update opp;
        Test.stopTest();
    }
}