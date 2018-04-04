@isTest
public class TestOppr_Document_Ctrl
{
    @testsetup static void setup()
    {
        Account acc = new Account();
        acc.name = 'testcase';
        insert acc;
        
        Campaign cp = new Campaign();
        cp.name = 'cppname';
        insert cp;
        
        Opportunity opp = new Opportunity();
        opp.name = 'oppname';
        opp.accountid = acc.id;
        opp.ForecastCategoryName = 'Commit';
        opp.LeadSource = 'A001';
        opp.Campaignid = cp.id;
        opp.CloseDate = system.today();
        opp.Current_Processor__c = '1st federal financial';
        opp.StageName = 'closed';
        insert opp;
        
        Oppr_Document__c od = New Oppr_Document__c();
        od.Opportunity__c = opp.Id;
        od.Status__c = 'Received';
        od.Description__c = 'Test Desc';
        od.Document_Name__c = 'Test Doc';
        od.RequiredDoc__c = true;
        od.Additional_Notes__c = 'Additional Notes';
        insert od;
        
    }
   
     static testMethod void unitTest1()
     {   
         Test.startTest();
        // DS-CONAM CALC.apexTesting();     
        Opportunity opp=[select
                                id,External_ID__c
                            from
                                Opportunity
                            where 
                                 name='oppname' Limit 1];
                                 
        Oppr_Document__c od=[select
                                    id
                            from
                                    Oppr_Document__c 
                            where 
                                     Opportunity__c =:opp.id Limit 1];
        
         
        ApexPages.currentPage().getParameters().put('retURL','oppId='+opp.Id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        

        Oppr_Document_Ctrl Odc = new Oppr_Document_Ctrl(sc);
        Odc.genDynamicQuery(od.Id);
        System.debug(Odc);
        Odc.Save();
        Odc.Cancel();
        ApexPages.currentPage().getParameters().put('id',od.id);
        Oppr_Document_Ctrl Odc1 = new Oppr_Document_Ctrl(sc);
        Odc1.genDynamicQuery(null);
        Test.StopTest();
    
     }
     static testMethod void unitTest2()
     {   
        Test.startTest();  
        Opportunity opp=[select
                                id,External_ID__c
                            from
                                Opportunity
                            where 
                                 name='oppname' Limit 1];
                                 
        Oppr_Document__c od=[select
                                    id
                            from
                                    Oppr_Document__c 
                            where 
                                     Opportunity__c =:opp.id Limit 1];
        
         
        ApexPages.currentPage().getParameters().put('retURL','oppId='+opp.Id);
        ApexPages.currentPage().getParameters().put('Id',opp.id);
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        

        Oppr_Document_Ctrl Odc = new Oppr_Document_Ctrl(sc);
        Odc.genDynamicQuery(null);
        Odc.Save();

       
        Test.StopTest();
    
     }
 
}