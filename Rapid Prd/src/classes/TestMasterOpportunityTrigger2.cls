/**
@Name            : TestMasterOpportunityTrigger_2nd 
@Author          : MK Conam
@Date            : Aug 28 2015
@Description     : Test Class for OpportunityTriggerHandler
**/

@isTest

private class TestMasterOpportunityTrigger2
{  
    static testMethod voId unitTestUnderwritingOpprtunity()
    {    
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        try
        {
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Campaign cam= new Campaign();
            cam.Name = 'Test';
            cam.Type='Internet';
            insert cam;
            
            Opportunity opp = new Opportunity();
            opp.Name = 'testOpportunity';
            opp.LeadSource = 'web';
            opp.StageName = 'Prospecting';
            opp.Underwriter_Assigned__c ='AUTO DECISION';
            opp.CampaignId = cam.Id;           
            opp.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp.CloseDate = System.today() + 20;
            opp.AccountId = acc.Id;
            insert opp;      
        
            User usr = new User();
            usr.LastName='TestUser1';
            usr.Email ='test@test.com';
            insert usr;
            
            UnderWriting_Opportunity_Users__c uWO =new UnderWriting_Opportunity_Users__c();
            uWO.Name='Test111';
            uWO.Id =usr.Id;
            insert uWO;
        }
        Catch(Exception e)
        {
        }
        test.stopTest();
    }
    
    static testMethod voId unitTestOpportunityCampaign()
    {
        Test.startTest(); 
        try
        {
         testRenewalClone();
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    }
    
    static voId testRenewalClone() 
    {       
        // DS-CONAM CALC.ApexTesting();
         try
        {
            User uVal = [SELECT 
                            Id 
                        FROM 
                            User 
                        WHERE 
                            isActive = true 
                        AND 
                            profile.name='System administrator' LIMIT 1];
            Opportunity opp =new Opportunity(name='Test Opportunity 12345',closedate = system.today(), 
                                                stagename = 'Closed Deal', calculate_due_dates__c = system.now());
            insert opp;
            
                    OpportunityTeamMember newOtm = new OpportunityTeamMember();
                    newOtm.OpportunityId = opp.Id;
                    newOtm.UserId = uVal.Id;
                    newOtm.TeamMemberRole = 'Partner Sales Representative';
                    
                    insert newOtm;
                    
            Opportunity oppOther = new Opportunity(name='Test Opportunity 12345',closedate = system.today(), 
                                                    stagename = 'Closed Deal', calculate_due_dates__c = system.now());
            oppOther.previous_opportunity__c = opp.Id;
            insert oppOther; 
        }
        catch(Exception e)
        {
        }

    }
       
    static testMethod voId unitTestOpprtunityStageChangeCALC()
    {
        // DS-CONAM CALC.apexTesting();
         Test.startTest();
        try
        {
            List<RecordType> gId=[SELECT
                                        Id
                                    FROM
                                        RecordType
                                    WHERE
                                        sObjectType='Opportunity'
                                    AND
                                        DeveloperName='GreenTree'];
    
            Account ac= new Account();
            ac.name='testcase';
            ac.BusinessType__c = 'testBusiness';
           
            insert ac;
            
            Campaign cp= new Campaign();
            cp.name='cppname';
            cp.Type='Internet';
            insert cp;
           
            Opportunity opp = new Opportunity();
            opp.name='oppname';
            opp.accountId=ac.Id;
            opp.ForecastCategoryName='Commit';
            opp.LeadSource='A001';
            opp.CampaignId=cp.Id;
            opp.CloseDate=system.today();
            opp.Current_Processor__c='1st federal financial';
            opp.StageName='closed';
            opp.Advance_ID__c ='0987654321';
            insert opp;      
            
            Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
            gt.opportunity__c=opp.Id;
            insert gt;
            
            List <DistributorGreenTree__c> defaultOwnerId = [SELECT
                                                                        Name
                                                                FROM
                                                                        DistributorGreenTree__c
                                                                ORDER BY
                                                                        createddate Limit 1];
                                                                    
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    }
}