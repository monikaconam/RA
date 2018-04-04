@isTest

private class TestUpdateCampaignAsPerGTUser
{
    static testMethod void unitTest()
    {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name = 'test– campign';
        insert cp;
        
        Campaign cpj = new Campaign();
        cpj.name = 'GreenTree - Universal Cash Fund';
        insert cpj;
        
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name = 'oppname1';
        gOpp1.accountId = ac.Id;
        gOpp1.RecordTypeId = gId.get(0).Id;
        gOpp1.ForecastCategoryName = 'Commit';
        gOpp1.LeadSource = 'A001';
        gOpp1.CampaignId = cp.Id;
        gOpp1.CloseDate = system.today();
        gOpp1.Current_Processor__c = '1st federal financial';
        gOpp1.StageName = 'Initial Call Needed';

        insert gOpp1;
        
        List<user> userList=[Select id, name from user where name ='Juan Yanez' and isActive=true];
        if(userList.size()>0)
            gOpp1.ownerId= userList.get(0).id;
        update gOpp1;  
        Test.stopTest();
    }
    
    static testMethod void unitTestM()
    {
        Test.startTest();
        
        List<RecordType> gId = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND DeveloperName = 'GreenTree' LIMIT 1];
        Account ac = new Account();
        ac.name = 'testcase';
        insert ac;
        Campaign cp= new Campaign();
        cp.name = 'test– campign';
        insert cp;
        
        Campaign cpM = new Campaign();
        cpM.name = 'GreenTree – Twinfold Capital';
        insert cpM;
        
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name = 'oppname1';
        gOpp1.accountId = ac.Id;
        gOpp1.RecordTypeId = gId.get(0).Id;
        gOpp1.ForecastCategoryName = 'Commit';
        gOpp1.LeadSource = 'A001';
        gOpp1.CampaignId = cp.Id;
        gOpp1.CloseDate = system.today();
        gOpp1.Current_Processor__c = '1st federal financial';
        gOpp1.StageName = 'Initial Call Needed';

        insert gOpp1;
        
        List<user> userList=[Select id, name from user where name ='Matthew Dillingham' and isActive=true];
        if(userList.size()>0)
            gOpp1.ownerId= userList.get(0).id; 
        
        update gOpp1;
        Test.stopTest();
    }
}