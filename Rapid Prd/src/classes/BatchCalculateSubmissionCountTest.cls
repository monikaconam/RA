/*
@Name               : BatchCalculateSubmissionCountTest
@Author             : RS-Conam
@Date               : 16 March 2018
@Description        : Test class for BatchCalculateSubmissionCount
*/
@isTest
public class BatchCalculateSubmissionCountTest
{
    @isTest
    public static void calculateCount()
    {
        List<string> fieldNamesLst = BOOPTriggerHelper.getSubmittedFieldAPINames();
        Set<String> countApiNames = new Set<String>();
        
        List<Boop__c> boopList = new List<Boop__c>();
        
        Marble__c m = new Marble__c();
        m.Name = 'Test Marble';
        m.Where_Did_You_Find_This_Client__c = 'Credit Karma';
        insert m;
        
        Marble__c marble = [SELECT Id,Name FROM Marble__c WHERE Id =: m.Id];
        System.assertEquals(marble.Name , 'Test Marble');
        
        for(Integer i=0;i<100;i++)
        {
            Boop__c newRecord = new Boop__c();
            for(String apiNames : fieldNamesLst)
            {
                newRecord.put(apiNames,true);
                countApiNames.add(apiNames);
            }
            newRecord.Marble__c = m.Id;
            boopList.add(newRecord);
            
         }
        insert boopList;
        
        Boop__c boopCount = [SELECT Id,Total_Submission_Count__c FROM Boop__c where Id =: boopList[0].Id];
        System.assertEquals(countApiNames.size(),boopCount.Total_Submission_Count__c);
        
        System.debug('Size of Map@@@'+countApiNames.size());
        
        Test.startTest();
        BatchCalculateSubmissionCount subCount = new  BatchCalculateSubmissionCount();
        Database.executeBatch(subCount,100);
        Test.stopTest();
    }
}