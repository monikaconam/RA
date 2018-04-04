@isTest

private class TestSendDocuments 
{
    static testMethod void myUnitTest() 
    {
        Test.startTest();
        Opportunity opp = Biz2CreditUtils.createOpportunity();
        Oppr_Document__c OppDoc = Biz2CreditUtils.createOppDoc(opp);
        Attachment att = Biz2CreditUtils.createAttachment(OppDoc);
        // Request 1 
        sendDocuments.sendDocuments(opp.External_ID__c, opp.Source_System__c, OppDoc.Id, OppDoc.Name, att.Body, 'txt');
        // Request 2
        sendDocuments.sendDocuments(opp.External_ID__c, '', OppDoc.Id, OppDoc.Name, att.Body, 'txt');
        // Request 3        
        sendDocuments.sendDocuments('', '', att.Id, att.Name, att.Body, 'txt');
        Test.stopTest();

    }  
     
    static testMethod void myUnitTest1() 
    {
        Test.startTest();
        Opportunity opp = new Opportunity();
        opp.Name = 'testOp1';
        opp.LeadSource = 'A001';
        opp.Campaign = Biz2CreditUtils.createCampaign();
        opp.CloseDate = System.today();
        opp.StageName = 'STATUS_RECIEVED';
        opp.External_ID__c = '';
        opp.Status__c = '';
        opp.Source_System__c = 'B2C';
        opp.Current_Processor__c = 'ABC Global System';
        insert opp;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'testOp1';
        opp1.LeadSource = 'A001';
        opp1.Campaign = Biz2CreditUtils.createCampaign();
        opp1.CloseDate = System.today();
        opp1.StageName = 'STATUS_RECIEVED';
        opp1.External_ID__c = '' + System.currentTimeMillis();
        opp1.Status__c = 'TestStatus';
        opp1.Source_System__c = 'B2C';
        opp1.Current_Processor__c = 'ABC Global System';
        insert opp1;
        
        opp1.Status__c ='status';
        update opp1;

        Oppr_Document__c oppDoc = new Oppr_Document__c();
        oppDoc.Document_Name__c = 'TestName';
        oppDoc.Additional_Notes__c = 'testDoc';
        oppDoc.Opportunity__c = opp.Id;
        insert oppDoc;        
                
        Oppr_Document__c oppDoc1 = new Oppr_Document__c();
        oppDoc1.Document_Name__c = 'STATUS_RECIEVED';
        oppDoc1.Additional_Notes__c = 'testDoc';
        oppDoc1.Opportunity__c = opp1.Id;
        insert oppDoc1;
        
        oppDoc1.Document_Name__c = 'test1';
        update oppDoc1;        
        
        Attachment att = new Attachment();
        att.Body = Blob.valueOf('This is Test.');
        att.Name = String.valueOf('STATUS_RECIEVED.txt');
        att.ParentId = oppDoc.Id;
        insert att;      
        
        // Request 1 
        sendDocuments.sendDocuments(opp1.External_ID__c, opp1.Source_System__c, OppDoc1.Id, OppDoc1.Name, att.Body, 'txt');
        // Request 2
        sendDocuments.sendDocuments(opp1.External_ID__c, '', OppDoc1.Id, OppDoc1.Name, att.Body, 'txt');  
        
        //  SendDocuments.returnOppDoc(oppdoc,'STATUS_RECIEVED');
        //  SendDocuments.returnOppDoc(oppdoc,null); 
        Test.stopTest();
       
    }  
}