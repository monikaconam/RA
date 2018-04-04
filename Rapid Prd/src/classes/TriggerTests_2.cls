@istest
public class TriggerTests_2 {
    static testMethod void myTest() {
         
        testOppDates();
        
    }

    static void testOppDates() {
        Test.startTest();
        CALC.ApexTesting();
        
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


        o.Renewal__c = true;
        update o;
        
        o.Underwriting_Approval__c = 'Declined' ;
        update o;

        o.Underwriting_Approval__c = 'Auto Declined';
        update o;
       
        Test.stopTest();   
            
            
            
    }


    
}