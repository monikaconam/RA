@isTest 

public class TestOpportunity_Tab_Detail  
{
    static testMethod void Opportunity_Tab_Detail_UnitTest() 
    {
        // DS-CONAM CALC.apexTesting();   
        Test.startTest();   
        Opportunity_Tab_Detail oTD = new Opportunity_Tab_Detail();
        oTD.TabName ='TestTabName';
        
        oTD.fieldl = new List<Opportunity_Tab_Detail.AnyField_Detail>();
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusibess';
        insert acc ;
        
        Campaign cam =  new Campaign();
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
        Opportunity_Tab_Detail.AnyField_Detail objdetail = new Opportunity_Tab_Detail.AnyField_Detail();
        Test.stopTest();
       /**  objdetail.isMandatory=true;
        Boolean isVisible;
        String fieldLabel;
        String fieldDataType;
        String fieldAPI;  **/
    } 
}