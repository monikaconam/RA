/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
 
@isTest
private class TestMasterNoteTrigger 
{
    @testSetup static void setup() {
        Account Acc = new Account();
        Acc.name = 'Test Account1';
        Acc.BusinessType__c = 'testBusiness';
        insert Acc;
        
        Campaign cam = new Campaign();
        cam.Name = 'Test';
        cam.Type='Internet';
        insert cam ;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cam.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = acc.id;
        insert opp;   
    }
    
    static testMethod void myUnitTest() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType> rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'Internal QC'
                                And
                                    sobjectType='Note__c'];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity 
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.recordTypeID=rt.get(0).id;
        noteObj2.Opportunity__c = opp.Id; 
        insert noteObj2;
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                            
    }
    
     static testMethod void myUnitTest2() 
     {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        List<RecordType> rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'Internal UW Notes'
                                And
                                    sobjectType='Note__c'];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity 
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
               
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;

        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                           
    }
        
    static testMethod void myUnitTest3() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType>rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'Processing Notes'
                                And
                                    sobjectType='Note__c' Limit 1];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
                
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id;
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;
             
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                           
    }
        
    static testMethod void myUnitTest4() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType> rt = [SELECT 
                                        Id,Name, LastModifieddate
                                    FROM 
                                        RecordType 
                                    WHERE 
                                        Name = 'UW Notes'
                                    And
                                        sobjectType='Note__c' Limit 1];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;

        
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                            
    }
    static testMethod void myUnitTest5() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType> rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'Third Party UW Notes'
                                And
                                    sobjectType='Note__c'];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                   Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;
                
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                            
    }
    static testMethod void myUnitTest6() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType> rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'UW Notes to Processing/Risk Department'
                                And
                                    sobjectType='Note__c'];
       Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;

        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
         Test.stopTest();                           
    }
    static testMethod void myUnitTest7() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        List<RecordType> rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'SA Internal Notes'
                                And
                                    sobjectType='Note__c'];
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;
        
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        
        
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                           
    }    

    static testMethod void myUnitTest8() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        Account acc=[select
                            name, BusinessType__c 
                    from 
                            Account
                    where 
                            name = 'Test Account1'];
        Campaign cam= [select
                            name, type
                    from 
                            Campaign 
                    where 
                            name = 'Test'];
        Opportunity opp= [select
                                    Name , LeadSource ,StageName ,CloseDate ,CampaignId,Current_Processor__c  ,AccountId  
                            from 
                                    Opportunity
                            where 
                                    name = 'testOpportunity'];
        
        List<RecordType>rt = [SELECT 
                                    Id,Name, LastModifieddate
                                FROM 
                                    RecordType 
                                WHERE 
                                    Name = 'Pre Qual Notes'
                                AND
                                    sobjectType='Note__c' LIMIT 2];     
        
        Note__c noteObj2 = new Note__c();
        noteObj2.Note_Content__c='Conditions';
        noteObj2.Opportunity__c = opp.Id; 
        noteObj2.recordTypeID=rt.get(0).id;
        insert noteObj2;
       
        Note__c noteObj = new Note__c();
        noteObj .Note_Content__c='Conditions';
        noteObj .Opportunity__c = opp.Id; 
        insert noteObj ;
        
        noteObj.recordTypeID=rt.get(0).id;
        update noteObj;
        delete noteObj;
        Test.stopTest();                    
    }
}