/**
@Name            : LeadProspectContactedHandler
@Author          : Monika CONAM
@Date            : Sept 21 2016
@Description     : Handler Class used in MasterTaskTrigger
**/ 
public class LeadProspectContactedHandler{
    public static void UpdateLeadProspectContacted(List<Task> TaskNewList){
        try{
            List<Id> leadIds=new List<Id>();           
            for(Task t:TaskNewList){
                if(t.WhoId!=NULL && t.CallDurationinSeconds>=120 && String.valueOf(t.whoId).startsWith('00Q')==TRUE){                             
                            leadIds.add(t.whoId);                   
                }
             }
            if (leadIds.size() > 0) { 
                List<Lead> lstTemp = [SELECT Id, Prospect_Contacted__c FROM Lead WHERE Id IN :leadIds and IsConverted = false and Prospect_Contacted__c = FALSE];          
                List<Lead> leadlst=new List<Lead>();
                For(Lead l : lsttemp){
                    l.Prospect_Contacted__c=TRUE;
                    leadlst.add(l);
                } 
                
                if (leadlst.size() > 0) {             
                    Database.upsert(leadlst,false);
                }    
            }                            
        }
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage());
        }
    }
}