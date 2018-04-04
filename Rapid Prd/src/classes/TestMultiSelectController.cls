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
 */
@isTest
private class TestMultiSelectController {

    static testMethod void myUnitTest() {
        
        Test.startTest();
        
        Account accNew=new Account(Name='Test');
        insert accNew;
        
        Partner_category__c sNew=new Partner_category__c();
        sNew.Name='Reason1';
        sNew.sort_Order__C=1;
        sNew.Partner_Account__C=accNew.id;       
        insert sNew;
        
        PageReference pNew=Page.PartnerCategoryAccount;
        Test.setCurrentPage(pNew);
        ApexPages.CurrentPage().getParameters().put('id',accNew.id);
        ApexPages.standardController controller = new ApexPages.standardController(accNew);
        MultiselectController mCtrl=new MultiselectController ();
        mCtrl.accid='';
        mCtrl.sObjType='Account';
        mCtrl.buttonVisible=false;
        mCtrl.accountId=accNew.id;
        mCtrl.saveAccount();
        Test.stopTest();
    }
    
    static testMethod void myUnitTest2() {
        Test.startTest();
        
        
        Account accNew=new Account(Name='Test');
        insert accNew;
        
        Partner_category__c sNew=new Partner_category__c();
        sNew.Name='Reason1';
        sNew.sort_Order__C=1;
        sNew.Partner_Account__C=accNew.id;        
        insert sNew;
        
        PageReference pNew=Page.PartnerCategoryAccount;
        Test.setCurrentPage(pNew);
        ApexPages.CurrentPage().getParameters().put('id',accNew.id);
        ApexPages.standardController controller = new ApexPages.standardController(accNew);
        MultiselectController mCtrl=new MultiselectController ();
        mCtrl.leftOptions=new List<SelectOption>();
        mCtrl.rightOptions=new List<SelectOption>();
        mCtrl.leftOptions.add(new SelectOption('Reason0','Reason0'));
        mCtrl.rightOptions.add(new SelectOption('Reason1','Reason1'));
        mCtrl.rightOptions.add(new SelectOption('Reason2','Reason2'));
        mCtrl.leftOptionsHidden='Reason0&Reason0';
        mCtrl.rightOptionsHidden='Reason1&Reason1&Reason2&Reason2';
        mCtrl.accountId=accNew.id;
        mCtrl.saveAccount();
        
        mCtrl.rightOptionsHidden='';
        mCtrl.saveAccount();
        Test.stopTest();
    }
    
    static testMethod void myUnitTest3() {
        
        Test.startTest();
        
        
        Lead newLead= new Lead();
        newLead.Company ='Test Lead';
        newLead.Email='Test@test.com';
        newLead.FirstName='test';
        newLead.LastName='lastname';
        insert newLead;

        
        Partner_category__c sNew=new Partner_category__c();
        sNew.Name='Reason1';
        sNew.sort_Order__C=1;
        sNew.Partner_Lead__C=newLead.id;        
        insert sNew;
        
        PageReference pNew=Page.PartnerCategoryAccount;
        Test.setCurrentPage(pNew);
        ApexPages.CurrentPage().getParameters().put('id',newLead.id);
        ApexPages.standardController controller = new ApexPages.standardController(newLead);
        MultiselectController mCtrl=new MultiselectController ();
        mCtrl.leftOptions=new List<SelectOption>();
        mCtrl.rightOptions=new List<SelectOption>();
        mCtrl.leftOptions.add(new SelectOption('Reason0','Reason0'));
        mCtrl.rightOptions.add(new SelectOption('Reason1','Reason1'));
        mCtrl.rightOptions.add(new SelectOption('Reason2','Reason2'));
        mCtrl.leftOptionsHidden='Reason0&Reason0';
        mCtrl.rightOptionsHidden='Reason1&Reason1&Reason2&Reason2';
        mCtrl.accountId=newLead.id;
        mCtrl.saveLead();
        
        mCtrl.rightOptionsHidden='';
        mCtrl.saveLead();
        Test.stopTest();
    }
    
    static testMethod void myUnitTest4() {
        
        Test.startTest();
        
        
        Lead newLead= new Lead();
        newLead.Company ='Test Lead';
        newLead.Email='Test@test.com';
        newLead.FirstName='test';
        newLead.LastName='lastname';
        insert newLead;

        
        Partner_category__c sNew=new Partner_category__c();
        sNew.Name='Reason1';
        sNew.sort_Order__C=1;
        sNew.Partner_Lead__C=newLead.id;        
        insert sNew;
        
        PageReference pNew=Page.PartnerCategoryAccount;
        Test.setCurrentPage(pNew);
        ApexPages.CurrentPage().getParameters().put('id',newLead.id);
        ApexPages.standardController controller = new ApexPages.standardController(newLead);
        MultiselectController mCtrl=new MultiselectController ();
        mCtrl.leftOptions=new List<SelectOption>();
        mCtrl.rightOptions=new List<SelectOption>();
        mCtrl.leftOptions.add(new SelectOption('Reason0','Reason0'));
        mCtrl.rightOptions.add(new SelectOption('Reason1','Reason1'));
        mCtrl.rightOptions.add(new SelectOption('Reason2','Reason2'));
        mCtrl.leftOptionsHidden='Reason0&Reason0';
        mCtrl.rightOptionsHidden='Reason1&Reason1&Reason2&Reason2';
        mCtrl.accountId=newLead.id;
        mCtrl.saveLead(newLead.id);
        
        mCtrl.rightOptionsHidden='';
        mCtrl.saveLead(newLead.id);
        
        Test.stopTest();
        
    }
}