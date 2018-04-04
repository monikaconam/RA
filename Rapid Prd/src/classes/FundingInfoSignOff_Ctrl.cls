/*
@Name               : FundingInfoSignOff_Ctrl 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        : @Revision History   : Uses of psoe loan key suppliment ,RA Finance Calc ,psoe voided check ,received rapid funding addendum  
                      green r errors ,psoe no qc calc ,Funding Checklist Error ,mla addendum ,PSOE Competitor Payoff ,rapid funding addendum ,
                      psoe funding checklist  Removed/Commented BY MK Conam 2 Dec 2015 

*/
public with sharing class FundingInfoSignOff_Ctrl 
{

    public Opportunity oppRecord{get; set;}
    public Account accRecord{get; set;}
    public Decimal applicant1FICO{get; private set;}
    public Decimal yrsInBusiness{get; private set;}      
    public fundingInfoSignOff_Ctrl()
    {
        String oppId = ApexPages.currentPage().getParameters().get('Id');        
        if (oppId != null && oppId.trim() != '')
        {
            List<Opportunity> oppList = [SELECT 
                                            Id, Type_of_Entity__c, Legal_Name__c, Current_ROI__c, OwnerId, Processing_Representative__c, 
                                            UW_Underwriter_Assigned__c,Product__c, Amount, Pay_Back_Amount__c,Packet_Preparation_Sent__c,
                                            Percent_Payback__c, Estimated_Daily_Transactions__c, 
                                            SIC_CODE__c, Business_Category__c, Applicant_2_FICO__c,Account_Database_Entry_Due_Date__c, 
                                            AccountId,Manual_Applicant_1_FICO_Score__c, Manual_Applicant_2_FICO_Score__c, Closed_Reason__c,
                                            PSOE_Business_Term__c, Account_Database_Entry__c, Funded_by_WC__c, Funding_Status__c, CloseDate
                                        FROM 
                                            Opportunity 
                                        WHERE 
                                            Id = :oppId 
                                        LIMIT 1];                                            
            if (!oppList.isEmpty())
            {
                oppRecord = oppList.get(0); 
                List<Account> accountList = [SELECT 
                                                Id, Name, Legal_Name__c,
                                                BillingStreet, BillingCity, BillingState, BillingPostalCode, 
                                                Number_of_Locations__c,Number_of_Terminals_at_Location__c
                                            FROM 
                                                Account 
                                            WHERE 
                                                Id =:oppRecord.AccountId];
                                                
                accRecord=!accountList.isEmpty() ? accountList.get(0) : new Account();
            }            
            applicant1FICO = FormulaFieldUtility.ccApplicant1FICO;
            yrsInBusiness = FormulaFieldUtility.yrsInBusiness;
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));   
        }    
    }
    
    public PageReference doSave() 
    {
        Savepoint sp = Database.setSavepoint();
        try
        {
            if(accRecord != null) 
            {
                upsert accRecord;
                if(accRecord.Id != null) 
                {
                    oppRecord.AccountId = accRecord.Id;    
                }    
            }
            upsert oppRecord;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Funding Info Sign Off Information Saved Successfully!'));
        }
        catch(Exception e)
        { 
            Database.rollback(sp); 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        } 
            return null;
    }
}