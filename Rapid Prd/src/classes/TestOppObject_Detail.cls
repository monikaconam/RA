@isTest 

public class TestOppObject_Detail 
{   
    static testMethod void OppObject_Detail_UnitTest() 
    {
        test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        RecordType rc= new RecordType(name='Approved');
        
        Account Acc = new Account();
        Acc.name = 'Test Account1';
        Acc.BusinessType__c = 'testBusibess';
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
        insert noteObj ;
        List < String > selectedNotesRT = new List < String > {'Opportunity','Sales Check List','Visa Info',
                                                                 'Underwriting','Merchant','Opportunity Bank' };
                                                                 
        list < RecordType > allRecordsType = [SELECT 
                                                    Id, Name 
                                                FROM 
                                                    RecordType 
                                                WHERE
                                                    Name 
                                                IN: selectedNotesRT 
                                                    AND IsActive = true];

        OppObject_Detail obc=new OppObject_Detail('Opportunity Details', opp.Id);        
        Test.stopTest();
    }
}