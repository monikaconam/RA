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
 Code Coverage for 
 Trigger UpdateGTParentOpportunity
 and 
 Trigger TrackGTFStageChanges
 
 */
@istest
public class TestTrackGTFStageChanges
{
    @testSetup static void setup() {
        List<RecordType> gID=[select
                        id
                  From
                        RecordType
                  Where
                        sObjectType='Opportunity'
                  And
                        DeveloperName='GreenTree'];
        system.debug(gID);
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        insert opp;
        
        
        Opportunity gOpp = new Opportunity();
        gOpp.name='Goppname';
        gOpp.accountid=ac.id;
        gOpp.RecordTypeID=gID.get(0).id;
        gOpp.ForecastCategoryName='Commit';
        gOpp.LeadSource='A001';
        gOpp.Campaignid=cp.id;
        gOpp.CloseDate=system.today();
        gOpp.Current_Processor__c='1st federal financial';
        gOpp.StageName='Initial Call Needed';
        insert gOpp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=gOpp.id;
        insert gt;
    }           
}