@isTest
Public class ReviewBoopStatusAlertTest
{
    @isTest
    public static void reviewMsgAlert()
    {
        Marble__c m = new Marble__c();
        m.Home_Based__c = 'Yes';
        m.Where_Did_You_Find_This_Client__c = 'Renewal';
        m.Name = 'abc';
        m.BOOP_Status__c = 'New';
        insert m;    
        
        BOOP__c b = new BOOP__c();
        b.Status__c = 'New';
        b.Marble__c = m.Id;
        b.Review_Status__c = true;
        insert b;
        
        Test.startTest();
        
        PageReference pageRef = Page.BoopStatusReview; 
        pageRef.getParameters().put('id', String.valueOf(b.Id));
        Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(b);
        ReviewBoopStatusAlert boopStatus = new ReviewBoopStatusAlert(sc);
        
        boopStatus.onLoad();
        
        Test.stopTest();
    }
    
    
}