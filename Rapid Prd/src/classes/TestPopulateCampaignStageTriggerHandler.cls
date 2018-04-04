@istest
private class TestPopulateCampaignStageTriggerHandler 
{
    static testMethod void unitTest1()
    {
    
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        camp.Status = 'Inactive';
        insert camp;
        
        Campaign camp1 = new Campaign();
        camp1.Name = 'TestCamp';
        camp1.type = 'Internet';
        camp1.Status = 'Submitting';
        insert camp1;
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'TestCamp';
        camp2.type = 'Internet';
        camp2.Status = 'Funding';
        camp2.Funding_Partner_Date__c = date.today() -1;
        insert camp2;
        
        Campaign camp3 = new Campaign();
        camp3.Name = 'TestCamp';
        camp3.type = 'Internet';
        camp3.Status = 'High Signing Activity';
        camp3.Funding_Partner_Date__c =date.today() -1;
        insert camp3;
        
        Campaign camp4 = new Campaign();
        camp4.Name = 'TestCamp';
        camp4.type = 'Internet';
        camp4.Status = 'Dormant';
        camp4.Funding_Partner_Date__c =date.today() -1;
        insert camp4;
       
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        insert opp;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'TestingOpp';
        opp1.leadSource = 'A001';
        opp1.campaignId = camp1.Id;
        opp1.closeDate = date.newInstance(2007, 5, 5);
        opp1.stageName = 'Closed Won';
        opp1.current_Processor__c = 'Blue Pay';
        insert opp1;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'TestingOpp';
        opp2.leadSource = 'A001';
        opp2.campaignId = camp2.Id;
        opp2.closeDate = date.newInstance(2007, 5, 5);
        opp2.stageName = 'Closed Won';
        opp2.current_Processor__c = 'Blue Pay';
        insert opp2;
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'TestingOpp';
        opp3.leadSource = 'A001';
        opp3.campaignId = camp2.Id;
        opp3.closeDate = date.newInstance(2007, 5, 5);
        opp3.stageName = 'Closed Won';
        opp3.current_Processor__c = 'Blue Pay';
        insert opp3;
        
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'TestingOpp';
        opp4.leadSource = 'A001';
        opp4.campaignId = camp2.Id;
        opp4.closeDate = date.newInstance(2007, 5, 5);
        opp4.stageName = 'Closed Won';
        opp4.current_Processor__c = 'Blue Pay';
        insert opp4;
        
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'TestingOpp';
        opp5.leadSource = 'A001';
        opp5.campaignId = camp2.Id;
        opp5.closeDate = date.newInstance(2007, 5, 5);
        opp5.stageName = 'Closed Won';
        opp5.current_Processor__c = 'Blue Pay';
        insert opp5;
        
        Opportunity opp6 = new Opportunity();
        opp6.Name = 'TestingOpp';
        opp6.leadSource = 'A001';
        opp6.campaignId = camp2.Id;
        opp6.closeDate = date.newInstance(2007, 5, 5);
        opp6.stageName = 'Closed Won';
        opp6.current_Processor__c = 'Blue Pay';
        insert opp6;
        
        Opportunity opp7 = new Opportunity();
        opp7.Name = 'TestingOpp';
        opp7.leadSource = 'A001';
        opp7.campaignId = camp3.Id;
        opp7.closeDate = date.newInstance(2007, 5, 5);
        opp7.stageName = 'Closed Won';
        opp7.current_Processor__c = 'Blue Pay';
        insert opp7;
        
      
        
    }
    
    static testMethod void unitTest2()
    {
    
        Campaign camp3 = new Campaign();
        camp3.Name = 'TestCamp';
        camp3.type = 'Internet';
        camp3.Status = 'High Signing Activity';
        camp3.Funding_Partner_Date__c =date.today() -1;
        insert camp3;
        
        Opportunity opp7 = new Opportunity();
        opp7.Name = 'TestingOpp';
        opp7.leadSource = 'A001';
        opp7.campaignId = camp3.Id;
        opp7.closeDate = date.newInstance(2007, 5, 5);
        opp7.stageName = 'Prospecting';
        opp7.current_Processor__c = 'Blue Pay';
        insert opp7;
       
        Campaign camp4 = new Campaign();
        camp4.Name = 'TestCamp';
        camp4.type = 'Internet';
        camp4.Status = 'Inactive';
        camp4.Funding_Partner_Date__c =date.today() -1;
        insert camp4;
        
        camp4.Status = 'Dormant';
        Update camp4;
        
        Campaign camp5 = new Campaign();
        camp5.Name = 'TestCamp';
        camp5.type = 'Internet';
        camp5.Status = 'Dormant';
        camp5.Funding_Partner_Date__c =date.today() -1;
        insert camp5;
        
        camp5.Status = 'Inactive';
        Update camp5;
        
        Campaign camp6 = new Campaign();
        camp6.Name = 'TestCamp';
        camp6.type = 'Internet';
        camp6.Status = 'Dormant';
        camp6.Funding_Partner_Date__c =date.today() -1;
        insert camp6;
        
        camp6.Status = 'Terminated';
        Update camp6;
        
        
        Opportunity opp8 = new Opportunity();
        opp8.Name = 'TestingOpp';
        opp8.leadSource = 'A001';
        opp8.campaignId = camp4.Id;
        opp8.closeDate = date.newInstance(2007, 5, 5);
        opp8.stageName = 'Closed Won';
        opp8.current_Processor__c = 'Blue Pay';
        opp8.Renewal__c = False;
        insert opp8;
        
        opp8.campaignId = camp5.Id;
        Update opp8;
        
        
        Lead tstlead=new Lead();
        tstlead.lastname='testLastName';
        tstlead.Company='ABC Company';
        tstlead.Phone='123-456-7890'; 
        tstlead.Principal_Home_Phone_Number__c='223-456-7890';
        tstlead.Status = 'Fraud';
        insert tstlead;
        
        tstlead.Status = 'Denied';
        Update tstlead;
    }
    
}