trigger UpdateOppStatusRule5bReviewingDocs on Opportunity (before insert, before update) {
		CheckForOppDocumentsAttach.updateFromOpp(Trigger.new);	
}