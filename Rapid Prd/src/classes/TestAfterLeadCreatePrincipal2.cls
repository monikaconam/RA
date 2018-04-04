@isTest 
public with sharing class TestAfterLeadCreatePrincipal2 {

 
    static testMethod void createPrincipal2_UnitTest() {
        Test.startTest(); 
        CALC.ApexTesting();
        Lead l = new Lead();
        
        l.Status = 'Inital Call Needed';
        l.LeadSource = 'A001';
        l.Company = 'Krell Audio/Video';
        l.Legal_Business_Name__c = 'Krell Audio/Video';
        l.Phone = '3132329090';
        l.Type_Of_Business__c = 'Entertainment';
        l.Operating_Since__c = 'More than 2 years';
        l.DateBusinessStarted__c = system.today();
        l.Owned_Business_Since__c = system.today();
        l.FirstName = 'Jake';
        l.LastName = 'Jones';
        l.Principal_1_Street_Address__c = '1000 West Street';
        l.Principal_1_City__c = 'Washington';
        l.Principal_1_State__c = 'DC';
        l.Principal_1_Zip__c = '20012';
        l.Monthly_Visa_Mastercard_Volume__c ='80,000 - 100,000';
        
        l.Principal_2_First_Name__c = 'Jerry';
        l.Principal_2_Last_Name__c = 'Jones';
        l.Principal_2_Street_Address__c = '1000 Dallas Way';
        l.Principal_2_City__c = 'Dallas';
        l.Principal_2_State__c = 'TX';
        l.Principal_2_Zip__c = '30012';        
        
        insert l;
        
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm); 
        
    String id = l.id;

    Database.LeadConvert lc = new Database.LeadConvert();
    lc.setLeadId(id);
     
    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    lc.setConvertedStatus(convertStatus.MasterLabel);

    Database.LeadConvertResult lcr = Database.convertLead(lc);
    if(lcr.isSuccess())
    {
      String cId = lcr.getContactId();

    }
            
        
        Test.stopTest();
    }
 
}