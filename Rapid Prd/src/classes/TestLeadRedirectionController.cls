/**
@Name            : TestLeadRedirectionController
@Author          : MK-Conam
@Date            : Nov 12  , 2015
@Description     : Test Class for LeadRedirectionController
**/

@isTest

private class TestLeadRedirectionController
{
    static testMethod void unitTest()
    {
        Test.startTest();
        
        Lead led = new Lead();
        led.Company = 'Comp1';
        led.FirstName='First Name1';
        led.LastName='Last Name1';
        led.LeadSource='Twitter';
        insert led;
       
        User sysAdminUser=[Select 
                                id
                        from
                                user
                        where
                                profile.name='System Administrator' 
                        and
                                isActive=true Limit 1];
        
        User bdUser=[Select 
                                id
                        from
                                user
                        where
                                profile.name='BD - Extended' 
                        and
                                isActive=true Limit 1];
       
        Lead aTemp=[Select 
                                id, name
                       from
                                Lead
                       where 
                                Company ='Comp1' Limit 1];
        
        ApexPages.StandardController sc = new ApexPages.StandardController(aTemp);
        LeadRedirectionController ctrl=new LeadRedirectionController(sc);
        
        PageReference pVar=Page.LeadCloneRedirection;
        Test.setCurrentPage(pVar);
        
        System.runAs(sysAdminUser)
        { 
            ctrl.loadPageByProfile();
        }
        
        System.runAs(bdUser)
        {
            ctrl.loadPageByProfile();
        }
        
        ApexPages.CurrentPage().getParameters().put('id',aTemp.id);
        
        System.runAs(sysAdminUser)
        { 
            ctrl.loadPageByProfile();
        }
        
        System.runAs(bdUser)
        {
            ctrl.loadPageByProfile();
        }
        
        Test.stopTest();        
    }
    
    static testMethod void unitTest1()
    {
        Test.startTest();      
        
        Lead led = new Lead();
        led.Company = 'Comp1';
        led.FirstName='First Name1';
        led.LastName='Last Name1';
        led.LeadSource='Twitter';
        insert led;
       
        User sysAdminUser=[Select 
                                id
                        from
                                user
                        where
                                profile.name='System Administrator' 
                        and
                                isActive=true Limit 1];
        
        User bdUser=[Select 
                                id
                        from
                                user
                        where
                                profile.name='BD - Extended' 
                        and
                                isActive=true Limit 1];
       
        Lead aTemp=[Select 
                                id, name
                       from
                                Lead
                       where 
                                Company ='Comp1' Limit 1];
        
        ApexPages.StandardController sc = new ApexPages.StandardController(aTemp);
        LeadRedirectionController ctrl=new LeadRedirectionController(sc);
        
        PageReference pVar=Page.LeadRedirection;
        Test.setCurrentPage(pVar);        
        System.runAs(sysAdminUser)
        { 
            ctrl.loadPageByProfile();
        }        
        System.runAs(bdUser)
        {
            ctrl.loadPageByProfile();
        }
        
        ApexPages.CurrentPage().getParameters().put('id',aTemp.id);        
        System.runAs(sysAdminUser)
        { 
            ctrl.loadCloneByProfile();
        }        
        System.runAs(bdUser)
        {
            ctrl.loadCloneByProfile();
        }
        
        Test.stopTest();        
    }
}