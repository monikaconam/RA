@isTest

 public class TestDuplicateContactBlockerController  
 {
       public static testMethod void testContactDuplicateTrigger()
       {
            Test.startTest();
            // DS-CONAM CALC.apexTesting();
            PageReference testPage = Page.DuplicateContactBlockerSetup;
            Test.setCurrentPage(testPage);
                      
            Duplicate_Contact_Blocker_Setup__c dcbs =  new Duplicate_Contact_Blocker_Setup__c();                         
                                                                    
            dcbs.Name = 'TestDCBS1';
            dcbs.Match_Account_Name__c= true;
            dcbs.Match_Email__c=true;
            dcbs.Match_Phone__c= false;
            
            insert dcbs;
            
            if (dcbs.id!=null) 
            {
                DuplicateContactBlockerController theController = new DuplicateContactBlockerController();
                delete dcbs;
                theController.ReadyPage();                
            }

            Account acct = new Account();
            acct.Name = 'Test Account1';
            acct.BusinessType__c='testBusiness';
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
        
            Duplicate_Contact_Blocker_Setup__c dcbs2 = new Duplicate_Contact_Blocker_Setup__c();
            
            dcbs2.Match_Phone__c = true;
            dcbs2.Match_Last_Name__c = true;
            dcbs2.Match_First_Name__c = true;
            dcbs2.Match_Email__c = true;
            dcbs2.Match_Account_Name__c = true;
            insert dcbs2;
            
            Contact dContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com', Phone = '1231231234');
            duplicateContact.AccountId = acct.id;

        
            try
            {
               insert duplicateContact;
               insert dContact;
            }
            
            catch (Exception e) 
            {
                System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
            } 
            
                delete dcbs2;
                
            try 
            {
                insert dContact;
            } 
            
            catch (Exception e) 
            {
                System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
            }
            
            Test.stopTest();
      }
 }