@isTest 
private class TestCustomerSurveys_Ctrl {
    static testMethod void CustomerSurveys_UnitTest() {
    
        Test.startTest(); 
        // DS-CONAM Calc.apexTesting();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;
        
        Customer_Survey__c cs = new Customer_Survey__c();
        cs.Name = 'test';
        cs.Account__c = acc.Id;
        cs.Opportunity__c = opp.Id;
        insert cs;
        
        PageReference ref = new PageReference('/apex/CustomerSurveysCustom'); 
        Test.setCurrentPage(ref); 
        
        ApexPages.StandardController std  = new ApexPages.StandardController(cs);
        CustomerSurveys_Ctrl survey1Obj1 = new CustomerSurveys_Ctrl(std);
               
        survey1Obj1.save();
        survey1Obj1.cancel();
        
        ApexPages.CurrentPage().getParameters().put('retURL','oppId='+opp.Id); 
        
       
        CustomerSurveys_Ctrl survey1Obj = new CustomerSurveys_Ctrl(std);
        survey1Obj.save();
        survey1Obj.cancel();
         
        ApexPages.CurrentPage().getParameters().put('Id', cs.Id); 
              
        CustomerSurveys_Ctrl surveyObj = new CustomerSurveys_Ctrl(std);
        surveyObj.save();
        surveyObj.cancel();
      
        Test.stopTest();
    }
    
    static testMethod void CustomerSurveys_UnitTest2() {
    
        Test.startTest(); 
        // DS-CONAM Calc.apexTesting();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;
        
        Customer_Survey__c cs = new Customer_Survey__c();
        cs.Name = 'test';
        cs.Account__c = acc.Id;
        cs.Opportunity__c = opp.Id;
        insert cs;
        
        PageReference ref = new PageReference('/apex/CustomerSurveysCustom'); 
        Test.setCurrentPage(ref); 
        ApexPages.CurrentPage().getParameters().put('Id', cs.Id); 
        delete cs;
        
        ApexPages.StandardController std  = new ApexPages.StandardController(cs);
        CustomerSurveys_Ctrl survey1Obj1 = new CustomerSurveys_Ctrl(std);
      
        Test.stopTest();
    }
    
    
    static testMethod void CustomerSurveys_UnitTest3() {
    
        Test.startTest(); 
        // DS-CONAM Calc.apexTesting();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;
        
        Customer_Survey__c cs = new Customer_Survey__c();
        cs.Name = 'test';
        cs.Account__c = acc.Id;
        cs.Opportunity__c = opp.Id;
        insert cs;
        
        PageReference ref = new PageReference('/apex/CustomerSurveysCustom'); 
        Test.setCurrentPage(ref); 
        
        ApexPages.StandardController std  = new ApexPages.StandardController(cs);
        CustomerSurveys_Ctrl survey1Obj1 = new CustomerSurveys_Ctrl(std);
               
        survey1Obj1.save();
        survey1Obj1.cancel();
        
        ApexPages.CurrentPage().getParameters().put('retURL','oppId='+opp.Id+'&id='+cs.Id); 
        
       
        CustomerSurveys_Ctrl survey1Obj = new CustomerSurveys_Ctrl(std);
        survey1Obj.save();
        survey1Obj.cancel();
         
       Test.stopTest();
    }
    
    static testMethod void CustomerSurveys_UnitTest4() {
    
        Test.startTest(); 
        // DS-CONAM Calc.apexTesting();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;
        
        Customer_Survey__c cs = new Customer_Survey__c();
        cs.Name = 'test';
        cs.Account__c = acc.Id;
        cs.Opportunity__c = opp.Id;
        insert cs;
        
        PageReference ref = new PageReference('/apex/CustomerSurveysCustom'); 
        Test.setCurrentPage(ref); 
        
        ApexPages.StandardController std  = new ApexPages.StandardController(cs);
        CustomerSurveys_Ctrl survey1Obj1 = new CustomerSurveys_Ctrl(std);
               
        survey1Obj1.save();
        survey1Obj1.cancel();
        
        ApexPages.CurrentPage().getParameters().put('retURL','/'+opp.Id); 
        
       
        CustomerSurveys_Ctrl survey1Obj = new CustomerSurveys_Ctrl(std);
        survey1Obj.save();
        survey1Obj.cancel();
        Test.stopTest();
    }
    
    
}