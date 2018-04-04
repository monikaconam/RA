@isTest

// Test class for Lead triggers/classes

private class TestLeads {

   private static testMethod void testLead_Insert() {
      /* COMMENTED BY DS-CONAM 
      LeadUtils.setTesting();   // Mark this is an Apex test
      */   // Mark this is an Apex test
      Test.startTest();
      User u = new User();
      u.Alias = 'rc';
      u.Username = 'rc@test.com';
      u.FirstName = 'Test';
      u.LastName = 'Testo';
      u.Email = 'rc@test.com';
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
      
      User_Default__c ud = new User_Default__c();
      ud.Name = 'Rock Connections';
      ud.UserId__c = UserId;
      insert ud;

      // Test LeadSharing afterInsert trigger
      Lead l = new Lead(
         FirstName = 'Test',
         LastName  = 'Testofferson',
         Company   = 'Test Industries LLC',
         Email     = 'test@test.com',
         Phone     = '1-800-555-TEST'
      );
      
      l.OwnerId    = '00570000001B1yvAAC';
      l.LeadSource = 'Lead Generation';
      insert l;
      Test.stopTest();
   }  // end testLeadSharing_Insert method
   
   private static testMethod void testLead_Update() {
      /* COMMENTED BY DS-CONAM 
      LeadUtils.setTesting();   // Mark this is an Apex test
      */    // Mark this is an Apex test
      Test.startTest();
      User u = new User();
      u.Alias = 'rc';
      u.Username = 'rc@test.com';
      u.FirstName = 'Test';
      u.LastName = 'Testo';
      u.Email = 'rc@test.com';
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
      
      User_Default__c ud = new User_Default__c();
      ud.Name = 'Rock Connections';
      ud.UserId__c = UserId;
      insert ud;

      // Test LeadSharing afterInsert trigger
      Lead l = new Lead(
         FirstName = 'Test',
         LastName  = 'Testofferson',
         Company   = 'Test Industries LLC',
         Email     = 'test@test.com',
         Phone     = '1-800-555-TEST'
      );
      
      l.LeadSource = 'Lead Generation';
      sr = Database.insert(l);
      
      l.Id = sr.getId();
      l.OwnerId = '00570000001B1yvAAC';
      update l;
      Test.stopTest();
   }  // end testLeadSharing_Update method
   
   private static testMethod void testRC_Status() {
      // Test to see if a Lead gets the proper status update via Rock Connections
      
      Test.startTest();
      RC_Status__c test_status = new RC_Status__c();
      test_status.Name = 'RC Open';
      test_status.Local_Status__c = 'Rock Connections Test';
      insert test_status;
      
      RC_Status__c test_rcs = new RC_Status__c();
      test_rcs = RC_Status__c.getInstance('RC Open');
      system.debug(' *** ' + test_rcs.Local_Status__c);
      
      Lead l = new Lead(
         FirstName = 'Test',
         LastName  = 'Testofferson',
         Company   = 'Test Industries LLC',
         Email     = 'test@test.com',
         Phone     = '1-800-555-TEST',
         RC_Status__c = 'RC Open',
         Status = 'Test'
      );
      Database.SaveResult sr = Database.insert(l);
      
      Lead l_check = [SELECT Id,Status FROM Lead WHERE Email='test@test.com' LIMIT 1];
      System.assertEquals('Rock Connections Test',l_check.Status);
      Test.stopTest();
   }

}