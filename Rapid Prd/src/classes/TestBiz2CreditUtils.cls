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
private class TestBiz2CreditUtils {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        Application app=new Application();
        app.firstName='test';
        app.lastName='test';
        app.jobTitle='test';
        app.dateOfBirth='20150428'; ////FORMAT YYYYMMDD
    
        app.homeAddress1='test';
        app.homeAddress2='test';
        app.homeCity='test';
        app.homeState='test';
        app.homeZip='test';
        app.homeMobilePhone='test';
        app.borrowerOwnershipPct=5;
        app.ssn='test';
        app.residenceStatus='test';
        app.homeCountry='test';
        // Account
        app.merchantID='test';
        app.legalBusName='test';
        app.industry='test';
        app.subIndustry='test';
        app.businessAddress1='test';
        app.businessAddress2='test';
        app.businessCity='test';
        app.businessState='test';
        app.businessZip='test';
        app.businessMobilePhone='test';
        app.businessCountry='test';
    
        app.avgAnnualRevenue=1000;
        app.legalStructure='test';
        app.ageOfBusinessYrs='20150428'; //FORMAT YYYYMMDD
        app.ageOfBusinessMonths='test';
        app.federalTaxId='test';
    
        // Opportunity
        app.loanIntent='test';
        app.existingCashAdvance='test';
        app.cashAdvance=1;
        app.mcaCompany=1;
        app.avgMonthSales=1; //*
        app.majorCreditCardsProc='test'; //*    
        app.avgMonthTrans=10;
        app.ccSalesLastMonth=10;
        app.ccSalesLast1Month=10;
        app.ccSalesLast2Month=10;
        app.ccSalesLast3Month=10;
        app.numOfTransLastMonth=10;
        app.numOfTrans1Month=10;
        app.numOfTrans2Month=10;
        app.numOfTrans3Month=10;
    
        app.sourceSystem='test';
        app.leadSource='test';//A001*
        app.campaignID='test'; // find default*
        app.closeDate='20150428'; //FORMAT YYYYMMDD
    
        app.stage='test'; // Prospecting*
        app.product='test'; // Product__c*
        app.oppRecType=''; //find *
        app.externalID='test'; //*
        
        Opportunity opp=Biz2CreditUtils.createOpportunity(app);
        Opportunity oppOther=Biz2CreditUtils.createOpportunity();
        String url=Biz2CreditUtils.getInstanceURL();
        Date retDate=Biz2CreditUtils.dateConversion('20150606');
        
        Campaign cam=Biz2CreditUtils.createCampaign();
        Opportunity oppNew=Biz2CreditUtils.createOpportunity_new();
        Oppr_Document__c oppDoc=Biz2CreditUtils.createOppDoc(opp);
        Attachment attachment=Biz2CreditUtils.createAttachment(oppDoc);
        Oppr_Offer__c oppOffer=Biz2CreditUtils.createOpprOffer(String.valueOf(opp.id));
        
        //DS-CONAM ADDED    
            Date retDateException=Biz2CreditUtils.dateConversion('2015-05-05');
        Test.stopTest();        
    }
}