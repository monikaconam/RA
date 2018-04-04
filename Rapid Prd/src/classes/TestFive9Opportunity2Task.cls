@istest
public class TestFive9Opportunity2Task
{
    public static testMethod void unitTest()
    {
        Test.startTest();
        //DS-CONAM CALC.ApexTesting();
        Five9Task2OppMappings__c val=new Five9Task2OppMappings__c();
        val.Five9Disposition__c='Opp- No Contact – No VM Left';
        val.name='1';
        /*val.stageName='No contact Made';*/
        insert val;
        
        Account acc=TestUtils.createAccount();
        Campaign cTemp=TestUtils.createCampaign();
        Opportunity opp=TestUtils.createOpportunity(acc,cTemp);
        Task tTemp=new Task();
        tTemp.subject='Call';
        tTemp.CallDisposition='Opp- No Contact – No VM Left';
        tTemp.whatId=opp.id;
        insert tTemp;
        system.debug(opp.StageName);        
        Test.stopTest();
        
    }    
}