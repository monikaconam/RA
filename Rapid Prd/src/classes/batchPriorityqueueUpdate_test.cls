@isTest
                                
private class batchPriorityqueueUpdate_test{

    static testmethod void testb() {
    
    CALC.ApexTesting();
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
        insert cTest;
        
        Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company',Phone='415789415',Lastname='lastname'
                           );
        insert lTest;
        
        CampaignMember newMember = new CampaignMember (campaignid=cTest.id, leadid=lTest.id);
        insert newMember;
        // The query used by the batch job.

        
        String query = 'select id, Phone_cti_modified__c from priority_queue__C where Phone_cti_modified__c=\'\' and createddate>2015-01-01T00:00:00z order by lastmodifieddate';

       // Create some test merchandise items to be deleted
       //   by the batch job.
      
        List<priority_queue__C> po=database.query(query);
        sYSTEM.debug(po);
       Test.startTest();
       batchPriorityqueueUpdate c = new batchPriorityqueueUpdate ();
      // Database.executeBatch(c);
       Database.QueryLocator ql = c.start(null);
       c.execute(null,po);
       c.Finish(null);
       Test.stopTest();


    }
}