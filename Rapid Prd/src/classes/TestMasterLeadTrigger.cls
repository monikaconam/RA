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
private class TestMasterLeadTrigger {

    static testMethod void biBeforeGlobalTest() {
        Test.startTest();

        User uRec =[select id,name from user where profile.name='System Administrator' and isactive=true Limit 1];
        System.runAs(uRec)
        {
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Account acc2 = new Account();
            acc2.name = 'Test Account1';
            acc2.BusinessType__c = 'testBusiness';
            insert acc2;
            
            Campaign  cm = new Campaign();
            cm.name = 'Test';
            cm.type='Internet';
            insert cm;
            
            Opportunity opp = new Opportunity();
            opp.name = 'testOpportunity';
            opp.leadSource = 'web';
            opp.stageName = 'Prospecting';
            opp.closeDate = System.today() + 20;
            opp.campaignId = cm.Id;
            opp.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp.closeDate = System.today() + 50;
            opp.accountId = acc.id;
            insert opp;
            
            RC_Status__c test_status = new RC_Status__c();
            test_status.Name = 'RC Open';
            test_status.Local_Status__c = 'Rock Connections Test';
            insert test_status;
              
            RC_Status__c test_rcs = new RC_Status__c();
            test_rcs = RC_Status__c.getInstance('RC Open');
            system.debug(' *** ' + test_rcs.Local_Status__c);
              
            Lead l = new Lead(
            FirstName = 'Test',
            LastName  = 'Testofferson',
            Company   = 'Test Industries LLC',
            Email     = 'test@test.com',
            Phone     = '18005551111',
            RC_Status__c = 'RC Open',
           // Referral_Merchant_ID__c =acc.id,
            Status = 'Test');
              
            insert l;
            
            
            Lead l2 = new Lead(
            FirstName = 'Test',
            LastName  = 'Testofferson',
            Company   = 'Test Industries LLC',
            Email     = 'test@test.com',
            Phone     = '18005551111',
            RC_Status__c = 'RC Open',
           // Referral_Merchant_ID__c =acc2.id,
            Status = 'Duplicate - Customer');
            insert l2;
        }
        Test.stopTest();
    }
    
    static testMethod void biPopulateLeadSourceIfReferral() {
        Test.startTest();

        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
              
        Lead l = new Lead(
        FirstName = 'Test',
        LastName  = 'Testofferson',
        Company   = 'Test Industries LLC',
        Email     = 'test@test.com',
        Phone     = '18005551111',
        Referral_Merchant_ID__c =acc.id,
        Status = 'Test');   
        insert l;
        Test.stopTest();
    }
    
    static testMethod void buBeforeGlobalTest() {
        Test.startTest();
        
        
        User uRec =[select id,name from user where profile.name='System Administrator' and isactive=true Limit 1];
        System.runAs(uRec)
        {
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Account acc2 = new Account();
            acc2.name = 'Test Account2';
            acc2.BusinessType__c = 'testBusiness';
            insert acc2;
            
            Campaign  cm = new Campaign();
            cm.name = 'Test';
            cm.type='Internet';
            insert cm;
            
            Opportunity opp = new Opportunity();
            opp.name = 'testOpportunity';
            opp.leadSource = 'web';
            opp.stageName = 'Prospecting';
            opp.closeDate = System.today() + 20;
            opp.campaignId = cm.Id;
            opp.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp.closeDate = System.today() + 50;
            opp.accountId = acc.id;
            insert opp;
            
            Opportunity opp2 = new Opportunity();
            opp2.name = 'testOpportunity';
            opp2.leadSource = 'web';
            opp2.stageName = 'Prospecting';
            opp2.closeDate = System.today() + 20;
            opp2.campaignId = cm.Id;
            opp2.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp2.closeDate = System.today() + 50;
            opp2.accountId = acc2.id;
            insert opp2;
            
            RC_Status__c test_status = new RC_Status__c();
            test_status.Name = 'RC Open';
            test_status.Local_Status__c = 'Rock Connections Test';
            insert test_status;
              
            RC_Status__c test_rcs = new RC_Status__c();
            test_rcs = RC_Status__c.getInstance('RC Open');
            system.debug(' *** ' + test_rcs.Local_Status__c);
              
            Lead l = new Lead(
            FirstName = 'Test',
            LastName  = 'Testofferson',
            Company   = 'Test Industries LLC',
            Email     = 'test@test.com',
            Phone     = '18005551111',
            RC_Status__c = 'RC Open',
           // Referral_Merchant_ID__c =acc.id,
            Principal_2_Last_Name__c='TEST',
            Status = 'Test');
              
            insert l;
            
           // l.Referral_Merchant_ID__c =acc2.id;
            L.Status='Converted';
            update l;
        }
        Test.stopTest();
    }
    
