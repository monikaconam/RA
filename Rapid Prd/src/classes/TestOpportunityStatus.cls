@isTest
private class TestOpportunityStatus 
{
    static testMethod void myUnitTest() 
    {
        Test.startTest();
         OpportunityStatus oppOS = new OpportunityStatus();
         oppOS.Status='TestStatus';
         oppOS.Status_Reason='TestStatus_Reason';  
         Test.stopTest();
    }
}