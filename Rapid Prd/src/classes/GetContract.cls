/**
*********************************************************************************************************************
* Module Name   : GetOffers Webservice
* description   : This method will  return opportunity with attatchment details
* Throws        : HTTP 400
* Calls         : NONE
* Test Class    :  GetContract_UnitTest Test Method
* 
* Organization  : Rainmaker Associates LLC
*
* Revision History:-
* Version  Date           Author           WO#         description of Action
* 1.0      12/16/2012     MU               Initial Version
*******************************************************************************************************************
**/
 
@RestResource(urlMapping='/GetContract/*')
global with sharing class GetContract 
{
     
    @HttpGet
    global static String getContracts() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String externalId = RestContext.request.params.get('id');
        String source_System = RestContext.request.params.get('SourceSystem');
        String attachments =null;
            
            if ('B2C'.equals(Source_System)) 
            {
                Source_System = 'Biz2Credit';
            }
            
            if (!'Biz2Credit'.equals(Source_System)) 
            {
                res.StatusCode  = 400;
                res.addHeader('Error','Invalid Source System!');
                return JSON.serialize(new AttachmentDetail('false','Invalid Source System!',null,null,null));
            }
            
            if(externalId != null && externalId.trim() != '') 
            {
                List<Opportunity> objOpp;                
               
                                    objOpp =[SELECT 
                                                Source_System__c, External_ID__c, Status__c,
                                                (SELECT 
                                                    Id,Name, Additional_Notes__c, Description__c, Opportunity__c, Document_Name__c, Status__c 
                                                FROM 
                                                    Opprtunity_Documents__r 
                                                WHERE 
                                                    Document_Name__c = 'Contract') 
                                            FROM 
                                                Opportunity 
                                            WHERE 
                                                External_ID__c =:externalId 
                                            AND 
                                                Source_System__c =:Source_System 
                                            Limit 1];
                if((objOpp.size() > 0))
                {
                    if(objOpp[0].Status__c != 'Contract Available')
                    {
                        res.StatusCode  = 400;
                        res.addHeader('Error','Application Error: No Contract found on this opportunity!');
                        return JSON.serialize(new AttachmentDetail('false','No Contract found on this opportunity!',null,null,null));
                    }
                }                  
                                                

                
                if(objOpp.isEmpty() || ((!objOpp.isEmpty()) && objOpp.get(0).Opprtunity_Documents__r.isEmpty())) 
                {
                    return JSON.serialize(new AttachmentDetail('false','Record Does Not Exist!',null,null,null));
                }
                else 
                {                   
                    List<Oppr_Document__c> objOpprDocument =[SELECT 
                                                                Id,Description__c, 
                                                                (SELECT 
                                                                    Id 
                                                                FROM 
                                                                    Attachments) 
                                                            FROM 
                                                                Oppr_Document__c 
                                                            WHERE 
                                                                Id=:objOpp.get(0).Opprtunity_Documents__r.get(0).Id 
                                                            limit 1];                                 
                    System.debug('XXXXXXXXXXXX '+objOpp.get(0).Opprtunity_Documents__r.get(0).Id );
                    System.debug('XXXXXXXXXXXX '+objOpprDocument);
                    System.debug('XXXXXXXXXXXX '+objOpprDocument.get(0).Attachments); 
                    System.debug('XXXXXXXXXXXX '+!objOpprDocument.get(0).Attachments.isEmpty());
                    System.debug('XXXXXXXXXXXX '+objOpprDocument!=null);  
                    System.debug('XXXXXXXXXXXX '+!objOpprDocument.isEmpty());
                    if(null!=objOpprDocument.get(0).Attachments && !objOpprDocument.get(0).Attachments.isEmpty() && objOpprDocument!=null && !objOpprDocument.isEmpty() )
                    {
                        List<Attachment> objAttachments  = [SELECT 
                                                                Description, ContentType, Body 
                                                            FROM 
                                                                Attachment 
                                                            WHERE 
                                                                id =: objOpprDocument.get(0).Attachments.get(0).Id];
                        AttachmentDetail objAtt = null;
                        if(objAttachments != null && !objAttachments.isEmpty())
                        {
                            objAtt = new AttachmentDetail('true','Success',objAttachments.get(0).description,objAttachments.get(0).contentType,objAttachments.get(0).body);                 
                        }
                        else
                        {
                            res.StatusCode  = 400;
                            res.addHeader('Error','Attachment Does Not Exist!');
                            objAtt = new AttachmentDetail('false','Attachment Does Not Exist!',null,null,null);
                        }                                   
                        attachments = JSON.serialize(objAtt);
                        returnOppDoc(objOpprDocument.get(0),'Sent');
                        return attachments;
                    }             
                }
                res.StatusCode  = 400;
                res.addHeader('Error','Attachment Does Not Exist!');
                attachments = JSON.serialize(new AttachmentDetail('false','Attachment Does Not Exist!',null,null,null));
                return attachments;
            } 
            else 
            {
                res.StatusCode  = 400;
                res.addHeader('Error','Application Error: external ID Does Not Exist!');
                return JSON.serialize(new AttachmentDetail('false','external ID Does Not Exist!',null,null,null)); 
            }
        
        return null;
    } 
    
    private static String returnOppDoc(Oppr_Document__c oppDoc, String status)
    {
        if(oppDoc != NULL && status != NULL) 
        {            
            oppDoc.Status__c = status;
            upsert oppDoc;
            if(oppDoc.Id != NULL) 
            {
                return oppDoc.Id;
            }
        }
        return null;
    }
    
    /* AttachmentDetail Wrapper Class */
    global class AttachmentDetail
    {
        global String description {get;set;}
        global String contentType {get;set;}
        global Blob body {get;set;}
        global String message {get;set;}
        global String isSuccess {get;set;}
         
        global AttachmentDetail(String isSuccess,String message,String description,String contentType,Blob body)
        {
            this.description = description;
            this.contentType = contentType;
            this.body = body;
            this.isSuccess = isSuccess;
            this.message = message;
        }
    }
    
    
}