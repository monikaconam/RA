/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestScheduleBatchReevaluateLead {

    static testMethod void myUnitTest() {
    
        Test.startTest();
        CALC.ApexTesting();
        Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company', Phone='415789415',Lastname='lastname');
        insert lTest;
    
        // Schedule the test job
        String jobId =ScheduleBatchReevaluteLeadforDeals.scheduleExecution('ScheduleBatchLeadforDealstest'+System.currentTimeMillis());
      
    
          // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
    
          // Verify the expressions are the same
        System.assertEquals('0 0 1 * * ?',  ct.CronExpression);
    
          // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
       
          //for opportunity
          
        Account acc=new Account();
        acc.name='test';
        acc.recordtypeid='0125000000099ajAAA';
        acc.BusinessType__c='Small Business';
        acc.FederalTaxID__c='123457896';
        acc.Owned_Business_Since__c=System.today().addYears(-10);
        acc.DateBusinessStarted__c=System.today().addYears(-10);
        insert acc;
            
            
        Opportunity opp2=new Opportunity();
        opp2.name='testopp1';
        opp2.StageName = 'Open';
        opp2.CloseDate = Date.today();
        opp2.Submit_to_UW_Processing__c=System.now();
        opp2.accountid=acc.id;
        opp2.Product__c='Loan';
        opp2.Percent_Paid_Off__c=55;
        opp2.State_Of_Location__c='CT';
            
        insert opp2;
        jobId =ScheduleBatchReevaluteOppforDeals.scheduleExecution('ScheduleBatchOppforDealstest'+System.currentTimeMillis());
       /*   String jobId = System.schedule('ScheduleBatchReevaluteOppforDeals','0 30 1 * * ?',
             new ScheduleBatchReevaluteLeadforDeals ());*/
    
          // Get the information from the CronTrigger API object
        ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
    
          // Verify the expressions are the same
        System.assertEquals('0 30 1 * * ?',  ct.CronExpression);
    
          // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
           
                  
        
        
        Test.stopTest();    
   
    }
    

      
}