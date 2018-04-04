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

@Name            : TestCBRTesting_Ctrl 
@Author          : DS Conam
@Date            : July 29 , 2015
@Description     : Test Class for CBRTesting_Ctrl
 */
@isTest
private class TestCBRTesting_Ctrl {

    static testMethod void myUnitTest() {
        Test.startTest(); 
        // DS-CONAM CALC.ApexTesting();
        
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;
        
        
        PageReference P=Page.CBR_Integration;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        CBRTesting_Ctrl cbrObj = new CBRTesting_Ctrl();
        cbrObj.doSave();
        /* commented out DS-CONAM- 07/30/2015
        cbrObj.doCBRIntegration();
        */
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);

        CBRTesting_Ctrl cbrtestObj = new CBRTesting_Ctrl();
        cbrObj.doSave();
        /* commented out DS-CONAM- 07/30/2015
        cbrObj.doCBRIntegration();
        */
        Test.stopTest(); 
    }
    
     static testMethod void myUnitTest2() {
        Test.startTest(); 
        // DS-CONAM CALC.ApexTesting();
        /* Commented by DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm); 
        */
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;

        CBRTesting_Ctrl cbrObj = new CBRTesting_Ctrl();
        cbrObj.doSave();

        Test.stopTest(); 
    }
}