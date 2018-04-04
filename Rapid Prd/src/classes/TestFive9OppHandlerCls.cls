/*
@Name            : TestFive9OppHandlerCls
@Author          : SS Conam
@Date            : July 14, 2015
@Description     : Test class for Class Five9OppHandlerCls


@Revision History
@Author          : DS-Conam
@Date            : Nov 3, 2015
@Description     : Modified the Five9 Namespace from Five9PS to Five9LSP due to change in Five9 namespace.
*/

@isTest
private class TestFive9OppHandlerCls {

    static testMethod void myUnitTest() {
        
        Test.startTest();
        CALC.ApexTesting();
        Campaign camp = new Campaign();
        camp.Name = 'test Campaign';
        camp.Type = 'Internet';
        insert camp;
        
        Five9LSP__Five9_List__c five9 = new Five9LSP__Five9_List__c();
        five9.Name = 'Opportunities';
        five9.Five9LSP__Five9_User_Name__c = 'apiuser@RA-DD';
        five9.Five9LSP__Five9_User_Password__c = 'test123';
        five9.Five9LSP__Five9_Domain__c = 'RapidAdvance';
        five9.Five9LSP__Field_Mapping__c='{"number1":"business_phone_phone__c","Stage":"stagename","Renewal":"renewal__c","Percent Complete":"percent_paid_off__c","Opportunity Owner":"owner_email__c","Opportunity Number":"opportunity_number__c","Opportunity Name":"name"}';
        five9.Five9LSP__Controlling_Object__c='Opportunity';
        insert five9;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'New Opportunity';
        opp.StageName = 'Approved';
        opp.CampaignId = camp.id;
        opp.LeadSource = 'Email';
        opp.CloseDate = System.today();
        opp.ForecastCategoryName = 'Pipeline';
        insert opp;
        
        delete opp;
        Test.stopTest();

    }
}