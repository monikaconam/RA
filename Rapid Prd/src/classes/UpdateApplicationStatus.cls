/** 
*********************************************************************************************************************
* Module Name   : UpdateApplicationStatus Webservice
* Description   :  This method will update opp on status and reason 
* Throws        : HTTP 400
* Calls         : NONE
* Test Class    :  UpdateApplicationStatus_UnitTest   Test Method
* 
* Organization  : Rainmaker Associates LLC
*
* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      02/01/2013     AC                             Initial Version
*******************************************************************************************************************
**/
/*
@Name               : UpdateApplicationStatus 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field status_reason__c Commented/Removed By MK Conam 2 Dec 2015
*/

@RestResource(urlMapping='/UpdateApplicationStatus/*')

global with sharing class UpdateApplicationStatus {
    
    @HttpPost
    global static ReturnOppDetails doPost(OppDetails oppData) {     
    
    
    System.debug('UpdateApplicationStatus id==>' + oppData);
    RestResponse res = RestContext.response;
           if((oppData.ExternalID != NULL && oppData.ExternalID != '') &&  (oppData.sourceSystem != NULL && oppData.sourceSystem != '')){
            // added Code 
            if(oppData.ExternalID.length() >30 || oppData.sourceSystem.length() > 10)
            {
                res.StatusCode  = 400;
                res.addHeader('Error','Application Error: External ID Or sourceSystem should be valid format!');
                return new ReturnOppDetails(''+res.statusCode, 'External ID Or sourceSystem should be valid format!',Null);
            }
               
            String id = oppData.ExternalID;
            String sourceSystem = oppData.SourceSystem;
            
            System.debug('UpdateApplicationStatus id==>' + id);
            
            Opportunity opp = new Opportunity();
                opp = [SELECT id, external_id__c,Status__c,Source_System__c,Opportunity_Number__c FROM Opportunity WHERE  External_ID__c =: id  AND Source_System__c =: sourceSystem LIMIT 1];
                    
            Map<String,String> OppStatus  = getStatus();
            if(null == OppStatus.get(oppData.Status)){
                res.StatusCode  = 400;
                res.addHeader('Error','Application Error: Invalid Status!');
                return new ReturnOppDetails('true', 'Invalid Status. Please provide correct Status!', Null);
            }     
            if(opp != null){
                opp.Status__c = oppData.Status;
                // opp.Status_Reason__c = oppData.StatusReason;
                update opp; 
            }           
         } else{
                res.StatusCode  = 400;
                res.addHeader('Error','Application Error: Please provide both External ID and Source System!');
                return new ReturnOppDetails('true', 'Please provide both External ID and Source System!', Null);
         }      
            return new ReturnOppDetails('true', 'Success',oppData);
    }
    
    public String countString()
    {
            return null;
    }
    
    public static Map<String,String> getStatus()
{
    Map<String,String> options = new Map<String,String>();
   Schema.DescribeFieldResult fieldResult =
   Opportunity.Status__c.getDescribe();
   List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
   for( Schema.PicklistEntry f : ple)
   {
        options.put(f.getLabel(),f.getLabel());
   }
         
   return options;
}

     global class ReturnOppDetails {
    
        global Integer totalSize = 0;
        global String message;
        global OppDetails updateDetails;        
    
        global ReturnOppDetails(String success, String message, OppDetails oppDis) {
            if(oppDis != null)
                    this.totalSize = 1;
            this.message = message;
            this.updateDetails = oppDis;
        }
    }
         
    global class OppDetails {
    global String SourceSystem {get;set;}
    global String ExternalID {get;set;}
    global String Status {get;set;}
    global String StatusReason {get;set;}    
  } 
       
}