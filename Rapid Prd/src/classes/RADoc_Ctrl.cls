public with sharing class RADoc_Ctrl
{
    public Quote raDoc {get;set;}
    public Opportunity quoteOpp{get;set;}
    String oppId;
    String cancelURL;
    
    public RADoc_Ctrl (ApexPages.StandardController stdController) 
    {
            oppId = '';
            String raDocId = ApexPages.currentPage().getParameters().get('Id');
            cancelURL = ApexPages.currentPage().getParameters().get('retURL');  
          
            if(raDocId != null && raDocId.trim() != '')
            {
                List<Quote> raDocList = (List<Quote>)Database.Query(genDynamicQuery(raDocId)); 
                System.debug('#######raDocList ' + raDocList );
                         
                if(raDocList != null && !raDocList.isEmpty())
                {
                    raDoc = raDocList.get(0);
                    oppId = raDoc.OpportunityId;
                }
                else
                {                       
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid Customer Survey Id'));              
                    raDoc = new Quote ();
                    /*objMerchant.OpportunityId = OppId;*/
                }
            }
            else
            {                       
                raDoc = new Quote ();
                String returnURL =  apexpages.currentPage().getParameters().get('retURL');
                
                if(returnURL != null && returnURL.trim() != '') 
                {
                    integer startIndex = returnURL.indexOf('oppId=');                   
                    if(startindex == -1) 
                    {
                        oppId = returnURL.subString(1, returnURL.length());
                    }
                    else 
                    {
                        integer nextParam =  returnURL.indexOf('&',startIndex);
                       
                        /*if(nextParam == -1) 
                        {
                            oppId = returnURL.subString(startIndex+'oppId='.length());                           
                        }
                        else 
                        {
                            oppId = returnURL.subString(startIndex+'oppId='.length(), nextParam);                          
                        }
						*/
                        oppId=nextParam == -1 ? returnURL.subString(startIndex+'oppId='.length()) : returnURL.subString(startIndex+'oppId='.length(), nextParam);
                        
                    }
                } 
                if(oppId != null && oppId.trim() != '') 
                {
                    // added line
                    String oppId =  ApexPages.currentPage().getParameters().get('oppId');
                    raDoc.OpportunityId =  oppId;  
                }
                /** objMerchant.OpportunityId = OppId;
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));
                **/
            }
            
            if(oppId != null && oppId.trim() != '') 
            {
                List<Opportunity> oppList = [SELECT 
                                                    Id, Name 
                                                FROM 
                                                    Opportunity 
                                                WHERE 
                                                    Id =:oppId LIMIT 1];
                if(!oppList.isEmpty()) 
                {
                    quoteOpp =  oppList.get(0);   
                }
            }
    }    
    public String genDynamicQuery(String raDocId)
    {
        if(raDocId != null) 
        {
            String fieldSets = '';
            for (SObjectField field : Quote.SObjectType.getDescribe().fields.getMap().values()) 
            {
              fieldSets = fieldSets + field.getDescribe().getName() + ',';
            }
            if (fieldSets.length() > 0)
            {
                fieldSets = fieldSets.subString(0,fieldSets.length()-1);
                String dynamicQuery = 'SELECT ' + fieldSets + ' FROM Quote WHERE Id=:raDocId';
                return dynamicQuery;   
            }
        }
        return null;
    }    
    public PageReference cancel() 
    {
        if(cancelURL != null && cancelURL.trim() != '') 
        {
            return new PageReference(cancelURL);
        }
        return null;
    }
    /**
    public PageReference cancel() 
    {
        PageReference oppPage = new PageReference('/apex/raDocsRelatedList?Id='+oppId +'&oppId=' + oppId);
        return oppPage;
    }
    **/
    public PageReference save() 
    {
        try
        {
            upsert raDoc;
            PageReference oppPage = new PageReference('/apex/raDocsRelatedList?Id='+ raDoc.OpportunityId + '&oppId=' + raDoc.OpportunityId);
            return oppPage;
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Saved Successfully!'));
        }
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        return null;
    } 
}