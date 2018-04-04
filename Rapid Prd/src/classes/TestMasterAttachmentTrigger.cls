/**
@Name            : TestMasterAttachmentTrigger
@Author          : MK Conam
@Date            : Aug 31 2015
@Description     : Test Class for AttachmentTriggerHandler
**/

@isTest

private class TestMasterAttachmentTrigger
{
    static testMethod voId unitTestAttachment_Delete_SiteSurvey()
    {
        // DS-CONAM CALC.ApexTesting();
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        insert opp;
        
        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
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
        
        surveyObj.Viewing_Status__c = attachment.Id + ',' + attachment2.Id;
        update surveyObj;
        
        Apexpages.currentpage().getparameters().put('id', surveyObj.Id);
        delete attachment;
        Test.stopTest();
    }
    static testMethod voId unitTestAttachment_Delete_SiteSurvey1()
    {
        // DS-CONAM CALC.ApexTesting();
        Test.startTest();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        insert opp;
        
        Site_Survey__c surveyObj = new Site_Survey__c();
        surveyObj.Name = 'test';
        surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
        surveyObj.Opportunity__c = opp.Id;
        insert surveyObj;
       
        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('Test Attatchment on Class');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = opp.Id; 
        try
        {
            insert attachment;
        }
        catch(Exception Ex)
        {
            Ex.getMessage();
        }
        
        Attachment attachment2 = new Attachment();
        attachment2.Body = Blob.valueOf('Test Attatchment on Class');
        attachment2.Name = String.valueOf('test.txt');
        attachment2.ParentId = opp.Id; 
        try
        {
            insert attachment;
        }
        catch(Exception Ex)
        {
            Ex.getMessage();
        }
        
        surveyObj.Viewing_Status__c = attachment.Id + ',' + attachment2.Id;
        update surveyObj;
        
        Apexpages.currentpage().getparameters().put('id', surveyObj.Id);
        delete attachment;
        Test.stopTest();
    }
}