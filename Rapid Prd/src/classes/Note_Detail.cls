public class Note_Detail 
{
    public string objectName{get;set;}
    public List<RecordTypeDetail> recordType{get;set;}
    public Note_Detail(string objectName)
    {
        this.objectName = objectName;
        this.recordType = tabsInformation();
    }
    /*Initial Data binding*/ 
    public List<RecordTypeDetail> tabsInformation()
    { 
        List<RecordTypeDetail> objRecordTypeDetail = new List<RecordTypeDetail>();        
        List<String> selectedNotesRT = new List<String>
        {
            'Processing Notes',
            'Sales Notes to UW & Processing',
            'UW Notes to Processing/Risk Department',
            'Sales Check List',
            'SA Internal Notes',
            'Pre Qual Notes',
            'Internal UW Notes',
            'Third Party UW Notes',
            'UW Notes'
        };
        for(String nrt:selectedNotesRT)
        {
            if(null != noteMap.get(nrt))
            {
                List<NotesDetail> notes = new List<NotesDetail>();
                Integer index = 0;
                for(Note__c lnv:getAllNotes.values())
                {
                    if(lnv.RecordType.Name == nrt)
                    {
                        notes.add(new NotesDetail(lnv.Note_Content__c,'',lnv.LastModifieddate,MainClass.getAllUsers.get(lnv.LastModifiedById).Name));
                    } 
                    index++;
                }               
                //noteMap.get(nrt).Note_Content__c
                List<NotesDetail> notesSorted = sortByLastDate(notes);
                objRecordTypeDetail.add(new RecordTypeDetail(nrt,
                notesSorted,noteMap.get(nrt).RecordTypeId));
            }
            else
            {
                objRecordTypeDetail.add(new RecordTypeDetail(nrt,null,getAllNoteMap.get(nrt).Id));
            }
        }
        return objRecordTypeDetail; 
    }
    /*Wrapper class Sorting*/
    private List<NotesDetail> sortByLastDate(List<NotesDetail> wrapperObject) 
    {
        if(wrapperObject == null || wrapperObject.size() <= 1)
        {
            return wrapperObject ;
        }        
        List<NotesDetail> lessWrapperObject = new List<NotesDetail>();
        List<NotesDetail> greatWrapperObject = new List<NotesDetail>();
        Integer pivot = wrapperObject.size() / 2;
        
        //save the pivot and remove it from the selectOption list
        NotesDetail pivotValue = wrapperObject[pivot];
        wrapperObject.remove(pivot);
        for(NotesDetail SO : wrapperObject)
        {
            if(SO.lastModifiedDateTime > pivotValue.lastModifiedDateTime)
            {
                lessWrapperObject.add(SO);
            }
            else if(SO.lastModifiedDateTime <= pivotValue.lastModifiedDateTime)
            {
                greatWrapperObject.add(SO);   
            }
        }
        List<NotesDetail> sortedWrapperObject = new List<NotesDetail>(); 
        sortedWrapperObject.addAll(sortByLastDate(lessWrapperObject));
        sortedWrapperObject.add(pivotValue);
        sortedWrapperObject.addAll(sortByLastDate(greatWrapperObject));
        return sortedWrapperObject;
    }
    /*Note map Key > Note Record Type , value > Note*/
    private Map<String,Note__c> noteMap
    {
        get
        {
            if(noteMap == null)
            {
                noteMap = new Map<String,Note__c>();
                List<Note__c>lSTemp= [SELECT 
                                            Id, Name, LastModifiedById,LastModifieddate, 
                                            OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                                        FROM 
                                            Note__c 
                                        WHERE 
                                            Opportunity__c=:apexpages.currentpage().getparameters().get('Id') 
                                        ORDER BY 
                                            LastModifieddate 
                                        DESC];
                for(Note__c no:lSTemp)
                {
                    //if(!noteMap.containsKey(no.RecordType.Name)){
                        noteMap.put(no.RecordType.Name,no);
                    //}
                }
            }
            return noteMap;
        }
        private set;
    }  
    /*Note map Key > Id , value > Note*/
    private Map<String,Note__c> getAllNotes
    {
        get
        {
            if(getAllNotes == null)
            {
                getAllNotes = new Map<String,Note__c>([SELECT
                                                            Id, Name, LastModifiedById,LastModifieddate, 
                                                            OwnerId, RecordType.Name,RecordTypeId, Note_Content__c 
                                                        FROM 
                                                            Note__c 
                                                        WHERE 
                                                            Opportunity__c=:apexPages.currentPage().getParameters().get('Id') 
                                                        ORDER BY 
                                                            LastModifiedDate 
                                                        DESC]);
            }
            return getAllNotes;
        }
        private set;
    }
    /*Record Type map Key > Record Type Name , value > RT */
    private Map<String,RecordType> getAllNoteMap
    {
        get
        {
            if(getAllNoteMap == null)
            {
                getAllNoteMap = new Map<String,RecordType>();
                List<RecordType>rTL = [SELECT 
                                            Id,SobjectType, Name, LastModifiedDate 
                                        FROM 
                                            RecordType 
                                        WHERE 
                                            sObjectType='Note__c'];
                                        
                for(RecordType n:rTL)
                {
                    getAllNoteMap.put(n.Name,n);
                }
            }
            return getAllNoteMap;
        }
        private set;
    }
    /*Tab and deatl wrapper*/    
    class RecordTypeDetail
    {
        public string recordTypeName{get;set;}
        public list<NotesDetail> notesDetails{get;set;}
        public String recordTypeId {get;set;}
        public String oppId {get;set;}
        
        public RecordTypeDetail(String recordTypeName,list<NotesDetail> notesDetails,String recordTypeId)
        {
            this.recordTypeName = recordTypeName;
            this.notesDetails = notesDetails;            
            this.recordTypeId = recordTypeId;
            this.oppId = apexpages.currentpage().getparameters().get('Id');
        }
    }
    /*Note Detail Wrapper*/
    class NotesDetail
    {
        public String latestNoteValues{get;set;}
        public String lastModifiedBy{get;set;}
        public String profileImageUrl{get;set;}
        public DateTime lastModifiedDateTime{get;set;}
        public NotesDetail(string latestNoteValues,string profileImageUrl,DateTime lastModifiedDateTime,String lastModifiedBy)
        {
            this.latestNoteValues = latestNoteValues;
            this.profileImageUrl = profileImageUrl;
            this.lastModifiedDateTime = lastModifiedDateTime;
            this.lastModifiedBy = lastModifiedBy;
        } 
    }    
}





