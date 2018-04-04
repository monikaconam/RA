@isTest
public with sharing class TestOppAttachmentController 
{
    @testSetup static void setup()
    {
        Account acc =  new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusibess';
        insert acc;
        
        Campaign cm =  new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;
    }
    static testMethod Void testMethod1()
    {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
                                
        OppAttachmentController OppAttchObj = new OppAttachmentController();
        OppAttchObj.cancel();
        OppAttchObj.validateFields();
        OppAttchObj.save();
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        
        OppAttachmentController OppAttchObj1 = new OppAttachmentController();
        OppAttchObj1.cancel();
        OppAttchObj1.validateFields();
        OppAttchObj1.save();
        
        Test.stopTest();
    }
    
    Static testMethod Void testMethod2()
    {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        
        OppAttachmentController OppAttchObj = new OppAttachmentController();
        OppAttchObj.cancel();
        OppAttchObj.validateFields();
        OppAttchObj.save();
        
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.currentPage().getParameters().put('retURL', 'return');
        
        OppAttachmentController OppAttchObj1 = new OppAttachmentController();
        OppAttchObj1.oppAttachment.Name = 'Test Attachment';
        OppAttchObj1.oppAttachment.Body = Blob.valueOf('Test Attachment');
        OppAttchObj1.cancel();
        OppAttchObj1.validateFields();
        OppAttchObj1.save();
        ApexPages.currentPage().getParameters().put('cancelUrl', 'www.force.com');
        OppAttchObj1.cancel();
        
        Test.stopTest();
    }
}