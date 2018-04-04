@isTest
private class TestCreateCreditCardProcessingStatement 
{
    static testMethod void unitTest()
    {
        
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
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
        
        ApexPages.StandardController controller =new ApexPages.StandardController(opp);
        createCreditCardProcessingStatement  creditCardObj = new createCreditCardProcessingStatement (controller);
        creditCardObj.doSave();
        creditCardObj.Save();
        creditCardObj.doSave1();
        
        
        ApexPages.currentPage().getParameters().put('Id', acc.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        createCreditCardProcessingStatement  creditCardObj1 = new createCreditCardProcessingStatement (controller);

        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        createCreditCardProcessingStatement  creditCardObj2 = new createCreditCardProcessingStatement (controller);
        creditCardObj2.doSave();
        creditCardObj2.Save();
        creditCardObj2.doSave1();
        Test.stopTest(); 
    }
}