    static testMethod void auAfterLeadCreatePrincipal2test() {
            Test.startTest();
             
            
            Lead l = new Lead();
            
            l.Status = 'Inital Call Needed';
            l.LeadSource = 'A001';
            l.Company = 'Krell Audio/Video';
            l.Legal_Business_Name__c = 'Krell Audio/Video';
            l.Phone = '3132329090';
            l.Type_Of_Business__c = 'Entertainment';
            l.Operating_Since__c = 'More than 2 years';
            l.DateBusinessStarted__c = system.today();
            l.Owned_Business_Since__c = system.today();
            l.FirstName = 'Jake';
            l.LastName = 'Jones';
            l.Principal_1_Street_Address__c = '1000 West Street';
            l.Principal_1_City__c = 'Washington';
            l.Principal_1_State__c = 'DC';
            l.Principal_1_Zip__c = '20012';
            l.Monthly_Visa_Mastercard_Volume__c ='80,000 - 100,000';
            
            l.Principal_2_First_Name__c = 'Jerry';
            l.Principal_2_Last_Name__c = 'Jones';
            l.Principal_2_Street_Address__c = '1000 Dallas Way';
            l.Principal_2_City__c = 'Dallas';
            l.Principal_2_State__c = 'TX';
            l.Principal_2_Zip__c = '30012';        
            
            insert l;
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Campaign  cm = new Campaign();
            cm.name = 'Test';
            cm.type='Internet';
            insert cm;
            
            Opportunity opp = new Opportunity();
            opp.name = 'testOpportunity';
            opp.leadSource = 'web';
            opp.stageName = 'Prospecting';
            opp.closeDate = System.today() + 20;
            opp.campaignId = cm.Id;
            opp.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp.closeDate = System.today() + 50;
            opp.accountId = acc.id;
            insert opp;
            
            String id = l.id;
        
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(id);
             
            LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
            lc.setConvertedStatus(convertStatus.MasterLabel);
        
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            if(lcr.isSuccess())
            {
              String cId = lcr.getContactId();
            }
                    
            Test.stopTest();
        }
        
        static testmethod void LeadOwnerFromCampaignForCalcLeadsTest()
        {
            Test.startTest();
            User u=[select id from user where profile.name ='System Administrator' and isactive=true Limit 1];
            CalcLeadCreator__C cstUser=new CalcLeadCreator__C();
            cstUser.name=u.id;
            insert cstUser;
                  
               
            Campaign cTest=new Campaign(name='Test Campagin',type='Internet',default_opportunity_owner__C=u.id,default_lead_owner__c=u.id);
            insert cTest;
             
            System.runAs(u) {
            Lead lTest=new Lead();
            lTest.Status='Calling - No Contact Made';
            lTest.LeadSource='Partner-Web';
            lTest.Company='test company';
            lTest.Phone='415789415';
            lTest.Lastname='lastname';
            lTest.Campaign_Name_Upload__c=cTest.id;     
            insert lTest;
            }
            
            Test.stopTest();
        
        }
        static testMethod void LeadSharingInsertTest()
        {
            Test.startTest();
            User u = new User();
            u.Alias = 'rc';
            u.Username = 'rc@test.com';
            u.FirstName = 'Test';
            u.LastName = 'Testo';
            u.Email = 'rc@test.com';
            u.EmailEncodingKey = 'UTF-8';
            u.LanguageLocaleKey = 'en_US';
            u.LocaleSidKey = 'en_US';
            u.TimeZoneSidKey = 'America/New_York';
            u.ProfileId='00e30000000h0BsAAI';
            u.UserPermissionsMarketingUser = true;
            u.UserPermissionsOfflineUser = true;
            u.IsActive = true;
            Database.SaveResult sr = Database.insert(u);
            String UserId = sr.getId();
            
            User_Default__c ud = new User_Default__c();
            ud.Name = 'Rock Connections';
            ud.UserId__c = UserId;
            insert ud;
            
            // Test LeadSharing afterInsert trigger
            Lead l = new Lead(
               FirstName = 'Test',
               LastName  = 'Testofferson',
               Company   = 'Test Industries LLC',
               Email     = 'test@test.com',
               Phone     = '1-800-555-TEST'
            );
            
            l.OwnerId    = UserId;
            l.LeadSource = 'Lead Generation';
            Database.SaveResult sr3 = Database.insert(l);
            
            l.Id = sr3.getId();
            update l;
            Test.stopTest();
        }  
        
