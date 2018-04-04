@isTest
private class TestUpdateOpportunityOwner  {

    static testMethod void myUnitTest() { 
       
       User u=[select id from user where profile.name ='System Administrator' and isactive=true Limit 1];
    
        CALC.ApexTesting();   
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet',default_opportunity_owner__C=u.id);
        insert cTest;
         
         
      Profile p = [SELECT Id FROM Profile WHERE Name='system administrator']; 
      User uNew = new User(Alias = 'standt', Email='standarduser@ra.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id, 
      TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@ra.com');

      System.runAs(uNew ) {

      
        Opportunity opp=new Opportunity();
        opp.name='testopp';
        opp.StageName = 'Open';
        opp.CloseDate = Date.today();
        opp.Submit_to_UW_Processing__c=System.now();
        opp.Product__c='Loan';
        opp.Percent_Paid_Off__c=55;
        opp.State_Of_Location__c='CT';    
        opp.CampaignId=ctest.id;
        insert opp;
      }
        
        
          

       

    }
}