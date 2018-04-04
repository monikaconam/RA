@isTest

public with sharing class TestRADoc_Ctrl 
{
    @testSetup static voId setup()
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.Id;
        insert opp;
        
        Quote Quo = new Quote();
        Quo.Name = 'Test';
        Quo.OpportunityId = opp.Id;
        insert Quo;

    }
    
    static TestMethod voId testMethod1()
    {
        test.startTest(); 
        
        // DS-CONAM CALC.apexTesting();        
        Opportunity opp=[SELECT
                                Id
                        FROM    
                                Opportunity
                        WHERE
                                name='testOpportunity' LIMIT 1];
                
        PageReference ref = new PageReference('/apex/RADoc_Custom'); 
        Test.setCurrentPage(ref); 
        ApexPages.currentPage().getParameters().put('retURL','oppId='+opp.Id);
        
        ApexPages.StandardController controller =new ApexPages.StandardController(opp);
        RADoc_Ctrl radocObj1 = new RADoc_Ctrl(controller);
        radocObj1.cancel();
        radocObj1.save();
         
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        RADoc_Ctrl radocObj = new RADoc_Ctrl(controller);
        radocObj.cancel();
        radocObj.save();        

        Test.stopTest();       
    }  
    
     static TestMethod voId testMethod11()
    {
        test.startTest(); 
        
        // DS-CONAM CALC.apexTesting();        
        Opportunity opp=[SELECT
                                Id
                        FROM    
                                Opportunity
                        WHERE
                                name='testOpportunity' LIMIT 1];
                
        PageReference ref = new PageReference('/apex/RADoc_Custom'); 
        Test.setCurrentPage(ref); 
        ApexPages.currentPage().getParameters().put('retURL',opp.Id);
        
        ApexPages.StandardController controller =new ApexPages.StandardController(opp);
        RADoc_Ctrl radocObj1 = new RADoc_Ctrl(controller);
        radocObj1.cancel();
        radocObj1.save();
         
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        RADoc_Ctrl radocObj = new RADoc_Ctrl(controller);
        radocObj.cancel();
        radocObj.save();        

        Test.stopTest();       
    }      

    Static TestMethod voId testMethod2()
    {
        test.startTest(); 
        
        Opportunity opp=[SELECT
                                Id
                        FROM    
                                Opportunity
                        WHERE
                                name='testOpportunity' LIMIT 1];
        Quote Quo=[SELECT
                                Id
                        FROM    
                                Quote 
                        WHERE
                                name='Test' LIMIT 1];
        
       
        PageReference ref = new PageReference('/apex/raDocsRelatedList'); 
        Test.setCurrentPage(ref); 
        ApexPages.currentPage().getParameters().put('Id', Quo.Id ); 
        //ApexPages.currentPage().getParameters().put('retURL', opp.Id + 'oppId='+ opp.Id ); 
        
        ApexPages.StandardController controller =new ApexPages.StandardController(opp);
        RADoc_Ctrl radocObj1 = new RADoc_Ctrl(controller);        
               
        radocObj1.cancel();
        radocObj1.save();
        radocObj1.genDynamicQuery(null);
        Test.stopTest();    
    }
}