        static testMethod void LeadSharingUpdateTest()
        {
            Test.startTest();
            User u = new User();
            u.Alias = 'rc';
            u.Username = 'rc@test2.com2';
            u.FirstName = 'Rock';
            u.LastName = 'Connections';
            u.Email = 'rc2@test.com';
            u.EmailEncodingKey = 'UTF-8';
            u.LanguageLocaleKey = 'en_US';
            u.LocaleSidKey = 'en_US';
            u.TimeZoneSidKey = 'America/New_York';
            u.ProfileId='00e30000000h0BsAAI';
            u.UserPermissionsMarketingUser = true;
            u.UserPermissionsOfflineUser = true;
            u.IsActive = true;
            Database.SaveResult sr = Database.insert(u);
            String UserId = sr.getId();
            
            User u2 = new User();
            u2.Alias = 'sectest';
            u2.Username = 'swap@test.com';
            u2.FirstName = 'Test';
            u2.LastName = 'Secundo';
            u2.Email = 'swap@test.com';
            u2.EmailEncodingKey = 'UTF-8';
            u2.LanguageLocaleKey = 'en_US';
            u2.LocaleSidKey = 'en_US';
            u2.TimeZoneSidKey = 'America/New_York';
            u2.ProfileId='00e30000000h0BsAAI';
            u2.UserPermissionsMarketingUser = true;
            u2.UserPermissionsOfflineUser = true;
            u2.IsActive = true;
            Database.SaveResult sr2 = Database.insert(u2);
            String SecondId = sr2.getId();
                        
            Lead l = new Lead(
               FirstName = 'Test',
               LastName  = 'Testofferson',
               Company   = 'Test Industries LLC',
               Email     = 'test@test.com',
               Phone     = '1-800-555-TEST'
            );
            
            l.OwnerId    = UserId;
            l.LeadSource = 'Lead Generation';
            Database.SaveResult sr3 = Database.insert(l);
            
            l.Id = sr3.getId();
            l.ownerID=SecondId;
            update l;
            
            Test.stopTest();
      
        }
        
        static testMethod void UpdatePrimaryCampaignSourceTest()
        {
            Test.startTest();
           // DS-CONAM  CALC.ApexTesting();   
            Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
            insert cTest;
    
            // create a Lead
            Lead ltest=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Initial Call Made');
            insert ltest;     
            
            CampaignMember newMember = new CampaignMember (campaignid=cTest.id, leadid=lTest.id,status='sent');
            insert newMember;           
            
            newMember.status='responded';
            update newMember;
            
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(ltest.id);
            lc.setDoNotCreateOpportunity(false);
            lc.setConvertedStatus('Converted');
            
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            Test.stopTest();      

        } 
        
