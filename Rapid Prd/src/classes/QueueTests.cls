@isTest

private class QueueTests {

    @testSetup static void setup()
    {
        Test.startTest();
        LeadUtils.setTesting();   
        CALC.ApexTesting();
        Lead l = new Lead(
        FirstName = 'Test',
        LastName  = 'Testofferson',
        Company   = 'Test Industries LLC',
        Email     = 'test@test.com',
        Phone     = '1-800-555-TEST'
        );
        insert l;
        
        Priority_Queue__c pq1 = new Priority_Queue__c(Name = l.Company,Lead__c=l.id,Priority__c = 1);
        insert pq1;
        
        Task LeadTask = new Task (
        Status   = 'Closed',
        Priority = 'High',
        Subject  = 'Test Task for Lead',
        WhoId    = l.id
        );
        insert LeadTask;
        Test.stopTest();
    }

   // Test the Lead trigger/sync, attempt to convert the Lead. Add tasks too.
    private static testMethod void testLeadQueue() 
    {
        Test.startTest();
        LeadUtils.setTesting();   
        CALC.ApexTesting();
        
        Id LeadId=[Select id from Lead where company='Test Industries LLC' Limit 1].id;
        List<Priority_Queue__c> q_query = [SELECT Id,Lead__c,Last_Activity_Date__c FROM Priority_Queue__c WHERE name='Test Industries LLC'];   
        
        String QueueId = q_query[0].Id;
        Queue_Sync.clearActed();
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(LeadId);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        Test.stopTest();

    }
   
   // Test the Opp trigger/sync as well as related Status field/formula
    private static testMethod void testOppQueue() 
    {
        Test.startTest();
        LeadUtils.setTesting();   // Mark this is an Apex test
        CALC.ApexTesting();
        
        Opportunity o = new Opportunity(
        Name      = 'Test Opp',
        StageName = 'Open',
        CloseDate = Date.today()
        );
        Database.SaveResult sr = Database.insert(o);
        String OppId = sr.getId();

        List<Priority_Queue__c> q_query = [SELECT Id,Stage_Status__c FROM Priority_Queue__c WHERE Opportunity__c=:OppId];
        Test.stopTest();

    }
} // end class