@istest
private class TestContactTriggerHandler
{
    static testMethod void unitTest()
    {
        Test.startTest();
        Contact cNew=new Contact();
        cNew.firstname ='John';
        cNew.lastname='Doe';
        cNew.email='test@test.com';
        cNew.phone='2200000000';
        insert cNew;  
        
        TriggerUtils tTemp=new TriggerUtils();
        tTemp.checkForContactDup(cNew);
        Test.stopTest();
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest();
        Account acc=new Account();
        acc.name='test account';
        insert acc;
        
        Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();                
        newDCBS.Name = 'Duplicate Criteria';
        newDCBS.Match_First_Name__c = true;
        newDCBS.Match_Last_Name__c = true;
        newDCBS.Match_Email__c = true;
        newDCBS.Match_Phone__c = true;
        newDCBS.Match_Account_Name__c = true;
        
        insert newDCBS; 
        
        Contact cNew2=new Contact();
        cNew2.firstname ='John';
        cNew2.lastname='Doe';
        cNew2.email='test@test.com';
        cNew2.accountID=acc.id;
        cNew2.phone='2200000000';
        insert cNew2;
        
        TriggerUtils tTemp=new TriggerUtils();
        tTemp.checkForContactDup(cNew2);
        
        Test.stopTest();
    }
    
    static testMethod void unitTest3()
    {
        Test.startTest();
        Account acc=new Account();
        acc.name='test account';
        insert acc;
        
        Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();                
        newDCBS.Name = 'Duplicate Criteria';
        newDCBS.Match_First_Name__c = false;
        newDCBS.Match_Last_Name__c = false;
        newDCBS.Match_Email__c = false;
        newDCBS.Match_Phone__c = false;
        newDCBS.Match_Account_Name__c = false;
        insert newDCBS; 
        
        Contact cNew2=new Contact();
        cNew2.firstname ='John';
        cNew2.lastname='Doe';
        cNew2.email='test@test.com';
        cNew2.accountID=acc.id;
        insert cNew2;
        
        TriggerUtils tTemp=new TriggerUtils();
        tTemp.checkForContactDup(cNew2);
        
        Test.stopTest();
    }
    
    static testMethod void unitTest5()
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
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        con.Created_By_Conversion__c=opp.id;
        insert con;
        
        Test.stopTest();
    }
    
    static testMethod void unitTest4()
    {
        Test.startTest();
        Account acc=new Account();
        acc.name='test account';
        insert acc;
        
        Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();                
        newDCBS.Name = 'Duplicate Criteria';
        newDCBS.Match_First_Name__c = false;
        newDCBS.Match_Last_Name__c = false;
        newDCBS.Match_Email__c = false;
        newDCBS.Match_Phone__c = false;
        newDCBS.Match_Account_Name__c = false;
        insert newDCBS; 
        
        Contact cNew3=new Contact();
        cNew3.firstname ='John';
        cNew3.lastname='Doe';
        cNew3.email='test@test.com';
        cNew3.accountID=acc.id;
        insert cNew3;
        
        Contact cNew2=new Contact();
        cNew2.firstname ='John';
        cNew2.lastname='Doe';
        cNew2.email='test@test.com';
        cNew2.accountID=acc.id;
        try
        {
            insert cNew2;
        }
        catch(Exception e)
        {
            //System.assert(e.getMessage().contains('Contact cannot be created - Contact already exists'),true);
        }
        Test.stopTest();
    }
}