trigger updateNoteFieldsOnOpp on Note__c (after insert, after update, before delete) {
//Id TestOppId0 = '0067000000VHvZw';
//Id TestOppId2 = '006Q000000BVnWLIA1';
List<Id> TestOppId = new  List<Id>();
//TestOppId.add(TestOppId0);
//TestOppId.add(TestOppId2);
string var_time {get; set;}
 public map<Id,User> getAllUsers{
        get{
            if(getAllUsers == null){
                //todo FullPhotoUrl
                getAllUsers = new map<Id,User>([select Id,Name,TimeZoneSidKey from User /*where isActive= true*/]);
            }
        return getAllUsers;
        }private set;
    }
List<Note__c> noteList = new List<Note__c>();
List<Note__c> newnoteList = new List<Note__c>(); 
List<Note__c> newnoteListD = new List<Note__c>(); 
Note__c testNote = null; 
if(trigger.isInsert || trigger.isUpdate){
 newnoteList = [SELECT Id, Name, Opportunity__c, RecordType.name, Note_Content__c FROM Note__c WHERE ID =: trigger.new[0].Id];
 testNote = newnoteList[0];
 for(Note__c nt : Trigger.New){
      TestOppId.add(nt.Opportunity__c);
 }
}else {
 newnoteListD = [SELECT Id, Name, Opportunity__c, RecordType.name, Note_Content__c FROM Note__c WHERE ID =: trigger.old[0].Id];
testNote = newnoteListD [0];
 for(Note__c nt : Trigger.old){
      TestOppId.add(nt.Opportunity__c);
 }
}

System.debug('Ajay >>>>> '+ TestOppId);
List<Opportunity> oppList = [SELECT Id, Name, SA_Internal_Notes__c, Pre_Qual_Notes__c, Internal_QC_Notes__c, Internal_Underwriting_Notes__c, Processing_Notes__c, Underwriting_Notes__c, Third_Party_UW_Notes__c FROM Opportunity WHERE Id IN: TestOppId];

System.debug('Ajay >>>>> '+ oppList);
System.debug('Ajay >>>>> '+ testNote.RecordType.Name);
System.debug('Ajay >>>>> '+ TestOppId);
if(null!=oppList)
if(!oppList.isEmpty())
if( testNote.Opportunity__c == oppList[0].Id ){
    if(trigger.isInsert || trigger.isUpdate){
        noteList = [SELECT Id, Name, Opportunity__c, RecordType.name, Note_Content__c, LastModifiedBy.Name, LastModifiedDate FROM Note__c WHERE Opportunity__c IN: TestOppId AND RecordType.Name=:testNote.RecordType.Name ORDER BY LastModifiedDate DESC ];    
    }else{
        noteList = [SELECT Id, Name, Opportunity__c, RecordType.name, Note_Content__c, LastModifiedBy.Name, LastModifiedDate FROM Note__c WHERE Opportunity__c IN: TestOppId AND RecordType.Name=:testNote.RecordType.Name AND ID<>:newnoteListD[0].Id  ORDER BY LastModifiedDate DESC ];
    }
    System.debug('Ajay >>>>> '+ noteList);
    if(testNote.RecordType.Name == 'SA Internal Notes'){
        System.debug('Ajay >>>>> '+testNote.RecordType.Name );
        oppList[0].SA_Internal_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].SA_Internal_Notes__c == '')
                  oppList[0].SA_Internal_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].SA_Internal_Notes__c = oppList[0].SA_Internal_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'Pre Qual Notes'){
        oppList[0].Pre_Qual_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Pre_Qual_Notes__c == '')
                  oppList[0].Pre_Qual_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Pre_Qual_Notes__c = oppList[0].Pre_Qual_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'Internal QC'){
        oppList[0].Internal_QC_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Internal_QC_Notes__c == '')
                  oppList[0].Internal_QC_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Internal_QC_Notes__c = oppList[0].Internal_QC_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'Internal UW Notes'){
        oppList[0].Internal_Underwriting_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Internal_Underwriting_Notes__c == '')
                  oppList[0].Internal_Underwriting_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Internal_Underwriting_Notes__c = oppList[0].Internal_Underwriting_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'Processing Notes'){
        oppList[0].Processing_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Processing_Notes__c == '')
                  oppList[0].Processing_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Processing_Notes__c = oppList[0].Processing_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'UW Notes'){
        oppList[0].Underwriting_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Underwriting_Notes__c == '')
                  oppList[0].Underwriting_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Underwriting_Notes__c = oppList[0].Underwriting_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    if(testNote.RecordType.Name == 'Third Party UW Notes'){
        oppList[0].Third_Party_UW_Notes__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].Third_Party_UW_Notes__c == '')
                  oppList[0].Third_Party_UW_Notes__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].Third_Party_UW_Notes__c = oppList[0].Third_Party_UW_Notes__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }
    /*if(testNote.RecordType.Name == 'UW Notes to Processing/Risk Department'){
        oppList[0].UW_Notes_to_Processing_Risk_Department__c = '';
        for(Note__c testno : noteList){
             var_time = testno.LastModifiedDate.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(testno.LastModifiedById).TimeZoneSidKey); 
             if(oppList[0].UW_Notes_to_Processing_Risk_Department__c == '')
                  oppList[0].UW_Notes_to_Processing_Risk_Department__c = testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
               else
                  oppList[0].UW_Notes_to_Processing_Risk_Department__c = oppList[0].UW_Notes_to_Processing_Risk_Department__c + '\n' +  testno.LastModifiedBy.Name + ' : ' + var_time + ' : ' + testno.Note_Content__c;
        }
    }*/
    try{
    update oppList;
    }catch(Exception e){}


}
 
}