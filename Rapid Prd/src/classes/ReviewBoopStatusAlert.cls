public class ReviewBoopStatusAlert {

    public Id currentId = ApexPages.currentPage().getParameters().get('id');
    public BOOP__c boopRecord = [Select Id,Review_Status__c from BOOP__c where Id =: currentId];
    
    public ReviewBoopStatusAlert(ApexPages.StandardController controller)
    {

        if(boopRecord.Review_Status__c)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'Please Review the Status'));
        }
     }
    public void onLoad()
    {
        boopRecord.Review_Status__c = false;
        update boopRecord;
    }
}