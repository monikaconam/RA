@isTest

// Test class for Lead triggers/classes to use Salesforce to Salesforce sharing
// Change the name of this class!

private class LeadTests_SeeAll {
 
   private static testMethod void testVsExisting() {
      LeadUtils.setTesting();   // Mark this is an Apex test

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

      User u2 = new User();
      u2.Alias = 'sectest';
      u2.Username = 'swap@test.com';
      u2.FirstName = 'Test';
      u2.LastName = 'Secundo';
      u2.Email = 'swap@test.com';
      u2.EmailEncodingKey = 'UTF-8';
      u2.LanguageLocaleKey = 'en_US';
      u2.LocaleSidKey = 'en_US';
      u2.TimeZoneSidKey = 'America/New_York';
      u2.ProfileId='00e30000000h0BsAAI';
      u2.UserPermissionsMarketingUser = true;
      u2.UserPermissionsOfflineUser = true;
      u2.IsActive = true;
      Database.SaveResult sr2 = Database.insert(u2);
      String SecondId = sr2.getId();

      User_Default__c ud = new User_Default__c();
      ud.Name = 'Rock Connections';
      ud.UserId__c = UserId;
      insert ud;

      Set<String> LeadIds = new Set<String>();
      List<Lead> lds = new List<Lead>();
      for (PartnerNetworkRecordConnection cnct : 
         [SELECT Id,LocalRecordId FROM PartnerNetworkRecordConnection LIMIT 100] ) {
          LeadIds.add(cnct.LocalRecordId);
      }
      if (LeadIds.size() > 0) {
         for (Lead l : [SELECT Id,OwnerId FROM Lead WHERE IsConverted=false AND Id IN: LeadIds]) {
            l.LeadSource = 'Changey';
            l.OwnerId = SecondId;
            lds.add(l);
         }
         update lds;
      
         for (Lead l : lds) {
            l.LeadSource = 'Lead Generation';
            l.OwnerId = UserId;
         }
         update lds;
      }
   }
   
   private static testMethod void testLeadSharing_Insert() {
      LeadUtils.setTesting();   // Mark this is an Apex test
      
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

      User u2 = new User();
      u2.Alias = 'sectest';
      u2.Username = 'swap@test.com';
      u2.FirstName = 'Test';
      u2.LastName = 'Secundo';
      u2.Email = 'swap@test.com';
      u2.EmailEncodingKey = 'UTF-8';
      u2.LanguageLocaleKey = 'en_US';
      u2.LocaleSidKey = 'en_US';
      u2.TimeZoneSidKey = 'America/New_York';
      u2.ProfileId='00e30000000h0BsAAI';
      u2.UserPermissionsMarketingUser = true;
      u2.UserPermissionsOfflineUser = true;
      u2.IsActive = true;
      Database.SaveResult sr2 = Database.insert(u2);
      String SecondId = sr2.getId();

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
      
      l.OwnerId    = UserId;
      l.LeadSource = 'Lead Generation';
      Database.SaveResult sr3 = Database.insert(l);
      
      l.Id = sr3.getId();
      l.OwnerId = SecondId;
      update l;
   }  // end testLeadSharing_Update method

}