@isTest 
public class Five9VoicemailScreenpopTest {
    static testMethod void createLeadPositiveCase() {
        test.startTest();
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/F9VoiceMail/';  
        req.addParameter('ani', '1925948151');
        req.addParameter('dnis', '+1925948151');
        req.addParameter('leadSource', 'Voicemail');
        req.addParameter('company', 'Five9 Generated Lead');
        req.addParameter('lastName', 'Five9 Generated Lead');
        req.addParameter('status', 'Initial Call needed');
        req.addParameter('ownerId', '123456789');
        
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        
        string result =Five9VoicemailScreenpop.leadCreater();
        test.stopTest();
        system.assertEquals('SUCCESS', result);
        
    }
    static testMethod void createLeadAtleastOnePositiveCase() {
        test.startTest();
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/F9VoiceMail/';  
        req.addParameter('ani', '1925948151');
        req.addParameter('dnis', '+1925948150');
        req.addParameter('leadSource', 'Voicemail');
        req.addParameter('company', 'Five9 Generated Lead');
        req.addParameter('lastName', 'Five9 Generated Lead');
        req.addParameter('status', 'Initial Call needed');
        req.addParameter('ownerId', '123456789');
        
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        string result =Five9VoicemailScreenpop.leadCreater();
        test.stopTest();
        system.assertEquals('SUCCESS', result);        
    }    
    static testMethod void createLeadEmailCase() {
        contact c = new contact();
        c.LastName='test data';
        c.MobilePhone='+1925948150';
        Account a = new Account();
        a.Name='test';
        a.BusinessType__c='Large Business';
        insert a;
        //        Account a = [SELECT ID FROM ACCOUNT LIMIT 1];        
        c.AccountId=a.id;
        insert c;
        Five9VoicemailScreenpopSettings__c item = new Five9VoicemailScreenpopSettings__c();
        item.Salesforce_User_Email__c='test@mail.com';
        item.Name='abc';
        insert item;
        test.startTest();
        
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/F9VoiceMail/';  
        req.addParameter('ani', '1925948151');
        req.addParameter('dnis', '1925948150');
        req.addParameter('leadSource', 'Voicemail');
        req.addParameter('company', 'Five9 Generated Lead');
        //req.addParameter('lastName', 'Five9 Generated Lead');
        req.addParameter('status', 'Initial Call needed');
        req.addParameter('ownerId', '123456789');
        
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        string result =Five9VoicemailScreenpop.leadCreater();
        test.stopTest();
        system.assertNotEquals('SUCCESS', result);        
    }
    
    static testMethod void createLeadOneContactCase() {
        contact c = new contact();
        c.LastName='test data';
        c.Phone='1925948150';
        Account a = new Account();
        a.Name='test';
        a.BusinessType__c='Large Business';
        insert a;       
        c.AccountId=a.id;
        insert c;
        Five9VoicemailScreenpopSettings__c item = new Five9VoicemailScreenpopSettings__c();
        item.Salesforce_User_Email__c='test@mail.com';
        item.Name='abc';
        insert item;
        test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/F9VoiceMail/';  
        req.addParameter('ani', '1925948150');
        req.addParameter('dnis', '1925948150');
        req.addParameter('leadSource', 'Voicemail');
        req.addParameter('company', 'Five9 Generated Lead');
        req.addParameter('lastName', 'Five9 Generated Lead');
        req.addParameter('status', 'Initial Call needed');
        req.addParameter('ownerId', '123456789');
        
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        string result =Five9VoicemailScreenpop.leadCreater();
        
        test.stopTest();
        system.assertEquals('SUCCESS', result);        
    }
}