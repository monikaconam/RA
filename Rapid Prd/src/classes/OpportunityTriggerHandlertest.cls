@isTest
public class OpportunityTriggerHandlertest{

    public static testmethod  void assignCountersForRoundRobinOnInsert()
    { 
    
        User u = new User(
        ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
        FirstName = 'Darius',
        LastName = 'Polk',
        Email = 'puser000@amamama.com',
        Username = 'puser000@amamama.com' + System.currentTimeMillis(),
        CompanyName = 'TEST',
        Title = 'title',
        Alias = 'alias',
        TimeZoneSidKey = 'America/Los_Angeles',
        EmailEncodingKey = 'UTF-8',
        LanguageLocaleKey = 'en_US',
        LocaleSidKey = 'en_US',
        isactive =  true
        );
        
        insert u;
        
        Tiger_Teams__c tt = new Tiger_Teams__c();
        tt.User__c = u.id;
        insert tt;
        
        
         OPEN_Dialer_Team_Counter_For_Opportunity__c od = new OPEN_Dialer_Team_Counter_For_Opportunity__c();
        od.Name = 'testName';
        od.Partner_Number__c = 0;
        insert od;
        
        Tiger_Team_1_Counter_for_Opportunity__c tiger1 = new Tiger_Team_1_Counter_for_Opportunity__c ();
        tiger1.Partner_Number__c = 2;
        tiger1.Name = 'Tiger Team 1 Counter';
        insert tiger1;
        
        Tiger_Team_2_Counter_for_Opportunity__c tiger2 = new Tiger_Team_2_Counter_for_Opportunity__c ();
        tiger2.Partner_Number__c = 2;
        tiger2.Name = 'Tiger Team 2 Counter';
        insert tiger2;
        
        Tiger_Team_3_Counter_for_Opportunity__c tiger3 = new Tiger_Team_3_Counter_for_Opportunity__c ();
        tiger3.Partner_Number__c = 2;
        tiger3.Name = 'Tiger Team 3 Counter';
        insert tiger3;
        
        Tiger_Team_4_Counter_for_Opportunity__c tiger4 = new Tiger_Team_4_Counter_for_Opportunity__c ();
        tiger4.Partner_Number__c = 2;
        tiger4.Name = 'Tiger Team 4 Counter';
        insert tiger4;
        
        
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        camp.partner_campaign_team__c = 'T1';
        insert camp;
        
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'TestCamp';
        camp2.type = 'Internet';
        camp2.partner_campaign_team__c = 'T2';
        insert camp2;
        
        Campaign camp3 = new Campaign();
        camp3 .Name = 'TestCamp';
        camp3 .type = 'Internet';
        camp3 .partner_campaign_team__c = 'T3';
        insert camp3 ;
        
        Campaign camp4 = new Campaign();
        camp4.Name = 'TestCamp';
        camp4.type = 'Internet';
        camp4.partner_campaign_team__c = 'T4';
        insert camp4 ;
        
         Campaign camp5 = new Campaign();
        camp5.Name = 'TestCamp';
        camp5.type = 'Internet';
        //camp4.partner_campaign_team__c = 'T4';
        insert camp5 ;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.leadSource = 'A001';
        opp.campaignId = camp.Id;
        opp.closeDate = date.newInstance(2007, 5, 5);
        opp.stageName = 'Prospecting';
        opp.current_Processor__c = 'Blue Pay';
        opp.AccountId=acc.Id;        
        insert opp;
        
        
        opp.campaignId = camp2.Id;
        update opp;
        
        opp.campaignId = camp3.Id;
        update opp;
        
        opp.campaignId = camp4.Id;
        update opp;
        
        opp.campaignId = camp5.Id;
        update opp;
        
        OPEN_Dialer_Team_Counter_For_Opportunity__c pn  = new OPEN_Dialer_Team_Counter_For_Opportunity__c();
        pn.name = 'test';
        pn.Partner_Number__c = 1;
        insert pn;
    }
}