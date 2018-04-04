/*

Modified
DS-CONAM - 03/04/2015
Version 10 to 32
Added @istest Annotation
Added Test.startTest() and Test.stopTest() to both methods
*/


@istest
public class TriggerTests {
    static testMethod void myTest() {
         Test.startTest(); 
        testOppDates();
        testRenewalClone();
        Test.stopTest();
    }

    static void testRenewalClone() {
        
        User u = [select id from user where isactive = true limit 1];
        Opportunity o = new Opportunity(name='Test Opportunity 12345',closedate = system.today(), stagename = 'Closed Deal', calculate_due_dates__c = system.now());
        insert o;

        opportunityteammember newotm = new opportunityteammember();
        newotm.OpportunityId = o.id;
        newotm.UserId = u.id;
        newotm.TeamMemberRole = 'Partner Sales Representative';
        //newotm.OpportunityAccessLevel = otm.OpportunityAccessLevel;
        insert newotm;
                
        Opportunity o2 = new Opportunity(name='Test Opportunity 12345',closedate = system.today(), stagename = 'Closed Deal', calculate_due_dates__c = system.now());
        o2.previous_opportunity__c = o.id;
        insert o2;
     }   
    static void testOppDates() {
        
        User u = [select id from user where isactive = true limit 1];

        Campaign c = new campaign();
        c.name = 'test';
        c.Sales_Team_Member_1__c = u.id;
        c.Sales_Team_Member_2__c = u.id;
        c.Sales_Team_Member_3__c = u.id;
        c.Sales_Team_Member_4__c = u.id;
        c.Sales_Team_Member_5__c = u.id;
        c.Sales_Team_Member_6__c = u.id;
        insert c;
        
        Opportunity o = new Opportunity(name='Test Opportunity 12345',closedate = system.today(), stagename = 'Closed Deal', calculate_due_dates__c = system.now());
        o.campaignid = c.id;
        o.Decision_Date__c = system.now(); 
        o.submit_to_sales_assistant__c = system.now();
        o.re_decision_date__c = system.now(); 

        insert o;
           
        o.Split_Fund_Set_Up__c  = 'GPS - Rocky Mountain' ;
        update o;

        o.Split_Fund_Set_Up__c  = 'Rapid Advance Chooses'; 
        update o;

        o.Split_Fund_Set_Up__c  = 'xxx'; 
        o.Current_Processor__c = 'Nova'; 
        o.Processor_Name__c = 'Nova';
        update o;

        o.Current_Processor__c = 'Nova'; 
        o.Processor_Name__c = 'xxy';
        update o;

    }


    
}