@isTest
private class TestTotalImages {

    public static testMethod void UnitTest1() {
        /* DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cam =  TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cam);
        Site_Survey__c surveyObj = TestUtils.createSiteSurvey(opp);
        */

        Test.startTest();
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

        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
        insert surveyObj;

        PageReference p = Page.AllAttachments_viewedList;
        Test.setCurrentPage(p);
        ApexPages.StandardController controller = new ApexPages.StandardController(surveyObj);
        TotalImages imageObj = new TotalImages(controller);

        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('Test Attatchment on Class');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = surveyObj.Id;
        insert attachment;

        Attachment attachment2 = new Attachment();
        attachment2.Body = Blob.valueOf('Test Attatchment on Class');
        attachment2.Name = String.valueOf('test.txt');
        attachment2.ParentId = surveyObj.Id;
        insert attachment2;

        surveyObj.Viewing_Status__c = attachment.Id + ',' + attachment2.Id;
        update surveyObj;

        p = Page.AllAttachments_viewedList;
        Test.setCurrentPage(p);
        Apexpages.currentpage().getparameters().put('id', surveyObj.Id);

        TotalImages imagesObj = new TotalImages(controller);
        delete attachment;
        Test.stopTest();
    }

    public static testMethod void UnitTest2() {
        Test.startTest();
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


        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
        surveyObj.Viewing_Status__c = null;
        insert surveyObj;

        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('Test Attatchment on Class');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = surveyObj.Id;
        insert attachment;

        Attachment attachment2 = new Attachment();
        attachment2.Body = Blob.valueOf('Test Attatchment on Class');
        attachment2.Name = String.valueOf('test.txt');
        attachment2.ParentId = surveyObj.Id;
        insert attachment2;

        PageReference p = Page.AllAttachments_viewedList;
        Test.setCurrentPage(p);
        Apexpages.currentpage().getparameters().put('id', surveyObj.Id);

        ApexPages.StandardController controller = new ApexPages.StandardController(surveyObj);
        TotalImages imageObj = new TotalImages(controller);

        Test.stopTest();
    }
}