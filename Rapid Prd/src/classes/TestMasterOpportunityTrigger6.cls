@isTest

private class TestMasterOpportunityTrigger6
{  
    static testMethod voId unitTestTrackGTFStageChanges()
    {
        Test.startTest();
        List<RecordType> gId=[SELECT
                                    Id
                                FROM
                                    RecordType
                                WHERE
                                    sObjectType='Opportunity'
                                AND
                                    DeveloperName='GreenTree' LIMIT 1];

        Account ac= new Account();
        ac.name='testcase';
        insert ac;
        
        Campaign cp= new Campaign();
        cp.name='cppname';
        insert cp;
       
        Opportunity opp = new Opportunity();
        opp.name='oppname';
        opp.accountId=ac.Id;
        opp.ForecastCategoryName='Commit';
        opp.LeadSource='A001';
        opp.CampaignId=cp.Id;
        opp.CloseDate=system.today();
        opp.Current_Processor__c='1st federal financial';
        opp.StageName='closed';
        insert opp;        
        
        Opportunity gOpp = new Opportunity();
        gOpp.name='Goppname';
        gOpp.accountId=ac.Id;
        gOpp.RecordTypeId=gId.get(0).Id;
        gOpp.ForecastCategoryName='Commit';
        gOpp.LeadSource='A001';
        gOpp.CampaignId=cp.Id;
        gOpp.CloseDate=system.today();
        gOpp.Current_Processor__c='1st federal financial';
        gOpp.StageName='Initial Call Needed';
        insert gOpp;
        
        Green_Tree_Oppy_Extension__c gt=new Green_Tree_Oppy_Extension__c();
        gt.opportunity__c=gOpp.Id;
        insert gt;
        
        
    }
}