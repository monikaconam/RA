@isTest 
private class TestSiteSurveys_Ctrl
{
    @testSetup static void setup()
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
        opp.AccountId = acc.id;
        insert opp; 
        
        Site_Survey__c siteObj = new  Site_Survey__c();
        siteObj.Name = 'TestSite';
        siteObj.Site_Survey_Type__c = 'Merchant Site 72';
        siteObj.Opportunity__c = opp.Id;
        insert  siteObj;
    }    
    static testMethod void unitTest1() 
    {
        Test.startTest();        
        Opportunity opp=[SELECT
                                Id
                            FROM
                                Opportunity
                            WHERE
                                Name='testOpportunity' LIMIT 1];
     
        Site_Survey__c siteObj = [SELECT 
                                        Id
                                    FROM
                                        Site_Survey__c 
                                    WHERE
                                        Name='TestSite' LIMIT 1];        
        PageReference p=Page.SiteSurveysCustom;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('Id', siteObj.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.StandardController siteController = new ApexPages.standardController(siteObj);
        SiteSurveys_Ctrl siteS = new SiteSurveys_Ctrl(siteController);
       
        siteS.Save();
        siteS.cancel();        
        Test.stopTest();
    }
    
    static testMethod void unitTest2() 
    {
        Test.startTest(); 
        
        Opportunity opp=[SELECT
                                Id
                            FROM
                                Opportunity
                            WHERE
                                Name='testOpportunity' LIMIT 1];
     
        Site_Survey__c siteObj = [SELECT 
                                        Id
                                    FROM
                                        Site_Survey__c 
                                    WHERE
                                        Name='TestSite' LIMIT 1];

        PageReference p=Page.SiteSurveysCustom;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('Id', NULL);
        ApexPages.currentPage().getParameters().put('retURL', '/apex/SiteSurveysCustom?id='+siteObj.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.StandardController siteController = new ApexPages.standardController(siteObj);
        SiteSurveys_Ctrl siteS = new SiteSurveys_Ctrl(siteController);
       
        siteS.Save();
        siteS.cancel();
        
        Test.stopTest();
    }
    
     static testMethod void unitTest3() 
     {
        Test.startTest(); 
        // DS-CONAM CALC.apexTesting();
        Opportunity opp=[SELECT
                                Id
                            FROM
                                Opportunity
                            WHERE
                                Name='testOpportunity' LIMIT 1];
     
        Site_Survey__c siteObj = [SELECT 
                                        Id
                                    FROM
                                        Site_Survey__c 
                                    WHERE
                                        Name='TestSite' LIMIT 1];
        
        PageReference p=Page.SiteSurveysCustom;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('Id', NULL);
        ApexPages.currentPage().getParameters().put('retURL', '/apex/SiteSurveysCustom?id='+siteObj.Id+'&oppId='+opp.id);
        ApexPages.StandardController siteController = new ApexPages.standardController(siteObj);
        SiteSurveys_Ctrl siteS = new SiteSurveys_Ctrl(siteController);
       
        siteS.Save();
        siteS.cancel();        
        Test.stopTest();
    }   
    
    static testMethod void unitTest4() 
    {
        Test.startTest(); 
        Opportunity opp=[SELECT
                                Id
                            FROM
                                Opportunity
                            WHERE
                                Name='testOpportunity' LIMIT 1];
     
        Site_Survey__c siteObj = [SELECT 
                                        Id
                                    FROM
                                        Site_Survey__c 
                                    WHERE
                                        Name='TestSite' LIMIT 1];      
        
        PageReference p=Page.SiteSurveysCustom;
        Test.setCurrentPage(p);
        
        ApexPages.currentPage().getParameters().put('', siteObj.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.StandardController siteController = new ApexPages.standardController(siteObj);
        SiteSurveys_Ctrl siteS = new SiteSurveys_Ctrl(siteController);
               
        siteS.Save();
        siteS.cancel();   
        siteS.genDynamicQuery(Null);
        Test.stopTest();
    }   
}