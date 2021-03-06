@isTest

private class TestMasterOpportunityTrigger4
{  
    static testMethod voId unitTestOpportunityCampaign()
    {
        Test.startTest();
        try{ 
            testOppDates();
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    }
    static voId testOppDates() 
    {        
        // DS-CONAM CALC.ApexTesting();        
        User u = [SELECT 
                        Id 
                    FROM 
                        User 
                    WHERE 
                        isActive = true 
                    AND 
                        profile.Name='System administrator' LIMIT 1];

        Campaign camp = new campaign();
        camp.name = 'test';
        camp.Sales_Team_Member_1__c = u.Id;
        camp.Sales_Team_Member_2__c = u.Id;
        camp.Sales_Team_Member_3__c = u.Id;
        camp.Sales_Team_Member_4__c = u.Id;
        camp.Sales_Team_Member_5__c = u.Id;
        camp.Sales_Team_Member_6__c = u.Id;
        insert camp;
        
        Campaign campOther = new campaign();
        campOther.name = 'campOther';
        campOther.Sales_Team_Member_1__c = u.Id;
        campOther.Sales_Team_Member_2__c = u.Id;
        campOther.Sales_Team_Member_3__c = u.Id;
        campOther.Sales_Team_Member_4__c = u.Id;
        campOther.Sales_Team_Member_5__c = u.Id;
        campOther.Sales_Team_Member_6__c = u.Id;
       
        insert campOther;
        
        Opportunity opp = new Opportunity(name='Test Opportunity 12345',closedate = system.today(), 
                                            stagename = 'Closed Deal', 
                                            calculate_due_dates__c = system.now());
        opp.campaignId = camp.Id;
        opp.Decision_Date__c = system.now(); 
        opp.submit_to_sales_assistant__c = system.now();
        opp.re_decision_date__c = system.now(); 

        insert opp;
        
        //ApexServices.CountBusinessDays(system.now(), system.now());

        opp.Split_Fund_Set_Up__c  = 'GPS - Rocky Mountain' ;
        update opp;
        
        opp.Split_Fund_Set_Up__c  = 'RapId Advance Chooses'; 
        update opp;
        
        opp.Split_Fund_Set_Up__c  = 'xxx'; 
        opp.Current_Processor__c = 'Nova'; 
        opp.Processor_Name__c = 'Nova';
        update opp;
        
        opp.Current_Processor__c = 'Nova'; 
        opp.Processor_Name__c = 'xxy';
        update opp;
        
         
    }
}