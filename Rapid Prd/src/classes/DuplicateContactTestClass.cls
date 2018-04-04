public class DuplicateContactTestClass {
   public static testMethod void testContactDuplicateTrigger() {
   	
   	    PageReference testPage = Page.DuplicateContactBlockerSetup;
		Test.setCurrentPage(testPage);
		Test.setCurrentPage(testPage);
		List<Duplicate_Contact_Blocker_Setup__c> dcbs = [select id, Name, Match_Phone__c, Match_Last_Name__c,
                                                              Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                       from Duplicate_Contact_Blocker_Setup__c];
        if (!dcbs.isEmpty()) {
		  DuplicateContactBlockerController theController = new DuplicateContactBlockerController();
		  delete dcbs[0];
          theController.ReadyPage();
        }
		
   	    Account acct = new Account();
   	    acct.Name = 'The Test Account';
   	    insert acct;
   	    
		Contact existingContact = new Contact();
		existingContact.FirstName = 'John';
		existingContact.LastName = 'Smith123';
		existingContact.Email = 'js123@gmail.com';
		existingContact.AccountId = acct.id;
		existingContact.Phone = '1231231234';
		insert existingContact;
		
		Contact duplicateContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com');
		duplicateContact.AccountId = acct.id;
		
		List<Duplicate_Contact_Blocker_Setup__c> dcbs2 = [select id, Name, Match_Phone__c, Match_Last_Name__c,
                                                              Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                       from Duplicate_Contact_Blocker_Setup__c];
        
        dcbs2[0].Match_Phone__c = true;
        dcbs2[0].Match_Last_Name__c = true;
        dcbs2[0].Match_First_Name__c = true;
        dcbs2[0].Match_Email__c = true;
        dcbs2[0].Match_Account_Name__c = true;
        update dcbs2[0];
        
        Contact dContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com', Phone = '1231231234');
		duplicateContact.AccountId = acct.id;
		
		
		try {
		   insert duplicateContact;
		   insert dContact;
		}
		catch (Exception e) {
		   System.debug('We want to see this.  This means the trigger is working.');
		} 
		
		delete dcbs2[0];
		try {
		   insert dContact;
		} 
		catch (Exception e) {
			System.debug('We want to see this.  This means the trigger is working.');
		}
   }
}