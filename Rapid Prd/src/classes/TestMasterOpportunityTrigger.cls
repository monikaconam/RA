/**
@Name            : TestMasterOpportunityTrigger
@Author          : MK Conam
@Date            : Aug 28 2015
@Description     : Test Class for OpportunityTriggerHandler
**/

@isTest

private class TestMasterOpportunityTrigger 
{    
    @testSetup static void setup()
    {
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
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
    
    }
    static testMethod voId unitTestRiskAlert()
    {
        // DS-CONAM CALC.ApexTesting(); 
        Test.startTest();
        try
        {
            User_Lookup__c test1 = new User_Lookup__c(Name = 'test1', Email__c = 'test@test.com');
            insert test1;
            User_Lookup__c test2 = new User_Lookup__c(Name = 'test2', Email__c = 'test2@test.com');
            insert test2;
    
            Opportunity o = new Opportunity();
            o.Name = 'Test Opp';
            o.StageName = 'Credit Pulled';
            o.CloseDate = Date.today();
            o.Send_Risk_Alert__c =true;
            Database.SaveResult sr = Database.insert(o);
    
            String oppId = sr.GetId();
            o.Processing_Representative__c = 'test1';
            o.Risk_Employee__c = 'test2';
            update o;
    
            Opportunity[] o_query = [SELECT Id,Send_Risk_Alert__c FROM Opportunity WHERE Id=: oppId];
           //System.assertEquals(true, o_query[0].Send_Risk_Alert__c);
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    }
    
    static testMethod voId unitTestContactRolesOppr()
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();
        try
        {
            RecordType rt = [SELECT 
                                Id 
                            FROM 
                                RecordType 
                            WHERE 
                                sObjectType = 'Opportunity' 
                            AND
                                Name = 'New Opportunity' LIMIT 1 ];
            
            Opportunity opp=[select
                                    id
                            from
                                    Opportunity
                            where 
                                    name='TestingOpp' Limit 1];                        
            
            Account acc=[select
                                    id
                            from
                                    Account 
                            where 
                                    name='Test Account1' Limit 1];   
            Contact con = [select
                                    id
                            from
                                    Contact
                            where 
                                    lastname='test' Limit 1];  
            Campaign cam=[select
                                    id
                            from
                                    Campaign 
                            where 
                                    name='TestCamp' Limit 1]; 
            
            OpportunityContactRole  oppConRole = new OpportunityContactRole();
            oppConRole.contactId = con.Id;
            oppConRole.opportunityId  = opp.Id;
            oppConRole.role = 'Principal 1'; 
            oppConRole.isPrimary = true; 
            insert oppConRole;        
            
            Opportunity opp1 = new Opportunity();
            opp1.Name = 'TestingOpp';
            opp1.leadSource = 'A001';
            opp1.campaignId = cam.Id;
            opp1.closeDate = date.newInstance(2007, 5, 5);
            opp1.stageName = 'Prospecting';
            opp1.current_Processor__c = 'Blue Pay';
            opp1.if_Renewal_Preceding_Opportunity__c = opp.Id;
            opp1.AccountId=acc.Id;
            insert opp1;
        }
        catch(Exception e)
        {
            System.debug(e);
        }
        Test.stopTest();
    }
   
    static testMethod voId unitTestUpdateOpportunityForBiz2Credit()
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        try
        {
            Campaign cam=[select
                                    id
                            from
                                    Campaign 
                            where 
                                    name='TestCamp' Limit 1];
            
            Opportunity opp=[select
                                    id
                            from
                                    Opportunity
                            where 
                                    name='TestingOpp' Limit 1];    
            
            Opportunity opp1 =[SELECT
                                    Name,Id,StageName,Status__c,CloseDate,CampaignId 
                                FROM
                                     Opportunity 
                                 WHERE Id=: opp.Id ];
            update opp1;
            // System.assertEquals(true, opp1[0].Status__c);
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    }
    
