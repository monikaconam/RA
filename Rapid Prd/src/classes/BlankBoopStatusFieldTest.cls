@isTest
public class BlankBoopStatusFieldTest
{
    @isTest
    public static void BoopStatusNull()
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
        insert b;
        
        delete b;
        
        Test.stopTest();
    } 
        
        
}