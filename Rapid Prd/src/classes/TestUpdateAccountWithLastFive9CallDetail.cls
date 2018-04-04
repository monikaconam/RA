@istest
private class TestUpdateAccountWithLastFive9CallDetail
{
    static testMethod void unitTestAfterInsert()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        
        Task newTask=new Task();
        newTask.whatid=opp.id;
        newTask.Subject='test call';
        newTask.Five9__Five9HandleTime__c='12/12/2016';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        newTask.Five9__Five9CallType__c='Agent';
        insert newTask;
        
        Test.stopTest();
    }
    
    static testMethod void unitTestAfterUpdateSubject()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        
        Task newTask=new Task();
        newTask.whatid=opp.id;
        newTask.Subject='test';
        newTask.Five9__Five9HandleTime__c='12/12/2016';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        newTask.Five9__Five9CallType__c='Agent';
        insert newTask;
        
        Task t=[Select subject from Task where id=:newTask.id];
        t.subject='CAll';
        update t;
        Test.stopTest();
    }
    
    static testMethod void unitTestAfterUpdateFive9handle()
    {
        Test.startTest();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        
        Task newTask=new Task();
        newTask.whatid=opp.id;
        newTask.Subject='test';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        newTask.Five9__Five9CallType__c='Agent';
        insert newTask;
        
        Task t=[Select Five9__Five9HandleTime__c from Task where id=:newTask.id];
        newTask.Five9__Five9HandleTime__c='12/12/2016';
        update t;
        Test.stopTest();
    }
}