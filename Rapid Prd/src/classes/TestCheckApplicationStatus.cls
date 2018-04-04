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

@Name            : TestCheckApplicationStatus
@Author          : DS Conam
@Date            : July 31 , 2015
@Description     : Test Class for CheckApplicationStatus
 */
@isTest
private class TestCheckApplicationStatus {

    @testsetup static void setup()
    {
        Application app = new Application();
        app.firstName = 'James';
        app.lastName = 'Jones';
        app.homeCity = 'Washington';

        //Get List Of required fields - account
        app.businessCity = 'Washington DC';
        app.federalTaxId = '111155555';

        //Get List Of required fields - opportunity
        app.avgMonthSales = 50000;
        app.majorCreditCardsProc = 'Visa';
        app.avgMonthTrans = 45000;
        app.ccSalesLastMonth = 100000;
        app.ccSalesLast1Month = 45000;
        app.ccSalesLast2Month = 55000;
        app.ccSalesLast3Month = 65000;
        app.numOfTransLastMonth = 300;
        app.numOfTrans1Month = 250;
        app.numOfTrans2Month = 350;
        app.numOfTrans3Month = 450;
        app.sourceSystem = 'B2C';
        app.externalID = 'ExtID10001';
        app.merchantID = 'Merchant 2000';
        
        Opportunity opp = new Opportunity();
        opp.External_ID__c = app.ExternalID;
        opp.Source_System__c = 'Biz2Credit';
        opp.Status__c = 'Processing';
        // opp.Status_Reason__c = 'Passed';
        opp.Name = app.ExternalID;
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
    }

    static testMethod void myUnitTest() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();

        //Opportunity opp = Biz2CreditUtils.createOpportunity(app);
        Opportunity opp=[select
                                id,External_ID__c
                            from
                                Opportunity
                            where 
                                 name='ExtID10001' Limit 1];
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addParameter('id', opp.External_ID__c);
        req.addParameter('SourceSystem', 'B2C');
        String instanceUrl = Biz2CreditUtils.getInstanceURL();
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/CheckApplicationStatus';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        // request 1 
        CheckApplicationStatus.doGet();


        req.addParameter('id', opp.External_ID__c);
        req.addParameter('source', 'Biz2edit');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/CheckApplicationStatus';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        // request 1 
        CheckApplicationStatus.doGet();
        Test.stopTest();

    }
    
     static testMethod void myUnitTest2() 
    {
        Test.startTest();
        String instanceUrl = Biz2CreditUtils.getInstanceURL();
        Opportunity opp=[select
                                id,External_ID__c
                            from
                                Opportunity
                            where 
                                 name='ExtID10001' Limit 1];
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addParameter('id', null);
        req.addParameter('source', 'Biz2edit');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/CheckApplicationStatus';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        // request 1 
        CheckApplicationStatus.doGet();
        Test.stopTest();

    }
    
    static testMethod void myUnitTest3() 
    {
        Test.startTest();
        Opportunity opp=[select
                                id,External_ID__c
                            from
                                Opportunity
                            where 
                                 name='ExtID10001' Limit 1];
                                 
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addParameter('id', opp.External_ID__c);
        req.addParameter('SourceSystem', 'BizCredit');
        String instanceUrl = Biz2CreditUtils.getInstanceURL();
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/CheckApplicationStatus';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        // request 1 
        CheckApplicationStatus.doGet();


        req.addParameter('id', opp.External_ID__c);
        req.addParameter('source', 'Biz2edit');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/CheckApplicationStatus';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        // request 1 
        CheckApplicationStatus.doGet();
        Test.stopTest();

    }
    
}