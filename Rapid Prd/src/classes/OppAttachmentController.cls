public class OppAttachmentController 
{

    public Attachment oppAttachment{get; set;} 
    public Opportunity oppRecord{get; set;}
    String cancelURL;
    
    public OppAttachmentController()
    {
        oppAttachment = new Attachment();  
        String oppId = ApexPages.currentPage().getParameters().get('oppid'); 
        cancelURL = ApexPages.currentPage().getParameters().get('retURL');  
        
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
      
    }
    
    public PageReference save()
    {
        if(!validateFields())
        {
            if(oppRecord != null && oppAttachment!= null) 
            {
                oppAttachment.ParentId =  oppRecord.Id;
                try
                {
                    if(oppAttachment.Id != null)
                    {
                         ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm,'Attachment Uploaded Successfully'));
                    }
                    insert oppAttachment;  
                }
                catch(Exception e)
                {
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'There was some problem - '+e.getMessage()+' at line '+e.getLineNumber()));
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
        if(oppAttachment != null) 
        {
            if(oppAttachment.Body == NULL)
            {
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please specify a file to upload. Type in the path to the file, or use the "Browse" button to locate it in your local filesystem.'));
                return true;
            }
        }
        return false;
    }
    
}