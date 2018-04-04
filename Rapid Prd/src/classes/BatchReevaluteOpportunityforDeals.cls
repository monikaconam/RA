public with sharing class BatchReevaluteOpportunityforDeals implements Database.Batchable<sObject>{
    
    public DataBase.QueryLocator start(Database.BatchableContext bc)
    {
        return DataBase.getQueryLocator([select id,accountid,name,Funded_by_WC__c,createddate from Opportunity where createddate>=LAST_N_DAYS:14]);
    }
    
    
    public void execute(Database.BatchableContext bc, List<Sobject> scope)
    {
        System.debug('scope '+scope);
        Boolean success = Queue_Sync.syncQueue(scope);
    }
    
    
    public void finish(Database.BatchableContext bc)
    {
        AsyncApexJob a = [SELECT id, ApexClassId, JobItemsProcessed, TotalJobItems,NumberOfErrors, CreatedBy.Email FROM 
                            AsyncApexJob WHERE id = :bc.getJobId()];
        
        String emailMessage = 'Batch job - Re-Evaluate Opportunity for Deals has finished.  It executed ' + a.totalJobItems 
                               + ' batches. Out of which ' + a.numberOfErrors + ' batches failed.'; 

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String[] toAddresses = new String[] {a.createdBy.email};
        String[] toAddresses = new String[] {'deepak@conamtechnologies.com'};
        mail.setToAddresses(toAddresses);
        mail.setReplyTo('noreply@salesforce.com');
        mail.setSenderDisplayName('Batch Job Summary - BatchReevaluteLeadforDeals ');
        mail.setSubject('Batch job completed');
        mail.setPlainTextBody(emailMessage);
        mail.setHtmlBody(emailMessage);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]       { mail });
        
    }

}