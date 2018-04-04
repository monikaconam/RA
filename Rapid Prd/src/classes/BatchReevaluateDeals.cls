public with sharing class BatchReevaluateDeals implements Database.Batchable<sobject> {
    
    public DataBase.QueryLocator start(Database.BatchableContext bc)
    {
        return DataBase.getQueryLocator([select id from Priority_Queue__c]);
    }
    
    
    public void execute(Database.BatchableContext bc, List<sobject> scope)
    {
            List<priority_queue__C> pqList=new List<priority_queue__C>();
            try{
                    Database.update(scope,false);
                }
                catch(Exception e)
                {
                    System.debug('An exception has occurred -' +e.getMessage());
                    
                }
        
    }
    
    
    public void finish(Database.BatchableContext bc)
    {
        AsyncApexJob a = [SELECT id, ApexClassId, JobItemsProcessed, TotalJobItems,NumberOfErrors, CreatedBy.Email FROM 
                            AsyncApexJob WHERE id = :bc.getJobId()];
        
        String emailMessage = 'Batch job - Re-Evaluate Deals has finished.  It executed ' + a.totalJobItems 
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