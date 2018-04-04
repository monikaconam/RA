public class PreQual_Ctrl 
{
    public Opportunity oppRecord{get; set;}
    
    public PreQual_Ctrl()
    {
        String oppId = ApexPages.currentPage().getParameters().get('Id');        
        if (oppId != null && oppId.trim() != '')
        {
            List<Opportunity> oppList = [SELECT 
                                                Id, Pre_Qual_Person__c, Pre_Qual_Decision__c, Pre_Qual_Pending_Date__c,
                                                Pre_Qual_Decision_Date__c, Pre_Qual_FAIL_Reason__c, Pre_Qual_Unqualified_Reasons__c                                             
                                           FROM 
                                                Opportunity 
                                           WHERE 
                                                Id = :oppId LIMIT 1];
                                            
            if (!oppList.isEmpty()) 
            {
                oppRecord = oppList.get(0);               
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
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Pre-Qual Information Saved Successfully!'));
        }
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    }
}