@isTest
public class TestFillSurveyChoices {
   Static testMethod void FillSurveyChoicesTest(){
       Test.startTest();
       
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.Name = 'Test';
        cm.Type='Internet';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.AccountId = acc.id;
        opp.email_address__c='test@test.com';
        insert opp;
       
       Id recordTypeIdFunding= Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Funding Survey').getRecordTypeId();
       Id recordTypeIdClient= Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Client Service Survey').getRecordTypeId();
       
       GetFeedback_Survey__c gt=new GetFeedback_Survey__c();
       gt.recordtypeid = recordTypeIdFunding;
       gt.BA_Service_Rating_Comments__c='I didn\'t that the business advisor was knowledgeable enough about the details of my financing / funding.,I didn\'t get called back when promised.,My business advisor wasn\'t available to me when I tried to reach him/her.,My business advisor didn\'t set accurate expectations about the funding process.';     
       gt.Overall_Satisfaction_Comments__c='The application process was harder or more time consuming than I expected.,It took too long to get the approval decision from underwriting.,there were too many conditions prior to actually funding my account.,I experienced problems with customer service.,It took too long to get the decision from underwriting.,I was given the expectation I would be approved, but the situation seemed to change in underwriting.,The underwriting process was overly intrusive and disruptive.';
       gt.Opportunity__c = opp.Id;
       insert gt;
       
       GetFeedback_Survey__c gt1=new GetFeedback_Survey__c();
       gt1.recordtypeid = recordTypeIdClient;
       gt1.BA_Service_Rating_Comments__c='I didn\'t feel that the business advisor was knowledgeable enough about the details of my financing.I didn\'t get called back when promised.My business advisor wasn\'t available to me when I tried to reach him/her.My business advisor didn\'t set accurate expectations about the funding process.';
       gt1.Overall_Satisfaction_Comments__c='The application process was harder or more time consuming than I expected.It took too long to get the approval decision from underwriting.there were too many conditions prior to actually funding my account.I experienced problems with customer service.It took too long to get the decision from underwriting.I was given the expectation I would be approved but the situation seemed to change in underwriting.The underwriting process was overly intrusive and disruptive.';
       gt1.Opportunity__c = opp.Id;
       insert gt1;
       
       Test.stopTest();

   }
}