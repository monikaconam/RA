@isTest
private class TestDncHandler
{
    static testmethod void unitTest()
    {
        Test.startTest();        
        Lead lTemp = new Lead();
        lTemp.FirstName = 'Test';
        lTemp.LastName  = 'Test & offerson';
        lTemp.Company   = 'Test & Industries LLC';
        lTemp.Email     = 'test@test.com';
        lTemp.Phone     = '18005551111';
        lTemp.Status = 'Test';
        lTemp.Legal_Business_Name__c='AB & BA';       
        lTemp.Company   ='Test Industries';
        insert lTemp;
        Test.stopTest();
    }
    
    static testmethod void unitTestInsertW2L()
    {
        Test.startTest();
        
        DNCLeadHandler d=new DNCLeadHandler();
        d.eventType='Insert';
        Lead lTemp = new Lead();
        lTemp.FirstName = 'Test';
        lTemp.LastName  = 'Test & offerson';
        lTemp.Company   = 'Test & Industries LLC';
        lTemp.Email     = 'test@test.com';
        lTemp.Phone     = '18005551111';
        lTemp.Status = 'Test';
        lTemp.Legal_Business_Name__c='AB & BA';       
        lTemp.Company   ='Test Industries';
        lTemp.leadSource='Web-To-Lead';
        insert lTemp;
        
        Test.stopTest();
    }
    
    static testmethod void unitTestInsertCJ()
    {
        Test.startTest();
        
        DNCLeadHandler d=new DNCLeadHandler();
        d.eventType='Insert';
        Lead lTemp = new Lead();
        lTemp.leadSource='Customer Journey Web to Lead';
        lTemp.FirstName = 'Test';
        lTemp.LastName  = 'Test & offerson';
        lTemp.Company   = 'Test & Industries LLC';
        lTemp.Email     = 'test@test.com';
        lTemp.Phone     = '18005551111';
        lTemp.Status = 'Test';
        lTemp.Legal_Business_Name__c='AB & BA';       
        lTemp.Company   ='Test Industries';
        insert lTemp;
        
        Test.stopTest();
    }
    
    static testmethod void unitTestInsertupdate()
    {
        Test.startTest();
        
        DNCLeadHandler d=new DNCLeadHandler();
        d.eventType='Update';
        Lead lTemp = new Lead();
        lTemp.leadSource='Customer Journey Web to Lead';
        lTemp.FirstName = 'Test';
        lTemp.LastName  = 'Test & offerson';
        lTemp.Company   = 'Test & Industries LLC';
        lTemp.Email     = 'test@test.com';
        lTemp.Phone     = '18005551111';
        lTemp.Status = 'Test';
        lTemp.Legal_Business_Name__c='AB & BA';       
        lTemp.Company   ='Test Industries';
        insert lTemp;
        
        Test.stopTest();
    }
}