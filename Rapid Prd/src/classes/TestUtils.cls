public class TestUtils {

    public static Account createAccount()
    {
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusiness';
        insert testAccount;
        return testAccount;
    }

    public static Campaign createCampaign()
    {
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test';
        cmObj.Type='Internet';
        insert cmObj;
        return cmObj;
    }


    public static Opportunity createOpportunity(Account acc, Campaign cam)
    {
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        insert opp;
        return opp;
    }
    public static Quote createQuote(Opportunity opp)
    {
        Quote Quo = new Quote();
        Quo.Name = 'Test';
        Quo.OpportunityId = opp.id;
        insert Quo;
        return Quo;
    }
    
    public static Contact createContact(Account acc){
        Contact c = new Contact();
        c.AccountId = acc.Id;
        c.LastName = 'test';
        insert c;
        return c;
    }
    
    public static OpportunityContactRole createOpportunityContactRole(Contact con, Opportunity opp) {
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = con.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 2'; 
        insert oppRole;
        return oppRole;
    }
    public static OpportunityContactRole createOpportunityContactRolePrimary(Contact con, Opportunity opp) {
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = con.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 1'; 
        oppRole.isPrimary=true;
        insert oppRole;
        return oppRole;
    }
    
    
    public static Note__c createNote(Opportunity opp){
       Note__c Nc= new Note__c();
       nc.Note_Content__c='Conditions';
       RecordType rc= new RecordType(name='Approved');
       Nc.Opportunity__c = opp.Id; 
       insert Nc;
       return Nc;
    }
    
     public static Note__c createNote_New(Opportunity opp){
       Note__c Nc= new Note__c();
       nc.Note_Content__c='Conditions';
       RecordType rc= new RecordType(name='Internal UW Notes');
       Nc.Opportunity__c = opp.Id; 
       insert Nc;
       return Nc;
    }
    
    public static  Merchant__c createMerchant(Opportunity opp){
        Merchant__c  mc = new Merchant__c ();
        mc.Opportunity__c = opp.Id;
        insert mc;
        return mc;
    }
    
    
    public static Additional_Locations__c createAdditionalLocation(Account acc) {
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = acc.Id;
        insert aloc;
        return aloc;
    }
    
    
    public static Attachment createAttachment(Opportunity opp) {
        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('Test Attatchment on Class');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = opp.Id; 
        insert attachment;
        return attachment;
    }
    
    
     public static Customer_Survey__c createCustomerSurvey(Opportunity opp , Account acc) {
         Customer_Survey__c cs = new Customer_Survey__c();
         cs.Name = 'test';
         cs.Account__c = acc.Id;
         cs.Opportunity__c = opp.Id;
         insert cs;
         return cs;
     }
     
     public static Site_Survey__c createSiteSurvey(Opportunity opp) {
         Site_Survey__c surveyObj = new Site_Survey__c();
         surveyObj.Name = 'test';
         surveyObj.Site_Survey_Type__c = 'Merchant Site 24';
         surveyObj.Opportunity__c = opp.Id;
         insert surveyObj;
         return surveyObj;
             
     }
     
     Static testMethod void testUtil_UnitTest() {
        Account acc = TestUtils.createAccount(); 
        Campaign ca =  TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, ca);
        Quote q = TestUtils.createQuote(opp);
        Customer_Survey__c  cs = TestUtils.createCustomerSurvey(opp ,acc);
        TestUtils.createAttachment(opp);
        TestUtils.createAdditionalLocation(acc);
        TestUtils.createMerchant(opp);
        TestUtils.createNote(opp);
        Contact con = TestUtils.createContact(Acc);
        TestUtils.createOpportunityContactRole(con, opp);
        TestUtils.createNote_New(opp);
        TestUtils.createSiteSurvey(opp);
     }
     
     
    
}