/*
Created: 30/11/2015
VT-CONAM
*/

@isTest
private class TestScheduleBatchLeadNotifyAfter30Mins {

    static testmethod void ScheduleBatchLeadNotifyTest() {
        Test.startTest();

        try {
            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                Lead lTest = new Lead(Status = 'Initial Call Needed', LeadSource = 'Twitter', ownerId = uTest.id,
                Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1', Email_Sent__c = false);
                insert lTest;
                // Less than start hour - SAT
                DateTime dt41 = DateTime.newInstance(2061, 2, 12, 8, 51, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt41);

                //Less than start hour - week day
                DateTime dt42 = DateTime.newInstance(2061, 2, 11, 8, 49, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt42);

                //Less than start hour - SUN
                DateTime dt43 = DateTime.newInstance(2061, 2, 13, 8, 39, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt43);

                //greater than & equal to start hour & less than end hour
                DateTime dt5 = DateTime.newInstance(2061, 2, 11, 12, 51, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt5);

                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

    static testmethod void ScheduleBatchLeadNotifyTest1() {
        Test.startTest();

        try {
            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                Lead lTest = new Lead(Status = 'Initial Call Needed', LeadSource = 'Twitter', ownerId = uTest.id,
                Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1', Email_Sent__c = false);
                insert lTest;

                //Less than start hour - SUN
                DateTime dt43 = DateTime.newInstance(2061, 2, 13, 8, 39, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt43);

                //greater than & equal to start hour & less than end hour - week day
                DateTime dt5 = DateTime.newInstance(2061, 2, 11, 12, 51, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt5);



                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

    static testmethod void ScheduleBatchLeadNotifyTest2() {
        Test.startTest();

        try {

            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                Lead lTest = new Lead(Status = 'Initial Call Needed', LeadSource = 'Twitter', ownerId = uTest.id,
                Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1', Email_Sent__c = false);
                insert lTest;

                //greater than & equal to start hour & less than end hour - SUN
                DateTime dt6 = DateTime.newInstance(2061, 2, 13, 12, 55, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt6);

                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

    static testmethod void ScheduleBatchLeadNotifyTest3() {
        Test.startTest();

        try {
            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                //greater than & equal to start hour & less than end hour - SAT
                DateTime dt6 = DateTime.newInstance(2061, 2, 12, 12, 55, 1);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt6);

                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

    static testmethod void ScheduleBatchLeadNotifyTest4() {
        Test.startTest();

        try {

            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                //greater than end hour  - Week Day
                DateTime dt7 = DateTime.newInstance(2061, 2, 11, 19, 0, 0);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt7);
                //greater than end hour  - SAT
                DateTime dt8 = DateTime.newInstance(2061, 2, 12, 19, 0, 0);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt8);
                //greater than end hour  - SUN
                DateTime dt9 = DateTime.newInstance(2061, 2, 13, 19, 0, 0);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt9);

                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

    static testmethod void ScheduleBatchLeadNotifyTest5() {
        Test.startTest();

        try {

            Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

            System.debug('profile' + p);
            User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Test User', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@2792test.com');

            System.debug('uTest ' + uTest);
            System.runAs(uTest) {
                EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
                callUser1.Name = uTest.LastName;
                insert callUser1;

                //greater than end hour  - Week Day
                DateTime dt7 = DateTime.newInstance(2049, 2, 14, 19, 0, 0);
                ScheduleBatchLeadNotifyAfter30Mins.scheduleMethod(dt7);

                System.debug('System.now' + System.now());
                //BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
            }
        } catch (Exception e) {}
        Test.stopTest();
    }

}