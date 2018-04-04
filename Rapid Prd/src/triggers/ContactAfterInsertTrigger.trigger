/**
*********************************************************************************************************************
* Module Name   :  ContactAfterInsertTrigger
* Description   :  
* Throws        : <Any Exceptions/messages thrown by this class/triggers>
* Calls         : <Any classes/utilities called by this class | None if it does not call>
* Test Class    :  
* 
* Organization  : Rainmaker Associates LLC
*  
* Revision History:-
* Version  Date        	  Author      	   WO#         Description of Action
* 1.0      05/15/2013     Milligan                 		Initial Version
*   
*******************************************************************************************************************
**/
trigger ContactAfterInsertTrigger on Contact (after insert) {
	
	List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
	List<String> lids = new List<String>();
	//Select o.Role, o.OpportunityId, o.ContactId From OpportunityContactRole o
	for(Contact c: Trigger.New){
		
		if(c.Created_By_Conversion__c <> null && c.Created_By_Conversion__c <> ''){
			
	 		lids.add(c.Created_By_Conversion__c);
			
		}
	} 
	
	
	Map<id, Opportunity> oppMap = new Map<id, Opportunity>([SELECT id, name FROM Opportunity WHERE Id IN: lids]);
	
	for(Contact c: Trigger.New){
		
		if(c.Created_By_Conversion__c <> null && c.Created_By_Conversion__c <> ''){
			
 				Opportunity o = oppMap.get(c.Created_By_Conversion__c);
 				OpportunityContactRole oc = new OpportunityContactRole();
				oc.OpportunityId = o.id;
				oc.ContactId = c.id;
				oc.Role = 'Principal 2'; 
				
				ocrList.add(oc);
			
		}
	}	
	
	if(!ocrList.IsEmpty()){
		insert ocrList;
	}
}