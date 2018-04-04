/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestConnectionHelper {

    static testMethod void myUnitTest() {
      Test.startTest();
      init();
      Test.stopTest();
      /*
      DuplicateCheck dupecheck = new DuplicateCheck();
      dupecheck.toSearchPhone.add('123');
      dupecheck.doSearch();
      System.assertEquals(NULL,dupecheck.Matched.get('123'));
      
      dupecheck.toSearchPhone.add('555-1212');
      dupecheck.toSearchPhone.add('555-1234');
      dupecheck.toSearchEmail.add('email@match.com');
      dupecheck.doSearch();
      
      // Find the matching values
      Map<String, Id> check = new Map<String,Id>();
      Map<String, Id> checkOwner = new Map<String,Id>();
      for (Lead l : [SELECT Id,OwnerId,Phone,MobilePhone,Email FROM Lead]) 
      {
         if (l.Phone == '555-1212') 
            { 
                check.put(l.Phone, l.Id); 
                checkOwner.put(l.Phone, l.OwnerId); 
            }
         else if (l.MobilePhone == '555-1234') 
            { 
                check.put(l.MobilePhone, l.Id);
                checkOwner.put(l.MobilePhone, l.OwnerId); 
            }
         else if (l.Email == 'email@match.com') 
            { 
                check.put(l.Email, l.Id);
                checkOwner.put(l.Email, l.OwnerId); 
            }
      }*/
      
     }

   private static void init() {
      User u = new User();
      u.Alias = 'duper';
      u.Username = 'duper@test.com';
      u.FirstName = 'Doctor';
      u.LastName = 'Duper';
      u.Email = 'duper@test.com';
      u.EmailEncodingKey = 'UTF-8';
      u.LanguageLocaleKey = 'en_US';
      u.LocaleSidKey = 'en_US';
      u.TimeZoneSidKey = 'America/New_York';
      u.ProfileId='00e30000000h0BsAAI';
      u.UserPermissionsMarketingUser = true;
      u.UserPermissionsOfflineUser = true;
      u.IsActive = true;
      Database.SaveResult sr = Database.insert(u);
      String UserId = sr.getId();
      
      User u2 = new User();
      u2.Alias = 'dm';
      u2.Username = 'dupemanager@test.com';
      u2.FirstName = 'Dupe';
      u2.LastName = 'Manager';
      u2.Email = 'dupemanager@test.com';
      u2.EmailEncodingKey = 'UTF-8';
      u2.LanguageLocaleKey = 'en_US';
      u2.LocaleSidKey = 'en_US';
      u2.TimeZoneSidKey = 'America/New_York';
      u2.ProfileId='00e30000000h0BsAAI';
      u2.UserPermissionsMarketingUser = true;
      u2.UserPermissionsOfflineUser = true;
      u2.IsActive = true;
      Database.SaveResult sr2 = Database.insert(u2);
      String UserId2 = sr2.getId();

      User u3 = new User();
      u3.Alias = 'deadbeat';
      u3.Username = 'deadbeat@test.com';
      u3.FirstName = 'Inactive';
      u3.LastName = 'Employee';
      u3.Email = 'deadbeat@test.com';
      u3.EmailEncodingKey = 'UTF-8';
      u3.LanguageLocaleKey = 'en_US';
      u3.LocaleSidKey = 'en_US';
      u3.TimeZoneSidKey = 'America/New_York';
      u3.ProfileId='00e30000000h0BsAAI';
      u3.UserPermissionsMarketingUser = true;
      u3.UserPermissionsOfflineUser = true;
      u3.IsActive = true;
      u3.ManagerId = UserId2;
      Database.SaveResult sr3 = Database.insert(u3);
      String UserId3 = sr3.getId();
      
      List<Lead> new_leads = new List<Lead>();
      Lead l = new Lead(
         FirstName = 'Phone',
         LastName  = 'Match',
         Company   = 'Phone Match Industries LLC',
         Email     = 'phone@match.com',
         Phone     = '555-1212',
         OwnerId   = UserId
      );
      new_leads.add(l);
      l = new Lead(
         FirstName = 'Mobile',
         LastName  = 'Match',
         Company   = 'Mobile Match Industries LLC',
         Email     = 'phone@match.com',
         Phone     = '123456',
         MobilePhone = '555-1234',
         OwnerId   = UserId2
      );
      new_leads.add(l);
   
      insert new_leads;
           
      User mockAdmin = new User(Id = USerId2);
      System.runAs(mockAdmin) {
         User toDisable = [SELECT Id,IsActive FROM User WHERE Alias='deadbeat'];
         toDisable.isActive = false;
         update toDisable;      
      }
   }   // end method init
}