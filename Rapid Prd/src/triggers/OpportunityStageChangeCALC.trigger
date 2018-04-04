trigger OpportunityStageChangeCALC on Opportunity (after insert, before update) {
	for (Opportunity newOpp: Trigger.new) 
	{		
 		if (trigger.isInsert)
        {
            System.debug('>>> OPP CALC TRIGGER .. Inserting ' + newOpp.Id);
            CALC.OpportunityRequest(String.valueOf(newOpp.Id));
        }
        else
        {
            Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id);
            if ((newOpp.StageName != oldOpp.StageName) ||
                (newOpp.Advance_ID__c != oldOpp.Advance_ID__c))
            {
                // stage or advance id is updated 
                System.debug('>>> OPP CALC TRIGGER .. Updating ' + newOpp.Id);
                CALC.OpportunityRequest(String.valueOf(newOpp.Id));
            }
        }
    }
}