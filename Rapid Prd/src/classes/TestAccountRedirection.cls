/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.


@Name            : TestAccountRedirection
@Author          : DS-Conam
@Date            : Nov 12  , 2015
@Description     : Test Class for AccountRedirection

 
 
 */
@isTest

private class TestAccountRedirection
{
    @testSetup static void setup() 
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
    }
    
    static testMethod void unitTest()
    {
        Test.startTest();
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
       
        Account aTemp=[Select 
                                id, name
                       from
                                Account
                       where 
                                name ='Test Account1' Limit 1];
        
        System.debug(' aTemp'+ aTemp.id);
        ApexPages.StandardController sc = new ApexPages.StandardController(aTemp);
        AccountRedirectionController ctrl=new AccountRedirectionController(sc);
        
        PageReference pVar=Page.AccountRedirection;
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
}