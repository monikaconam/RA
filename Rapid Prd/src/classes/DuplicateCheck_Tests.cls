@isTest

private class DuplicateCheck_Tests {

   private static testMethod void testLead() {
   Test.startTest();
   CALC.ApexTesting();
      init();
      
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
      for (Lead l : [SELECT Id,OwnerId,Phone,MobilePhone,Email FROM Lead]) {
         if (l.Phone == '555-1212') { check.put(l.Phone, l.Id); checkOwner.put(l.Phone, l.OwnerId); }
         else if (l.MobilePhone == '555-1234') { check.put(l.MobilePhone, l.Id); checkOwner.put(l.MobilePhone, l.OwnerId); }
         else if (l.Email == 'email@match.com') { check.put(l.Email, l.Id); checkOwner.put(l.Email, l.OwnerId); }
      }
      
      /* Do not check owner assignment until approved for production
      
      System.assertEquals(check.get('555-1212'), dupecheck.Matched.get('555-1212'));
      System.assertEquals(check.get('555-1234'), dupecheck.Matched.get('555-1234'));
      System.assertEquals(check.get('email@match.com'), dupecheck.Matched.get('email@match.com'));
      
      // Check status of newly created Leads (should be duplicate)
      List<Lead> new_leads = new List<Lead>();
      Lead l = new Lead(
         FirstName = 'Status',
         LastName  = 'Check',
         Company   = 'Status Check Industries LLC',
         Email     = 'status@check.com',
         Phone     = '555-1212'
      );
      insert l;
      
      Lead l_check = [SELECT Id,OwnerId,Status FROM Lead WHERE FirstName='Status' AND LastName='Check'];
      Id TestOwnerId = l_check.OwnerId;
      System.assertEquals('Duplicate - Lead',l_check.Status);
      System.assertEquals(checkOwner.get('555-1212'),TestOwnerId);
      
      l = new Lead(
         FirstName = 'Email',
         LastName  = 'Check',
         Company   = 'Email Check Industries LLC',
         Email     = 'email@match.com',
         Phone     = '1234567890'
      );
      insert l;
      l_check = [SELECT Id,OwnerId,Status FROM Lead WHERE FirstName='Email' AND LastName='Check'];
      TestOwnerId = l_check.OwnerId;
      System.assertEquals('Duplicate - Lead',l_check.Status);
      System.assertEquals(checkOwner.get('555-1234'),TestOwnerId);  // Should be equal to the Mobile guy (Manager)
      */
     Test.stopTest();
   }
   
   private static testMethod void testContact() {
      Test.startTest();
      CALC.ApexTesting();
      init();

      // Just convert all existing Leads
      LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];

      for (Lead l : [SELECT Id FROM Lead]) {
         Database.LeadConvert lc = new database.LeadConvert();
         lc.setLeadId(l.Id);
         lc.setConvertedStatus(convertStatus.MasterLabel);
         Database.LeadConvertResult lcr = Database.convertLead(lc);
      }

      DuplicateCheck dupecheck = new DuplicateCheck();
      dupecheck.toSearchPhone.add('123');
      dupecheck.doSearch();
      System.assertEquals(NULL,dupecheck.Matched.get('123'));
      
      dupecheck.toSearchPhone.add('555-1212');
      dupecheck.toSearchPhone.add('555-1234');
      dupecheck.toSearchEmail.add('email@match.com');
      dupecheck.doSearch();

      /* Do not check owner assignment until approved for production

      // Find the matching values
      Map<String, Id> check = new Map<String,Id>();
      for (Contact c : [SELECT Id,Phone,MobilePhone,Email FROM Contact]) {
         if (c.Phone == '555-1212') { check.put(c.Phone, c.Id); }
         else if (c.MobilePhone == '555-1234') { check.put(c.MobilePhone, c.Id); }
         else if (c.Email == 'email@match.com') { check.put(c.Email, c.Id); } 
      }
      System.assertEquals(check.get('555-1212'), dupecheck.Matched.get('555-1212'));
      System.assertEquals(check.get('555-1234'), dupecheck.Matched.get('555-1234'));
      System.assertEquals(check.get('email@match.com'), dupecheck.Matched.get('email@match.com'));
      */
         Test.stopTest();
   }

   private static void init() {
     LeadUtils.setTesting();   // Mark this is an Apex test

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
     /* COOMENTED BY DS-CONAM
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
      l = new Lead(
         FirstName = 'Email',
         LastName  = 'Match',
         Company   = 'Email Match Industries LLC',
         Email     = 'email@match.com',
         Phone     = '123456',
         OwnerId   = UserId3
      );
      new_leads.add(l);*/
      insert new_leads;
           
      User mockAdmin = new User(Id = USerId2);
      System.runAs(mockAdmin) {
         User toDisable = [SELECT Id,IsActive FROM User WHERE Alias='deadbeat'];
         toDisable.isActive = false;
         update toDisable;      
      }
   }   // end method init

}