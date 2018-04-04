@isTest
Private Class TestGetFeedBackSurveyHelper
{   
    public static Boolean preventGetFeedBackSurveyHelperFromFire = False;
    @TestSetup
    static void setUpData()
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        opp.email_address__c='test@test.com';
        insert opp;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        con.email='test@test.com';
        insert con;
        
        OpportunityContactRole role =new OpportunityContactRole();
        role.ContactId = con.Id;
        role.OpportunityId  = opp.Id;
        role.isPrimary=true;
        role.Role = 'Principal 1'; 
        insert role;
    }
    static testMethod void unitTestDeclined()
    {
        Test.startTest();
        Opportunity oppL=[Select 
                                id, name, stageName,send_declined_survey_on__c 
                            from 
                                Opportunity 
                            where 
                                name='testOpportunity' Limit 1];
        oppL.send_declined_survey_on__c=system.now();
        oppL.StageName='Declined';
        update oppL;
        Test.stopTest();
    }
    
    static testMethod void unitTestFundingSurvey1Day()
    {
        Test.startTest();
        Opportunity oppL=[Select 
                                id, name, stageName,Send_Client_Funding_Survey_On__c,Amount,Funded_by_WC__c,Client_Funding_Survey__c   
                            from 
                                Opportunity 
                            where 
                                name='testOpportunity' Limit 1];
        oppL.Send_Client_Funding_Survey_On__c=system.now();
        oppL.StageName='Closed Won';
        oppL.Amount  = 1;
        oppL.Client_Funding_Survey__c = true;
        preventGetFeedBackSurveyHelperFromFire =False;
        oppL.Funded_by_WC__c = system.now();
        update oppL;
        Test.stopTest();
    }
    static testMethod void unitTestFundingSurvey90Day()
    {
        Test.startTest();
        Opportunity oppL=[Select 
                                id, name, stageName,Send_90_Day_Post_Funding_Survey_On__c, Funding_status__c,Amount,Funded_by_WC__c
                            from 
                                Opportunity 
                            where 
                                name='testOpportunity' Limit 1];
        oppL.Send_90_Day_Post_Funding_Survey_On__c=system.now();
        oppL.StageName='Closed Won';
        oppL.Funding_status__c='Funded - Processing Trial Completed';
        oppL.Amount  = 1;
        oppL.Client_Funding_Survey__c = true;
        preventGetFeedBackSurveyHelperFromFire =False;
        oppL.Funded_by_WC__c = system.now();
        update oppL;
        Test.stopTest();
    }
}