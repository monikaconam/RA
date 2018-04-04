@isTest
public class TestOppNoteController {
    
    @testSetup static void setup()
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        insert opp;
    }

    static TestMethod Void TestMethod1()
    {
        Test.startTest();
        Opportunity opp=[select 
                                id 
                        from 
                                opportunity 
                        where 
                                name='testOpportunity' limit 1];    
        
        Note__c noteObj= new Note__c();
        noteObj.Note_Content__c='Conditions';
        noteObj.Opportunity__c = opp.Id; 
        insert noteObj;
        
        ApexPages.currentPage().getParameters().put('oppid', opp.Id);
        ApexPages.currentPage().getParameters().put('id', noteObj.Id);
        
        OppNoteController OppNoteObj = new OppNoteController();
        OppNoteObj.validateFields();
        OppNoteObj.cancel();
        OppNoteObj.save();
        ApexPages.currentPage().getParameters().put('id', null);
        OppNoteController OppNoteObj_NEW = new OppNoteController();
        Test.stopTest();
    }
    static TestMethod Void TestMethod3()
    {
        Test.startTest();
        Opportunity opp=[select 
                                id 
                        from 
                                opportunity 
                        where 
                                name='testOpportunity' limit 1];    
        
        Note noteObj= new Note();
        noteObj.Title='test';
        noteObj.body='test';
        noteObj.parentID = opp.Id; 
        insert noteObj;
        
        ApexPages.currentPage().getParameters().put('oppid', opp.Id);
        ApexPages.currentPage().getParameters().put('id', noteObj.Id);
        
        OppNoteController OppNoteObj = new OppNoteController();
        OppNoteObj.validateFields();
        OppNoteObj.cancel();
        OppNoteObj.save();
        ApexPages.currentPage().getParameters().put('id', null);
        OppNoteController OppNoteObj_NEW = new OppNoteController();
        Test.stopTest();
        
        
    }
    static TestMethod Void TestMethod2()
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        /*DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cam =  TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cam);
        */
        
        Opportunity opp=[select 
                                id 
                        from 
                                opportunity 
                        where 
                                name='testOpportunity' limit 1];    

        ApexPages.currentPage().getParameters().put('retURL', opp.Id);
        ApexPages.currentPage().getParameters().put('oppid', opp.Id);
        
        OppNoteController OppNoteObj = new OppNoteController();
        OppNoteObj.oppNote.Title = 'testTitle';
        OppNoteObj.save();
        OppNoteObj.cancel();
        Test.stopTest();

    }
}