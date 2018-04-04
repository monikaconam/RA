@isTest

private class TestRiskAlert 
{

   static testMethod void testRiskAlert() 
   {  
      Test.startTest();
      User_Lookup__c test1 = new User_Lookup__c(Name = 'test1', Email__c = 'test@test.com');
      insert test1;
      User_Lookup__c test2 = new User_Lookup__c(Name = 'test2', Email__c = 'test2@test.com');
      insert test2;
      
      Opportunity o = new Opportunity();
      o.Name = 'Test Opp';
      o.CloseDate = Date.today();
      o.stageName='Prospecting';
      Database.SaveResult sr = Database.insert(o);
      
      String oppId = sr.GetId();
      o.Processing_Representative__c = 'test1';
      o.Risk_Employee__c = 'test2';
      update o;
      
      Opportunity[] o_query = [SELECT 
                                      Id,Send_Risk_Alert__c 
                                  FROM 
                                      Opportunity 
                                  WHERE 
                                      Id=: oppId];
      Test.stopTest();
   }
}