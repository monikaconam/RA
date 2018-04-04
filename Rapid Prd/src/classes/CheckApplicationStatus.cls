/**
*********************************************************************************************************************
* Module Name   : CheckApplicationStatus Webservice
* Description   :  This method will send status of application
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
/*
@Name               : CheckApplicationStatus 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field Status_Reason__c Commented/Removed By MK Conam 2 Dec 2015
*/
@RestResource(urlMapping='/CheckApplicationStatus/*')
global with sharing class CheckApplicationStatus {

    @HttpGet
    global static ReturnAppStatusDetails doGet() {      
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;     
        
        OpportunityStatus oppStatus = new OpportunityStatus();
        
        if(RestContext.request.params.get('SourceSystem') != null && RestContext.request.params.get('source') != '')  {
            
            System.debug('CheckApplicationStatus WS Source Entered ---->' + RestContext.request.params.get('source')); 
            String sourceEntered = RestContext.request.params.get('SourceSystem');
            if ('B2C'.equals(sourceEntered)) {
                sourceEntered = 'Biz2Credit';
            }
            if( !sourceEntered.equals('Biz2Credit') ){             
                res.StatusCode  = 400;
                res.addHeader('Error','Invalid Source System');
                 
                return new ReturnAppStatusDetails('false', 'HTTP Error 400', oppStatus);
            }
        }
        
        if(RestContext.request.params.get('id') != null){    
                 
            String id = RestContext.request.params.get('id');
            System.debug('CheckApplicationStatus WS id ---->' + id); 
        
            Opportunity opp = new Opportunity();
            
            opp = [SELECT 
                        status__c
                   FROM 
                        Opportunity 
                   WHERE  
                        Source_System__c = 'Biz2Credit' 
                   AND 
                        external_ID__c =:id  limit 1];

            if(opp<>null){      
                oppStatus.Status = opp.Status__c;
                // oppStatus.Status_Reason = opp.Status_Reason__c;
            }
         
        }else{
            res.StatusCode  = 400;
            res.addHeader('Error','Missing required fields: External ID; Source System');       
            return new ReturnAppStatusDetails('false', 'Missing required fields: External ID; Source System', oppStatus);
        }
        
        return new ReturnAppStatusDetails('true', 'Success', oppStatus);
        
        
    }
    
    global class ReturnAppStatusDetails {
    
        global Integer totalSize = 0;
        global String message;
        global OpportunityStatus oppStatusRecord;
    
        global ReturnAppStatusDetails(String success, String message, OpportunityStatus record) {
            this.totalSize = 1;
            this.message = message;
            this.oppStatusRecord = record;
        }
    }     
}