@isTest
public class updateMarbleCheckboxOnOppTest
{
    @isTest
    public static void updateMarbleCheckbox()
    {
        Test.startTest();
        
        opportunity opp=new opportunity ();
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Name = 'Test Opportunity';
        opp.LeadSource = 'Radio';
        opp.ForecastCategoryName = 'Pipeline';
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
        
        delete m;
        
        Test.stopTest();
     } 
        
        
}