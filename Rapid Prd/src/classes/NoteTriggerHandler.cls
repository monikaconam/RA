public with sharing class NoteTriggerHandler 
{
    public static void aiUpdateNoteFieldsOnOpp(List<Note__c> noteListT)
    {
        noteIUHelper(noteListT);
    }
    public static void auUpdateNoteFieldsOnOpp(List<Note__c> noteListT)
    {
        noteIUHelper(noteListT);
    }
    
    public static void bdUpdateNoteFieldsOnOpp(List<Note__c> oldList)
    {
        String var_time;
        List<Note__c> noteList = new List<Note__c>();
        List<Note__c> newNoteListD = new List<Note__c>(); 
        Map<Id,User> getAllUsers=new map<Id,User>([SELECT 
                                                        Id,Name,TimeZoneSidKey 
                                                    FROM 
                                                        User]
                                                   );
        Note__c testNote = null; 
        List<Id> TestOppId = new  List<Id>();
        
        newnoteListD = [SELECT 
                                Id, Name, Opportunity__c, RecordType.name, Note_Content__c 
                        FROM 
                                Note__c 
                        WHERE 
                                ID =: oldList.get(0).Id];
                                
        testNote = newnoteListD.get(0);
        
        for(Note__c nt : oldList)
        {
            TestOppId.add(nt.Opportunity__c);
        }
        List<Opportunity> oppList = [SELECT 
                                            Id, Name, SA_Internal_Notes__c, Pre_Qual_Notes__c, Internal_QC_Notes__c, 
                                            Internal_Underwriting_Notes__c, 
                                            Processing_Notes__c, Underwriting_Notes__c, Third_Party_UW_Notes__c
                                             
                                        FROM 
                                            Opportunity 
                                        WHERE 
                                            Id IN: TestOppId];
        /* DS-CONAM
        if(null!=oppList)
        if(!oppList.isEmpty())
        */
        if(oppList.size()>0)
        {
            if( testNote.Opportunity__c == oppList.get(0).Id )
            {
                noteList = [SELECT 
                                    Id, Name, Opportunity__c, RecordType.name, Note_Content__c, LastModifiedBy.Name, LastModifiedDate 
                            FROM 
                                    Note__c 
                            WHERE 
                                    Opportunity__c 
                            IN      
                                    : TestOppId 
                            AND     
                                    RecordType.Name=:testNote.RecordType.Name 
                            AND     
                                    ID<>:newnoteListD.get(0).Id  ORDER BY LastModifiedDate DESC ];
            
                if(testNote.RecordType.Name == 'SA Internal Notes')
                {
                    oppList.get(0).SA_Internal_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* ds-conam 
                        if(oppList.get(0).SA_Internal_Notes__c == '')
                              oppList.get(0).SA_Internal_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).SA_Internal_Notes__c = oppList.get(0).SA_Internal_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).SA_Internal_Notes__c = oppList.get(0).SA_Internal_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).SA_Internal_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        
                        }
                }
                if(testNote.RecordType.Name == 'Pre Qual Notes')
                {
                    oppList.get(0).Pre_Qual_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM 
                        if(oppList.get(0).Pre_Qual_Notes__c == '')
                              oppList.get(0).Pre_Qual_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Pre_Qual_Notes__c = oppList.get(0).Pre_Qual_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Pre_Qual_Notes__c = oppList.get(0).Pre_Qual_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Pre_Qual_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        
                    }
                }
                if(testNote.RecordType.Name == 'Internal QC')
                {
                    oppList.get(0).Internal_QC_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM  
                        if(oppList.get(0).Internal_QC_Notes__c == '')
                              oppList.get(0).Internal_QC_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Internal_QC_Notes__c = oppList.get(0).Internal_QC_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        
                        oppList.get(0).Internal_QC_Notes__c =oppList.get(0).Internal_QC_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Internal_QC_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c; 
                    }
                }
                if(testNote.RecordType.Name == 'Internal UW Notes')
                {
                    oppList.get(0).Internal_Underwriting_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM
                        if(oppList.get(0).Internal_Underwriting_Notes__c == '')
                              oppList.get(0).Internal_Underwriting_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Internal_Underwriting_Notes__c = oppList.get(0).Internal_Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Internal_Underwriting_Notes__c =oppList.get(0).Internal_Underwriting_Notes__c == '' ?testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Internal_Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'Processing Notes')
                {
                    oppList.get(0).Processing_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM 
                        if(oppList.get(0).Processing_Notes__c == '')
                              oppList.get(0).Processing_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Processing_Notes__c = oppList.get(0).Processing_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Processing_Notes__c =oppList.get(0).Processing_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Processing_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'UW Notes')
                {
                    oppList.get(0).Underwriting_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                         /* DS-CONAM
                         if(oppList.get(0).Underwriting_Notes__c == '')
                              oppList.get(0).Underwriting_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Underwriting_Notes__c = oppList.get(0).Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                          */
                          oppList.get(0).Underwriting_Notes__c = oppList.get(0).Underwriting_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'Third Party UW Notes')
                {
                    oppList.get(0).Third_Party_UW_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                         /* DS-CONAM
                         if(oppList.get(0).Third_Party_UW_Notes__c == '')
                              oppList.get(0).Third_Party_UW_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Third_Party_UW_Notes__c = oppList.get(0).Third_Party_UW_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                          */
                        oppList.get(0).Third_Party_UW_Notes__c =  oppList.get(0).Third_Party_UW_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Third_Party_UW_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                          
                    }
                }
                if(testNote.RecordType.Name == 'UW Notes to Processing/Risk Department')
                {
                    
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                           
                              
                    }
                }
                try
                {
                    Database.update(oppList,false);
                }
                catch(Exception e) 
                { 
                    oppList[0].addError('Exception Caught at line number'+ '' + e.getLineNumber()+ '' + e.getMessage());
                }
            }
        }
        
    }
    
    public static void noteIUHelper(List<Note__c> noteListS)
    {
        String var_time;
        List<Note__c> noteList = new List<Note__c>();
        List<Note__c> newNoteListD = new List<Note__c>(); 
        List<Note__c> newNoteList = new List<Note__c>();
        Note__c testNote = null; 
        List<Id> TestOppId = new  List<Id>();
        Map<Id,User> getAllUsers=new map<Id,User>([select Id,Name,TimeZoneSidKey from User]);
        newNoteList = [SELECT 
                            Id, Name, Opportunity__c, RecordType.name, Note_Content__c 
                        FROM 
                            Note__c 
                        WHERE 
                            ID =: trigger.new.get(0).Id];
        testNote = newnoteList.get(0);
        for(Note__c nt : noteListS)
        {
            if(nt.Opportunity__c!= null)
                TestOppId.add(nt.Opportunity__c);
        }
        
        List<Opportunity> oppList = [SELECT 
                                            Id, Name, SA_Internal_Notes__c, Pre_Qual_Notes__c, Internal_QC_Notes__c, Internal_Underwriting_Notes__c, 
                                            Processing_Notes__c, Underwriting_Notes__c, Third_Party_UW_Notes__c 
                                        FROM 
                                            Opportunity 
                                        WHERE 
                                            Id IN: TestOppId];
        /* DS-CONAM
        if(null!=oppList)
        if(!oppList.isEmpty())
        */
        if(oppList.size()>0)
        {
            if( testNote.Opportunity__c == oppList.get(0).Id )
            {
                noteList = [SELECT 
                                    Id, Name, Opportunity__c, RecordType.name, Note_Content__c, 
                                    LastModifiedBy.Name, LastModifiedDate 
                                FROM 
                                    Note__c 
                                WHERE 
                                    Opportunity__c 
                                IN      
                                    : TestOppId 
                                AND 
                                    RecordType.Name=:testNote.RecordType.Name 
                                ORDER BY 
                                    LastModifiedDate DESC ];    

                if(testNote.RecordType.Name == 'SA Internal Notes')
                {
                    oppList.get(0).SA_Internal_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM
                         * if(oppList.get(0).SA_Internal_Notes__c == '')
                              oppList.get(0).SA_Internal_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).SA_Internal_Notes__c = oppList.get(0).SA_Internal_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).SA_Internal_Notes__c =oppList.get(0).SA_Internal_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).SA_Internal_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        
                    }
                }
                if(testNote.RecordType.Name == 'Pre Qual Notes')
                {
                    oppList.get(0).Pre_Qual_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM 
                        if(oppList.get(0).Pre_Qual_Notes__c == '')
                              oppList.get(0).Pre_Qual_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Pre_Qual_Notes__c = oppList.get(0).Pre_Qual_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Pre_Qual_Notes__c=oppList.get(0).Pre_Qual_Notes__c == '' ?testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Pre_Qual_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'Internal QC')
                {
                    oppList.get(0).Internal_QC_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM  
                        if(oppList.get(0).Internal_QC_Notes__c == '')
                              oppList.get(0).Internal_QC_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Internal_QC_Notes__c = oppList.get(0).Internal_QC_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Internal_QC_Notes__c =oppList.get(0).Internal_QC_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Internal_QC_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'Internal UW Notes')
                {
                    oppList.get(0).Internal_Underwriting_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* ds-conam 
                        if(oppList.get(0).Internal_Underwriting_Notes__c == '')
                              oppList.get(0).Internal_Underwriting_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Internal_Underwriting_Notes__c = oppList.get(0).Internal_Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Internal_Underwriting_Notes__c=oppList.get(0).Internal_Underwriting_Notes__c == '' ?testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Internal_Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        
                    }
                }
                if(testNote.RecordType.Name == 'Processing Notes')
                {
                    oppList.get(0).Processing_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* 
                        if(oppList.get(0).Processing_Notes__c == '')
                              oppList.get(0).Processing_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Processing_Notes__c = oppList.get(0).Processing_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        oppList.get(0).Processing_Notes__c =oppList.get(0).Processing_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Processing_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        
                    }
                }
                if(testNote.RecordType.Name == 'UW Notes')
                {
                    oppList.get(0).Underwriting_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* 
                        if(oppList.get(0).Underwriting_Notes__c == '')
                              oppList.get(0).Underwriting_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else 
                              oppList.get(0).Underwriting_Notes__c = oppList.get(0).Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        
                        oppList.get(0).Underwriting_Notes__c =oppList.get(0).Underwriting_Notes__c == '' ? testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Underwriting_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'Third Party UW Notes')
                {
                    oppList.get(0).Third_Party_UW_Notes__c = '';
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                        /* DS-CONAM 
                        if(oppList.get(0).Third_Party_UW_Notes__c == '')
                              oppList.get(0).Third_Party_UW_Notes__c = testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                           else
                              oppList.get(0).Third_Party_UW_Notes__c = oppList.get(0).Third_Party_UW_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                        */
                        
                        oppList.get(0).Third_Party_UW_Notes__c = oppList.get(0).Third_Party_UW_Notes__c == '' ?testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c : oppList.get(0).Third_Party_UW_Notes__c + '\n' +  testNo.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testNo.Note_Content__c;
                    }
                }
                if(testNote.RecordType.Name == 'UW Notes to Processing/Risk Department')
                {
                    
                    for(Note__c testNo : noteList)
                    {
                         var_time = testNo.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testNo.LastModifiedById).TimeZoneSidKey); 
                       
                    }
                }
                try
                {
                    Database.update(oppList,false);
                }
                catch(Exception e)   
                {    
                    noteListS[0].addError('Exception Caught at line number '+e.getLineNumber());
                }            
            
            }
        }
    }
}