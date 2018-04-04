/*
@Name            : ScheduleBatchLeadNotifyAfter30Mins  
@Author          : VT-CONAM
@Date            : Oct 30, 2015
*/

@isTest
private class TestBatchLeadNotificationAfter30Mins {

    static testmethod void batchLeadNotificationTest() {

        Test.startTest();

        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

        System.debug('profile' + p);
        User uTest = new User(Alias = 'newUser', Email = 'newuser@testorg.com', firstname='Deepak K',
        EmailEncodingKey = 'UTF-8', LastName = 'Srivastava', LanguageLocaleKey = 'en_US',
        LocaleSidKey = 'en_US', ProfileId = p.Id,
        TimeZoneSidKey = 'America/Los_Angeles', UserName = 'newuser@vasudha.com');

        System.debug('uTest ' + uTest);
        
            
        System.runAs(uTest) {

            EmailLeadswithInitialCallNeeded__c callUser1 = new EmailLeadswithInitialCallNeeded__c();
            callUser1.Name = 'Deepak K Srivastava';
            insert callUser1;

            EmailLeadswithInitialCallNeeded__c callUser2 = new EmailLeadswithInitialCallNeeded__c();
            callUser2.Name = 'User Test';
            insert callUser2;
            
            Lead lTest = new Lead(Status = 'Initial Call Needed', LeadSource = 'Twitter', 
        Company = 'Test Company1', Phone = '4157894151', Lastname = 'lastname1', Email_Sent__c = false);
        insert lTest;

            System.debug('lTest}}}}}}}}}}}}' + lTest);
            System.debug('lTest}}}}}}}}}}}}' + lTest.owner.name);


        }

        BatchLeadNotificationAfter30Mins bTemp = new BatchLeadNotificationAfter30Mins();
        ID batchProcessId = Database.executeBatch(bTemp);

        Test.stopTest();
    }

}