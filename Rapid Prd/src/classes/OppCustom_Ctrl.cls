/*
@Name               : OppCustom_Ctrl 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  

*/

public with sharing class OppCustom_Ctrl 
{
    public Opportunity objOpportunity {get;set;}
    public OppCustom_Ctrl(ApexPages.StandardController controller) 
    {
        String OppId = apexpages.currentpage().getparameters().get('Id');
            if(OppId != null && OppId.trim() != '')
            {            
                List<Opportunity> Opportunities = [SELECT 
                                                        Partner_Email_6__c,Partner_Email_5__c,Partner_Email_4__c, Partner_Email_3__c,Partner_Email_2__c,Partner_Email_1__c,
                                                        RecordType.Name, Account.Name, third_party_company_name__c,Wage_Garnishment_w_in_the_past_12_months__c,
                                                        third_party_payoff_amount__c,ucc_file_number__c, Write_Off_Date__c, Wire_Amount__c,  Type_of_Change__c,
                                                        Welcome_Kit_Sent__c, Welcome_Kit_Sent_Due_Date__c, ucc_acknowledgement_date__c,Voided_Check_Received__c, 
                                                        survey_needed__c, User__c, Unqualified_Reason__c, Underwriting_Approval__c, Underwriter_s_Score__c,   USER_ID__c, 
                                                        UCC_Ordered__c, UCC_Filing__c, UCC_Filing_Reason__c, UCC_Debtor_Legal_Name__c, UCC_Date__c,  
                                                        Type_of_Entity__c, Type, Transition_Initials__c, Tracking_Code_Opp__c, Time_For_Renewal_Date__c, 
                                                        Third_Party_Payoff__c, Tentative_Funding_Date__c, Telemarketing_Comments__c, Tax_Liens_Open__c, Tax_Liens_Judgment_on_Business__c, 
                                                        Syndication_Amount__c, SyncedQuoteId, Submitted_For_Funding_Approval__c, Submit_to_UW_Processing__c, 
                                                        State_Of_Location__c, StageName, Split_Fund_Set_Up__c, Site_Visit_Ordered__c, 
                                                        Site_Survey_Ordered__c, Site_Survey_Ordered_Due_Date__c, Site_Survey_Available__c,
                                                        Signed_Contract_Received__c, Sent_Mailer__c,  Send_Auto_Updates__c, SIC_CODE__c, Resulting_Process__c,
                                                        Search_Type_Opp__c, Risk_Alert_Date__c, Rescind_Reason__c, Renewal__c, Renewal_Number__c, Renewal_Eligibility__c, Risk_Alert_Source__c,
                                                        Remaining_Balance__c, Referring_URL_Opp__c, Reference_Number__c, RecordTypeId, Loan_Term_Days__c,
                                                        Re_Decision_Date__c, RENEWAL_DATE__c, QC_Person__c, QC_Gross_Monthly_Sales__c, 
                                                        QC_Decision__c, QC_Decision_Date__c, QC_Calculator_Average__c, Processing_Representative__c,
                                                        Purpose_of_Funds__c, Product__c, Processor_Name__c, Processing_and_or_Origination_Fee_s__c, 
                                                        Probability, Previous_Sales_Rep__c, Previous_Opportunity__c, Open_Account_Pay_Off_Letter_Sent__c,
                                                        Pre_Qual_Unqualified_Reasons__c,  Pre_Qual_FAIL_Reason__c, PSOE_Business_Term__c,  
                                                        Pre_Qual_Decision__c, Pre_Qual_Decision_Date__c, Postcard_Code__c, ForecastCategory,  FiscalYear,
                                                        Percent_Payback__c, Percent_Paid_Off__c, Payoff_Letter_Received__c, Payoff_Check_Sent__c, Intended_use_of_cash__c,
                                                        Payoff_Amount__c, Pay_Off_ROI__c, Pay_Back_Amount__c, Paid_Off_Letter_Rec_d__c, Paid_Off_Date__c, Packet_Preparation_Sent__c,
                                                        PPC_Creative_Opp__c, PASSWORD__c, OwnerId, Other_UCC_Filings__c, Opportunity_Number__c, Opportunity_Level__c,  
                                                        Open_Account_Pay_Off_Letter_Requested__c, Monthly_cc_sales__c, Manual_Applicant_1_FICO__c,Gross_monthly_sales__c,
                                                        Not_Interested_Reason__c, NextStep, New_Split__c, New_Processor_Setup_Completed__c, New_Lead_Source__c, 
                                                        New_Advance_Amount__c, Name, NVMS_Status__c, NVMS_Report__c, Mortgage_Delinquent__c, 
                                                        Management_Sign_Off__c, MI_Website_if_availible__c, HasOpportunityLineItem,  
                                                        Legible_4_months_processing_statements__c, Legal_Name__c, Lead_ID_Opp__c, Lead_Created_Dated_Opp__c, 
                                                        LeadSource, Keyword_Serach_Type_Opp__c, Judgements_Open__c, IsWon, IsDeleted, IsClosed,   
                                                        Initial_underwriting_approval__c, Individual_Bankruptcies__c,  Site_Survey_Available_Due_Date__c,
                                                        Id, How_did_you_hear_about_us__c, Funding_Status__c, Funded_by_WC__c,  ForecastCategoryName,  FiscalQuarter, Fiscal, 
                                                        ExpectedRevenue, Exceptions__c, Estimated_Days_to_Repay__c, Email_Validation_Code__c, Email_Address__c, 
                                                        Does_the_Merchant__c, Does_Merchant_Own_The_Business_Location__c,
                                                        Description, Decline_Reason__c, Decline_Letter_Sent__c, Decline_Letter_Sent_Due_Date__c, Decision_Date__c, 
                                                        Date_Split_Changed__c, Current_ROI__c, Current_Processor__c, CreatedDate, CreatedById, Contact__c, ContactID__c, 
                                                        Confirmed_wire_amount_with__c, Business_Judgements__c, CloseDate, Campaign_name__c,
                                                        Closed_Reason__c, Closed_Account_Paid_Off_Letter_Sent__c, CampaignId, Calculate_Due_Dates__c, CRR__c,  
                                                        Business_Tax_Lien_Date_Filed__c, Business_Status__c, Business_Open_Tax_Liens__c, Business_Category__c, Business_Bankruptcies__c, 
                                                        Advance_Payoff_Date__c, AsOfDate_for_Remaining_Balance__c,  Approved_With_Conditions__c, Applicant_2_FICO__c, Amount, 
                                                        Account_Database_Entry__c, Account_Database_Entry_Due_Date__c, AccountId,  AE_Calculator_Average__c, Notes_from_Prefunding_Call__c
                                                    FROM 
                                                        Opportunity
                                                    WHERE 
                                                        Id =:apexpages.currentpage().getparameters().get('id')];
            if(Opportunities  != null && !Opportunities.isEmpty())
            {
                objOpportunity = Opportunities.get(0);
            }
            else
            {                       
                objOpportunity = new Opportunity();               
            }
            
            //this.objOpportunity  = (Opportunity)controller.getRecord();
            }
            else
            {                       
                objOpportunity  = new Opportunity();            
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));
            }
    }
    
    public PageReference cancel() 
    {
        return null;
    }
    
    public PageReference save() 
    {
        try
        {
            upsert objOpportunity;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Saved Successfully!'));
        }
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    }   
    
    
}