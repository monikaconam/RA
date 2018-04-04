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
 

@Name            : TestSendAcceptedOffers 
@Author          : DS Conam
@Date            : Aug 14 , 2015
@Description     : Test Class for SendAcceptedOffer

 
 */
@istest
private class TestSendAcceptedOffers {
    @testsetup static void setup()
    {
        Test.startTest();
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
        Oppr_Offer__c opprOffer = Biz2CreditUtils.createOpprOffer(opp.Id);
        Test.stopTest();
    
    }
    static testMethod void unitTest() {
        // DS-CONAM CALC.apexTesting()
        Test.startTest();
        String instanceUrl = Biz2CreditUtils.getInstanceURL();
        Oppr_Offer__c opprOffer=[SELECT 
                                        ID ,NAME
                                from
                                        Oppr_Offer__c 
                                where 
                                        Amount__c = 123 Limit 1];
                                        
        Opportunity opp=[select
                                id,Status__c
                        from
                                Opportunity
                        where 
                                name='ExtID10001' Limit 1];
        
        
        
        Oppr_Document__c oppDoc = new Oppr_Document__c();
        oppDoc.Document_Name__c = 'testDoc';
        oppDoc.Additional_Notes__c = 'testDoc';
        oppDoc.status__c='Requested';
        oppDoc.Opportunity__c = opp.Id;
        oppDoc.RequiredDoc__c=true;
        insert oppDoc;

        OpportunityOffer oppOff = new OpportunityOffer();

        System.debug('opprOffer.Name....' + opprOffer.Name);
        // Correctly Entered data should give successful resp
        oppOff.OfferID = opprOffer.Name;
        oppOff.Amount = 1000;
        oppOff.DailyCollection = 1000;
        oppOff.Duration = 5;
        oppOff.ProductName = 'Product 1';
        oppOff.DailyPayment = 1000;
        oppOff.NumOfPayments = 6;
        oppOff.ExternalID = 'ExtID10001';
        oppOff.Source = 'Biz2Credit';


        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/SendAcceptedOffers';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;


        SendAcceptedOffers.ReturnSendOfferDetails resp1 = SendAcceptedOffers.doPost(oppOff);

        // Incorrectly ExternalID entered data should give error resp
        //oppOff.ExternalID = 'ExtID100';
        oppOff.ExternalID = 'ExtID10001';
        SendAcceptedOffers.ReturnSendOfferDetails resp2 = SendAcceptedOffers.doPost(oppOff);

        // Incorrectly source entered data should give error resp
        // oppOff.Source = 'Biz2Cred';
        
        oppOff.Source = 'B2C';
        SendAcceptedOffers.ReturnSendOfferDetails resp21 = SendAcceptedOffers.doPost(oppOff);
        

        OpportunityOffer oppOff1 = new OpportunityOffer();
        // Correctly Entered data should give successful resp
        oppOff1.OfferID = opprOffer.Name;
        oppOff1.Amount = 1000;
        oppOff1.DailyCollection = 1000;
        oppOff1.Duration = 5;
        oppOff1.ProductName = 'Product 1';
        oppOff1.DailyPayment = 1000;
        oppOff1.NumOfPayments = 6;
        oppOff1.ExternalID = 'ExtID10001';
        oppOff1.Source = 'test';
        SendAcceptedOffers.ReturnSendOfferDetails resp3 = SendAcceptedOffers.doPost(oppOff1);

        opp.Status__c = 'Qualified Offer';
        update opp;
        SendAcceptedOffers.ReturnSendOfferDetails resp4 = SendAcceptedOffers.doPost(oppOff);
        Test.stopTest();
    }
    static testMethod void unitTest2() {
        Test.startTest();
        String instanceUrl = Biz2CreditUtils.getInstanceURL();
        Oppr_Offer__c opprOffer=[SELECT 
                                        ID ,NAME
                                from
                                        Oppr_Offer__c 
                                where 
                                        Amount__c = 123 Limit 1];
        Opportunity opp=[select
                                id,Status__c
                        from
                                Opportunity
                        where 
                                name='ExtID10001' Limit 1];
                                 
        OpportunityOffer oppOff = new OpportunityOffer();

        System.debug('opprOffer.Name....' + opprOffer.Name);
        // Correctly Entered data should give successful resp
        oppOff.OfferID = opprOffer.Name;
        oppOff.Amount = 1000;
        oppOff.DailyCollection = 1000;
        oppOff.Duration = 5;
        oppOff.ProductName = 'Product 1';
        oppOff.DailyPayment = 1000;
        oppOff.NumOfPayments = 6;
        oppOff.ExternalID = 'ExtID10001';
        oppOff.Source = 'Biz2Credit';


        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/SendAcceptedOffers';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;


        SendAcceptedOffers.ReturnSendOfferDetails resp1 = SendAcceptedOffers.doPost(oppOff);

        // Incorrectly ExternalID entered data should give error resp
        //oppOff.ExternalID = 'ExtID100';
        oppOff.ExternalID = 'ExtID10001';
        SendAcceptedOffers.ReturnSendOfferDetails resp2 = SendAcceptedOffers.doPost(oppOff);

        // Incorrectly source entered data should give error resp
        // oppOff.Source = 'Biz2Cred';
        
        oppOff.Source = 'B2C';
        SendAcceptedOffers.ReturnSendOfferDetails resp21 = SendAcceptedOffers.doPost(oppOff);
        

        OpportunityOffer oppOff1 = new OpportunityOffer();
        // Correctly Entered data should give successful resp
        oppOff1.OfferID = opprOffer.Name;
        oppOff1.Amount = 1000;
        oppOff1.DailyCollection = 1000;
        oppOff1.Duration = 5;
        oppOff1.ProductName = 'Product 1';
        oppOff1.DailyPayment = 1000;
        oppOff1.NumOfPayments = 6;
        oppOff1.ExternalID = 'ExtID10001';
        oppOff1.Source = 'test';
        SendAcceptedOffers.ReturnSendOfferDetails resp3 = SendAcceptedOffers.doPost(oppOff1);

        opp.Status__c = 'Qualified Offer';
        update opp;
        SendAcceptedOffers.ReturnSendOfferDetails resp4 = SendAcceptedOffers.doPost(oppOff);
        Test.stopTest();
        }
        
       static testMethod void unitTest1() {
       Test.startTest();
       String instanceUrl = Biz2CreditUtils.getInstanceURL();
         Oppr_Offer__c opprOffer=[SELECT 
                                        ID ,NAME
                                from
                                        Oppr_Offer__c 
                                where 
                                        Amount__c = 123 Limit 1];
        Opportunity opp=[select
                                id,Status__c
                        from
                                Opportunity
                        where 
                                name='ExtID10001' Limit 1];

        OpportunityOffer oppOff = new OpportunityOffer();

        System.debug('opprOffer.Name....' + opprOffer.Name);
        // Correctly Entered data should give successful resp
        oppOff.OfferID = null;
        oppOff.Amount = 1000;
        oppOff.DailyCollection = 1000;
        oppOff.Duration = 5;
        oppOff.ProductName = 'Product 1';
        oppOff.DailyPayment = 1000;
        oppOff.NumOfPayments = 6;
        oppOff.ExternalID = 'ExtID10001';
        oppOff.Source = 'Biz2Credit';


        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.addHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.requestURI = 'https://' + instanceUrl + '/services/apexrest/SendAcceptedOffers';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        SendAcceptedOffers.ReturnSendOfferDetails resp1 = SendAcceptedOffers.doPost(oppOff);

        opp.Status__c = 'Qualified Offer';
        update opp;
        Test.stopTest();
    }

}