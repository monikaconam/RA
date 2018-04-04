/*******************************************************************************************************************
** Module Name   : ContactRolesOppr
** Description   : ---- Code End For WO# 1404 ----
** Throws        : NA
** Calls         : NA
** Test Class    : ContactRolesOppr_UnitTest
** 
** Organization  : Algoworks
**
** Revision History:-
** Version             Date            Author           WO#         Description of Action
** 1.0                                  RainMaker                           Initial Version
******************************************************************************************************************/

trigger ContactRolesOppr on Opportunity (after insert) {
// Code for WO# 1404
	boolean checkRenewal = false;
	String parentOppId;
	List<OpportunityContactRole> oppRoleInsertList =  new List<OpportunityContactRole>();
	OpportunityContactRole oppContactRoleObj;
	String currentID;
	if(trigger.isAfter && trigger.isInsert)
	{
			for(Opportunity opps: Trigger.new) {
				if(opps.If_Renewal_Preceding_Opportunity__c != null)
					{
						currentID = opps.Id; 	
						checkRenewal = true;
						parentOppId = opps.If_Renewal_Preceding_Opportunity__c; 
						System.debug('checkRenewal......'+checkRenewal+'.....parentOppId....'+parentOppId);	
					}
			}
			if(checkRenewal)
			{
				 List<OpportunityContactRole> oppRoleList =[SELECT Id, Role, OpportunityId, IsPrimary, ContactId FROM
                            OpportunityContactRole WHERE
                            OpportunityId =:parentOppId and 
                            Contact.IsDeleted=false];
                  if(oppRoleList !=null && oppRoleList.size() > 0)
                  {
                  	 for(OpportunityContactRole opprole :oppRoleList)
                  		{
                  			oppContactRoleObj = new OpportunityContactRole(); 
                  			oppContactRoleObj.OpportunityId = currentID; 
                  			oppContactRoleObj.ContactId = opprole.ContactId;
                  			oppContactRoleObj.Role = opprole.Role;
                  			
			                 if(opprole.IsPrimary == true)
			                 {
    	    			    	oppContactRoleObj.IsPrimary = true;  		
	    	    	         }
	    	    	    	   oppRoleInsertList.add(oppContactRoleObj);  
                  		}
                  		if(oppRoleInsertList.size() > 0)
                  		{
							try
							{
									insert 	oppRoleInsertList;							
							}                  			
							catch(Exception ex){
								System.debug('exception in insert role....'+ex.getMessage());
							}
                  		}
			}
	}  
}
	/*---- Code End For WO# 1404 ----*/
}