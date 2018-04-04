@isTest

public class TestOpportunityDetail
{
   
    @testSetup  static void setup()
    {
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test';
        cmObj.Type='Internet';
        insert cmObj;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cmObj.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = testAccount.id;
        insert opp;
    
    }
    static void EditTest()
    {
        OpportunityDetail Od= new OpportunityDetail();
        Od.btnText='Edit';
        Od.isVisible = false;
        Od.onEdit();
        Od.btntext='notEdit';
        Od.onEdit();
    }
    
    static void  canceltest()
    {
         OpportunityDetail Od= new OpportunityDetail();
         Od.btnText='Edit';
         Od.isVisible = false;
         Od.onEdit11();
         Od.onCancel();
    }
    
    static  testMethod void OpportunityDetailtest()
    {        
       Test.startTest();
        
        Opportunity opp =new Opportunity();
        PageReference newPage=Page.OpportunityDetail;
        Test.setCurrentPage(newPage);
        
        ApexPages.CurrentPage().getParameters().put('Id',null);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OpportunityDetail od1 = new OpportunityDetail(sc);
        
        try
        {
            OpportunityDetail Od= new OpportunityDetail();        
        }
        catch(Exception ex)   
        {   
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred');    
            ApexPages.addMessage(msg);  
        }      
        
        opp=[select
                    id
            from
                    Opportunity
            where 
                    name='testOpportunity' Limit 1];
        
        ApexPages.CurrentPage().getParameters().put('Id',opp.id);
        sc = new ApexPages.standardController(opp);
        od1 = new OpportunityDetail(sc); 

        try
        {
            OpportunityDetail od= new OpportunityDetail();     
            String sTemp =od.EstimatedDailyTransactions;        
        }
        catch(Exception ex)   
        {   
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred');    
            ApexPages.addMessage(msg);  
        }       
        
        EditTest();
        canceltest();
        Test.stopTest();
     }
    
    static testMethod void OpportunityDetailtest1()
    {        
        Test.startTest();
        
        Campaign cmObj=[select
                                id
                        from
                                Campaign 
                        where 
                                name='test' Limit 1];
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cmObj.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        insert opp;
                
        PageReference newPage=Page.OpportunityDetail;
        Test.setCurrentPage(newPage);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OpportunityDetail od1 = new OpportunityDetail(sc); 
        ApexPages.currentPage().getParameters().put('id',opp.id);
       
        EditTest();
        canceltest();
        Test.stopTest();
    }    
    
}