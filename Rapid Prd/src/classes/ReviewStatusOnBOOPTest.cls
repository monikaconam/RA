@isTest
public class ReviewStatusOnBOOPTest
{
    @isTest
    public static void ReviewStatus()
    {
        Test.startTest();
        
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
        
        b.Renewal_Number__c = 34;
        update b;
        
        BOOP__c b1 = new BOOP__c();
        b1.Status__c = 'New';
        b1.Marble__c = m.Id;
        b1.Review_Status__c = true;
        
        insert b1;
        
        b1.Partner_Email_Address__c = 'test@gmail.com';
        update b1;
        
        Test.stopTest();
        
    }
}