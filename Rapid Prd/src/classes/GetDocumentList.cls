/***********************************************************************************************************************
* Module Name   : GetDocumentList Webservice
* Description   :  This method will  find  Oppr_Doc__c   for Biz2Credit 
* Throws        : <Any Exceptions/messages thrown by this class/triggers>
* Calls         : <Any classes/utilities called by this class | None if it does not call>
* Test Class    :  
* 
* Organization  : Rainmaker Associates LLC
*
* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      12/16/2012     Milligan                 Initial Version
*******************************************************************************************************************
**/ 
@RestResource(urlMapping='/GetDocumentList/*')
global with sharing class GetDocumentList 
{
    
    @HttpGet
    global static ReturnDocmentListDetails doGet() 
    { 
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;   
            
        List<Oppr_Document__c> oppDocRows = new List<Oppr_Document__c>();
        List<OpportunityDocs> oppDocList = new List<OpportunityDocs>();     
        
              
        String externalId = '';
            
         if(RestContext.request.params.get('id') != null && RestContext.request.params.get('SourceSystem') != null)
         {    
        
            externalId = RestContext.request.params.get('id');
            String source = RestContext.request.params.get('SourceSystem');
            
            if ('B2C'.equals(source)) 
            {
                source = 'Biz2Credit';
            }
            
            if (!'Biz2Credit'.equals(source)) 
            {
                res.StatusCode  = 400;
                res.addHeader('Error','Invalid Source System!');                   
                return new ReturnDocmentListDetails('false', 'Invalid Source System!', oppDocList);
            }
            
          
                    
            Opportunity opp = new Opportunity();
        
                opp = [SELECT 
                          id, external_id__c, Status__c 
                       FROM 
                          Opportunity 
                       WHERE  
                          Source_System__c =: source 
                       AND 
                          External_ID__c =: externalId limit 1]; 
 
           
                oppDocRows = [SELECT 
                                Id, Name, Document_Name__c,Additional_Notes__c,Description__c, Status__c 
                              FROM 
                                Oppr_Document__c  
                              WHERE 
                                opportunity__c=:opp.id 
                              AND 
                                Status__c in ('Requested','Rejected')];
                
           
            if(!oppDocRows.IsEmpty()){
                
                for(Oppr_Document__c oList: oppDocRows)
                {
                     OpportunityDocs od = new OpportunityDocs();
                     od.DocumentID =  oList.Name;
                     od.DocumentName = oList.Document_Name__c;
                     od.AdditionalNotes = oList.Additional_Notes__c;
                     od.Description = oList.Description__c;
                     od.Status = oList.Status__c;
                     oppDocList.add(od);
                    
                }
                
            } 
            else
            {
                res.StatusCode  = 400;
                    res.addHeader('Error','No documents found!');                   
                return new ReturnDocmentListDetails('false', 'No documents found!', oppDocList);
            }

        } 
        else 
        {
            res.StatusCode  = 400;
                res.addHeader('Error','ExternalID or Source System is missing!');           
            return new ReturnDocmentListDetails('false', 'ExternalID or Source System is missing!', oppDocList);
            
        }
        return new ReturnDocmentListDetails('Success', externalId , oppDocList);

    }
    
        
    global class ReturnDocmentListDetails 
    {
    
        global Integer totalSize = 0;
        global String message;
        global List<OpportunityDocs> oppDocListRecords;
    
        global ReturnDocmentListDetails(String success, String message, List<OpportunityDocs> records) 
        {
            
            if(records.size() > 0)
                this.totalSize = records.size();
                this.message = message;
                this.oppDocListRecords = records;
        }
    }    


}