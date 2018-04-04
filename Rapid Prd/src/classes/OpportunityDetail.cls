/*
@Name               : OpportunityDetail 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field Account_In_Risk__c Commented/Removed By MK Conam 2 Dec 2015
@Revision History   : Uses of Field Account_In_Risk__c added By DS-CONAM 2 FEB 2016
*/
global class OpportunityDetail 
{
    global boolean isVisible { get; set;}
    global String btnText{get;set;}
    global Opportunity opp{get;set;}
    global String EstimatedDailyTransactions{get; private set;}
    public OpportunityDetail(ApexPages.StandardController controller) 
    {
        try
        {
        isVisible = false;
        String op= ApexPages.currentPage().getParameters().get('id');
            if(op != null && op.trim() !='')
            {
                opp=[SELECT
                            Renewal_Number__c,Renewal__c,Campaign.name, Account_Database_Entry_Due_Date__c,
                            Account_Database_Entry__c,Id, Name,StageName, Type,AccountId,Account.BillingCity, Account.BillingCountry, 
                            Account.BillingState,Account.BillingStreet, Account.BillingPostalCode, Account.Roll_up_Approved__c, Account.Fax, 
                            Account.DateBusinessStarted__c, Account.Phone,Account.Name, Account.FederalTaxID__c, Account.First_Funding_Date__c, 
                            Account.Most_Recent_Funded_Renewal_Date__c, Time_For_Renewal_Date__c, Account.Last_Renewal_Date__c,
                            CreatedDate, Account.Last_Created_Opportunity__c, Account.Legal_Name__c, Account.Months_with_Current_Processor__c, 
                            Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c,Syndication_Amount__c, Product__c, 
                            PrimaryCampaignSource__c,  OwnerId, LastModifiedById, CreatedById,  Amount,  Advance_ID__c,  
                            Account.Owned_Business_Since__c, Account.BusinessType__c, Pay_Back_Amount__c, Percent_Payback__c, Loan_Term_Days__c,
                            Account.ownerId,Account.Type,Purchase_Amount__c,Underwriter_Assigned__c,Processing_Representative__c, 
                            Opportunity_Number__c,Submit_to_UW_Processing__c,
                            CALC_Link__c,Notes_Link__c, Account_In_Risk__c
                        FROM 
                            Opportunity 
                        WHERE 
                            Id =:op];
                            
                EstimatedDailyTransactions = ((Decimal.valueof(FormulaFieldUtility.estimatedDailyRepay)).setScale(2))+'';
            }
            else
            {
                ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'Please provide Opportunity ID');
                ApexPages.addMessage(msg);      
            }
        }
        
        catch(Exception ex)   
        {  
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred'+ex.getMessage()); 
            ApexPages.addMessage(msg);  
        }
       
    }


    
    global OpportunityDetail()
    {
        btnText='Edit';
        
        try
        {
            isVisible = false;
            String op= ApexPages.currentPage().getParameters().get('id');
            if(op != null && op.trim() !='')
            {
                    opp=[SELECT 
                            Renewal_Number__c,Renewal__c,Campaign.name,Account_Database_Entry_Due_Date__c,
                            Account_Database_Entry__c,Id, Name,StageName, Type,AccountId,Account.BillingCity, Account.BillingCountry, 
                            Account.BillingState,Account.BillingStreet, Account.BillingPostalCode, Account.Roll_up_Approved__c, Account.Fax, 
                            Account.DateBusinessStarted__c, Account.Phone,Account.Name, Account.FederalTaxID__c, Account.First_Funding_Date__c, 
                            Account.Most_Recent_Funded_Renewal_Date__c, Time_For_Renewal_Date__c, Account.Last_Renewal_Date__c,
                            CreatedDate, Account.Last_Created_Opportunity__c, Account.Legal_Name__c, Account.Months_with_Current_Processor__c, 
                            Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c,Syndication_Amount__c, Product__c, 
                            PrimaryCampaignSource__c,  OwnerId, LastModifiedById, CreatedById,  Amount,  Advance_ID__c,  
                            Account.Owned_Business_Since__c, Account.BusinessType__c, Pay_Back_Amount__c, Percent_Payback__c, Loan_Term_Days__c,
                            Account.ownerId,Account.Type,Purchase_Amount__c,Underwriter_Assigned__c,Processing_Representative__c, 
                            Opportunity_Number__c,Submit_to_UW_Processing__c, CALC_Link__c,Notes_Link__c, Account_In_Risk__c 
                        FROM
                            Opportunity 
                        WHERE 
                            Id =:op];
                            
                    EstimatedDailyTransactions = ((Decimal.valueof(FormulaFieldUtility.estimatedDailyRepay)).setScale(2))+'';
            }
            else
            {
                ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'Please provide Opportunity ID');
                ApexPages.addMessage(msg);      
            }
        }
        catch(Exception ex)   
        {  
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred'+ex.getMessage()); 
            ApexPages.addMessage(msg);  
        }
       
    }
    global PageReference onEdit11() 
    {
        isVisible = true;
        return null;
    }
    
    global PageReference onEdit() 
    {    
        try
        {
            update opp.Account;
            update opp.Campaign;    
            update opp;

        }
        catch(Exception ex)   
        {   
            System.debug(' An exception! '+ex.getMessage());
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred');    
            ApexPages.addMessage(msg);  
        }                    
        return null;
    }
    global PageReference onCancel() 
    {
        btnText='Edit';
        isVisible = false;
        return null;    
    }
}