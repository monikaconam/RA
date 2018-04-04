trigger opportunityAfterInsert on Opportunity (after insert) {
      
      if (Trigger.New.Size() == 1) {
		List<opportunityteammember> newlist = new List<opportunityteammember>();
		opportunity o = Trigger.New[0];
		 
		if (o.previous_opportunity__c != null) {
			for ( opportunityteammember otm : [select Id, OpportunityId, UserId, TeamMemberRole, OpportunityAccessLevel from opportunityteammember where opportunityid = :o.previous_opportunity__c]) {
				opportunityteammember newotm = new opportunityteammember();
				newotm.OpportunityId = o.id;
				newotm.UserId = otm.UserId;
				newotm.TeamMemberRole = otm.TeamMemberRole;
				//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
				newlist.add(newotm);
			}		
		}
		
		if (newlist.Size() > 0)
			insert newlist;
		
		      	
      }

 	  

}