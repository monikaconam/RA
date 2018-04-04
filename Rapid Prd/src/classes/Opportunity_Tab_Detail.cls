public class Opportunity_Tab_Detail 
{
    public String TabName {get;set;}
    public List<AnyField_Detail> fieldl {get;set;}
    
    /**  Commented By : MkConAm    Date:18 Aug 2015**/
    
    /** 
    public Opportunity_Tab_Detail(Id oppId)
    {
        try
        {
             Opportunity objOpportunity = [Select 
                                                 Id, Name,StageName, Type,AccountId,Account.BillingCity, Account.BillingCountry, 
                                                 Account.BillingState,Account.BillingStreet, Account.BillingPostalCode, 
                                                 Account.Roll_up_Approved__c, Account.Fax, Account.DateBusinessStarted__c, 
                                                 Account.Phone,Account.Name, Account.FederalTaxID__c, Account.First_Funding_Date__c, 
                                                 Account.Most_Recent_Funded_Renewal_Date__c, Time_For_Renewal_Date__c, 
                                                 Account.Last_Renewal_Date__c,CreatedDate, Account.Last_Created_Opportunity__c, 
                                                 Account.Legal_Name__c, Account.Months_with_Current_Processor__c, 
                                                 Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c, 
                                                 Account.Owned_Business_Since__c, Account.BusinessType__c, 
                                                 Account.OwnerId,Account.Type,Opportunity_Number__c 
                                             FROM 
                                                 Opportunity 
                                             WHERE 
                                                 Id =:oppId];
            
             if(objOpportunity != null)
             {
                        //objOpportunityDetail = new Opportunity_Detail(objOpportunity);
             }   
        }
        catch(Exception ex)
        {
        
        }
   }
   **/
        
    public class AnyField_Detail
    {
       Boolean isMandatory;
       Boolean isVisible;
       String fieldLabel;
       String fieldDataType;
       String fieldAPI; 
    }
    

}