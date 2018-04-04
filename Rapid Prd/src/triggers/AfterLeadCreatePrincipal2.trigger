/**
*********************************************************************************************************************
* Module Name   :  AfterLeadCreatePrincipal2
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
trigger AfterLeadCreatePrincipal2 on Lead (after update) {
	
	List<Contact> contactList = new List<Contact>();
	List<OpportunityContactRole> updOppRoleList = new List<OpportunityContactRole>();
	
	List<Contact> contactPrimeList = new List<Contact>();
	
	
	List<String>  contactIDs = new List<String>();
	
	Map<id, String> contactEmailMap = new Map<id, String>();
	List<Contact> contactUpdList = new List<Contact>();
	
		
	for(Lead l: Trigger.New){
		
		System.debug('AfterLeadCreatePrincipal2 --->' + l.Status + ' id-->' + l.id);
		
		if(Trigger.oldMap.containsKey(l.id)){
						
			Lead oldLead = Trigger.oldMap.get(l.id);
			
			System.debug('AfterLeadCreatePrincipal2 oldLead--->' + oldLead.Status);
			
			if(!oldLead.Status.equals('Converted') && l.status.equals('Converted')){
				
				if(l.Principal_2_Last_Name__c <> null && l.Principal_2_Last_Name__c <> ''){
					
					if(l.ConvertedAccountId <> null){
						
 						Contact c = new Contact();
 						
						c.LastName = l.Principal_2_Last_Name__c;
						c.FirstName = l.Principal_2_First_Name__c;
						c.Principal_1_Street_Address__c = l.Principal_2_Street_Address__c;
						c.Principal_1_City__c = l.Principal_2_City__c;
						c.Principal_1_State__c = l.Principal_2_State__c;
						c.Principal_1_Zip__c = l.Principal_2_Zip__c;
						c.Phone = l.Principal_2_Phone__c;
						c.MobilePhone = l.Principal_2_Mobile__c;
						c.Email = l.Principal_2_Email__c;
						c.Date_of_Birth__c = l.Principal_2_Date_of_Birth__c;
						c.Birthdate = l.Principal_2_Date_of_Birth__c;
						c.SS__c = l.Principal_2_Social_Security__c;
						c.OwnershipPercentage__c = l.Principal_2_Percent_Ownership__c;
						c.Principal_Home_Phone__c = l.Principal_2_Phone__c;
						
						
						c.AccountId = l.ConvertedAccountId;
						c.Created_By_Conversion__c = l.ConvertedOpportunityId;
						
						TriggerUtils t = new TriggerUtils();
						
						Boolean insertContact = false;
						insertContact = t.checkForContactDup(c);
						System.debug('Inserted --->' + insertContact);	
						
						if(insertContact)
							contactList.add(c);
						contactIDs.add(l.ConvertedContactId);	
						contactEmailMap.put(l.ConvertedContactId, l.Principal_1_Email__c);
					
					}	 
				}
				
			}
		}

	}
		if(!contactIDs.IsEmpty()){
			
			updOppRoleList = [SELECT id, IsPrimary FROM OpportunityContactRole WHERE ContactId IN: contactIDs];
			
			contactPrimeList = [SELECT id, email FROM Contact WHERE Id IN: contactIDs];
			
			if(!updOppRoleList.IsEmpty()){
				for(OpportunityContactRole oc: updOppRoleList){
					oc.IsPrimary = true;
				}
				update updOppRoleList;
			}
			
			if(!contactPrimeList.IsEmpty()){
				
				for(Contact c: contactPrimeList){
					
					if(contactEmailMap.containsKey(c.id)){
						String pEmail = contactEmailMap.get(c.id);
						c.Email = pEmail;
						contactUpdList.add(c);
					}
					
				}
				
				if(!contactUpdList.IsEmpty()){
					update contactUpdList;
				}
				
			}
			
			
		}
		
		if(!contactList.isEmpty()){
			insert contactList;
		}
}