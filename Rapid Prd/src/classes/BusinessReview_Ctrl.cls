/*
@Name               : BusinessReview_Ctrl 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field onfirmed_business_information_from_qc__c Commented/Removed By MK Conam 2 Dec 2015
*/

public class BusinessReview_Ctrl 
{

     public Opportunity oppRecord{get; set;}
     public Account accRecord{get; set;}
     public String CreditAlert{get; private set;} 
     public String SCFAlert{get; private set;} 
     public String BusinessCategoryAlert{get; private set;}
     public String BusinessAlertCount{get; private set;}
     public String CriteriaDecision{get; private set;}
     public String isTheBusinessTypeConsideredLuxury{get; private set;}
     
     
     public BusinessReview_Ctrl(){
         String oppId = ApexPages.currentPage().getParameters().get('Id');
        
        if (oppId != null && oppId.trim() != ''){
            List<Opportunity> oppList = [SELECT 
                                                Id,Type_of_Entity__c, Business_Status__c, AccountId, Other_UCC_Filings__c, 
                                                EC_Company_in_business_6_months__c, Business_Tax_Lien_Date_Filed__c, 
                                                Annual_CC_sales_Avg_4_Mo_times_12__c, Current_Processor__c, 
                                                Annual_Gross_sales_Avg_2_Mo_times_12__c, Processor_Name__c, SIC_CODE__c,
                                                Business_Category__c,CRR__c, CRR__r.FICO__c, Merchant_Website__c
                                        FROM 
                                                Opportunity 
                                        WHERE 
                                                Id = :oppId LIMIT 1];
                                            
            if (!oppList.isEmpty()) {
                oppRecord = oppList.get(0); 
            }
            // Business Alerts
            creditAlert = FormulaFieldUtility.QCConditionalCriteria;
            SCFAlert =  FormulaFieldUtility.QCSCFAlert;
            BusinessCategoryAlert = FormulaFieldUtility.QCBusinessCategoryAlert;
            BusinessAlertCount = FormulaFieldUtility.BABusinessAlertCount;
            CriteriaDecision = FormulaFieldUtility.ECCriteriaDecision;
            isTheBusinessTypeConsideredLuxury = FormulaFieldUtility.BAIsTheBusinessTypeConsideredLuxury;
               
            
        }else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));   
        }    
    }
     
     
    
    public PageReference doSave() {
           
        try{
            if(oppRecord != null) {
                upsert oppRecord;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Business Review Information Saved Successfully!'));
            }
        }catch(Exception e){

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    } 
    
}