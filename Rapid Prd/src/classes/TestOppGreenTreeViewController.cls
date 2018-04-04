@istest
public class TestOppGreenTreeViewController
{
    public static testMethod void unitTest()
    {        
        Test.startTest();
        
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        opp.Renewal_Funded_Amount__c = 1000;
        insert opp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=opp.id;
        gt.Amount__c= 20000;
        gt.Amount_Sold__c= 1000;
        insert gt;
        
        gt.Amount__c= 10000;
        gt.Amount_Sold__c= 1000;
        Update gt;
        
       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController (sc);
        nc.edit();
        nc.onSave();       
        nc.onCancel();
      
        apexpages.currentpage().getparameters().put('Id',opp.id);
        Test.stopTest();
    }
    
    public static testMethod void unitTest1()
    {  
        Test.startTest();        
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
        
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.Renewal_Funded_Amount__c = 1000;
        opp.StageName='closed';  
                              
            
        PageReference p = page.GreenTreeInfoDisplay;
        Test.setCurrentPage(p); 
        ApexPages.currentPage().getParameters().put('Id', opp.Id);       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController(sc);
        nc.edit();
        nc.onSave();       
       
        Test.stopTest();
    }
     public static testMethod void unitTest2()
    {        
        Test.startTest();
        
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        opp.Renewal_Funded_Amount__c = 1000;
        insert opp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=opp.id;
        gt.Amount__c= 20000;
        gt.Amount_Sold__c= 1000;
        insert gt;
        
        gt.Amount__c= 10000;
        gt.Amount_Sold__c= 1000;
        Update gt;
        
       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController (sc);
        nc.edit();
        nc.onSave();       
        nc.onCancel();
      
        apexpages.currentpage().getparameters().put('Id',opp.id);
        Test.stopTest();
    }
    public static testMethod void unitTest3()
    {        
        Test.startTest();
        
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        opp.Renewal_Funded_Amount__c = 1000;
        insert opp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=opp.id;
        gt.Amount__c= 20000;
        gt.Amount_Sold__c= 1000;
        insert gt;
        
        gt.Amount__c= 10000;
        gt.Amount_Sold__c= 1000;
        Update gt;
        
       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController (sc);
        nc.edit();
        nc.onSave();       
        nc.onCancel();
      
        apexpages.currentpage().getparameters().put('Id',opp.id);
        Test.stopTest();
    }
    public static testMethod void unitTest4()
    {        
        Test.startTest();
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        opp.Renewal_Funded_Amount__c = 1000;
        insert opp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=opp.id;
        gt.Amount__c= 20000;
        gt.Amount_Sold__c= 1000;
        insert gt;
        
        gt.Amount__c= 10000;
        gt.Amount_Sold__c= 1000;
        Update gt;
        
       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController (sc);
        nc.edit();
        nc.onSave();       
        nc.onCancel();
      
        apexpages.currentpage().getparameters().put('Id',opp.id);
        Test.stopTest();
    }
    public static testMethod void unitTest5()
    {        
        Test.startTest();
        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountid=ac.id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.Campaignid=cp.id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        opp.Renewal_Funded_Amount__c = 1000;
        insert opp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=opp.id;
        gt.Amount__c= 20000;
        gt.Amount_Sold__c= 1000;
        insert gt;
        
        gt.Amount__c= 10000;
        gt.Amount_Sold__c= 1000;
        Update gt;
        
       
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        OppGreenTreeViewController nc= new OppGreenTreeViewController (sc);
        nc.edit();
        nc.onSave();       
        nc.onCancel();
      
        apexpages.currentpage().getparameters().put('Id',opp.id);
        Test.stopTest();
    }
}