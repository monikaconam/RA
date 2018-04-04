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
 
@Name            : TestOppOppDocUpdateStatus 
@Author          : DS Conam
@Date            : July 16 , 2015
@Description     : Test Class for OppOppDocUpdateStatus
 
 
 */
@isTest
private class TestOppOppDocUpdateStatus 
{
    static testMethod void myUnitTest()
    {   
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        Application app = new Application();
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID10001';
        app.MerchantID = 'Merchant 2000';
        
        Opportunity opp = Biz2CreditUtils.createOpportunity(app);
        opp.status__c = 'Reviewing Documents';
        update opp;
        
        Oppr_Document__c od = new Oppr_Document__c();
        od.document_name__c = 'Contract';
        od.Opportunity__c = opp.Id;
        insert od;
        
        Attachment at1 = new Attachment();
        at1.Name = 'Contract';
        at1.body = blob.valueof('attachment body');
        at1.parentid = od.id;
            
        insert at1; 
        
        List<Opportunity> oppList = new List<Opportunity>();
        List<Oppr_Document__c> oppDocList = new List<Oppr_Document__c>();
        
        oppDocList.add(od);
            
        OppOppDocUpdateStatus.updateFromOppDocument(oppDocList);
        Test.stopTest();
    }
}