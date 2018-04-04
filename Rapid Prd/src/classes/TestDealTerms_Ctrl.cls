@isTest 

private class TestDealTerms_Ctrl 
{
    public static testMethod void dealTerms_UnitTest() 
    {       
        Test.startTest(); 
        
        // DS-CONAM CALC.apexTesting();
        Account testAccount = new Account(name ='Test Account1',BusinessType__c ='testBusiness');
        insert testAccount;  
        System.Assert(testAccount.Id != null, 'The Test Account did not insert properly, please check validation rules and other mechanisms');           
        
        Campaign  cmObj = new Campaign(Name = 'Test',Type='Internet');
        insert cmObj;
        
        Opportunity opp = new Opportunity(Name = 'testOpportunity',LeadSource = 'web',StageName = 'Prospecting',Current_Processor__c = 'Abanco INTERNATIONAL', CloseDate = System.today() +50,AccountId = testAccount.id,CampaignId = cmObj.Id);
        insert opp;
        
        Opportunity opp1 = new Opportunity(Name = 'testOpportunity1',LeadSource = 'Facebook',StageName = 'Prospecting',Current_Processor__c = 'Abanco INTERNATIONAL1', CloseDate = System.today() +25,AccountId = testAccount.id,CampaignId = cmObj.Id);
        insert opp1;
        
        Sales_Check_List__c scl = new Sales_Check_List__c(name = 'TestSales',Opportunity__c =opp.id);
        insert scl;
        
        PageReference pTemp = Page.DealTermsPage;
        Test.setCurrentPage(pTemp);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
          
        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.currentPage().getParameters().put('opp1Id', opp1.Id);
        
        DealTerms_Ctrl dealObj = new DealTerms_Ctrl();
        dealObj.doSave();        
        try
        {
            if(opp.Id ==Null)
            {
                return ;
            }
        }
        
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }        
        Test.stopTest();     
    }
    
    public static testMethod void dealTerms_UnitTest1() 
    {       
        Test.startTest(); 
        
        // DS-CONAM CALC.apexTesting();
        Account testAccount = new Account(name ='Test Account1',BusinessType__c ='testBusiness');
        insert testAccount;  
        testAccount.Name ='TestUpdate';
        update testAccount;
        
        System.Assert(testAccount.Id != null, 'The Test Account did not insert properly, please check validation rules and other mechanisms');           
        
        Campaign  cmObj = new Campaign(Name = 'Test', Type='Internet');
        insert cmObj;       

        Opportunity opp = new Opportunity(Name = 'testOpportunity',LeadSource = 'web',StageName = 'Prospecting',Current_Processor__c = 'Abanco INTERNATIONAL', CloseDate = System.today() +50,AccountId = testAccount.id,CampaignId = cmObj.Id);
        insert opp;
        
        Opportunity opp1 = new Opportunity(Name = 'testOpportunity1',LeadSource = 'Facebook',StageName = 'Prospecting',Current_Processor__c = 'Abanco INTERNATIONAL1', CloseDate = System.today() +25,AccountId = testAccount.id,CampaignId = cmObj.Id);
        insert opp1;
        
        
        
        PageReference pTemp = Page.DealTermsPage;
        Test.setCurrentPage(pTemp);        
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);          
        ApexPages.currentPage().getParameters().put('', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        ApexPages.currentPage().getParameters().put('opp1Id', opp1.Id);
               
        DealTerms_Ctrl dealObj = new DealTerms_Ctrl();  
              
        dealObj.doSave();        
        try
        {
            if(opp.Id !=Null)
            {
                return ;
            }
        }        
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
        
        
        
        Test.stopTest();     
    }
}