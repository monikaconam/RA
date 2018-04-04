public with sharing class NoteController 
{

    public Note__c objNote {get;set;}
    public transient list<NotesDetail> objNotesDetail{get;set;}
    public list<RecordTypeDetail> objRecordTypeDetail{get;set;}
    public String selectedNoteId{get;set;}
    public String lastModifiedTime{get;set;}
    public String btnTxt{get;set;}
    public boolean isUpdate{get;set;}
    public Map<ID,User> userMap{get;set;}
    
    public Map<String,Id> recordTypeMap{get;set;}
    // Added Code 
  
    List<String> selectedNotesRTSort = new List<String>
    {
        //'Sales Check List',
        //'Sales Notes to UW & Processing',
        //'SA Internal Notes',
        'Pre Qual Notes',
        'UW Notes',
        'UW Notes to Processing/Risk Department',
        'Third Party UW Notes', 
        'Internal QC',    
        'Internal UW Notes',
        'Processing Notes',
        'Internal Processing Notes'};    
    
    public NoteController(ApexPages.StandardController controller) 
    {
        init();
        btnTxt = 'Save';
        isUpdate = false;
         try
         {
            objRecordTypeDetail = new list<RecordTypeDetail>();
            recordTypeMap = new Map<String,Id>();
            List<String> selectedNotesRT = new List<String>
            {
                                //'Sales Check List',
                                'Processing Notes',
                                //'Sales Notes to UW & Processing',
                                'UW Notes to Processing/Risk Department',
                                //'SA Internal Notes',
                                'Pre Qual Notes',
                                'Internal QC',
                                'Internal UW Notes',
                                'Third Party UW Notes',
                                'Internal Processing Notes',
                                'UW Notes'};
                list<RecordType> allRecordsType = [SELECT 
                                                        Id,Name 
                                                    FROM 
                                                        RecordType 
                                                    WHERE 
                                                        Name 
                                                    IN
                                                        :selectedNotesRT 
                                                    AND 
                                                        IsActive=true  
                                                    AND 
                                                        SobjectType='Note__c'];
                                                        
                allRecordsType.sort();
                // added code for managing sorting of Nodes
                for(RecordType rt:allRecordsType)
                {
                        recordTypeMap.put(rt.Name,rt.Id);
                }
                for(String listObj:selectedNotesRTSort)
                {
                    objRecordTypeDetail.add(new RecordTypeDetail(recordTypeMap.get(listObj),listObj));
                }
                /*
                for(RecordType rt:allRecordsType){
                        objRecordTypeDetail.add(new RecordTypeDetail(rt.Id,rt.Name));
                }
                */
                init();
         }
         catch(Exception ex)
         {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 1!'+ex));
         } 
    }
    
    public NoteController()
    {
         try
         {
                objRecordTypeDetail = new list<RecordTypeDetail>();
                recordTypeMap = new Map<String,Id>();
                List<String> selectedNotesRT = new List<String>
                {
                                //'Sales Check List',
                                'Processing Notes',
                                //'Sales Notes to UW & Processing',
                                'UW Notes to Processing/Risk Department',
                                //'SA Internal Notes',
                                'Pre Qual Notes',
                                'Internal QC',
                                'Internal UW Notes',
                                'Third Party UW Notes',
                                'Internal Processing Notes',
                                'UW Notes'
                };
                list<RecordType> allRecordsType = [SELECT 
                                                        Id,Name 
                                                    FROM 
                                                        RecordType 
                                                    WHERE 
                                                        Name 
                                                    IN
                                                        :selectedNotesRT 
                                                    AND 
                                                        IsActive=true  
                                                    AND 
                                                        SobjectType='Note__c'];
                allRecordsType.sort();
                // added code for managing sorting of Nodes
                for(RecordType rt:allRecordsType)
                {
                        recordTypeMap.put(rt.Name,rt.Id);
                }
                for(String listObj:selectedNotesRTSort)
                {
                    objRecordTypeDetail.add(new RecordTypeDetail(recordTypeMap.get(listObj),listObj));
                }
                /*
                for(RecordType rt:allRecordsType){
                        objRecordTypeDetail.add(new RecordTypeDetail(rt.Id,rt.Name));
                }
                */
                init();
         }
         catch(Exception ex)
         {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 1!'+ex));
         } 
    }
    
    public void init()
    {
           
            // added code 
            userMap = new Map<ID,User>([SELECT 
                                            ID,TimeZoneSidKey 
                                        FROM 
                                            User]);
            try
            {    
            objNotesDetail = new List<NotesDetail>();
            //objNotesDetail.add(new NotesDetail('','','',null));            
            for(Note__c no:[SELECT 
                                Id, Name, LastModifiedById,LastModifieddate, OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                            FROM 
                                Note__c 
                            WHERE 
                                opportunity__c=:apexpages.currentpage().getparameters().get('Id') 
                            AND 
                                RecordTypeId =:apexpages.currentpage().getparameters().get('rtId') 
                            ORDER BY 
                                LastModifieddate 
                            DESC])
            {
                lastModifiedTime =  convertToLocalTime(no.LastModifieddate,no.LastModifiedById);
                //lastModifiedTime = String.valueOf(LastModifiedDateTime);                
                String lastModBy = 'N/A';
                if(getAllUsers.get(no.LastModifiedById) != null)
                lastModBy = getAllUsers.get(no.LastModifiedById).Name;                  
                //todo getAllUsers.get(no.LastModifiedById).FullPhotoUrl
                objNotesDetail.add(new NotesDetail(no.Id,new Note__c(Note_content__c=no.Note_Content__c),lastModBy,'',lastModifiedTime,no.OwnerId)); 
                }       
                objNote = new Note__c();
        }
        catch(Exception ex)
        { 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 2!'+ex)); 
        }        
    }
    
    //added functions
    public String convertToLocalTime(datetime param_time,Id UserID)
    {
        //convert to string to format datetime to local parameter
        // User u = [SELECT ID, TimeZoneSidKey FROM User WHERE ID = :UserID];        
        //Boolean contains = userMap.containsKey(UserID);        
        //User user;
        if(getAllUsers.containsKey(UserID))
        {
                DateTime utcTime = param_time;
                //user = getAllUsers.get(UserID);
                string var_time = utcTime.format('MM/dd/yyyy hh:mm:ss a',getAllUsers.get(UserID).TimeZoneSidKey); 
                return var_time; //return datetime.valueOf(var_time);
        }
        
             return param_time.format('MM/dd/yyyy hh:mm:ss a');
      }
      
    public map<Id,User> getAllUsers
    {
        get
        {
            if(getAllUsers == null)
            {
                //todo FullPhotoUrl
                getAllUsers = new map<Id,User>([SELECT 
                                                    Id,Name,TimeZoneSidKey 
                                                FROM 
                                                    User 
                                                WHERE 
                                                    isActive= true]);
            }
        return getAllUsers;
        }
        private set;
    }
    
    public pagereference createNote() 
    {
        try 
        {             
            if(btnTxt == 'update' && isUpdate)
            {
                btnTxt = 'save';
                isUpdate = false;
                update objNote; 
            }
            else
            {
                objNote = new Note__c(Note_Content__c=objNote.Note_Content__c, 
                                    RecordTypeId = apexpages.currentpage().getparameters().get('rtId'),
                                    Opportunity__c = apexpages.currentpage().getparameters().get('Id'));
                insert objNote;
            }
            init();
        } 
        catch (Exception e) 
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 3! '+e));   
        }
        return null;
    }
    
    public pagereference editNote() 
    {
        try 
        {
             btnTxt = 'Update';
             isUpdate = true;
             init();
             objNote = [Select 
                            Id, Name, LastModifiedById,LastModifieddate, OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                        FROM 
                            Note__c 
                        WHERE 
                            Opportunity__c=:apexpages.currentpage().getparameters().get('Id') 
                        AND 
                            RecordTypeId =:apexpages.currentpage().getparameters().get('rtId') 
                        AND 
                            id =:selectedNoteId];
             //update objNote;
             //init();
        } 
        catch (Exception e) 
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 4! '+e));   
        }
        return null;
    }
    
    public pagereference deleteNote() 
    {
        try 
        {
            objNote = [SELECT 
                             Id, Name, LastModifiedById,LastModifieddate, OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                        FROM  
                            Note__c 
                        WHERE 
                            Opportunity__c=:apexpages.currentpage().getparameters().get('Id') 
                        AND 
                            RecordTypeId =:apexpages.currentpage().getparameters().get('rtId') 
                        AND 
                            id =:selectedNoteId];
            delete objNote;
            init();
        } 
        catch (Exception e) 
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator 5! '+e));   
        }
        return null;
    }
    
    public class RecordTypeDetail
    {
        public String oppId{get;set;}
        public String recordTypeName {get;set;}
        public String recordTypeId {get;set;}
        public RecordTypeDetail(String recordTypeId,String recordTypeName)
        {
                this.recordTypeId = recordTypeId;
                this.recordTypeName = recordTypeName;
                this.oppId = apexpages.currentpage().getparameters().get('Id');                 
        }
    }
    /*Note Detail Wrapper*/
    public class NotesDetail
    {
        public String noteId {get;set;}
        public Note__c latestNoteValues{get;set;}
        public String lastModifiedBy{get;set;}
        public String profileImageUrl{get;set;}
        public boolean isEditableAndDeleteableByUser{get;set;}
        public String ownerId{get;set;}
        //public DateTime lastModifiedDateTime{get;set;}
        public String lastModifiedDateTime{get;set;}
        
        public NotesDetail(string noteId,Note__c latestNoteValues,string lastModifiedBy,string profileImageUrl,String lastModifiedDateTime,String ownerId)
        {
            this.noteId = noteId;
            this.latestNoteValues = latestNoteValues;
            this.profileImageUrl = profileImageUrl;
            this.lastModifiedDateTime = lastModifiedDateTime;
            this.lastModifiedBy = lastModifiedBy;
            
            if(ownerId != Userinfo.getUserId() && !profileNameById.containskey(userInfo.getProfileId()))
            {
                this.isEditableAndDeleteableByUser = false;
            }
            else
            {
                this.isEditableAndDeleteableByUser = true;
            }            
        }
        
        public map<String,Profile> profileNameById
        {
            get
            {
                if(profileNameById == null)
                {
                    profileNameById = new map<String,Profile>([SELECT 
                                                                    Name 
                                                                FROM 
                                                                    Profile 
                                                                WHERE 
                                                                    Name ='System Administrator']);
                }
                return profileNameById;
            }
            private set;
        } 
    }
    
    
}
    /*Inetial Data binding
    public list<RecordTypeDetail> tabsInformation(){ 
        list<RecordTypeDetail> objRecordTypeDetail = new List<RecordTypeDetail>();
        
        List<String> selectedNotesRT = new List<String>{'Approved With Conditions',
                                                        'Archived Credit Bureau',
                                                        'Business Bankruptcies',
                                                        'Funding','Individual Bankrupties',
                                                        'Internal QC',
                                                        'Internal UnderWriting',
                                                        'Pre Qual','Pre Qual Loss',
                                                        'Prefunding Call','Processing',
                                                        'Quancor','Renewal',
                                                        'Risk Alert',
                                                        'Risk Notes',
                                                        'SA Internal',
                                                        'Sales Check List',
                                                        'Sales to UW Processing',
                                                        'Site','Split change',
                                                        'Underwriting','UW Processing'};
        for(String nrt:selectedNotesRT){
            if(null != noteMap.get(nrt)){
                list<NotesDetail> notes = new list<NotesDetail>();
                integer index = 0;
                for(Note__c lnv:getAllNotes.values()){
                    if(lnv.RecordType.Name == nrt){
                        notes.add(new NotesDetail(lnv.Note_Content__c,
                                                    MainClass.getAllUsers.get(lnv.LastModifiedById).FullPhotoUrl,
                                                    lnv.LastModifieddate,MainClass.getAllUsers.get(lnv.LastModifiedById).Name));
                        //notes.add(new NotesDetail(lnv.Note_Content__c,
                        MainClass.getAllUsers.get(getAllNotes.get(getAllNotes.keyset()[index]).LastModifiedById).FullPhotoUrl,n
                        oteMap.get(nrt).LastModifieddate,MainClass.getAllUsers.get(noteMap.get(nrt).LastModifiedById).Name));
                    } 
                    index++;
                }               
                //noteMap.get(nrt).Note_Content__c
                list<NotesDetail> notesSorted = sortByLastDate(notes);
                objRecordTypeDetail.add(new RecordTypeDetail(nrt,
                notesSorted,noteMap.get(nrt).RecordTypeId));
            }else{
                objRecordTypeDetail.add(new RecordTypeDetail(nrt,null,getAllNoteMap.get(nrt).Id));
            }
        }
        return objRecordTypeDetail; 
    }
    /*Wrapper class Sorting 
    private list<NotesDetail> sortByLastDate(list<NotesDetail> wrapperObject) {
        if(wrapperObject == null || wrapperObject.size() <= 1){
            return wrapperObject ;
        }        
        List<NotesDetail> lessWrapperObject = new List<NotesDetail>();
        List<NotesDetail> greatWrapperObject = new List<NotesDetail>();
        integer pivot = wrapperObject.size() / 2;
        
        //save the pivot and remove it from the selectOption list
        NotesDetail pivotValue = wrapperObject[pivot];
        wrapperObject.remove(pivot);
        for(NotesDetail SO : wrapperObject){
            if(SO.lastModifiedDateTime > pivotValue.lastModifiedDateTime){
                lessWrapperObject.add(SO);
            }else if(SO.lastModifiedDateTime <= pivotValue.lastModifiedDateTime){
                greatWrapperObject.add(SO);   
            }
        }
        list<NotesDetail> sortedWrapperObject = new list<NotesDetail>(); 
        sortedWrapperObject.addAll(sortByLastDate(lessWrapperObject));
        sortedWrapperObject.add(pivotValue);
        sortedWrapperObject.addAll(sortByLastDate(greatWrapperObject));
        return sortedWrapperObject;
    }
    /*Note map Key > Note Record Type , value > Note
    private map<String,Note__c> noteMap{
        get{
            if(noteMap == null){
                noteMap = new map<String,Note__c>();
                for(Note__c no:[Select 
                                        Id, Name, LastModifiedById,LastModifieddate, OwnerId, RecordType.Name,RecordTypeId, 
                                        Note_Content__c from Note__c 
                                Where 
                                        opportunity__c=:apexpages.currentpage().getparameters().get('Id') order by LastModifieddate desc]){
                    //if(!noteMap.containsKey(no.RecordType.Name)){
                        noteMap.put(no.RecordType.Name,no);
                    //}
                }
            }
            return noteMap;
        }private set;
    }  
    /*Note map Key > Id , value > Note
    private map<String,Note__c> getAllNotes{
        get{
            if(getAllNotes == null){
                getAllNotes = new map<String,Note__c>([Select 
                                                            Id, Name, LastModifiedById,LastModifieddate, OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                                                        from Note__c Where opportunity__c=:apexpages.currentpage().getparameters().get('Id') order by LastModifieddate desc]);
            }
            return getAllNotes;
        }private set;
    }
    /*Record Type map Key > Record Type Name , value > RT  
    private map<String,RecordType> getAllNoteMap{
        get{
            if(getAllNoteMap == null){
                getAllNoteMap = new map<String,RecordType>();
                for(RecordType n:[Select Id,SobjectType, Name, LastModifiedDate From RecordType where sobjecttype='Note__c']){
                    getAllNoteMap.put(n.Name,n);
                }
            }
            return getAllNoteMap;
        }private set;
    }
    /*Tab and deatl wrapper    
    class RecordTypeDetail{
        public string recordTypeName{get;set;}
        public list<NotesDetail> notesDetails{get;set;}
        public String recordTypeId {get;set;}
        
        public RecordTypeDetail(String recordTypeName,list<NotesDetail> notesDetails,String recordTypeId){
            this.recordTypeName = recordTypeName;
            this.notesDetails = notesDetails;            
            this.recordTypeId = recordTypeId;
            //this.oppId = apexpages.currentpage().getparameters().get('Id');
        }
    }    
}*/