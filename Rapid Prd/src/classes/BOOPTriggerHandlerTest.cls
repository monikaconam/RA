/*
@Name               : BOOPTriggerHandlerTest
@Author             : DS-Conam
@Date               : 6 March 2018
@Description        : Calculate submission count on Boop
@Class         : BOOPTriggerHandler, BOOPTriggerHelper
*/
@isTest
public class BOOPTriggerHandlerTest
{
    @isTest
    public static void submissionOnInsert()
    {
        Test.startTest();
        Marble__c marble = new Marble__c();
        marble.Home_Based__c = 'Yes';
        marble.Where_Did_You_Find_This_Client__c = 'Renewal';
        marble.Name = 'abc';
        marble.BOOP_Status__c = 'New';
        insert marble;    
        
        BOOP__c newRecord = new BOOP__c();
        newRecord.Status__c = 'New';
        newRecord.Marble__c = marble.Id;
        newRecord.Accountable_Submitted__c=true;
        insert newRecord;
        
        List<BOOP__c> bTemp=[Select id, Total_Submission_Count__c,Accountable_Submitted__c from BOOP__c where id=:newRecord.id];
        System.assertEquals(1,bTemp.get(0).Total_Submission_Count__c );
        
        newRecord.Accountable_Submitted__c=false;
        update newRecord;
        
        bTemp=[Select id, Total_Submission_Count__c,Accountable_Submitted__c from BOOP__c where id=:newRecord.id];
        System.assertEquals(0,bTemp.get(0).Total_Submission_Count__c );
        Test.stopTest();
    } 
}