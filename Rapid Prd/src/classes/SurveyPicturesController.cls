public with sharing class SurveyPicturesController {

    public Map<Id,String> attachmentUrlList {get;set;}  
    public Integer noOfImages{get;set;}
    public String siteSurvey{get;set;}
     
    public SurveyPicturesController()
    {
        try{
            noOfImages = 0;
            for(Site_Survey__c sTemp :[Select Id, Name, (Select Id, IsDeleted, SystemModstamp From Attachments)
                               From Site_Survey__c s where Id =: ApexPages.currentPage().getParameters().get('Id')])
             {
                siteSurvey = sTemp.Name;
                if(!sTemp.Attachments.isEmpty())
                {
                    attachmentUrlList = new Map<Id,String>();
                    for(Attachment na: sTemp.Attachments)
                    {
                        System.debug('na....'+na.Id);
                        attachmentUrlList.put(na.Id,'/servlet/servlet.FileDownload?file=' + na.Id);
                    }
                }
            }
            noOfImages = attachmentUrlList.size();
        }
        catch(Exception ex)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please contact your Administrator!'));
        } 
    }

}