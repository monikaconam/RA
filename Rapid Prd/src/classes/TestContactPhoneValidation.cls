@istest
private class TestContactPhoneValidation
{
    static testMethod void unitTest1()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-7890'; 
        tstContact.Principal_Home_Phone__c='223-456-7890';
        insert tstContact;
        Test.stopTest();
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-7890ExTension111'; 
        tstContact.Principal_Home_Phone__c='223-456-7890ExTension111';
        insert tstContact;
        Test.stopTest();
    }
    
    static testMethod void unitTest3()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-7890ext589';
        tstContact.Principal_Home_Phone__c='223-456-7890ext589'; 
        insert tstContact;
        Test.stopTest();
    }
    
    static testMethod void unitTest4()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='';
        tstContact.Principal_Home_Phone__c=''; 
        insert tstContact;
        Test.stopTest();
    }
    static testMethod void unitTest5()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='';
        tstContact.Principal_Home_Phone__c='1234567890'; 
        try
        {
            insert tstContact;
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
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-789022'; 
        tstContact.Principal_Home_Phone__c='223-456-789022-123';
        try
        {
            insert tstContact;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
    static testMethod void unitTest7()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-789022'; 
        tstContact.H_Phone_Ext__c ='123456';
        tstContact.Principal_Home_Phone__c=null;
        try
        {
            insert tstContact;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
    static testMethod void unitTest8()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone=null; 
        tstContact.Phone_Ext__c ='123456';
        try
        {
            insert tstContact;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
    static testMethod void unitTest9()
    {
        Test.startTest();
        Contact tstContact=new Contact();
        tstContact.lastname='test';
        tstContact.Phone='123-456-7890ext50101010101'; 
        try
        {
            insert tstContact;
        }
        catch(Exception e)
        {
            System.debug('This is an Exception' + e.getmessage());
        }
        Test.stopTest();
    }
}