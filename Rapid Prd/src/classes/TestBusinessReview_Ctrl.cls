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
private class TestBusinessReview_Ctrl {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Test.startTest();
        // DS-CONAM CALC.apexTesting();

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
               
        insert opp;
        
        PageReference p=Page.BusinessReviewPage;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('id',opp.id);
        ApexPages.currentPage().getParameters().put('oppid',opp.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        BusinessReview_Ctrl bCtrl= new BusinessReview_Ctrl();
        bCtrl.doSave();
        
       
        
       /* ApexPages.currentPage().getParameters().put('id',opp.id);
        sc=new ApexPages.StandardController(opp);
        bCtrl= new BusinessReview_Ctrl();
        bCtrl.doSave();
        */
        Test.stopTest();
        
    }
    
    static testMethod void myUnitTest2() {
        // TO DO: implement unit test
        Test.startTest();
        // DS-CONAM CALC.apexTesting();

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
               
        PageReference p=Page.BusinessReviewPage;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('id',opp.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        BusinessReview_Ctrl bCtrl= new BusinessReview_Ctrl();
        bCtrl.doSave();

        Test.stopTest();
        
    }
}