        static testMethod void test()
        {
            Test.startTest();
             
            
            
            Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();
            newDCBS.Name = 'Duplicate Criteria';
            newDCBS.Match_First_Name__c = true;
            newDCBS.Match_Last_Name__c = true;
            newDCBS.Match_Email__c = true;
            newDCBS.Match_Phone__c = true;
            newDCBS.Match_Account_Name__c = true;
            insert newDCBS;
            
          
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Contact con= new Contact();
            con.AccountId = acc.Id;
            con.FirstName='test';
            con.LastName = 'test';
            con.email='test@test.com';
            con.phone='1234567890';
            insert con;
            
            Contact con2= new Contact();
            con2.AccountId = acc.Id;
            con2.FirstName='test';
            con2.LastName = 'test';
            con2.email='test@test.com';
            con2.phone='1234567890';
            try
            {
                insert con2;
            }
            catch(Exception e)
            {
                
            }
            
            List<Duplicate_Contact_Blocker_Setup__c> dcbs = [SELECT 
                                                                    Id, Name, Match_Phone__c, Match_Last_Name__c,
                                                                    Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                            FROM 
                                                                    Duplicate_Contact_Blocker_Setup__c];
                                                            
            delete dcbs;
            /** Commented By MK -Conam **/
           // Boolean result=LeadTriggerHandler.checkForContactDup(con2);          
                    
            Test.stopTest();
            
            
        } 
         static testMethod void test2()
        {
            Test.startTest();
             

            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Contact con= new Contact();
            con.AccountId = acc.Id;
            con.FirstName='test';
            con.LastName = 'test';
            con.email='test@test.com';
            con.phone='1234567890';
            insert con;
         
            
            List<Duplicate_Contact_Blocker_Setup__c> dcbs = [SELECT 
                                                                    Id, Name, Match_Phone__c, Match_Last_Name__c,
                                                                    Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                            FROM 
                                                                    Duplicate_Contact_Blocker_Setup__c];
                                                            
            delete dcbs;
            Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();
            newDCBS.Name = 'Duplicate Criteria';
            newDCBS.Match_First_Name__c = true;
            newDCBS.Match_Last_Name__c = true;
            newDCBS.Match_Email__c = true;
            newDCBS.Match_Phone__c = true;
            newDCBS.Match_Account_Name__c = true;
            insert newDCBS;
            
            /** Commented By MK -Conam **/
            //Boolean result=LeadTriggerHandler.checkForContactDup(con);
            
            delete newDCBS;
            
            newDCBS = new Duplicate_Contact_Blocker_Setup__c();
            newDCBS.Name = 'Duplicate Criteria';
            newDCBS.Match_First_Name__c = false;
            newDCBS.Match_Last_Name__c = false;
            newDCBS.Match_Email__c = false;
            newDCBS.Match_Phone__c = false;
            newDCBS.Match_Account_Name__c = false;
            insert newDCBS;
            
            /** Commented By MK -Conam **/
            // result=LeadTriggerHandler.checkForContactDup(con);
            
            Test.stopTest();
        } 
        
        @isTest(SeeAllData=true)
        static void myUnitTest() 
        {
            List <PartnerNetworkConnection> pncList = [select
                                                            id, connectionname
                                                    from
                                                            PartnerNetworkConnection
                                                    where
                                                            connectionname = 'Rock Connections'
                                                    and
                                                            ConnectionStatus = 'Accepted'];

            Lead lTemp = new Lead();
            Lead lTemp2 = new Lead();
            lTemp.status = 'Calling - No Contact Made';
            lTemp.leadSource = 'Radio';
            lTemp.company = 'test company';
            lTemp.phone = '415789415';
            lTemp.lastname = 'lastname';
            lTemp.RC_Lead_Type__c = 'RAFF';
            insert lTemp;
            
            lTemp2.status = 'Calling - No Contact Made';
            lTemp2.leadSource = 'Radio';
            lTemp2.company = 'test company';
            lTemp2.phone = '415789415';
            lTemp2.lastname = 'lastname';
            lTemp2.RC_Lead_Type__c = 'RAFF2';
            insert lTemp2;
            
            System.debug(lTemp.ownerID);
    
            List <PartnerNetworkRecordConnection> lstShareRecords = new List <PartnerNetworkRecordConnection> ();
    
            for (PartnerNetworkConnection network: pncList) 
            {
    
                PartnerNetworkRecordConnection newRecord = new PartnerNetworkRecordConnection();
    
                newRecord.ConnectionId = network.Id;
                newRecord.LocalRecordId = lTemp.id;
                // newrecord.RelatedRecords = 'Lead';
                newRecord.SendClosedTasks = false;
                newRecord.SendOpenTasks = false;
                newRecord.SendEmails = false;
                
                PartnerNetworkRecordConnection newRecord2 = new PartnerNetworkRecordConnection();
    
                newRecord2.ConnectionId = network.Id;
                newRecord2.LocalRecordId = lTemp2.id;
                // newrecord.RelatedRecords = 'Lead';
                newRecord2.SendClosedTasks = false;
                newRecord2.SendOpenTasks = false;
                newRecord2.SendEmails = false;
    
                lstShareRecords.add(newRecord);
                lstShareRecords.add(newRecord2);
            }
                
                insert lstShareRecords;
        }
}