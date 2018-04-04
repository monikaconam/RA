/* this class covers autoIncrementInsert and autoIncrementUpdate of opportunitytriggerHandler */


@isTest
private class TestMasterOpportunityautoIncrement
{
 Static TestMethod Void autoIncrement()
    {
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
                
        list<campaign> campList = new list<campaign>();
    
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        camp.Partner_Campaign_Team__c ='';
        campList.add(camp); 
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'Test2';
        camp2.Type = 'Partners';
        camp2.Partner_Campaign_Team__c = 'T1';
        camp2.isActive = true;
        campList.add(camp2);
        
        Campaign camp3 = new Campaign();
        camp3.Name = 'Test2';
        camp3.Type = 'Partners';
        camp3.Partner_Campaign_Team__c = 'T2';
        camp3.isActive = true;
        campList.add(camp3);
        
        Campaign camp4 = new Campaign();
        camp4.Name = 'Test2';
        camp4.Type = 'Partners';
        camp4.Partner_Campaign_Team__c = 'T3';
        camp4.isActive = true;
        campList.add(camp4);
        
        Campaign camp5 = new Campaign();
        camp5.Name = 'Test2';
        camp5.Type = 'Partners';
        camp5.Partner_Campaign_Team__c = 'T4';
        camp5.isActive = true;
        campList.add(camp5);
        
        if(!campList.isEmpty())
        insert campList;
        
        
        list<opportunity> oppList = new list<opportunity>();
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = camp.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp);
        
        
        Opportunity opp1 = new Opportunity();
        opp1.name = 'testOpportunity';
        opp1.leadSource = 'web';
        opp1.stageName = 'Prospecting';
        opp1.closeDate = System.today() + 20;
        opp1.campaignId = camp2.Id;
        opp1.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp1.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp1);
        
        Opportunity opp2 = new Opportunity();
        opp2.name = 'testOpportunity';
        opp2.leadSource = 'web';
        opp2.stageName = 'Prospecting';
        opp2.closeDate = System.today() + 20;
        opp2.campaignId = camp3.Id;
        opp2.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp2.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp2);
        
        Opportunity opp3 = new Opportunity();
        opp3.name = 'testOpportunity';
        opp3.leadSource = 'web';
        opp3.stageName = 'Prospecting';
        opp3.closeDate = System.today() + 20;
        opp3.campaignId = camp4.Id;
        opp3.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp3.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp3);
        
        Opportunity opp4 = new Opportunity();
        opp4.name = 'testOpportunity';
        opp4.leadSource = 'web';
        opp4.stageName = 'Prospecting';
        opp4.closeDate = System.today() + 20;
        opp4.campaignId = camp5.Id;
        opp4.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp4.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp4);
        
        if(!oppList.isEmpty())
        insert oppList;
        
       
    }
    
    Static TestMethod Void autoIncrementupdate()
    {
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
                
        
    
         list<campaign> campList = new list<campaign>();
    
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        camp.Partner_Campaign_Team__c ='';
        campList.add(camp); 
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'Test2';
        camp2.Type = 'Partners';
        camp2.Partner_Campaign_Team__c = 'T1';
        camp2.isActive = true;
        campList.add(camp2);
        
        Campaign camp3 = new Campaign();
        camp3.Name = 'Test2';
        camp3.Type = 'Partners';
        camp3.Partner_Campaign_Team__c = 'T2';
        camp3.isActive = true;
        campList.add(camp3);
        
        Campaign camp4 = new Campaign();
        camp4.Name = 'Test2';
        camp4.Type = 'Partners';
        camp4.Partner_Campaign_Team__c = 'T3';
        camp4.isActive = true;
        campList.add(camp4);
        
        Campaign camp5 = new Campaign();
        camp5.Name = 'Test2';
        camp5.Type = 'Partners';
        camp5.Partner_Campaign_Team__c = 'T4';
        camp5.isActive = true;
        campList.add(camp5);
        
        if(!campList.isEmpty())
        insert campList;
        
        
        list<opportunity> oppList = new list<opportunity>();
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = camp.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp);
        
        
        Opportunity opp1 = new Opportunity();
        opp1.name = 'testOpportunity';
        opp1.leadSource = 'web';
        opp1.stageName = 'Prospecting';
        opp1.closeDate = System.today() + 20;
        opp1.campaignId = camp2.Id;
        opp1.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp1.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp1);
        
        Opportunity opp2 = new Opportunity();
        opp2.name = 'testOpportunity';
        opp2.leadSource = 'web';
        opp2.stageName = 'Prospecting';
        opp2.closeDate = System.today() + 20;
        opp2.campaignId = camp3.Id;
        opp2.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp2.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp2);
        
        Opportunity opp3 = new Opportunity();
        opp3.name = 'testOpportunity';
        opp3.leadSource = 'web';
        opp3.stageName = 'Prospecting';
        opp3.closeDate = System.today() + 20;
        opp3.campaignId = camp4.Id;
        opp3.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp3.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp3);
        
        Opportunity opp4 = new Opportunity();
        opp4.name = 'testOpportunity';
        opp4.leadSource = 'web';
        opp4.stageName = 'Prospecting';
        opp4.closeDate = System.today() + 20;
        opp4.campaignId = camp5.Id;
        opp4.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp4.closeDate = System.today() + 50;
        //opp.accountId = acc.id;
        oppList.add(opp4);
        
        if(!oppList.isEmpty())
        insert oppList;
        
        
        List<opportunity> oppListUpdate = new List<opportunity>();
        
        
        opp.campaignId = camp2.Id;
        oppListUpdate.add(opp);
        //update opp;
        
        opp1.campaignId = camp3.Id;
        oppListUpdate.add(opp1);
        
        opp2.campaignId = camp4.Id;
        oppListUpdate.add(opp2);
        
        opp3.campaignId = camp5.Id;
        oppListUpdate .add(opp3);
        
        opp4.campaignId = camp.Id;
        oppListUpdate.add(opp4);
        
        if(!oppListUpdate.isEmpty())
        update oppListUpdate ;
        
    }
}