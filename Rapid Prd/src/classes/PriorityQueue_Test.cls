@istest
public class PriorityQueue_Test{

    public static testmethod void testRun()
    {
      
          /* commented out DS-CONAM-
        LeadUtils.setTesting();   // Mark this is an Apex test
        */ 
      LeadUtils.setTesting(); 
      CALC.ApexTesting();
      Lead l = new Lead(
         FirstName = 'Test',
         LastName  = 'Testofferson',
         Company   = 'Test Lead',
         Email     = 'test@test.com',
         Phone     = '1-800-555-TEST'
      );
      Database.Saveresult sr = Database.insert(l);
      String LeadId = sr.getId();
      
      Queue_Sync.clearActed();
      
      Opportunity o = new Opportunity(
         Name      = 'Test Opp',
         StageName = 'Open',
         CloseDate = Date.today()
      );
      insert o;
      
      Priority_Queue__c pq1 = new Priority_Queue__c(Name = l.Company,Lead__c=l.id,Priority__c = 1);
      insert pq1;
      
      Priority_Queue__c pq2 = new Priority_Queue__c(Name = o.Name,Opportunity__c=o.id,Priority__c = 2);
      insert pq2;
      
      List<Priority_Queue__c> PQs = new List<Priority_Queue__c>();
      for (Priority_Queue__c pq : [SELECT Id,Type__c,Priority__c FROM Priority_Queue__c where id =:pq1.id OR id =:pq2.id]) {
         System.debug('+++ ' + pq.Id + ' : ' + pq.Type__c);
         if (pq.Type__c == 'Lead') { pq.Priority__c = 1; }
         else                      { pq.Priority__c = 2; }
         PQs.add(pq);
      }
      
       System.assertEquals(2, PQs.size());
      update PQs;
      
      PageReference pageRef = new PageReference('/apex/PriorityQueue'); 
      Test.setCurrentPage(pageRef);
      
      PriorityQueue_Controller pqCtrl = new PriorityQueue_Controller();
      System.assertEquals('Priority__c', pqCtrl.sortExpression);
      System.assertEquals('ASC', pqCtrl.getsortDir());
      
      system.debug('pqCtrl value '+pqCtrl.Q);
      List<Priority_Queue__c> displayQs = pqCtrl.Q;
      System.assertEquals('test@test.com',displayQs[0].Email__c);  // Should be equal to inserted Lead's email
      
      pqCtrl.sortExpression = 'Priority__c';      // Change the sort order
      System.assertEquals('DESC', pqCtrl.getsortDir());
      pqCtrl.sortExpression = 'Company_Name__c';  // Change the sort column
      System.assertEquals('Company_Name__c', pqCtrl.sortExpression);
      System.assertEquals('ASC', pqCtrl.getsortDir());
      pqCtrl.fetchData();
           
      // Test the details pane
      pqCtrl.QID = pqCtrl.Q[0].Id;
      String bufferQID = pqCtrl.QID;   // To check to see if things are being removed from list
      pageRef = pqCtrl.passQID();
      
      // Simulate selecting the Lead status
      pqCtrl.strLeadStatus = 'Unqualified';
      pqCtrl.needsVal();
      pqCtrl.getValOptions();
      pqCtrl.strLeadStatus = 'Not Interested';
      pqCtrl.needsVal();
      pqCtrl.getValOptions();
      pqCtrl.strValValue = 'Really not interested';
      pageRef = pqCtrl.markComplete(); // Mark as complete, check the next in turn

      pqCtrl.QID = pqCtrl.Q[0].Id;
      pageRef = pqCtrl.passQID();
      // Simulate selecting the Opp status
      pqCtrl.strOppStage = 'Not Interested';
      pqCtrl.strValValue = 'Really not interested';
      pageRef = pqCtrl.closeDetails(); // Test close button
      System.assertNotEquals(bufferQID,pqCtrl.QID);
      
      // Refresh the page!
      pageRef = pqCtrl.refreshQuery();
      
      // Test Priorities
      List<SelectOption> options = pqCtrl.getPriorityToggle();
      pqCtrl.SelectedPriority = '1';
      pqCtrl.filterQuery();
      displayQs = pqCtrl.Q;
    
    }

}