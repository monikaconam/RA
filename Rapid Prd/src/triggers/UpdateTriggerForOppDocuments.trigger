/**
*********************************************************************************************************************
* Module Name   : UpdateTriggerForOppDocuments for Biz2Credit Webservice
* Description   :   
* Throws        : <Any Exceptions/messages thrown by this class/triggers>
* Calls         : <Any classes/utilities called by this class | None if it does not call>
* Test Class    :  
* 
* Organization  : Rainmaker Associates LLC
* @RestResource(urlMapping='/rest/SubmitApplication/*')
* Revision History:-
* Version  Date        	  Author      	   WO#         Description of Action
* 1.0      01/11/2012     Milligan                 		Initial Version
* Rule 6 Changing from "Reviewing Documents" to "Documents Requested"  
*	If the status is "Reviewing Documents" and new documents have have been requested by adding additional documents to Opportunity 
*	documents object, the status of the Application/Opportunity should changed to be "Documents Requested"
*	The the status of the Opportunity Documents is updated as "Rejected", the status of the Application/Opportunity 
*	should changed to be "Documents Requested"
*******************************************************************************************************************
**/
trigger UpdateTriggerForOppDocuments on Oppr_Document__c (after insert, after update) {
	
	List<Opportunity> oppList  = new List<Opportunity>();
	List<String> oppIds = new List<String>();
	List<String> oppIdsToUpdate = new List<String>();	
	List<Oppr_Document__c> oppDocs = new List<Oppr_Document__c>();
		
	for(Oppr_Document__c oppDoc: Trigger.new){
		//Get all the opportunities
		oppIds.add(oppDoc.opportunity__c);			
	}
	
	if(!oppIds.IsEmpty()){
		// Get List  Opp Docs for the Opportunities and opportunity status. Get only docs that are requested and not required (new additional docs)
		oppDocs = [SELECT id, status__c, opportunity__c, opportunity__r.Status__c FROM Oppr_Document__c WHERE status__c in ('Requested','Rejected')  AND opportunity__c IN : oppIds];		
	}	
	
	if(!oppDocs.IsEmpty()){ 
		//Loop thru all opportunity docs. if new doc requested for an opp  with status = 'Reviewing Documents' add to update list
		// update opp doc status to reject
		for(Oppr_Document__c ods: oppDocs){
			if(ods.Opportunity__r.status__c == 'Reviewing Documents'){
				oppIdsToUpdate.add(ods.opportunity__c);		
				
			}
 		}
 		
 		//if there are opportunities with status = 'Reviewing Documents' to update get them update status
 		if(!oppIdsToUpdate.IsEmpty()){
			oppList = [SELECT id, status__c FROM Opportunity WHERE id IN : oppIdsToUpdate];	 
			if(!oppList.IsEmpty()){
				for(Opportunity ol: oppList){
					ol.status__c = 'Documents Requested';
				}
			}	
            update oppList;
 		}
 		
	} //if(!oppDocs.IsEmpty()) 
	
	//Rule 7 Changing from "Reviewing Documents" to "Contract Available"
	OppOppDocUpdateStatus.updateFromOppDocument(Trigger.new);	
	
	//Rule 5b
	CheckForOppDocumentsAttach.updateFromOppDocument(Trigger.new);
}