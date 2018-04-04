@isTest
public class sendEmailToCampaignContactTest
{
    @isTest
    public static void sendEmail()
    {
        
        Test.startTest();
        
        Campaign cp = new Campaign(Name = 'abc',Type = 'Internet',Campaign_Contact_Email__c ='test@gmail.com',IsActive=true);
        insert cp;
        
        Campaign campRecord =[select id,Name from Campaign where id =: cp.id];
        System.assertEquals(campRecord.Name, 'abc');

        opportunity opp=new opportunity ();
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Name = 'Test Opportunity';
        opp.LeadSource = 'Radio';
        opp.ForecastCategoryName = 'Pipeline';
        opp.CampaignId = cp.Id;
        insert opp;
        
        Opportunity oppRecord =[select id,Name from Opportunity where id =: opp.id];
        System.assertEquals(oppRecord.Name, 'Test Opportunity');
        
        Marble__c m = new Marble__c();
        m.Home_Based__c = 'Yes';
        m.Where_Did_You_Find_This_Client__c = 'Renewal';
        m.Name = 'abc';
        m.BOOP_Status__c = 'New';
        m.Opportunity_Reference__c = opp.Id;
        insert m;
        
        Marble__c marbleRecord =[select id,Name from Marble__c where id =:m.id];
        System.assertEquals(marbleRecord.Name, 'abc');
        
        BOOP__c b = new BOOP__c();
        b.Status__c = 'New';
        b.Marble__c = m.Id;
        b.Review_Status__c = true;
        insert b;
        
        BOOP__c boopRecord = [Select Id,Status__c from BOOP__c where Id =: b.Id];
        system.assertEquals(b.Status__c, 'New');
        
        b.Status__c = 'Submitted';
        update b;
        
        BOOP__c bbRecord = [Select Id,Status__c from BOOP__c where Id =: b.Id];
        system.assertEquals(b.Status__c, 'Submitted');
        
        Test.stopTest();
    }
}