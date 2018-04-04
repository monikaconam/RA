/*******************************************************************************************************************
** Module Name   : ContactRolesOppr
** Description   : Test class to cover ContactRolesOppr 
** Throws        : NA
** Calls         : NA
** Test Class    : it is a test class
** 
** Organization  : Algoworks
**
** Revision History:-
** Version             Date            Author           WO#         Description of Action
** 1.0                                   RainMaker                        Initial Version
******************************************************************************************************************/
/*
Modified
DS-CONAM - 03/04/2015
@isTest(SeeAllData = TRUE) TO false
changed Version from 16 to 32

*/


@isTest(SeeAllData = FALSE)
public with sharing class ContactRolesOppr_UnitTest 
{
    Static TestMethod Void estMethod1()
    {
        Test.startTest();
        CALC.ApexTesting();
        RecordType rt = [SELECT id FROM RecordType WHERE sobjecttype = 'Opportunity' AND name = 'New Opportunity' LIMIT 1 ];
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.Type = 'Internet';
        Insert camp;
        system.debug('>>>camp>>>'+camp);
        
        Account Acc = TestUtils.createAccount();
        system.debug('>>>Acc>>>'+Acc);
        Contact con = TestUtils.createContact(Acc);
        system.debug('>>con>>>>'+con);
                
        Opportunity opp = new Opportunity();
        opp.Name = 'TestingOpp';
        opp.LeadSource = 'A001';
        opp.CampaignId = camp.id;
        opp.CloseDate = date.newInstance(2007, 5, 5);
        opp.StageName = 'Prospecting';
        opp.Current_Processor__c = 'Blue Pay';
       
       //added DS-CONAM
        opp.accountid=acc.id;
        insert opp;
        system.debug('>>>opp>>>'+opp);
        
        OpportunityContactRole oppConRole = TestUtils.createOpportunityContactRole(con, opp);
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'TestingOpp';
        opp1.LeadSource = 'A001';
        opp1.CampaignId = camp.id;
        opp1.CloseDate = date.newInstance(2007, 5, 5);
        opp1.StageName = 'Prospecting';
        opp1.Current_Processor__c = 'Blue Pay';
        opp1.If_Renewal_Preceding_Opportunity__c = opp.id;
        
        //added DS-CONAM
        opp1.accountid=acc.id;
        insert opp1;
        system.debug('>>>opp1>>>'+opp);
        
        Test.stopTest();
        
    }

}