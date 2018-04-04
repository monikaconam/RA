/**
@Name            : BatchLeadProsContact
@Author          : Monika CONAM
@Date            : Sept 21 2016
@Description     : This BatchClass is used to set Prospect_Contacted__c(Lead) value True for not converted lead
**/
global class BatchLeadProsContact implements Database.Batchable <sObject> { 
   global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT ID,Whoid,CallDurationinSeconds FROM Task WHERE WhoId!=NULL AND CallDurationinSeconds >= 90';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Task> tasknew){
        
        try{
            List<Id> leadIds=new List<Id>();           
            for(Task t:tasknew){
                if(String.valueOf(t.whoId).startsWith('00Q')==TRUE){                             
                    leadIds.add(t.whoId);     
                }
             }
            System.Debug(leadIds.size());
            System.Debug(leadIds[0]);
            System.Debug([Select ID,Prospect_Contacted__c FROM Lead WHERE Id IN :leadIds]);
            if (leadIds.size() > 0 ) {                           
                List<Lead> lstTemp = [SELECT Id, Prospect_Contacted__c FROM Lead WHERE Id IN :leadIds and IsConverted = false and Prospect_Contacted__c = FALSE];    
                System.Debug(lstTemp.size());  
                System.Debug(lstTemp[0]);  
                List<Lead> leadlst=new List<Lead>();
                For(Lead l : lsttemp){ 
                    l.Prospect_Contacted__c=TRUE; 
                    leadlst.add(l);
                }
                
                if (leadlst.size() > 0) {             
                    Database.update(leadlst,false);
                }               
            }  
                   
        }     
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage());
        }
    }
   
    global void finish(Database.BatchableContext BC){
    }
        
}