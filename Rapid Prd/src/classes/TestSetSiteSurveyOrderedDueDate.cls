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
 
@Name            : TestSetSiteSurveyOrderedDueDate
@Author          : DS Conam
@Date            : Sept 09  , 2015
@Description     : Test Class for Trigger SetSiteSurveyOrderedDueDate 

 
 */

@isTest

private class TestSetSiteSurveyOrderedDueDate{

    static TestMethod void unitTest()
    {
        Test.startTest();
        
        RecordType rc= new RecordType(name='Approved' ,sobjecttype='Opportunity',developername='GreenTree' );
                                
        Campaign camp = new Campaign();
        camp.name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
                
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'Web';
        opp.campaignId = camp.Id;
        opp.closeDate = System.today();
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;    
        opp.StageName='Submitted Deal'; 
        opp.StageName='Approved';
        opp.Site_Survey_Ordered_Due_Date__c=System.today() + 20;   
        opp.Renewal__c= true;
        opp.amount = 60000;
        
        insert opp;    
        
        opp.CloseDate = System.today() + 50;
        opp.Site_Survey_Ordered_Due_Date__c= System.today()+25;
        opp.Status__c = 'Reviewing Documents';
        update opp; 
    }
}