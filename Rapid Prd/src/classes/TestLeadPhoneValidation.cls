@istest
private class TestLeadPhoneValidation
{
    static testMethod void unitTest1()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone='123-456-7890'; 
        tstlead.Principal_Home_Phone_Number__c='223-456-7890';
        insert tstlead;
        Test.stopTest();
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone='123-456-7890ExTension11148965877'; 
        tstlead.Principal_Home_Phone_Number__c='223-456-7890ExTension111';
        insert tstlead;
        Test.stopTest();
    }
    
    static testMethod void unitTest3()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone='123-456-7890EXT589';        
        tstlead.Principal_Home_Phone_Number__c='223-456-7890ext589'; 
        insert tstlead;
        Test.stopTest();
    }
    
    static testMethod void unitTest4()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone_Ext__c='589';
        tstlead.P1_Phone_Ext__c='2222'; 
        try
        {
            insert tstlead;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
    static testMethod void unitTest5()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.P1_Phone_Ext__c='2222'; 
        try
        {
            insert tstlead;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
    
    static testMethod void unitTest6()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone='123-456-789022'; 
        tstlead.Principal_Home_Phone_Number__c='223-456-789022';
        insert tstlead;
        Test.stopTest();
    }
    static testMethod void unitTest7()
    {
        Test.startTest();
        Lead tstlead=new Lead();
        tstlead.lastname='test';
        tstlead.Company='ABC Company';
        tstlead.Phone='123789022ext10101010101'; 
        tstlead.Principal_Home_Phone_Number__c='223-456-7890';
        insert tstlead;
        Test.stopTest();
    }
}