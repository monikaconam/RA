/*
Created: 04/03/2015
DS-CONAM
This class was created to populate the new phone field(Phone_cti_modified__c) that has been created to use Five9 from VF
*/

global class batchPriorityqueueUpdate implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'select id, Phone_cti_modified__c from priority_queue__C where Phone_cti_modified__c=\'\' and createddate>2015-01-01T00:00:00z order by lastmodifieddate';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Priority_queue__c> scope) {
    System.debug(scope);
        List<Priority_queue__c> pq=new List<Priority_queue__c>();
         for(Priority_queue__c pqTemp : scope) pq.add(pqTemp);  
        
        if(pq.size()>0) update pq;
        
    }   
    
    global void finish(Database.BatchableContext BC) {
    }
}