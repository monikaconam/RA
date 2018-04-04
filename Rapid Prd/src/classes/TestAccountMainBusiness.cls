@isTest
public class TestAccountMainBusiness {
    static testMethod void runTestMethod() {
        Test.startTest();
        editTest();
        cancelTest();
        mainBusinessTest();
        variableInit();
        Test.stopTest();
    }

    static void variableInit() {
        AccountMainBusiness am = new AccountMainBusiness();
        am.isVisible = true;
        am.btnText = 'Edit';
    }

    static void editTest() {
        AccountMainBusiness am = new AccountMainBusiness();
        variableInit();
        am.onEdit();
        am.btnText = 'notEdit';
        am.onEdit();
    }
    static void cancelTest() {
        AccountMainBusiness am = new AccountMainBusiness();
        variableInit();
        am.onCancel();
    }
    static void mainBusinessTest() {
        AccountMainBusiness am = new AccountMainBusiness();
        /*commentted out DS-Conam 08-04-2015
         Account acc = TestUtils.createAccount();
         Campaign cm = TestUtils.createCampaign();
         Opportunity opp = TestUtils.createOpportunity(acc,cm);
         */
        // DS-CONAM CALC.apexTesting();

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;

        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type = 'Internet';
        insert cm;

        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;

        variableInit();

        PageReference p = Page.AccountMainBusiness;
        Test.setCurrentPage(p);

        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        ApexPages.currentPage().getParameters().put('id', opp.id);

    }

}