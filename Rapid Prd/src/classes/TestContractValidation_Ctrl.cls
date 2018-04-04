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
 
@Name            : TestContractValidation_Ctrl
@Author          : DS Conam
@Date            : Aug 03  , 2015
@Description     : Test Class for ContractValidation_Ctrl

 
 */
@isTest
private class TestContractValidation_Ctrl {
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
        
        
        PageReference p=Page.Contract_Validation;
        Test.setCurrentPage(p);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        ApexPages.CurrentPage().getParameters().put('id',opp.id);
        
        ContractValidation_Ctrl cObj =new ContractValidation_Ctrl();
        cObj.doSave();   
        
        Test.stopTest();
        
    }
    
    static testMethod void myUnitTest2() {
        Test.startTest();
       /* RecordType rt = [SELECT 
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
        */
                
        Opportunity opp = new Opportunity();
        opp.name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';       

        PageReference p=Page.Contract_Validation;
        Test.setCurrentPage(p);
        ApexPages.StandardController sc=new ApexPages.StandardController(opp);
        ApexPages.CurrentPage().getParameters().put('id',opp.id);
        
        ContractValidation_Ctrl cObj =new ContractValidation_Ctrl();
        cObj.doSave();  
        
        Test.stopTest();
        
    }

    
}