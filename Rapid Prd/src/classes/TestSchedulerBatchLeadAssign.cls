/*
Created: 08/12/2015
MK-CONAM
Test Class of ScheduleLeadBatchAssign Schedular Class
*/

@isTest

private class TestSchedulerBatchLeadAssign 
{
    static testMethod void myLeadScheduleTest() 
    {
    
        Test.startTest();
        Transfer_Leads_for_Calling_User__c cNew=new Transfer_Leads_for_Calling_User__c();
        cNew.name='Brian Klenk';
        insert cNew;
        
        Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company', Phone='415789415',Lastname='lastname');
        insert lTest;

        
        // Schedule the test job
        String jobId =SchedulerBatchLeadAssign.scheduleMethod();
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];    
        System.assertEquals(0, ct.TimesTriggered);
        System.assertNotEquals(Null, ct.TimesTriggered);
              
        
        Test.stopTest();    
   
    }
    

      
}