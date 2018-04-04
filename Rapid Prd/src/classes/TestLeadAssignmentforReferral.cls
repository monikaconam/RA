@isTest
public class TestLeadAssignmentforReferral {   
    static testMethod void testLead(){
        Account acc = new Account();
        acc.Name = 'Test Acc';
        insert acc;
           
        Lead l = new Lead();
        l.LastName = 'Test LastName';
        l.Email = 'abc@test.com';
        l.company = 'Test Comp';
        l.Referral_Merchant_Id__c = acc.Id;
        insert l;
           
        Lead m = new Lead();
        m.LastName = 'Test LastName';
        m.Email = 'def@test.com';
        m.company = 'Test Comp';
        m.Referral_Merchant_Id__c = l.Id;
        insert m;        
    }
}