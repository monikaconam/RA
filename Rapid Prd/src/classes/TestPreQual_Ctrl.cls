@isTest 

private class TestPreQual_Ctrl  
{
    static testMethod void PreQual_UnitTest() 
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest(); 
        Account acc =new Account();
        acc.name = 'Test Account';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam;
        
        Opportunity opp =  new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;
        
        PreQual_Ctrl prq_Ctrl = new PreQual_Ctrl();
        prq_Ctrl.doSave();
        CBRTesting_Ctrl cbrObj = new CBRTesting_Ctrl();
        cbrObj.doSave();
        /* commented out DS-CONAM-
        cbrObj.doCBRIntegration();
        */
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        
        PreQual_Ctrl preq_Ctrl = new PreQual_Ctrl();
        prq_Ctrl.doSave();
        
        CBRTesting_Ctrl cbrTestObj = new CBRTesting_Ctrl();
        cbrObj.doSave();
        /* commented out DS-CONAM-
        cbrObj.doCBRIntegration();
        */
        Test.stopTest(); 
    }
}