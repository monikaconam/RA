public class OppNoteController 
{

    public Note oppNote{get; set;} 
    public Opportunity oppRecord{get; set;}
    String cancelURL;
    public OppNoteController()
    {
        oppNote = new Note();  
        String oppId = ApexPages.currentPage().getParameters().get('oppId'); 
        cancelURL = ApexPages.currentPage().getParameters().get('retURL');  
        String noteId =  ApexPages.currentPage().getParameters().get('Id'); 
        
        if(oppId != null && oppId.trim() != '')
        {
            List<Opportunity> oppList = [SELECT 
                                                Id, Name 
                                            FROM 
                                                Opportunity 
                                            WHERE 
                                                Id =:oppId 
                                            LIMIT 1];
            if (!oppList.isEmpty())
            {
                oppRecord = oppList.get(0); 
            }
        } 
        
        if(noteId != null && noteId.trim() != '')
        {
            List<Note> noteList =  [SELECT
                                        n.Title, n.ParentId, n.IsPrivate, n.Body 
                                    FROM 
                                        Note n 
                                    WHERE 
                                        n.Id = :noteId 
                                    Limit 1];   
            if(!noteList.isEmpty())
            {
                oppNote = noteList.get(0);    
            }
            
        }
      
    }
    
    public PageReference save()
    {
        if(!validateFields())
        {
            if(oppRecord != null && oppNote!= null) 
            {
                if(oppNote.ParentId == null)
                
                    oppNote.ParentId =  oppRecord.Id;               
                    upsert oppNote;  
                
                if(cancelURL != null && cancelURL.trim() != '') 
                 {
                     return new PageReference(cancelURL);
                 }
            }
        }
        return null;
    }
    
    public PageReference cancel() 
    {
        if(cancelURL != null && cancelURL.trim() != '') 
        {
             return new PageReference(cancelURL);
        }
        return null;
    }
    
    public Boolean validateFields() 
    {
        if(oppNote != null) 
        {
            if(oppNote.Title == NULL || oppNote.Title.trim() == '')
            {
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Enter Note Title.'));
                return true;
            }
        }
        return false;
    }
    
}