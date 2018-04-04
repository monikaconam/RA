/*
@Name               : DealTerms_Ctrl 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        : 
@Revision History   : Uses of Field visa info__c,ucc_acknowledgement_date__c,Commented/Removed By MK Conam 2 Dec 2015
*/
public class DealTerms_Ctrl 
{
     public Opportunity oppRecord{get; set;}
     public String fundedAmount{get; private set;}
     public String EstimatedDailyTransactions{get; private set;}
     public string Percentage_comp{get;set;}
     public Sales_Check_List__c SalesChkFld{get;set;}
     List<Opportunity> oppList;
     String oppId;
     public DealTerms_Ctrl()
     {
        oppId = ApexPages.currentPage().getParameters().get('Id');
        
        if (oppId != null && oppId.trim() != '')
        {
            oppList = getOppList();
            if (!oppList.isEmpty()) 
            {
                        oppRecord = oppList.get(0);
                        
                        if(!oppRecord.Sales_Check_Lists__r.isEmpty())
                        {  
                            SalesChkFld = oppRecord.Sales_Check_Lists__r.get(0);
                        }
            }
            fundedAmount = FormulaFieldUtility.fundedAmount;
            if(FormulaFieldUtility.estimatedDailyRepay != null && !FormulaFieldUtility.estimatedDailyRepay.equals(''))
            {
                EstimatedDailyTransactions = ((Decimal.valueof(FormulaFieldUtility.estimatedDailyRepay)).setScale(2))+'';
            }
        }
        else 
        {  
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));  
        }    
    }
    
    public PageReference doSave()
    {           
        try
        {
            upsert oppRecord;
            List<Opportunity> tempOppList = getOppList();
            if(null != tempOppList)
            {
                oppRecord = tempOppList.get(0);
            }
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Deal Terms Information Saved Successfully!'));
        }
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    }
    
    private list<Opportunity> getOppList(){
        return new list<Opportunity>{[SELECT 
                                                Id, Amount, Percent_Payback__c,Paid_Off_Letter_Rec_d__c, Pay_Back_Amount__c,Estimated_Days_to_Repay__c,Previous_FICO__c,
                                                Loan_Term_Days__c,QC_Calculator_Average__c, AE_Calculator_Average__c, Gross_monthly_sales__c,
                                                QC_Gross_Monthly_Sales__c,Remaining_Balance__c, Percent_Paid_Off__c,Competitor_Advance_Company__c,
                                                X20_Day_Average_Daily_Repay__c, Current_ROI__c, Total_Repay_Amount__c, 
                                                Purpose_of_Funds__c, New_Percent_Payback__c,ucc_file_number__c, New_Payback_Price__c, Product__c,ucc_acknowledgement_date__c,
                                                Average_Daily_Repay__c, Tentative_Funding_Date__c, Expected_Daily_Repay__c,  If_Renewal_Preceding_Opportunity__c,
                                                If_Renewal_Preceding_Opportunity__r.Current_ROI__c,third_party_company_name__c, If_Renewal_Preceding_Opportunity__r.Average_Daily_Repay__c,
                                                If_Renewal_Preceding_Opportunity__r.Total_Repay_Amount__c, If_Renewal_Preceding_Opportunity__r.Expected_Daily_Repay__c,
                                                If_Renewal_Preceding_Opportunity__r.Purchase_Amount__c,third_party_payoff_amount__c,Underwriting_Approval__c,
                                                If_Renewal_Preceding_Opportunity__r.Advance_ID__c, 
                                                If_Renewal_Preceding_Opportunity__r.X20_Day_Average_Daily_Repay__c,If_Renewal_Preceding_Opportunity__r.Renewal_Number__c,
                                                If_Renewal_Preceding_Opportunity__r.Remaining_Balance__c, If_Renewal_Preceding_Opportunity__r.Percent_Paid_Off__c,
                                                If_Renewal_Preceding_Opportunity__r.Pay_Back_Amount__c, Previous_Balance__c, New_Split__c, New_Advance_Amount__c,
                                                Est_Days_to_Repay__c,New_Advance_Price__c,Pre_Qual_Decision_Date__c, Existing_Competitor_Advance2__c, Payoff_Amount__c,
                                                Payoff_Check_Sent__c, Pre_Qual_Pending_Date__c,   Initial_File_Review_Complete__c, Approved_With_Conditions__c, 
                                                Third_Party_Payoff__c,QC_Decision__c,Pre_Qual_Decision__c, UCC_Filing__c, UCC_Date__c, Pre_Qual_Unqualified_Reasons__c,
                                                UCC_Filing_Reason__c, UCC_Ordered__c, Pre_Qual_FAIL_Reason__c, Decision_Date__c,QC_Decision_Date__c, 
                                                Re_Decision_Date__c, Decline_Reason__c, Rescind_Reason__c, Unqualified_Reason__c, Exceptions__c, Underwriter_s_Score__c,
                                                Underwriter_Assigned__c,Pre_Qual_Person__c, Site_Survey_Ordered__c, Site_Survey_Ordered_Due_Date__c, Site_Survey_Available__c,
                                                Site_Survey_Available_Due_Date__c, Initial_File_Review2__c,DS_Start_Date_Time__c,DS_Person__c,DS_Retrieved_All_Conditions__c,   
                                                Manual_Applicant_1_FICO_Score__c,Manual_Applicant_2_FICO_Score__c, CALC_FICO__c, cc_Applicant_1_FICO__c, Applicant_2_FICO__c,Manual_Applicant_1_FICO__c, 
                                                Purchase_Amount__c, QC_Person__c, (SELECT Competitor_Advance_Company__c FROM Sales_Check_Lists__r)
                                        FROM 
                                                Opportunity 
                                        WHERE 
                                                Id = :oppId LIMIT 1]};
                                            
    }
}