    static testMethod voId unitTestUpdateGTParentOpportunity()
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        try
        {
            List<RecordType> gId=[SELECT
                            Id
                      FROM
                            RecordType
                      WHERE
                            sObjectType='Opportunity'
                      AND
                            DeveloperName='GreenTree'];
            Opportunity opp=[select
                                    id
                            from
                                    Opportunity
                            where 
                                    name='TestingOpp' Limit 1];   
            Account acc=[select
                                    id
                            from
                                    Account 
                            where 
                                    name='Test Account1' Limit 1];  
            Campaign cp=[select
                                    id
                            from
                                    Campaign 
                            where 
                                    name='TestCamp' Limit 1];      
            
            Opportunity gOpp = new Opportunity();
            gOpp.Name='GoppName';
            gOpp.AccountId=acc.Id;
            gOpp.RecordTypeId=gId.get(0).Id;
            gOpp.ForecastCategoryName='Commit';
            gOpp.LeadSource='A001';
            gOpp.CampaignId=cp.Id;
            gOpp.CloseDate=system.today();
            gOpp.Current_Processor__c='1st federal financial';
            gOpp.StageName='Initial Call Needed';
            gOpp.RapId_Opportunity__c=opp.Id;
            insert gOpp;
            
            Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
            gt.opportunity__c=gOpp.Id;
            insert gt;
            
            

            gOpp.GTF_Qualified__c='No';
            update gOpp;    
        }
        catch(Exception e)
        {
        }
        Test.stopTest();
    } 
   
    static testMethod voId unitTestCreateGreenTreeOpp()
    {
        Test.startTest();
        try
        {
            List<RecordType> gId=[SELECT
                                        Id
                                  FROM
                                        RecordType
                                  WHERE
                                        sObjectType='Opportunity'
                                  AND
                                        DeveloperName='GreenTree'];
            
            User u=[SELECT 
                        Id 
                    FROM 
                        User 
                    WHERE 
                        Profile.Name='System Administrator'
                    AND 
                        isActive=true LIMIT 1];
            
            DistributorGreenTree__c g=new DistributorGreenTree__c();
            g.Name=u.Id;
            insert g;
            
            Account ac= new Account();
            ac.Name='testcase';
            insert ac;
            
            Campaign cp= new Campaign();
            cp.Name='cppName';
            insert cp;
           
            Opportunity opp = new Opportunity();
            opp.Name='oppName';
            opp.AccountId=ac.Id;
            opp.ForecastCategoryName='Commit';
            opp.LeadSource='A001';
            opp.CampaignId=cp.Id;
            opp.CloseDate=system.today();
            opp.Current_Processor__c='1st federal financial';
            opp.StageName='Credit Pulled';
            insert opp;
            
            opp.StageName='Pending Management Review';
            update opp;    
        }
        catch(Exception e)
        {
        }
        Test.stopTest();    
    }
    
    static testMethod voId unitTestCreateGTOppOnUpdate()
    {
        Test.startTest();
        try
        {
            List<RecordType> gId=[SELECT
                                        Id
                                  FROM
                                        RecordType
                                  WHERE
                                        sObjectType='Opportunity'
                                  AND
                                        DeveloperName='GreenTree'];
            
            User u=[SELECT 
                        Id 
                    FROM 
                        User 
                    WHERE 
                        Profile.Name='System Administrator'
                    AND 
                        isActive=true LIMIT 1];
            
            DistributorGreenTree__c g=new DistributorGreenTree__c();
            g.Name=u.Id;
            insert g;
            
            Account ac= new Account();
            ac.Name='testcase';
            insert ac;
            
            Campaign cp= new Campaign();
            cp.Name='cppName';
            insert cp;
           
            Opportunity opp = new Opportunity();
            opp.Name='oppName';
            opp.AccountId=ac.Id;
            opp.ForecastCategoryName='Commit';
            opp.LeadSource='A001';
            opp.CampaignId=cp.Id;
            opp.CloseDate=system.today();
            opp.Current_Processor__c='1st federal financial';
            opp.StageName='Credit Pulled';
            insert opp;
            
            opp.recordTypeId=gId.get(0).id;
            update opp;    
        }
        catch(Exception e)
        {
            System.debug(e);
        }
        Test.stopTest();    
    }    
    
    static testmethod void populateLdSourceonRenewalOppsTest() {
       
        Test.startTest(); 
        Account acc = new Account(Name='Account1');
        insert acc;
        
        Opportunity opp = new Opportunity(Name = 'Opp 2016',AccountId=acc.id,CloseDate=System.Today(),StageName='Closed Won',LeadSource='Web');
        insert opp;
        
        Opportunity oppnew = new Opportunity(Name = 'Opp 2017',AccountId=acc.id,CloseDate=System.Today(),StageName='Prospecting',Renewal__c=true);
        insert oppnew;
               
        Test.stopTest();
    }
}