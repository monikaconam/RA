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


@Name            : TestAccountPartnerCategoryEditExtn
@Author          : DS-Conam
@Date            : Nov 12  , 2015
@Description     : Test Class for AccountPartnerCategoryEditExtn

*/
@isTest

private class TestAccountPartnerCategoryEditExtn
{
    @testSetup static void setup() 
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        PartnerCategoryAccount__c pcObj=new PartnerCategoryAccount__c();
        pcObj.Name='Accountant';
        insert pcObj; 
        
        pcObj=new PartnerCategoryAccount__c();
        pcObj.Name='Agent/MLS-US';
        insert pcObj;
        
        pcObj=new PartnerCategoryAccount__c();
        pcObj.Name='Franchise';
        insert pcObj; 
    }
    
    static testMethod void unitTest()
    {
        Test.startTest();
        Account aTemp=[Select 
                                id, name
                       from
                                Account
                       where 
                                name ='Test Account1' Limit 1];
                                
        PageReference pPage=Page.AccountPartnerCategoryEdit;
        Test.setCurrentPage(pPage);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(aTemp);
        AccountPartnerCategoryEditExtn ctrl=new AccountPartnerCategoryEditExtn(sc);
        
        ApexPages.CurrentPage().getParameters().put('id',aTemp.id);
        ctrl=new AccountPartnerCategoryEditExtn(sc);
        ctrl.onSave();
        
        Partner_Category__c p1=new Partner_Category__c();
        p1.name='Accountant';
        p1.Partner_Account__c=aTemp.id;
        p1.Sort_Order__c=1;
        insert p1;
        
        p1=new Partner_Category__c();
        p1.Partner_Account__c=aTemp.id;
        p1.name='Franchise';
        p1.Sort_Order__c=1;
        insert p1;
        
        ctrl=new AccountPartnerCategoryEditExtn(sc);
        ctrl.onSave();
        
        ctrl.outputMessage='This is a test output Message. This is a test Message. This is a test Message. This is a test Message.';
        String sTemp=ctrl.outputMessage;
        Test.stopTest();
        
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest();
        
        Account acc = new Account();
        
        PageReference pPage=Page.AccountPartnerCategoryEdit;
        Test.setCurrentPage(pPage);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(acc );
        AccountPartnerCategoryEditExtn ctrl=new AccountPartnerCategoryEditExtn(sc);
        try
        {
            ctrl.onSave();
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
        
        
    }
}