/*if(null != noteMap.get('Approved With Conditions')){
            objRecordTypeDetail.add(new RecordTypeDetail('Approved With Conditions',
            noteMap.get('Approved With Conditions').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Approved With Conditions').LastModifiedById).Name+' <br/> On '+noteMap.get('Approved With Conditions').LastModifieddate,
            MainClass.getAllUsers.get(noteMap.get('Approved With Conditions').LastModifiedById).FullPhotoUrl,noteMap.get('Approved With Conditions').RecordTypeId));
        }else{
            objRecordTypeDetail.add(new RecordTypeDetail('Approved With Conditions','','','',getAllNoteMap.get('Approved With Conditions').Id));
        }
        
        if(null != noteMap.get('Archived Credit Bureau')){
            objRecordTypeDetail.add(new RecordTypeDetail('Archived Credit Bureau',noteMap.get('Archived Credit Bureau').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Archived Credit Bureau').LastModifiedById).Name+' <br/> On '+noteMap.get('Archived Credit Bureau').LastModifieddate,
            MainClass.getAllUsers.get(noteMap.get('Archived Credit Bureau').LastModifiedById).FullPhotoUrl,noteMap.get('Archived Credit Bureau').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Archived Credit Bureau','','','',getAllNoteMap.get('Archived Credit Bureau').Id));
        }
        
        if(null != noteMap.get('Business Bankruptcies')){
            objRecordTypeDetail.add(new RecordTypeDetail('Business Bankruptcies',noteMap.get('Business Bankruptcies').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Business Bankruptcies').LastModifiedById).Name+'<br/> On'+ noteMap.get('Business Bankruptcies').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Business Bankruptcies').LastModifiedById).FullPhotoUrl,noteMap.get('Business Bankruptcies').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Business Bankruptcies','','','',getAllNoteMap.get('Business Bankruptcies').Id));
        }
        
        if(null != noteMap.get('Funding')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Funding',noteMap.get('Funding').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Funding').LastModifiedById).Name+'<br/> On'+ noteMap.get('Funding').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Funding').LastModifiedById).FullPhotoUrl,noteMap.get('Funding').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Funding','','','',getAllNoteMap.get('Funding').Id));
        }
        
        if(null != noteMap.get('Individual Bankrupties')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Individual Bankrupties',noteMap.get('Individual Bankrupties').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Individual Bankrupties').LastModifiedById).Name+'<br/> On'+ noteMap.get('Individual bankrupties').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Individual Bankrupties').LastModifiedById).FullPhotoUrl,noteMap.get('Individual bankrupties').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Individual Bankrupties','','','',getAllNoteMap.get('Individual Bankrupties').Id));
        }
        
        
        if(null != noteMap.get('Internal QC')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Internal QC',noteMap.get('Internal QC').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Internal QC').LastModifiedById).Name+ '<br/> On'+ noteMap.get('Internal QC').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Internal QC').LastModifiedById).FullPhotoUrl,noteMap.get('Internal QC').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Internal QC','','','',getAllNoteMap.get('Internal QC').Id));
        }
        
        if(null != noteMap.get('Internal UnderWriting')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Internal UnderWriting',noteMap.get('Internal UnderWriting').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Internal Underwriting').LastModifiedById).Name+ '<br/ On>'+ noteMap.get('Internal Underwriting').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Internal Underwriting').LastModifiedById).FullPhotoUrl,noteMap.get('Internal Underwriting').RecordTypeId));
        } else{
            //objrecordTypeDetail.add(new RecordTypeDetail('Internal Underwriting','','','',getAllNoteMap.get('Internal Underwriting').Id));
        }
        
        if(null != noteMap.get('Pre Qual')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Pre Qual',noteMap.get('Pre Qual').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Pre Qual').LastModifiedById).Name+'<br/> On'+ noteMap.get('Pre Qual').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Pre Qual').LastModifiedById).FullPhotoUrl,noteMap.get('Pre Qual').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Pre Qual','','','',getAllNoteMap.get('Pre Qual').Id));
        }
        
        if(null != noteMap.get('Pre Qual Loss')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Pre Qual Loss',noteMap.get('Pre Qual Loss').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Pre Qual Loss').LastModifiedById).Name+'<br/> On'+ noteMap.get('Pre Qual Loss').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Pre Qual Loss').LastModifiedById).FullPhotoUrl,noteMap.get('Pre Qual Loss').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Pre Qual Loss','','','',getAllNoteMap.get('Pre Qual Loss').Id));
        }
        
        if(null != noteMap.get('Prefunding Call')){
             objRecordTypeDetail.add(new RecordTypeDetail('Prefunding Call',noteMap.get('Prefunding Call').Note_Content__c,
              MainClass.getAllUsers.get(noteMap.get('Prefunding call').LastModifiedById).Name+'<br/ On>'+ noteMap.get('Prefunding Call').LastModifiedDate ,
             MainClass.getAllUsers.get(noteMap.get('Prefunding call').LastModifiedById).FullPhotoUrl,noteMap.get('Prefunding Call').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Prefunding Call','','','',getAllNoteMap.get('Prefunding Call').Id));
        }
        
        if(null != noteMap.get('Processing')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Processing',noteMap.get('Processing').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Processing').LastModifiedById).Name+'<br/> On'+ noteMap.get('Processing').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Processing').LastModifiedById).FullPhotoUrl,noteMap.get('Processing').RecordTypeId));
        } else{
            objrecordTypeDetail.add(new RecordTypeDetail('Processing','','','',getAllNoteMap.get('Processing').Id));
        }
        
        if(null != noteMap.get('Quancor')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Quancor',noteMap.get('Quancor').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Quancor').LastModifiedById).Name+'<br/> On'+noteMap.get('Quancor').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Quancor').LastModifiedById).FullPhotoUrl,noteMap.get('Quancor').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Quancor','','','',getAllNoteMap.get('Quancor').Id));
        }
        
        if(null != noteMap.get('Renewal')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Renewal',noteMap.get('Renewal').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Renewal').LastModifiedById).Name +'<br/> On'+ noteMap.get('Renewal').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Renewal').LastModifiedById).FullPhotoUrl,noteMap.get('Renewal').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Renewal','','','',getAllNoteMap.get('Renewal').Id));
        }
        
        if(null != noteMap.get('Risk Alert')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Risk Alert',noteMap.get('Risk Alert').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Risk Alert').LastModifiedById).Name+'<br/> On'+noteMap.get('Risk Alert').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Risk Alert').LastModifiedById).FullPhotoUrl,noteMap.get('Risk Alert').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Risk Alert','','','',getAllNoteMap.get('Risk Alert').Id));
        }
        
        if(null != noteMap.get('Risk Notes')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Risk Notes',noteMap.get('Risk Notes').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Risk Notes').LastModifiedById).Name+'<br/> On'+ noteMap.get('Risk Notes').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Risk Notes').LastModifiedById).FullPhotoUrl,getAllNoteMap.get('Risk Notes').Id));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Risk Notes','','','',getAllNoteMap.get('Risk Notes').Id));
        }
        
        if(null != noteMap.get('SA Internal')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('SA Internal',noteMap.get('SA Internal').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('SA Internal').LastModifiedById).Name+'<br/> On'+ noteMap.get('SA Internal').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('SA Internal').LastModifiedById).FullPhotoUrl,noteMap.get('SA Internal').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('SA Internal','','','',getAllNoteMap.get('SA Internal').Id));
        }
        
        if(null != noteMap.get('Sales Check List')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Sales Check List',noteMap.get('Sales Check List').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Sales Check List').LastModifiedById).Name+'<br/> On'+ noteMap.get('Sales Check List').LastModifiedDate ,
            MainClass.getAllUsers.get(noteMap.get('Sales Check List').LastModifiedById).FullPhotoUrl,noteMap.get('Sales Check List').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Sales Check List','','','',getAllNoteMap.get('Sales Check List').Id));
        }
        
        if(null != noteMap.get('Sales to UW Processing')){
             objRecordTypeDetail.add(new RecordTypeDetail('Sales to UW Processing',noteMap.get('Sales to UW Processing').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('Sales to UW Processing').LastModifiedById).Name+'<br/> On'+noteMap.get('Sales to UW Processing').LastModifiedDate,
             MainClass.getAllUsers.get(noteMap.get('Sales to UW Processing').LastModifiedById).FullPhotoUrl,noteMap.get('Sales to UW Processing').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Sales to UW Processing','','','',getAllNoteMap.get('Sales to UW Processing').Id));
        }
        
        if(null != noteMap.get('Site')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Site',noteMap.get('Site').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Site').LastModifiedById).Name+'<br/> On'+ noteMap.get('Site').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Site').LastModifiedById).FullPhotoUrl,noteMap.get('Site').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Site','','','',getAllNoteMap.get('Site').Id));
        }
        
        if(null != noteMap.get('Split change')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Split change',noteMap.get('Split change').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Split change').LastModifiedById).Name+'<br/> On'+ noteMap.get('Split change').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Split change').LastModifiedById).FullPhotoUrl,noteMap.get('Split change').RecordTypeId));
        } else{
            //objRecordTypeDetail.add(new RecordTypeDetail('Split Change','','','',getAllNoteMap.get('Split Change').Id));
        }
        
        if(null != noteMap.get('Underwriting')){ 
            objRecordTypeDetail.add(new RecordTypeDetail('Underwriting',noteMap.get('Underwriting').Note_Content__c,
            MainClass.getAllUsers.get(noteMap.get('Underwriting').LastModifiedById).Name+'<br/> On'+noteMap.get('Underwriting').LastModifiedDate,
            MainClass.getAllUsers.get(noteMap.get('Underwriting').LastModifiedById).FullPhotoUrl,noteMap.get('Underwriting').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('Underwriting','','','',getAllNoteMap.get('Underwriting').Id));  
        }
        
        if(null != noteMap.get('UW Processing')){
             objRecordTypeDetail.add(new RecordTypeDetail('UW Processing',noteMap.get('UW Processing').Note_Content__c,
             MainClass.getAllUsers.get(noteMap.get('UW Processing').LastModifiedById).Name+'<br/> On'+ noteMap.get('UW Processing').LastModifieddate,
             MainClass.getAllUsers.get(noteMap.get('UW Processing').LastModifiedById).FullPhotoUrl,noteMap.get('UW Processing').RecordTypeId));
        } else{
            objRecordTypeDetail.add(new RecordTypeDetail('UW Processing','','','',getAllNoteMap.get('UW Processing').Id)); 
        }*/