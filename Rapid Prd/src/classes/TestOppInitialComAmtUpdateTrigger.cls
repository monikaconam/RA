@isTest

private class TestOppInitialComAmtUpdateTrigger{ 

    public static testMethod voId oppInitialComAmtUpdateTest1(){
        
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
                                   
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name='oppname1';
        gOpp1.accountId=ac.Id;
        gOpp1.RecordTypeId=gId.get(0).Id;
        gOpp1.ForecastCategoryName='Commit';
        gOpp1.LeadSource='A001';
        gOpp1.CampaignId=cp.Id;
        gOpp1.CloseDate=system.today();
        gOpp1.Current_Processor__c='1st federal financial';
        gOpp1.StageName='Initial Call Needed';
        gOpp1.Renewal_Funded_Amount__c = 1000;
        insert gOpp1;
        
        Green_Tree_Oppy_Extension__c gt1=new Green_Tree_Oppy_Extension__c();
        gt1.opportunity__c=gOpp1.Id;
        gt1.Amount__c= 10000;
        gt1.Amount_Sold__c= 1000;
        
        insert gt1;
               
        
        Test.stopTest();
    }
    public static testMethod voId oppInitialComAmtUpdateTest2(){
        
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
                                   
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name='oppname1';
        gOpp1.accountId=ac.Id;
        gOpp1.RecordTypeId=gId.get(0).Id;
        gOpp1.ForecastCategoryName='Commit';
        gOpp1.LeadSource='A001';
        gOpp1.CampaignId=cp.Id;
        gOpp1.CloseDate=system.today();
        gOpp1.Current_Processor__c='1st federal financial';
        gOpp1.StageName='Initial Call Needed';
        gOpp1.Renewal_Funded_Amount__c = 1000;
        insert gOpp1;
        
        Green_Tree_Oppy_Extension__c gt1=new Green_Tree_Oppy_Extension__c();
        gt1.opportunity__c=gOpp1.Id;
        gt1.Amount__c= 10000;
        gt1.Amount_Sold__c= 1000;
        
        insert gt1;
        
                
        Test.stopTest();
    }
    public static testMethod voId oppInitialComAmtUpdateTest3(){
        
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
                                   
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name='oppname1';
        gOpp1.accountId=ac.Id;
        gOpp1.RecordTypeId=gId.get(0).Id;
        gOpp1.ForecastCategoryName='Commit';
        gOpp1.LeadSource='A001';
        gOpp1.CampaignId=cp.Id;
        gOpp1.CloseDate=system.today();
        gOpp1.Current_Processor__c='1st federal financial';
        gOpp1.StageName='Initial Call Needed';

        gOpp1.Renewal_Funded_Amount__c = 1000;
        insert gOpp1;
        
        Green_Tree_Oppy_Extension__c gt1=new Green_Tree_Oppy_Extension__c();
        gt1.opportunity__c=gOpp1.Id;
        gt1.Amount__c= 10000;
        gt1.Amount_Sold__c= 1000;
        
        insert gt1;
        
        gOpp1.Renewal_Funded_Amount__c = 200;
        update gOpp1;
        
        
        
        Test.stopTest();
    }
    public static testMethod voId oppInitialComAmtUpdateTest4(){
        
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
                                   
        Opportunity gOpp1 = new Opportunity();
        gOpp1.name='oppname1';
        gOpp1.accountId=ac.Id;
        gOpp1.RecordTypeId=gId.get(0).Id;
        gOpp1.ForecastCategoryName='Commit';
        gOpp1.LeadSource='A001';
        gOpp1.CampaignId=cp.Id;
        gOpp1.CloseDate=system.today();
        gOpp1.Current_Processor__c='1st federal financial';
        gOpp1.StageName='Initial Call Needed';
        gOpp1.Renewal_Funded_Amount__c = 1000;
        insert gOpp1;
        
        Green_Tree_Oppy_Extension__c gt1=new Green_Tree_Oppy_Extension__c();
        gt1.opportunity__c=gOpp1.Id;
        gt1.Amount__c= 10000;
        gt1.Amount_Sold__c= 1000;
        
        insert gt1;
        
        update gOpp1;
        
        Test.stopTest();
    }
}