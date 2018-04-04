@isTest
public class partnerAutoIncrementUpdatetest{
    @testSetup
    public static void setup(){
        User u = new User(
        ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
        LastName = 'last',
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
        
        
        
        Lead lTemp2= new Lead();
        lTemp2.Company ='partner2Lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='test';
        lTemp2.LastName='lastname';  
        insert lTemp2;
        System.debug('lTemp2>>>>'+lTemp2);
        
        Tiger_Team_1_Counter__c objTeam1 = new Tiger_Team_1_Counter__c();
        objTeam1.Name = 'Tiger Team 1 Counter';
        objTeam1.Partner_Number__c = 1;
        insert objTeam1;
        
        Tiger_Team_2_Counter__c objTeam2 = new Tiger_Team_2_Counter__c();
        objTeam2.Name = 'Tiger Team 2 Counter';
        objTeam2.Partner_Number__c = 1;
        insert objTeam2;
        
        Tiger_Team_3_Counter__c objTeam3 = new Tiger_Team_3_Counter__c();
        objTeam3.Name = 'Tiger Team 3 Counter';
        objTeam3.Partner_Number__c = 1;
        insert objTeam3;
        
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        camp.IsActive = true;
        camp.Partner_Campaign_Team__c = 'T1';
        insert camp;
    }
    
    @isTest
    public static void partnerAutoIncrementUpdatetest1()
    { 
        /*
        Tiger_Team_1_Counter__c objTeam1 = new Tiger_Team_1_Counter__c();
        objTeam1.Name = 'Tiger Team 1 Counter';
        objTeam1.Partner_Number__c = 1;
        insert objTeam1;
        */
        /*
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        camp.IsActive = true;
        camp.Partner_Campaign_Team__c = 'T1';
        insert camp;
        */
        Campaign objCampaign = [select id from campaign];
        
        Lead objLead = [select id from lead];

        CampaignMember newMember = new CampaignMember (campaignid=objCampaign.id, leadid=objLead.id,status='Completed');
        insert newMember;
        
        objLead.DMSDocsFirstRoundComplete__c = System.today();
        update objLead;
        System.debug('partnerAutoIncrementUpdatetest1>>>>objLead>>>'+objLead);
        
    }
    
    @isTest
    public static void partnerAutoIncrementUpdatetest2()
    { 
        /*
        Tiger_Team_2_Counter__c objTeam2 = new Tiger_Team_2_Counter__c();
        objTeam2.Name = 'Tiger Team 2 Counter';
        objTeam2.Partner_Number__c = 1;
        insert objTeam2;
        
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        camp.IsActive = true;
        camp.Partner_Campaign_Team__c = 'T2';
        insert camp;
        */
        Campaign objCampaign = [select id from campaign];
        objCampaign.Partner_Campaign_Team__c = 'T2';
        
        Lead objLead = [select id from lead]; 
        
        CampaignMember newMember = new CampaignMember (campaignid=objCampaign.id, leadid=objLead.id,status='Completed');
        insert newMember;
        
        objLead.DMSDocsFirstRoundComplete__c = System.today();
        update objLead;
        System.debug('partnerAutoIncrementUpdatetest2>>>>objLead>>>'+objLead);
    }
    
    

    @isTest
    public static void partnerAutoIncrementUpdatetest3()
    { 
        /*
        Tiger_Team_3_Counter__c objTeam3 = new Tiger_Team_3_Counter__c();
        objTeam3.Name = 'Tiger Team 3 Counter';
        objTeam3.Partner_Number__c = 1;
        insert objTeam3;
        
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        camp.IsActive = true;
        camp.Partner_Campaign_Team__c = 'T3';
        insert camp;
        */
        Campaign objCampaign = [select id from campaign];
        objCampaign.Partner_Campaign_Team__c = 'T3';
        update objCampaign;
        
        Lead objLead = [select id from lead];   

        CampaignMember newMember = new CampaignMember (campaignid=objCampaign.id, leadid=objLead.id,status='Completed');
        insert newMember;
            
        objLead.DMSDocsFirstRoundComplete__c = System.today();
        update objLead;
        System.debug('partnerAutoIncrementUpdatetest3>>>>objLead>>>'+objLead);
    }
}