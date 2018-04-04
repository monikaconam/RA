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
private class TestSurveyPicturesController {

    static testMethod void myUnitTest() {
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
        
        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
        insert surveyObj;
        
        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('Test Attatchment on Class');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = surveyObj.Id; 
        insert attachment;
        
        PageReference p=Page.surveyPictures;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', surveyObj.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(surveyObj);
        SurveyPicturesController spObj = new SurveyPicturesController();
        
        Test.stopTest();
    }
    
    static testMethod void myUnitTest2() {
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
        
        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
        
               
        PageReference p=Page.surveyPictures;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', surveyObj.id);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(surveyObj);
        SurveyPicturesController spObj = new SurveyPicturesController();
        
        Test.stopTest();
    }
}