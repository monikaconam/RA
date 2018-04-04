@isTest
public class TestBatchUpdateOpportunityOwner{

    static testMethod void updateOwnerTest() {
    
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Brian', LastName='Klenk', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttssssstt@testorg.com');
                    
        insert u;
        
        User u2 = new User(Alias = 'standt', Email='standarduser@testorg2.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Alyssa', LastName='Palafox', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttsssrrtt@testorg.com');
                    
        insert u2;      
        
        Campaign camp = new Campaign();
        camp.Name = 'Test Campaign';
        camp.isActive = True;
        camp.Type = 'Display';
        insert camp;
        
        Transfer_Member__c transMem = new Transfer_Member__c();
        transMem.Name = 'Test Name';
        transMem.First_Name__c = 'Test';
        transMem.Last_Name__c = 'Name';
        transMem.Email__c = 'test@test.com';
        insert transMem;
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Transfer_Member__c = transMem.Id;
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opp 2016';
        opp.StageName = 'Credit Pulled';
        opp.CloseDate = System.today().addDays(10);
        opp.CampaignId = camp.Id;
        opp.LeadSource = 'Facebook';
        opp.AccountId = acc.Id;
        insert opp;
        
        Test.setCreatedDate(opp.Id, System.today().adddays(-3));
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'Quicken Loans Hot Transfer';
        camp2.isActive = True;
        camp2.Type = 'Display';
        insert camp2;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opp 2014';
        opp2.StageName = 'Credit Pulled';
        opp2.CloseDate = System.today().addDays(10);
        opp2.LeadSource = 'Facebook';
        opp2.CampaignId = camp2.Id;
        opp2.AccountId = acc.Id;
        insert opp2;
        
        Test.setCreatedDate(opp2.Id, System.today().adddays(-3));
        
        Test.startTest();
        
        BatchUpdateOpportunityOwner batch1 = new BatchUpdateOpportunityOwner();
        ID batchprocessid = Database.executeBatch(batch1);
        System.schedule('test Schedule', '0 0 0 15 3 ? 2022',new BatchUpdateOpportunityOwner());
        
        Test.stopTest();
    }
    
    static testMethod void updateOwnerTest2() {
    
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Brian', LastName='Klenk', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttxxssstt@testorg.com');
                    
        insert u;
        
        User u2 = new User(Alias = 'standt', Email='standarduser@testorg2.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Alyssa', LastName='Palafox', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttsysrrtt@testorg.com');
                    
        insert u2;  
    
        Campaign camp3 = new Campaign();
        camp3.Name = 'Test Camp 2';
        camp3.isActive = True;
        camp3.Type = 'Display';
        insert camp3;
        
        Transfer_Member__c transMem = new Transfer_Member__c();
        transMem.Name = 'Test Name';
        transMem.First_Name__c = 'Test';
        transMem.Last_Name__c = 'Name';
        transMem.Email__c = 'test@test.com';
        insert transMem;
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Transfer_Member__c = transMem.Id;
        insert acc;
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opp 2014';
        opp3.StageName = 'Credit Pulled';
        opp3.CloseDate = System.today().addDays(10);
        opp3.LeadSource = 'Facebook';
        opp3.CampaignId = camp3.Id;
        opp3.AccountId = acc.Id;
        insert opp3;
        
        Test.setCreatedDate(opp3.Id, System.today().adddays(-3));
        
        Task tsk = new Task();
        tsk.Subject = 'Test';
        tsk.Status = 'In Progress';
        tsk.Priority = 'Normal';
        tsk.OwnerId = u2.Id;
        tsk.WhatId = opp3.Id;
        insert tsk;
              
        Test.startTest();
        
        BatchUpdateOpportunityOwner batch1 = new BatchUpdateOpportunityOwner();
        ID batchprocessid = Database.executeBatch(batch1);
        System.schedule('test Schedule', '0 0 0 15 3 ? 2022',new BatchUpdateOpportunityOwner());
        
        Test.stopTest();
    }
}