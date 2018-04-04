public with sharing class Oppr_Document_Ctrl
{
    public Oppr_Document__c objOppDoc {get;set;}
    String oppId;
    
    public Oppr_Document_Ctrl (ApexPages.StandardController stdController) 
    {
            oppId = '';
            String oppdocId = ApexPages.currentPage().getparameters().get('Id');
          
            if(oppdocId != null && oppdocId.trim() != '')
            {
                List<Oppr_Document__c> oppDocList = (List<Oppr_Document__c>)Database.Query(genDynamicQuery(oppdocId)); 
                
                if(oppDocList != null && !oppDocList.isEmpty())
                {
                    objOppDoc = oppDocList.get(0);
                    oppId = objOppDoc.Opportunity__c;
                }
                else
                {                       
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid Customer Survey Id'));
                    objOppDoc = new Oppr_Document__c ();
                    /*objMerchant.Opportunity__c = OppId;*/
                }
            }
            else
            {                       
                objOppDoc = new Oppr_Document__c ();
                String returnURL =  apexpages.currentpage().getparameters().get('retURL');
                Integer startindex = returnURL.indexOf('oppId=');
                integer nextparam =  returnURL.indexOf('&',startindex);
                /*
                if(nextparam == -1) 
                {
                    oppId = returnURL.subString(startindex+'oppId='.length());                   
                }
                else 
                {
                    oppId = returnURL.subString(startindex+'oppId='.length(), nextparam);                    
                }
          		*/
                oppId = nextparam == -1 ? returnURL.subString(startindex+'oppId='.length()) :returnURL.subString(startindex+'oppId='.length(), nextparam);
                
                if(oppId != null && oppId.trim() != '') 
                {
                    objOppDoc.Opportunity__c =  oppId;  
                }
                /*objMerchant.Opportunity__c = OppId;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));*/
            }
    }
    
    public String genDynamicQuery(String oppdocId)
    {
         if(oppdocId != null) 
         {
             String fieldSets = '';
             for (SObjectField field : Oppr_Document__c.SObjectType.getDescribe().fields.getMap().values()) 
             {
                  fieldSets = fieldSets + field.getDescribe().getName() + ',';
             }
             
             if (fieldSets.length() > 0)
             {
                 fieldSets = fieldSets.subString(0,fieldSets.length()-1);
                 String dynamicQuery = 'SELECT ' + fieldSets + ' FROM Oppr_Document__c WHERE Id=:oppdocId';
                 return dynamicQuery;   
             }
         }
         return null;
    }
    
    public PageReference cancel() 
    {
        PageReference oppPage = new PageReference('/apex/opprtunityDocumentsRelatedList?Id='+ oppId + '&oppId=' + oppId);
        return oppPage;
    }

    public PageReference save() 
    {
        try
        {
            upsert objOppDoc;
            /* DS-CONAM variable oppPage is not being used
            PageReference oppPage = new PageReference('/apex/opprtunityDocumentsRelatedList?Id='+ objOppDoc.Opportunity__c + '&oppId=' + objOppDoc.Opportunity__c);return oppPage;
			
			*/
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Saved Successfully!'));
        }
        catch(Exception e)
        {	
            System.debug('An exception '+e);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    }  

}