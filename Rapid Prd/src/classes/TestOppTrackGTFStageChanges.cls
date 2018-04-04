@isTest

private class TestOppTrackGTFStageChanges {

    public static testMethod voId oppTrackGTFStageChangesTest1() {

        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp1 = new Opportunity();
        gOpp1.name = 'oppname1';
        gOpp1.accountId = ac.Id;
        gOpp1.RecordTypeId = gId.get(0).Id;
        gOpp1.ForecastCategoryName = 'Commit';
        gOpp1.LeadSource = 'A001';
        gOpp1.CampaignId = cp.Id;
        gOpp1.CloseDate = system.today();
        gOpp1.Current_Processor__c = '1st federal financial';
        gOpp1.StageName = 'Initial Call Needed';
        insert gOpp1;

        Green_Tree_Oppy_Extension__c gt1 = new Green_Tree_Oppy_Extension__c();
        gt1.opportunity__c = gOpp1.Id;
        insert gt1;

        
        update gOpp1;
    }

    public static testMethod voId oppTrackGTFStageChangesTest2() {

        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;
        Opportunity gOpp2 = new Opportunity();
        gOpp2.name = 'oppname2';
        gOpp2.accountId = ac.Id;
        gOpp2.RecordTypeId = gId.get(0).Id;
        gOpp2.ForecastCategoryName = 'Commit';
        gOpp2.LeadSource = 'A001';
        gOpp2.CampaignId = cp.Id;
        gOpp2.CloseDate = system.today();
        gOpp2.Current_Processor__c = '1st federal financial';
        gOpp2.StageName = 'Initial Call Needed';
        insert gOpp2;

        Green_Tree_Oppy_Extension__c gt2 = new Green_Tree_Oppy_Extension__c();
        gt2.opportunity__c = gOpp2.Id;
        insert gt2;

        
        update gOpp2;
        test.stopTest();
    }

    public static testMethod voId oppTrackGTFStageChangesTest3() {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp3 = new Opportunity();
        gOpp3.name = 'Goppname3';
        gOpp3.accountId = ac.Id;
        gOpp3.RecordTypeId = gId.get(0).Id;
        gOpp3.ForecastCategoryName = 'Commit';
        gOpp3.LeadSource = 'A001';
        gOpp3.CampaignId = cp.Id;
        gOpp3.CloseDate = system.today();
        gOpp3.Current_Processor__c = '1st federal financial';
        gOpp3.StageName = 'Initial Call Needed';
        insert gOpp3;

        Green_Tree_Oppy_Extension__c gt3 = new Green_Tree_Oppy_Extension__c();
        gt3.opportunity__c = gOpp3.Id;
        insert gt3;

        
        
        Test.stopTest();
    }
    public static testMethod voId oppTrackGTFStageChangesTest4() {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp4 = new Opportunity();
        gOpp4.name = 'Goppname4';
        gOpp4.accountId = ac.Id;
        gOpp4.RecordTypeId = gId.get(0).Id;
        gOpp4.ForecastCategoryName = 'Commit';
        gOpp4.LeadSource = 'A001';
        gOpp4.CampaignId = cp.Id;
        gOpp4.CloseDate = system.today();
        gOpp4.Current_Processor__c = '1st federal financial';
        gOpp4.StageName = 'Initial Call Needed';
        
        insert gOpp4;

        Green_Tree_Oppy_Extension__c gt4 = new Green_Tree_Oppy_Extension__c();
        gt4.opportunity__c = gOpp4.Id;
        insert gt4;

       


        Test.stopTest();
    }


    public static testMethod voId oppTrackGTFStageChangesTest5() {


        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp5 = new Opportunity();
        gOpp5.name = 'Goppname5';
        gOpp5.accountId = ac.Id;
        gOpp5.RecordTypeId = gId.get(0).Id;
        gOpp5.ForecastCategoryName = 'Commit';
        gOpp5.LeadSource = 'A001';
        gOpp5.CampaignId = cp.Id;
        gOpp5.CloseDate = system.today();
        gOpp5.Current_Processor__c = '1st federal financial';
        gOpp5.StageName = 'Initial Call Needed';
        
        insert gOpp5;

        Green_Tree_Oppy_Extension__c gt5 = new Green_Tree_Oppy_Extension__c();
        gt5.opportunity__c = gOpp5.Id;
        insert gt5;

        
        test.stopTest();
    }
    public static testMethod voId oppTrackGTFStageChangesTest6() {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp6 = new Opportunity();
        gOpp6.name = 'Goppname6';
        gOpp6.accountId = ac.Id;
        gOpp6.RecordTypeId = gId.get(0).Id;
        gOpp6.ForecastCategoryName = 'Commit';
        gOpp6.LeadSource = 'A001';
        gOpp6.CampaignId = cp.Id;
        gOpp6.CloseDate = system.today();
        gOpp6.Current_Processor__c = '1st federal financial';
        gOpp6.StageName = 'Initial Call Needed';
        
        insert gOpp6;

        Green_Tree_Oppy_Extension__c gt6 = new Green_Tree_Oppy_Extension__c();
        gt6.opportunity__c = gOpp6.Id;
        insert gt6;

        test.stopTest();
    }
    public static testMethod voId oppTrackGTFStageChangesTest7() {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp7 = new Opportunity();
        gOpp7.name = 'Goppname7';
        gOpp7.accountId = ac.Id;
        gOpp7.RecordTypeId = gId.get(0).Id;
        gOpp7.ForecastCategoryName = 'Commit';
        gOpp7.LeadSource = 'A001';
        gOpp7.CampaignId = cp.Id;
        gOpp7.CloseDate = system.today();
        gOpp7.Current_Processor__c = '1st federal financial';
        gOpp7.StageName = 'Initial Call Needed';
       
        insert gOpp7;

        Green_Tree_Oppy_Extension__c gt7 = new Green_Tree_Oppy_Extension__c();
        gt7.opportunity__c = gOpp7.Id;
        insert gt7;

       
        test.stopTest();
    }
    public static testMethod voId oppTrackGTFStageChangesTest8() {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;

        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;

        Opportunity gOpp8 = new Opportunity();
        gOpp8.name = 'Goppname8';
        gOpp8.accountId = ac.Id;
        gOpp8.RecordTypeId = gId.get(0).Id;
        gOpp8.ForecastCategoryName = 'Commit';
        gOpp8.LeadSource = 'A001';
        gOpp8.CampaignId = cp.Id;
        gOpp8.CloseDate = system.today();
        gOpp8.Current_Processor__c = '1st federal financial';
        gOpp8.StageName = 'Initial Call Needed';
       
        insert gOpp8;

        Green_Tree_Oppy_Extension__c gt8 = new Green_Tree_Oppy_Extension__c();
        gt8.opportunity__c = gOpp8.Id;
        insert gt8;

        
        update gOpp8;

        Test.stopTest();
    }
}