trigger UpdateOpportunityForBiz2Credit on Opportunity (after insert, after update) {
	List<Oppr_Document__c> oppDocs = new List<Oppr_Document__c>();
	List<String> oppIds = new List<String>();
	for(Opportunity opps: Trigger.new){
		
		if(opps.status__c == 'Reviewing Documents'){
			oppIds.add(opps.id);			
		}
		
	}
	if(!oppIds.IsEmpty()){
		oppDocs = [SELECT id, status__c, opportunity__c FROM Oppr_Document__c WHERE status__c = 'Requested' AND opportunity__c =: oppIds];
		
	}
	
	//Rule 7 Changing from "Reviewing Documents" to "Contract Available"
	//If the Contract Document is available and attached to the Opportunity Documents, the status of the Application/Opportunity 
	//should changed to be "Contract Available"
	 OppOppDocUpdateStatus.updateFromOpp(oppIds);
	 
	 
}