@isTest
Public Class TestGetFeedBackHandler
{
    static testMethod void TestGetFeedBackHandlerMethod()
    {
        try{ 
            Account acc = new Account();
            acc.name = 'Test Account1';
            acc.BusinessType__c = 'testBusiness';
            insert acc;
            
            Campaign  cm = new Campaign();
            cm.Name = 'Test';
            cm.Type='Internet';
            insert cm;
           
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = 'test';
            con.email='test@test.com';
            insert con;
            
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
            
            OpportunityContactRole oppConRole =  new OpportunityContactRole();
            oppConRole.OpportunityId =  opp.Id;
            oppConRole.ContactId = con.Id;
            oppConRole.IsPrimary = True;
            insert oppConRole;
              
            ID fSurvey=Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Funding Survey').getRecordTypeId();
            ID pfSurvey=Schema.SObjectType.GetFeedback_Survey__c.getRecordTypeInfosByName().get('Client Service Survey').getRecordTypeId();
            
            List<GetFeedback_Survey__c > gfsList = new List<GetFeedback_Survey__c >();
             
            GetFeedback_Survey__c  getSurvey   = new  GetFeedback_Survey__c();
            getSurvey.RecordTypeId = fSurvey; 
            getSurvey.Reference_Company_Name__c = 'Test Company Name';
            getSurvey.opportunity__c = opp.id;
            getSurvey.Reference_Name__c = 'Test Name';
            getSurvey.Reference_Phone_Number__c = '9898897988';
            gfsList.add(getSurvey);
            
            
            GetFeedback_Survey__c  getSurvey1   = new  GetFeedback_Survey__c();
            getSurvey1.RecordTypeId = fSurvey; 
            getSurvey1.Reference_Company_Name__c = 'Test Company Name';
            getSurvey1.opportunity__c = opp.id;
            getSurvey1.Reference_Name__c = 'TestName';
            getSurvey1.Reference_Phone_Number__c = '9898897988';
            gfsList.add(getSurvey1);
            
            if(!gfsList.isEmpty()){
               insert gfsList;
            }
        }
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
}