public class CBRTesting_CtrlExtension {

    
    public Opportunity oppRecord{get; set;}
    
    public CBRTesting_CtrlExtension (ApexPages.StandardController controller)
    {
        Opportunity opp = (Opportunity)Controller.getRecord();
        String oppId = opp.id;

        if (oppId != null && oppId.trim() != '')
        {
            List<Opportunity> oppList = [SELECT 
                                                Id, CRR__c,ContactID__c
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
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'CBR Testing Saved Successfully!'));
        }
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    }
    
    /* commented out DS-CONAM- 07/30/2015
    public PageReference doCBRIntegration() {
        try{
// have to add code             
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'CBR Integrate successfully.'));
        }catch(Exception e){ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));}
        return null;
    }
    */
    
    
}