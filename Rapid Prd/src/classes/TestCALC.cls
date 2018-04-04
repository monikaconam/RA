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
 
 
@Name            : TestCALC 
@Author          : DS Conam
@Date            : July 29 , 2015
@Description     : Test Class for CALC

 
 */
@isTest
private class TestCALC {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Test.startTest();
        // DS-CONAM CALC.ApexTesting();
        Campaign camp = new campaign();
        camp.name = 'test';
        camp.type='Test';
        insert camp;
        
        Id rId=[select
                        id
                from
                        RecordType
                where 
                        sobjectType='Account'
                And 
                        developerName='Partners' Limit 1].id;
        
        Account acc=new Account();
        acc.name='test Account';
        acc.RecordtypeId=rId;
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.name='Test Opportunity 12345';
        opp.closedate = system.today();
        opp.stagename = 'Credit Pulled'; 
        opp.calculate_due_dates__c = system.now();
        opp.campaignId=camp.id;
        insert opp;
        
        opp.stagename = 'Submitted Deal';
        update opp;
        Test.stopTest();
        
    }
}