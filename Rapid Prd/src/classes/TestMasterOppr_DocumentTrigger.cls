@isTest
public class TestMasterOppr_DocumentTrigger
{   
     static testMethod void unitTestOppr_Document()
     {   
        test.startTest();
        //CALC.apexTesting();       
        
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
         
        ApexPages.currentPage().getParameters().put('id',od.id);
        test.StopTest();    
     }
    
     static testMethod void unitTestOppr_Document1()
     {   
        test.startTest();
        //CALC.apexTesting();   
         
        Account acc = new Account();
        acc.name = 'testcase';
        Acc.BusinessType__c = 'testBusiness';
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
        opp.status__c ='Reviewing Documents';
        opp.StageName = 'closed';
        insert opp;
        System.assertNotEquals(null, opp.Id);
        
        Oppr_Document__c od = New Oppr_Document__c();
        od.Opportunity__c = opp.Id;
        od.Status__c = 'Requested';
        od.Description__c = 'Test Desc';
        od.Document_Name__c = 'Test Doc';
        od.RequiredDoc__c = true;
        od.Additional_Notes__c = 'Additional Notes';
        insert od;
        update od;
       // System.assert(![SELECT Id FROM Oppr_Document__c WHERE Opportunity__r.status__c= :opp.Id].isEmpty());         
        
        List<Opportunity> opp1 = new List<Opportunity>();
        opp1.add(opp);   
        update opp1;
             
        List<Oppr_Document__c> od1 = New List<Oppr_Document__c>();
        od1.add(od);  
        update od1;
        test.StopTest();    
     } 
}