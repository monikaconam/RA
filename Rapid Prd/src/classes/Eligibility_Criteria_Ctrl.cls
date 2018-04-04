public with sharing class Eligibility_Criteria_Ctrl {

public Opportunity oppRecord{get; set;}
     
     public Eligibility_Criteria_Ctrl(){
         String oppId = ApexPages.currentPage().getParameters().get('Id');
        
        if (oppId != null && oppId.trim() != ''){
            List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE Id = :oppId LIMIT 1];
                                            
            if (!oppList.isEmpty()) {
                oppRecord = oppList.get(0); 
               
            }
        }else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));   
        }    
    }
    
    public PageReference doSave() {
           
        try{
            upsert oppRecord;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Eligibility Criteria Information Saved Successfully!'));
        }catch(Exception e){

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    } 
}