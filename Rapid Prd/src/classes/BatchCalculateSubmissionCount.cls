/*
@Name               : BatchCalculateSubmissionCount
@Author             : RS-Conam
@Date               : 16 March 2018
@Description        : Calculate submission count on Boop
*/
global class BatchCalculateSubmissionCount implements Database.Batchable<sObject>{

    List<string> fieldNamesLst = BOOPTriggerHelper.getSubmittedFieldAPINames();
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        string query = ' SELECT Id '; 
        for(String fieldApi : fieldNamesLst)
        {
            query = query + ',' + fieldApi;
        }
            query = query + ' from BOOP__c';  
            return Database.getQueryLocator(query); 
    }
    
    global void execute(Database.BatchableContext BC, List<BOOP__c> scope){
    
        try{
            List<BOOP__c> listBoop = new List<Boop__c>();
            for(Boop__c varScope : scope)
            {
                Integer submissionCounter=0;
                for(String fieldName : fieldNamesLst)
                {
                    if(varScope.get(fieldName )==true)
                    {
                        submissionCounter++;
                    }
                 }
                varScope.Total_Submission_Count__c = submissionCounter;
                listBoop.add(varScope);
             }
            if(listBoop.size() > 0)
            {
                update listBoop;
            }    
        }
        catch(Exception e)
        {
            System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
        }
             
    }
    
    global void finish(Database.BatchableContext BC){
    }    
}