@isTest
public class TestAllNote_ctrl 
{

    public static testMethod void unitTest() 
    {

        Test.startTest();
        List<Note__c> notesList=new List<Note__c>();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
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
        
        Note__c noteObj= new Note__c();
        noteObj.Note_Content__c='Conditions';
        
        noteObj.Opportunity__c = opp.Id; 
        insert noteObj;

    
        
        ApexPages.StandardController sc = new ApexPages.StandardController(noteObj);
        AllNote_Ctrl cntrl = new AllNote_ctrl(sc);
        List <User> u = [select 
                                Id, Name, TimeZoneSidKey 
                        from
                                User
                        where 
                                isActive = true]; //FullPhotoUrl
        ApexPages.currentPage().getParameters().put('Id', opp.id);
   

        List <String> selectedNotesRT = new List <String> {
                'Prefunding Call', 'Processing Notes', 'Quancor', 'Renewal', 'Risk Alert', 'Risk Notes', 'SA Internal Notes',
                'Sales Check List', 'Sales to UW Processing', 'Site', 'Split change', 'UW Processing', 'Internal UW Notes', 'UW Notes', 'Third Party UW Notes', 'UW Notes to Processing/Risk Department'
        };

        list <RecordType> allRecordsType = [SELECT 
                                                    Id, Name 
                                            FROM 
                                                    RecordType 
                                            where   
                                                    Name
                                            IN      
                                                    : selectedNotesRT 
                                            AND 
                                                    IsActive = true];
        //list<selectOption> selectOptionRecordType=new list<selectOption>();
        allRecordsType.sort();
        for (RecordType rt: allRecordsType) 
        {
            AllNote_Ctrl.RecordTypeDetail rtd = new AllNote_Ctrl.RecordTypeDetail(rt.Id, rt.Name);
            //cntrl.selectOptionRecordType (new SelectOption(rt.Id,rt.Name));
            //  List<SelectOption> selOpts=cntrl.selectOptionRecordType(rt.Id,rt.Name);
            cntrl.searchText = 'ancd';
        }
        
        cntrl.onSearch();
        cntrl.createNote();
        cntrl.selectedRecordTypeForSearch = null;
        cntrl.searchText = '';
        cntrl.onSearch();
        //cntrl.selectedRecordTypeForSearch = 'test';
        cntrl.selectedRecordTypeForSearch = allRecordsType.get(0).id;
        cntrl.onSearch();
        
        String var_time = System.now().format('MM/dd/yyyy hh:mm:ss a', u.get(0).TimeZoneSidKey);
        AllNote_Ctrl.NotesDetail notedtl = new AllNote_Ctrl.NotesDetail(noteObj.id, u[0].name, '', var_time, noteObj, 'Approved'); //u[0].FullPhotoUrl
        cntrl.convertToLocalTime(System.now(), u[0].id);

        // PageReference PageRef = Page.success;
        //Test.setCurrentPageReference(PageRef);
        for (RecordType rt: allRecordsType) 
        {
            if (rt.Name == 'Pre Qual Notes' || rt.Name == 'Internal QC' || rt.Name == 'SA Internal Notes' || 
                rt.Name == 'Processing Notes' || rt.Name == 'Internal UW Notes' || rt.Name == 'UW Notes')
                {
                    Note__c noteObj1 = new Note__c(Opportunity__c = opp.Id, RecordTypeId = rt.Id);
                    notesList.add(noteObj1);
                }
        }
        if(notesList.size()>0)
            insert notesList;
            
        Test.stopTest();
    }
}