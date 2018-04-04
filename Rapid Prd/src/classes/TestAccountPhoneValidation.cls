@istest
private class TestAccountPhoneValidation
{
    static testMethod void unitTest1()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.Phone='123-456-7890'; 
        insert acc;
        Test.stopTest();
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.Phone='123-456-7890ExTension111'; 
        insert acc;
        Test.stopTest();
    }
    
    static testMethod void unitTest3()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.Phone='123-456-7890ext589';
        insert acc;
        Test.stopTest();
    }
    
    static testMethod void unitTest4()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.Phone ='';
        acc.Phone_Ext__c='';
        try
        {
            insert acc;
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
        }
        Test.stopTest();
    }
   
    static testMethod void unitTest5()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'TestAccount';
        acc.Phone='123-456-7890111sd13';              
        try
        {
            insert acc;
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
        }
        Test.stopTest();
    }
    static testMethod void unitTest6()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'TestAccount';
        acc.Phone='123-456-7890ext90101010101';
                    
        try
        {
            insert acc;
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
        }
        Test.stopTest();
    }
    static testMethod void unitTest7()
    {
        Test.startTest();
        Account acc = new Account();
        acc.name = 'TestAccount';
        acc.Phone_Ext__c='123123';            
        try
        {
            insert acc;
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
        }
        Test.stopTest();
    }
}