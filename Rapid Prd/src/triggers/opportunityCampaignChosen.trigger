trigger opportunityCampaignChosen on Opportunity (after insert, after update) {

	 //if (Trigger.isUi) {
	 	List<id> campaignids = new List<id>();
	 	
	 	for (integer i = 0; i < Trigger.New.Size(); i++ ) {
	  		if (Trigger.New[i].CampaignId != null && 
	 				(Trigger.isInsert || (Trigger.isUpdate && Trigger.New[i].CampaignId != Trigger.Old[i].CampaignId ))) {
	 		
	 			campaignids.add(Trigger.New[i].CampaignId);			
	 		} 
	 	}	

		Map<id, campaign> campaigns = new Map<id, campaign>([select id, name, Sales_Team_Member_1__c,Sales_Team_Member_2__c,Sales_Team_Member_3__c,Sales_Team_Member_4__c,Sales_Team_Member_5__c,Sales_Team_Member_6__c from campaign where id in :campaignids]);
	 	List<opportunityteammember> newlist = new List<opportunityteammember>();
	 	
	 	for (integer i = 0; i < Trigger.New.Size(); i++ ) {
	 		if (Trigger.New[i].CampaignId != null && 
	 				(Trigger.isInsert || (Trigger.isUpdate && Trigger.New[i].CampaignId != Trigger.Old[i].CampaignId ))) {
				opportunity o = Trigger.New[i];
		
				campaign c = campaigns.get(o.campaignid);
				if (c != null) {
					if (c.Sales_Team_Member_1__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_1__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	

					if (c.Sales_Team_Member_2__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_2__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	
					if (c.Sales_Team_Member_3__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_3__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	
					if (c.Sales_Team_Member_4__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_4__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	
					if (c.Sales_Team_Member_5__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_5__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	
					if (c.Sales_Team_Member_6__c != null ) {
			 			opportunityteammember newotm = new opportunityteammember();
						newotm.OpportunityId = o.id;
						newotm.UserId = c.Sales_Team_Member_6__c;
						newotm.TeamMemberRole = 'Partner Sales Representative';
						//newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
						newlist.add(newotm);
					}	
				}
	 		} 
	 	}	
		if (newlist.size() > 0) {
			insert newlist;	
		}
	 	
	 //}
}