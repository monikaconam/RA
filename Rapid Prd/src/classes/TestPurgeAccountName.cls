@isTest

private Class TestPurgeAccountName
{
    static TestMethod void unitTest()
    {
        Test.startTest();
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='&';
        p1.Replace_With__c='space';
        insert p1;
        
        Account acc = new Account();
        acc.Name = 'Test & Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        insert acc;
        
        acc.Name = 'Test Account2';
        update acc;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest11()
    {
        Test.startTest();
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='&';
        p1.Replace_With__c='space';
        insert p1;
        
        Account acc = new Account();
        acc.Name = 'Test & Account1 &';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA &';
        acc.Legal_Name__c='AB & BA&';
        insert acc;
        
        acc.Name = 'Test Account2';
        update acc;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest2()
    {
        Test.startTest();
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='inc.';
        p1.Replace_With__c='Incorporation';
        insert p1;
        
        Account acc = new Account();
        acc.Name = 'Test inc. Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB inc. BA ';
        acc.Legal_Name__c='AB inc. BA inc.';
        insert acc;
        
        acc.Name = 'Test Account2';
        update acc;
        
        Test.stopTest();
    }
    
    static TestMethod void unitTest22()
    {
        Test.startTest();
        
        Purge_characters_in_Name__c p1=new Purge_characters_in_Name__c();
        p1.name='1';
        p1.Character__c='inc.';
        p1.Replace_With__c='Incorporation';
        insert p1;
        
        Account acc = new Account();
        acc.Name = 'Test inc. Account1 inc.';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB inc. BA inc.';
        acc.Legal_Name__c='AB inc. BA inc.';
        insert acc;
        
        acc.Name = 'Test Account2';
        update acc;
        
        Test.stopTest();
    }
}