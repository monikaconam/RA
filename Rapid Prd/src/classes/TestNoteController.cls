@isTest
public class TestNoteController
{
    static testMethod void RunTestCase()
    {
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
        RecordType rc1= new RecordType(name='Approved');
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        List<User> u= [SELECT 
                            Id,Name,TimeZoneSidKey 
                        FROM 
                            User 
                        WHERE 
                            isActive= true];//FullPhotoUrl
        apexpages.currentpage().getparameters().put('Id',noteObj.id);
        ApexPages.StandardController sc = new ApexPages.standardController(noteObj);
        NoteController cntrl = new NoteController();
        
        List<String> selectedNotesRT = new List<String>{'Approved With Conditions','Archived Credit Bureau','Business Bankruptcies','Underwriting','Funding','Individual Bankrupties','Internal QC','Internal UnderWriting','Pre Qual','Pre Qual Loss','Prefunding Call','Processing','Quancor','Renewal','Risk Alert','Risk Notes','SA Internal','Sales Check List','Sales to UW Processing','Site','Split change','UW Processing'};
        list<RecordType> allRecordsType = [SELECT 
                                                Id,Name 
                                            FROM 
                                                RecordType 
                                            WHERE 
                                                Name 
                                            IN
                                                :selectedNotesRT 
                                            AND 
                                                IsActive=true];
        allRecordsType.sort();
        apexpages.currentpage().getparameters().put('rtId',allRecordsType[0].id);    
        
        ApexPages.StandardController noteController = new ApexPages.standardController(noteObj);
        NoteController nc = new NoteController(noteController);
        NoteController nc1 = new NoteController();
        
        for(RecordType rt:allRecordsType)
        {        
        NoteController.RecordTypeDetail  tr= new NoteController.RecordTypeDetail(rt.Id,rt.Name);
        }
        
        nc.createnote();
        
        string var_time = System.now().format('MM/dd/yyyy hh:mm:ss a',u[0].TimeZoneSidKey); 
        cntrl.convertToLocalTime(System.now(),u[0].id);
        cntrl.editNote();
        cntrl.deleteNote();
        NoteController.NotesDetail notedtl= new NoteController.NotesDetail (noteObj.id,noteObj, u[0].name,'',var_time,noteObj.ownerId);//u[0].FullPhotoUrl
    }
    
    static testMethod void RunTestCaseExc()
    {
        test.starttest();
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
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        RecordType rc1= new RecordType(name='Approved');
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        List<User> u= [SELECT 
                            Id,Name,TimeZoneSidKey 
                        FROM 
                            User 
                        WHERE 
                            isActive= true];//FullPhotoUrl                           
       
       
        NoteController cntrl = new NoteController();        
        List<String> selectedNotesRT = new List<String>{'Approved With Conditions','Archived Credit Bureau','Business Bankruptcies','Underwriting','Funding','Individual Bankrupties','Internal QC','Internal UnderWriting','Pre Qual','Pre Qual Loss','Prefunding Call','Processing','Quancor','Renewal','Risk Alert','Risk Notes','SA Internal','Sales Check List','Sales to UW Processing','Site','Split change','UW Processing'};
        list<RecordType> allRecordsType = [SELECT 
                                                Id,Name 
                                            FROM 
                                                RecordType 
                                            WHERE 
                                                Name 
                                            IN
                                                :selectedNotesRT 
                                            AND 
                                                IsActive=true];
        allRecordsType.sort();
        
        PageReference newPage=Page.NoteContent;
        Test.setCurrentPage(newPage);
        apexpages.currentpage().getparameters().put('rtId',allRecordsType[0].id);
        ApexPages.StandardController noteController = new ApexPages.standardController(noteObj);
        NoteController ncE = new NoteController(noteController);
        NoteController ncE1 = new NoteController();        
        for(RecordType rt:allRecordsType)
        {        
            NoteController.RecordTypeDetail  tr= new NoteController.RecordTypeDetail(rt.Id,rt.Name);
        }        
        ncE.createnote();        
        string var_time = System.now().format('MM/dd/yyyy hh:mm:ss a',u[0].TimeZoneSidKey); 
        cntrl.convertToLocalTime(System.now(),u[0].id);
        cntrl.editNote();
        cntrl.deleteNote();
        NoteController.NotesDetail notedtl= new NoteController.NotesDetail (noteObj.id,noteObj, u[0].name,'',var_time,noteObj.ownerId);//u[0].FullPhotoUrl
        
        test.stopTest();
    }
}