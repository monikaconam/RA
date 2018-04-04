public class AttachmentEditExt{
    
    public Attachment oppAttachment{get; set;} 
    public Opportunity oppRecord{get; set;}
    public String fileSize{get; private set;}
    String cancelURL;
    
    
    public AttachmentEditExt(ApexPages.StandardController std){
        String attId = ApexPages.currentPage().getParameters().get('id');   
        cancelURL = ApexPages.currentPage().getParameters().get('retURL');  
        
        if(attId != null && attId.trim() != ''){  
            List<Attachment> attList = [Select a.Id,a.Name, a.IsPrivate, a.Description, a.BodyLength From Attachment a where a.Id=:attId limit 1];
            
            if(!attList.isEmpty()){
                oppAttachment = attList.get(0); 
                if(oppAttachment.BodyLength >= (1024*1024)) {fileSize = oppAttachment.BodyLength/(1024*1024) + ' MBytes'; }
                if(oppAttachment.BodyLength >= (1024)) {fileSize = oppAttachment.BodyLength/(1024) +  ' KBytes';}
                 else {
                    fileSize =  oppAttachment.BodyLength + ' bytes';
                }
            }
        }  
    }
    
    public PageReference save(){
        if(!validateFields()){
            if(oppAttachment!= null) {
              
                update oppAttachment;
                  
                if(oppAttachment.Id != null) {
                    if(cancelURL != null && cancelURL.trim() != '') { return new PageReference(cancelURL); }     
                }
            }
        }
        return null;
    }
    
    public PageReference cancel() {
        if(cancelURL != null && cancelURL.trim() != '') { return new PageReference(cancelURL); }
        return null;
    }
    
    public Boolean validateFields() {
        if(oppAttachment != null) {
            if(oppAttachment.Name == NULL || oppAttachment.Name.trim() == ''){ ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Enter File Name')); return true;
            }
        }
        return false;
    }
    
    
}