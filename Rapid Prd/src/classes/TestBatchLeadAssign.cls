/*
Created        : 08/11/2015
Author         : MKConAm
Description    :    This class was created to assign the default Owner if there is no activity till 
                    one day after lead creation
*/

@isTest

private class TestBatchLeadAssign {
    static testmethod void batchLeadTest1() {
        Test.startTest();

        User r = [Select id, UserRoleId, Name from User where Name = 'Prachi Roy'];

        System.debug('role' + r.Name);
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

        System.debug('profile' + p);
        User u2 = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
        EmailEncodingKey = 'UTF-8', LastName = 'Testing;', LanguageLocaleKey = 'en_US',
        LocaleSidKey = 'en_US', ProfileId = p.Id, UserRoleId = r.UserRoleId,
        TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@vasudha.com');

        System.debug('u2 ' + u2);

        System.runAs(u2) {
            // The following code runs as user u2.
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());

            System.debug('User Create' + u2);

            Campaign_For_Calling_Users__c lcm = new Campaign_For_Calling_Users__c();
            lcm.name = 'Green Tree Funding';
            insert lcm;

            Transfer_Leads_for_Calling_User__c ctemp = new Transfer_Leads_for_Calling_User__c();
            ctemp.name = 'Brian Klenk';
            insert ctemp;

            Campaign newc = new Campaign(Name = 'test campaign', IsActive = True, Status = 'Sent');
            insert newc;

            Campaign newc1 = new Campaign(Name = 'Green Tree Funding', IsActive = True, Status = 'Sent');
            insert newc1;

            List < Campaign > campList = new List < Campaign > {
                newc, newc1
            };

            Lead lTest = new Lead(Status = 'Calling - No Contact Made', LeadSource = 'Twitter', ownerId = u2.id,
            Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1');
            insert lTest;

            Lead lTest1 = new Lead(Status = 'Calling - No Contact Made', LeadSource = 'Twitter', ownerId = u2.id,
            Company = 'Test Company2', Phone = '4157894151', Lastname = 'lastname2');
            insert lTest1;

            System.debug('lTest' + lTest);

            CampaignMember cm = new CampaignMember(CampaignId = campList.get(0).Id, LeadId = lTest.Id);
            insert cm;
            CampaignMember cm1 = new CampaignMember(CampaignId = campList.get(1).Id, LeadId = lTest.Id);
            insert cm1;
            CampaignMember cm2 = new CampaignMember(CampaignId = campList.get(0).Id, LeadId = lTest1.Id);
            insert cm2;

            //User uTemp=[select name from user where profile.name='system administrator' and isactive=true limit 1];

            Task tk = new Task(OwnerId = u2.Id, Subject = 'Call for test class',
            WhoId = lTest.id, Priority = 'Normal');
            insert tk;

            Task tTemp = new Task(OwnerId = u2.Id, Subject = 'Call for test1 class',
            WhoId = lTest1.id, Priority = 'High');
            insert tTemp;

        }

        batchLeadAssign c1 = new batchLeadAssign();
        ID batchProcessId = Database.executeBatch(c1, 10);

        Test.stopTest();
    }

    static testmethod void batchLeadTest2() {
        Test.startTest();

        User r = [Select id, UserRoleId, Name from User where Name = 'Prachi Roy'];

        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

        User u2 = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
        EmailEncodingKey = 'UTF-8', LastName = 'Testing;', LanguageLocaleKey = 'en_US',
        LocaleSidKey = 'en_US', ProfileId = p.Id, UserRoleId = r.UserRoleId,
        TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@vasudha.com');

        System.debug('u2' + u2);

        System.runAs(u2) {
            // The following code runs as user u2.
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());

            System.debug('User Create' + u2);

            DateTime dt = System.now();

            Campaign_For_Calling_Users__c lcm = new Campaign_For_Calling_Users__c();
            lcm.name = 'Green Tree Funding';
            insert lcm;

            Transfer_Leads_for_Calling_User__c ctemp = new Transfer_Leads_for_Calling_User__c();
            ctemp.name = 'Brian Klenk';
            insert ctemp;

            Campaign newc = new Campaign(Name = 'test campaign', IsActive = True, Status = 'Sent');
            insert newc;

            Campaign newc1 = new Campaign(Name = 'Green Tree Funding', IsActive = True, Status = 'Sent');
            insert newc1;

            List < Campaign > campList = new List < Campaign > {
                newc, newc1
            };

            Lead lTest = new Lead(Status = 'Calling - No Contact Made', LeadSource = 'Twitter', ownerId = u2.id,
            Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1');
            insert lTest;

            Lead lTest1 = new Lead(Status = 'Calling - No Contact Made', LeadSource = 'Twitter', ownerId = u2.id,
            Company = 'Test Company2', Phone = '4157894151', Lastname = 'lastname2');
            insert lTest1;

            System.debug('lTest' + lTest);

            CampaignMember cm = new CampaignMember(CampaignId = campList.get(0).Id, LeadId = lTest.Id);
            insert cm;
            CampaignMember cm1 = new CampaignMember(CampaignId = campList.get(1).Id, LeadId = lTest.Id);
            insert cm1;
            CampaignMember cm2 = new CampaignMember(CampaignId = campList.get(0).Id, LeadId = lTest1.Id);
            insert cm2;

            //User uTemp=[select name from user where profile.name='system administrator' and isactive=true limit 1];

            Task tk = new Task(OwnerId = u2.Id, Subject = 'Call for test class',
            WhoId = lTest.id, Priority = 'Normal');
            insert tk;

            Task tTemp = new Task(OwnerId = u2.Id, Subject = 'Call for test1 class',
            WhoId = lTest1.id, Priority = 'High');
            insert tTemp;

            Event evnt = new Event(WhoId = lTest1.id, StartDateTime = dt.addMinutes(-120),
            EndDateTime = dt.addMinutes(120), OwnerId = u2.Id);
            insert evnt;

            System.debug('evnt' + evnt);

            Event evnt1 = new Event(WhoId = lTest.id, StartDateTime = dt.addMinutes(-120),
            EndDateTime = dt.addMinutes(120), OwnerId = u2.Id);
            insert evnt1;
            System.debug('evnt1' + evnt1);

        }

        batchLeadAssign c2 = new batchLeadAssign();
        ID batchProcessId = Database.executeBatch(c2, 10);

        Test.stopTest();
    }

}