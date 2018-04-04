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
 */@isTest
private class TestSyncUnderwritingAndOpportunity {

    private static final Id OPPORTUNITY_ID;
    private static final String TEST_STRING = 'IIEndjPP';
    private static final Date TEST_DATE = System.today();
    private static final DateTime TEST_DATETIME;

    static 
    {
        // decrease precision to avoid issues with rounding on database commit
        TEST_DATETIME = DateTime.newInstance(TEST_DATE.year(), TEST_DATE.month(), TEST_DATE.day());

        // create test opportunity
        Opportunity testOpportunity = new Opportunity(stageName = TEST_STRING, name = TEST_STRING, closeDate = TEST_DATE);
        insert testOpportunity;
        OPPORTUNITY_ID = testOpportunity.id;
    }

    static testMethod void testInsert()
    {
        Test.startTest();
        try
        {
            // DS-CONAM CALC.ApexTesting();
            Underwriting__c testUnderwriting = getTestUnderwriting();
            insert testUnderwriting;
        } 
        catch (Exception e)
        {
            System.assert(e.getMessage().contains('REQUIRED_FIELD_MISSING'), 'Code Failure: Opportunity not linked to underwriting on underwriting creation');

        }

        Test.stopTest();
    }

    static testMethod void testUpdate()
    {
        // insert a new underwriting
        Test.startTest();
        // DS-CONAM CALC.ApexTesting();
        Underwriting__c testUnderwriting;
        try 
        {
            // DS-CONAM CALC.ApexTesting();
            testUnderwriting = getTestUnderwriting();
            insert testUnderwriting;
        }
        catch (Exception e)
        {
            System.assert(e.getMessage().contains('REQUIRED_FIELD_MISSING'), 'Code Failure: Opportunity not linked to underwriting on underwriting creation');

        }

        // add fields that need to get synced with opportunity
        testUnderwriting.ucc_filings__c = TEST_STRING;
        testUnderwriting.UCC_Request_Date__c = TEST_DATE;
        testUnderwriting.ucc_filing_reason__c = TEST_STRING;
        testUnderwriting.decision_date__c = TEST_DATETIME;
        testUnderwriting.Underwriting_Decision__c = TEST_STRING;
        testUnderwriting.Re_decision_date__c = TEST_DATETIME;
        update testUnderwriting;


        // verify fields are copied over to the opportunity
        Opportunity testOpportunity = [select 
                                                underwriting__c, ucc_filing__c, UCC_Date__c, ucc_filing_reason__c,
                                                Re_Decision_Date__c, Decision_Date__c, Underwriting_Approval__c
                                        from 
                                                Opportunity 
                                        where 
                                                id = : OPPORTUNITY_ID];
                                                
        system.assert(testOpportunity.ucc_filing__c == testUnderwriting.ucc_filings__c,
            'Code Failure: UCC Filings not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.ucc_filings__c + ', Found: ' + testOpportunity.ucc_filing__c);
        system.assert(testOpportunity.UCC_Date__c == testUnderwriting.UCC_Request_Date__c,
            'Code Failure: UCC Request Date not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.UCC_Request_Date__c + ', Found: ' + testOpportunity.UCC_Date__c);
        system.assert(testOpportunity.ucc_filing_reason__c == testUnderwriting.ucc_filing_reason__c,
            'Code Failure: UCC Filing Reason not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.ucc_filing_reason__c + ', Found: ' + testOpportunity.ucc_filing_reason__c);
        system.assert(testOpportunity.Decision_Date__c == testUnderwriting.decision_date__c,
            'Code Failure: Decision Date not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.decision_date__c.getTime() + ', Found: ' + testOpportunity.Decision_Date__c.getTime());
        system.assert(testOpportunity.Underwriting_Approval__c == testUnderwriting.Underwriting_Decision__c,
            'Code Failure: Underwriting Decision not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.Underwriting_Decision__c + ', Found: ' + testOpportunity.Underwriting_Approval__c);
        system.assert(testOpportunity.Re_Decision_Date__c == testUnderwriting.Re_decision_date__c,
            'Code Failure: Re-Decision Date not synced to opportunity when underwriting update. Expected: ' + testUnderwriting.Re_decision_date__c + ', Found: ' + testOpportunity.Re_Decision_Date__c);

        Test.stopTest();
    }

    private static Underwriting__c getTestUnderwriting() {
        return new Underwriting__c(opportunity__c = OPPORTUNITY_ID);
    }

}