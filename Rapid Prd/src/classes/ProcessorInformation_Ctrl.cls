/*
@Name               : ProcessorInformation_Ctrl
@Author             : DS-CONAM
@Date               : 13 APR 2015
@Revision History   : Added 3 new fields On Hold_Start_Date__c, On Hold_Stop_Date__c and On Hold_Stop_Date__c

@Author             : MK CONAM
@Date               : 2 DEC 2015
@Revision History   : Uses of Field received_rapid_funding_addendum__c,amex only_gcs_mid _2__c,
                      if_no_explain__c Commented/Removed

@Author             : DS-CONAM
@Date               : 22 FEB 2015
@Revision History   : Uses of Field received_rapid_funding_addendum__c,amex only_gcs_mid_ 2__c,
                      if_no_explain__c added back
*/

public class ProcessorInformation_Ctrl 
{
    public Opportunity oppRecord{get; set;}
    public Account accRecord{get; set;}
    
    public ProcessorInformation_Ctrl()
    {
        String oppId = ApexPages.currentPage().getParameters().get('Id');        
        if (oppId != null && !oppId.trim().equals(''))
        {
            List<Opportunity> oppList = [SELECT
                                             Id,AccountId,Current_Processor__c, Processor_Name__c,Site_Survey_Ordered_Due_Date__c,
                                             Split_Fund_Set_Up__c, Resulting_Process__c,Site_Survey_Available__c,third_party_company_name__c,
                                             New_Processor_Setup_Completed__c, Site_Survey_Available_Due_Date__c, Approved_With_Conditions__c,
                                             Exception_Requested__c, Site_Survey_Ordered__c, third_party_payoff_amount__c, Submitted_For_Funding_Approval__c, 
                                             Existing_Competitor_Advance2__c,Third_Party_Payoff__c,DDA_Requested__c,DDA_Received__c, Payoff_Amount__c,
                                             Payoff_Check_Sent__c, Processing_Representative__c,Competitor_Advance_Company__c ,
                                             received_rapid_funding_addendum__c, rapid_funding_addendum__c ,if_no_explain__c                         
                                         FROM 
                                             Opportunity 
                                         WHERE 
                                             Id = :oppId LIMIT 1];
             System.debug(oppList.get(0));
                                            
            if (oppList != null && !oppList.isEmpty()) 
            {
                oppRecord = oppList.get(0); 
                List<Account> accountList = [SELECT 
                                                    Id, Name, Number_of_Locations__c,
                                                    Number_of_Terminals_at_Location__c
                                                FROM 
                                                    Account 
                                                WHERE 
                                                    Id =:oppRecord.AccountId];  
                if(accountList != null && !accountList.isEmpty()) 
                {
                    accRecord =   accountList.get(0);
                }                           
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
            if(accRecord != null)
            {
                upsert accRecord;
            }
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Processor Information Saved Successfully!'));
        }
        catch(Exception e)
        { 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    } 
    
}