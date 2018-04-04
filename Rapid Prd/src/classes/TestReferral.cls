@isTest
private class TestReferral 
{
   static testMethod void leadReferral() 
   {
      Test.startTest();
      Database.SaveResult sr;
      
      User u = new User();
      u.Alias = 'reftest';
      u.Username = 'referraltest@test.com';
      u.FirstName = 'Test';
      u.LastName = 'Testo';
      u.Email = 'referraltest@test.com';
      u.EmailEncodingKey = 'UTF-8';
      u.LanguageLocaleKey = 'en_US';
      u.LocaleSidKey = 'en_US';
      u.TimeZoneSidKey = 'America/New_York';
      u.ProfileId='00e30000000h0BsAAI';
      u.UserPermissionsMarketingUser = true;
      u.UserPermissionsOfflineUser = true;
      u.IsActive = true;
      sr = Database.insert(u);
      String UserId = sr.getId();
      
      Account testA = new Account();
      testA.Name = 'Test Account';
      sr = Database.insert(testA);
      String AccountId = sr.getId();
      
      Lead NoOpp = new Lead();
      NoOpp.Company = 'Active Test';
      NoOpp.FirstName = 'Tester';
      NoOpp.LastName = 'Testofferson';
      NoOpp.Email = 'activelead@test.com';
      sr = Database.insert(NoOpp);
      String NoOppId = sr.getId();

      List<Lead> query = [SELECT 
                              Id,OwnerId 
                          FROM 
                              Lead 
                          WHERE 
                              Id =: NoOppId];
      System.assertEquals(UserInfo.getUserId(),query[0].OwnerId);

      Opportunity testO = new Opportunity();
      testO.AccountId = AccountId;
      testO.OwnerId = UserId;
      testO.Name = 'TestOpp';
      testO.StageName = 'Open';
      testO.CloseDate = Date.today();
      sr = Database.insert(testO);
      String OppId = sr.getId();
      
      Lead ActiveTest = new Lead();
      ActiveTest.Company = 'Active Test';
      ActiveTest.FirstName = 'Tester';
      ActiveTest.LastName = 'Testofferson';
      ActiveTest.Email = 'activelead2@test.com';
      // ActiveTest.Referral_Merchant_ID__c = AccountId;
      sr = Database.insert(ActiveTest);
      String ActiveTestId = sr.getId();

      query = [SELECT 
                      Id,OwnerId 
                  FROM 
                      Lead 
                  WHERE 
                      Id =: ActiveTestId];

      
      // Bulk test
      List<Lead> multiLeads = new List<Lead>();
      for (Integer c = 1 ; c == 500; c++) 
      {
         Lead FreshTest = new Lead();
         FreshTest.Company = 'Fresh ' + c.format();
         FreshTest.FirstName = 'Freshee';
         FreshTest.LastName = 'McFreshStein';
         FreshTest.Email = 'fresh' + c.format() + '@fresh.com';
         // FreshTest.Referral_Merchant_ID__c = AccountId;
         multiLeads.add(FreshTest);
      }
      insert multiLeads;
           
      System.runAs ( new User(Id = UserInfo.getUserId()) ) 
      {
         u.IsActive = false;
         update u;
      }

      Lead InactiveTest = new Lead();
      InactiveTest.Company = 'Inactive Test';
      InactiveTest.FirstName = 'Tester';
      InactiveTest.LastName = 'Testofferson';
      InactiveTest.Email = 'inactivelead@test.com';
      // InactiveTest.Referral_Merchant_ID__c = AccountId;
      sr = Database.insert(InactiveTest);
      String InactiveTestId = sr.getId();

      query = [SELECT 
                      Id,OwnerId 
                  FROM 
                      Lead 
                  WHERE 
                      Id =: InactiveTestId];
      //System.assertEquals(UserInfo.getUserId(),query[0].OwnerId);
      Test.stopTest();
   }
}