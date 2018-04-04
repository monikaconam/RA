@isTest(seeAlldata=true)
/*
https://success.salesforce.com/ideaView?id=08730000000h6RwAAI
History objects are not accessible in test class hence using SeeAllData=true

*/
private class TestWebServiceforCalc
{
   
    static testMethod void unitTest()
    {
        Test.startTest();

        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        acc.DBA__c='AB & BA';
        acc.Legal_Name__c='AB & BA';
        acc.Campaign__c=camp.id;
        acc.Phone='4567891524';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'Frank';
        con.firstName='Tom';
        con.email='test@test.com';
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
        
        opp.stageName='Closed Won';
        update opp;
        
        List<OpportunityHistory> sd = [ SELECT Id, OpportunityId  FROM OpportunityHistory
                                                         WHERE OpportunityId = :opp.Id ];
        system.debug('>>>>>>>> sd  '+sd);
        
        WebServiceforCalc.getDeals('testing','AB and BA','tom','frank','test@test.com','18005551111');
        //110417 actual WebServiceforCalc.getDeals('testing','AB and BA','tom','frank','test@test.com','18005551111');
        WebServiceforCalc.getDeals('','','','','','');
        
        WebServiceforCalc.getCampaign('test@test.com');
        
        
        //WebServiceforCalc.getDeals('','AB & BA','','','','4567891524EXTENSION123');
        //WebServiceforCalc.getDeals('','AB & BA','','','','4567891524EXT');
        //WebServiceforCalc.getDeals('','AB & BA','','','','');
        
        Test.stopTest();
    
    }
}