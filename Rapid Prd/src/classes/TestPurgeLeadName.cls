@isTest

private class TestPurgeLeadName 
{
    static TestMethod void unitTest()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        acc.Campaign__c=camp.id;
        insert acc;
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='&';
        p1.Replace_With__c='space';
        insert p1;
        
        Lead lTemp = new Lead(
                                FirstName = 'Test',
                                LastName  = 'Test & offerson',
                                Company   = 'Test & Industries LLC',
                                Email     = 'test@test.com',
                                Phone     = '18005551111',
                                Status = 'Test',
                                Legal_Business_Name__c='AB & BA'
                                );
              
        insert lTemp;
        
        lTemp.Company   ='Test Industries';
        update lTemp;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest11()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        acc.Campaign__c=camp.id;
        insert acc;
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='inc.';
        p1.Replace_With__c='incorporation';
        insert p1;
        
        Lead lTemp = new Lead(
                                FirstName = 'Test',
                                LastName  = 'Test inc. offerson',
                                Company   = 'Test inc. Industries LLC',
                                Email     = 'test@test.com',
                                Phone     = '18005551111',
                                Status = 'Test',
                                Legal_Business_Name__c='AB inc. BA'
                                );
              
        insert lTemp;
        
        lTemp.Company   ='Test Industries';
        update lTemp;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest2()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        acc.Campaign__c=camp.id;
        insert acc;
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='&';
        p1.Replace_With__c='space';
        insert p1;
        
        Lead lTemp = new Lead(
                                FirstName = 'Test',
                                LastName  = 'Test offerson &',
                                Company   = 'Test Industries LLC &',
                                Email     = 'test@test.com',
                                Phone     = '18005551111',
                                Status = 'Test',
                                Legal_Business_Name__c='AB & BA &'
                                );
              
        insert lTemp;
        
        lTemp.Company   ='Test Industries';
        update lTemp;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest21()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        acc.Campaign__c=camp.id;
        insert acc;
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='inc.';
        p1.Replace_With__c='Incorporation';
        insert p1;
        
        Lead lTemp = new Lead(
                                FirstName = 'Test',
                                LastName  = 'Test offerson inc.',
                                Company   = 'Test Industries LLC inc.',
                                Email     = 'test@test.com',
                                Phone     = '18005551111',
                                Status = 'Test',
                                Legal_Business_Name__c='AB & BA inc.'
                                );
              
        insert lTemp;
        
        lTemp.Company   ='Test Industries';
        update lTemp;
        
        Test.stopTest();
    }

}