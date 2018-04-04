@isTest

public class TestMasterContactTrigger 
{   
   public static testMethod void DuplicateContactBlocker_unitTest()
   {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        PageReference testPage = Page.DuplicateContactBlockerSetup;
        Test.setCurrentPage(testPage);                  
        Duplicate_Contact_Blocker_Setup__c dcbs =  new Duplicate_Contact_Blocker_Setup__c();
        dcbs.Name = 'TestDCBS1';
        dcbs.Match_Account_Name__c= true;
        dcbs.Match_Email__c=true;
        dcbs.Match_Phone__c= false;        
        insert dcbs;            
        if (dcbs.id!=null) 
        {
            DuplicateContactBlockerController theController = new DuplicateContactBlockerController();
            delete dcbs;
            theController.ReadyPage();                
        }

        Account acct = new Account();
        acct.Name = 'Test Account1';
        acct.BusinessType__c='testBusiness';
        insert acct;
    
        Contact existingContact = new Contact();
        existingContact.FirstName = 'John';
        existingContact.LastName = 'Smith123';
        existingContact.Email = 'js123@gmail.com';
        existingContact.AccountId = acct.id;
        existingContact.Phone = '1231231234';
        insert existingContact;
        
        Contact duplicateContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com');
        duplicateContact.AccountId = acct.id;
    
        Duplicate_Contact_Blocker_Setup__c dcbs2 = new Duplicate_Contact_Blocker_Setup__c();
        
        dcbs2.Match_Phone__c = true;
        dcbs2.Match_Last_Name__c = true;
        dcbs2.Match_First_Name__c = true;
        dcbs2.Match_Email__c = true;
        dcbs2.Match_Account_Name__c = true;
        insert dcbs2;
        
        Contact dContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com', Phone = '1231231234');
        duplicateContact.AccountId = acct.id;    
        try
        {
           insert duplicateContact;
           insert dContact;
        }        
        catch (Exception e) 
        {
            System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
        }         
            delete dcbs2;
            
        try 
        {
            insert dContact;
        } 
        
        catch (Exception e) 
        {
            System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
        }
        
        Test.stopTest();
    }
    public static testMethod void DuplicateContactBlocker_unitTest1()
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();         
        Duplicate_Contact_Blocker_Setup__c dcbs =  new Duplicate_Contact_Blocker_Setup__c();
        dcbs.Name = 'TestDCBS1';
        dcbs.Match_Account_Name__c= true;
        dcbs.Match_Email__c=true;
        dcbs.Match_Phone__c= true;
        insert dcbs;
            
        if (dcbs.id!=null) 
        {
            DuplicateContactBlockerController theController = new DuplicateContactBlockerController();
            theController.ReadyPage();                
        }

        Account acct = new Account();
        acct.Name = 'Test Account1';
        acct.BusinessType__c='testBusiness';
        insert acct;
    
        Contact existingContact = new Contact();
        existingContact.FirstName = 'John';
        existingContact.LastName = 'Smith123';
        existingContact.Email = 'js123@gmail.com';
        existingContact.AccountId = acct.id;
        existingContact.Phone = '1231231234';
        insert existingContact;
        
        Contact duplicateContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com');
        duplicateContact.AccountId = acct.id;    
        Duplicate_Contact_Blocker_Setup__c dcbs2 = new Duplicate_Contact_Blocker_Setup__c();        
        dcbs2.Match_Phone__c = true;
        dcbs2.Match_Last_Name__c = true;
        dcbs2.Match_First_Name__c = true;
        dcbs2.Match_Email__c = true;
        dcbs2.Match_Account_Name__c = true;
        insert dcbs2;
        
        Contact dContact = new Contact(FirstName = 'John', LastName = 'Smith123', Email = 'js123@gmail.com', Phone = '1231231234');
        duplicateContact.AccountId = acct.id;    
        try
        {
           insert duplicateContact;
           insert dContact;
        }        
        catch (Exception e) 
        {
            System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
        }         
        try 
        {
            insert dContact;
        } 
        
        catch (Exception e) 
        {
            System.debug('An exception has occured -'+e.getMessage()+' - '+ e.getLineNumber());
        }
        
        Test.stopTest();
    }
    
    static testMethod void ContactAfterInsertTrigger_unitTest()
    {    
        test.startTest();
        // DS-CONAM CALC.apexTesting();

        Account acc= new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusibess';
        insert acc;
        
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test';
        cmObj.Type='Internet';
        insert cmObj;

        Opportunity opp= new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cmObj.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        con.Created_By_Conversion__c = opp.Id;
        insert con;
        
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = con.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 2'; 
        oppRole.isPrimary=true;
        insert oppRole;        
        
        ApexPages.StandardController sc = new ApexPages.standardController(oppRole);        
        ApexPages.currentPage().getParameters().put('Id', oppRole.Id);

        test.stopTest();
     
     }
}