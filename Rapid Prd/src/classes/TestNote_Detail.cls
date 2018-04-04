@isTest

public class TestNote_Detail
{
    public static testMethod void runNoteDetails()
    {   
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        List<String> selectedNotesRT = new List<String>{'Processing Notes',
                                                        'Sales Notes to UW & Processing',
                                                        'UW Notes to Processing/Risk Department',
                                                        'Sales Check List',
                                                        'SA Internal Notes',
                                                        'Pre Qual Notes',
                                                        'Internal UW Notes',
                                                        'Third Party UW Notes',
                                                        'UW Notes'
                                                         };
        list<RecordType>DetailRecords = [SELECT 
                                                Id,Name, LastModifieddate
                                            FROM 
                                                RecordType 
                                            WHERE 
                                                Name 
                                            IN
                                                :selectedNotesRT 
                                            AND 
                                                IsActive=true];                                                
                
        Account Acc = new Account();
        Acc.name = 'Test Account1';
        Acc.BusinessType__c = 'testBusiness';
        insert Acc;
        
        Campaign cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam ;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        noteObj .RecordTypeId =DetailRecords.get(0).Id;
        insert noteObj ;
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.RecordTypeId =DetailRecords.get(0).Id;
        insert noteObj2;
        
        Note__c noteObj3 = new Note__c();
        noteObj3.Note_Content__c='Conditions';
        noteObj3.Opportunity__c = opp.Id; 
        noteObj3.RecordTypeId =DetailRecords.get(0).Id;
        insert noteObj3 ;
        
        noteObj .Note_Content__c='Condition09';
        update noteObj;
        
        PageReference newPage=Page.MainPageResizable;
        Test.setCurrentPage(newPage);
        ApexPages.currentPage().getParameters().put('Id',opp.id);
        ApexPages.currentPage().getParameters().put('oppId',opp.id);
        ApexPages.standardController con = new apexpages.standardcontroller(opp);
        MainClass ms = new MainClass();
    
        test.stopTest();        
    }
}