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
 
@Name            : TestContactRolesOppr
@Author          : DS Conam
@Date            : Aug 03  , 2015
@Description     : Test Class for Trigger ContactRolesOppr
@Revision History : Existing class ContactRolesOppr_UnitTest has been renamed to TestContactRolesOppr
 
 
 */
@isTest
private class TestContactRolesOppr {

    static testMethod void myUnitTest() {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        RecordType rt = [SELECT 
                                id 
                        FROM 
                                RecordType 
                        WHERE 
                                sobjecttype = 'Opportunity' 
                        AND
                                name = 'New Opportunity' LIMIT 1 ];
                                
        Campaign camp = new Campaign();
        camp.name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        system.debug('>>>camp>>>'+camp);
        
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        system.debug('>>>Acc>>>'+Acc);
        
        Contact con = new Contact();
        con.accountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        system.debug('>>con>>>>'+con);
                
        Opportunity opp = new Opportunity();
        opp.name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.accountId=acc.id;
        
        insert opp;
        system.debug('>>>opp>>>'+opp);
        
        OpportunityContactRole  oppConRole = new OpportunityContactRole();
        oppConRole.contactId = con.Id;
        oppConRole.opportunityId  = opp.Id;
        oppConRole.role = 'Principal 1'; 
        oppConRole.isPrimary = true; 
        insert oppConRole;
        
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'TestingOpp';
        opp1.leadSource = 'A001';
        opp1.campaignId = camp.id;
        opp1.closeDate = date.newInstance(2007, 5, 5);
        opp1.stageName = 'Prospecting';
        opp1.current_Processor__c = 'Blue Pay';
        opp1.if_Renewal_Preceding_Opportunity__c = opp.id;
        opp1.accountid=acc.id;
        insert opp1;
        
        system.debug('>>>opp1>>>'+opp);
        
        Test.stopTest();
        
    }
}