@isTest
private class TestUpdateLastActivityFields{
    
    @isTest static void updateLastActTest() {
        
        Test.startTest();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        UserRole r = new UserRole(DeveloperName = 'Business_Development', Name = 'Business Development');
        insert r;
        
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, UserRoleId = r.Id,
                            TimeZoneSidKey='America/Los_Angeles', UserName='standarduseeeer@testorg.com');
        insert u;
        
        User u2 = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, UserRoleId = r.Id,
                            TimeZoneSidKey='America/Los_Angeles', UserName='stndrdusrtesttest22@testorg.com');
                            
        insert u2;
        
        System.runAs(u){
            Account acc = new Account();
            acc.Name = 'Test Acc 1';
            insert acc;
                        
            Campaign camp = new Campaign();
            camp.Name = 'Test Camp';
            camp.Type = 'Internet';
            insert camp;
            
            Contact con = new Contact();
            con.LastName = 'Test con1';
            con.AccountId = acc.id;
            insert con;
            
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp 1';
            opp.StageName = 'Credit Pulled';
            opp.LeadSource = 'Chat';
            opp.AccountId = acc.Id;
            opp.CloseDate = System.Today();
            opp.CampaignId = camp.Id;
            insert opp;
            
            Task tsk = new task();
            tsk.Subject = 'Call Test';
            tsk.OwnerId = u.Id;
            tsk.Five9__Five9HandleTime__c = '00:03:10';
            tsk.Status = 'In Progress';
            tsk.Priority = 'Normal';
            tsk.WhoId = con.Id;
            insert tsk;
                        
            System.assertEquals(acc.Last_BD_Call_Activity__c,null);
            System.assertEquals(acc.Last_BD_Owner_Call_Activity__c,tsk.CreatedDate);
            
            Task tsk2 = new task();
            tsk2.Subject = 'Call Test 2';
            tsk2.OwnerId = u.Id;
            tsk2.Five9__Five9HandleTime__c = '00:02:10';
            tsk2.Status = 'In Progress';
            tsk2.Priority = 'Normal';
            tsk2.WhatId = opp.Id;
            insert tsk2;
            
            System.assertEquals(acc.Last_BD_Call_Activity__c,null);
            System.assertEquals(acc.Last_BD_Owner_Call_Activity__c,tsk2.CreatedDate);            
                        
            BatchUpdateLastActivityFields batch1 = new BatchUpdateLastActivityFields();
            Database.executeBatch(batch1);
        }
        
        Test.stopTest();
    }
    
    @isTest static void updateLastActTest2() {
        
        Test.startTest();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        UserRole r = new UserRole(DeveloperName = 'Business_Development', Name = 'Business Development');
        insert r;
        
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, UserRoleId = r.Id,
                            TimeZoneSidKey='America/Los_Angeles', UserName='standarduseeeer@testorg.com');
        insert u;
        
        User u2 = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, UserRoleId = r.Id,
                            TimeZoneSidKey='America/Los_Angeles', UserName='stndrdusrtesttest22@testorg.com');
                            
        insert u2;
                
        System.runAs(u){
        
            Account acc2 = new Account();
            acc2.Name = 'Test Acc 2';
            insert acc2;
            
            acc2.OwnerId = u2.Id;
            update acc2;
            
            Campaign camp = new Campaign();
            camp.Name = 'Test Camp';
            camp.Type = 'Internet';
            insert camp;
            
            Contact con2 = new Contact();
            con2.LastName = 'Test con2';
            con2.AccountId = acc2.id;
            insert con2;
            
            Opportunity opp2 = new Opportunity();
            opp2.Name = 'Test Opp 2';
            opp2.StageName = 'Credit Pulled';
            opp2.LeadSource = 'Chat';
            opp2.AccountId = acc2.Id;
            opp2.CloseDate = System.Today();
            opp2.CampaignId = camp.Id;
            insert opp2;
            
            Task tsk3 = new task();
            tsk3.Subject = 'Call Test';
            tsk3.OwnerId = u.Id;
            tsk3.Five9__Five9HandleTime__c = '00:13:10';
            tsk3.Status = 'In Progress';
            tsk3.Priority = 'Normal';
            tsk3.WhatId = acc2.Id;
            insert tsk3;
                        
            System.assertEquals(acc2.Last_BD_Call_Activity__c,tsk3.CreatedDate);
            System.assertEquals(acc2.Last_BD_Owner_Call_Activity__c,null);
            
            acc2.OwnerId = u.Id;
            
            Task tsk4 = new task();
            tsk4.Subject = 'Call Test';
            tsk4.OwnerId = u.Id;
            tsk4.Five9__Five9HandleTime__c = '00:02:00';
            tsk4.Status = 'In Progress';
            tsk4.Priority = 'Normal';
            tsk4.WhatId = opp2.Id;
            insert tsk4;
            
            System.assertEquals(acc2.Last_BD_Call_Activity__c,tsk3.CreatedDate);
            System.assertEquals(acc2.Last_BD_Owner_Call_Activity__c,tsk4.CreatedDate);
            
            BatchUpdateLastActivityFields batch1 = new BatchUpdateLastActivityFields();
            Database.executeBatch(batch1);
            
        }
        Test.stopTest();
    }
}