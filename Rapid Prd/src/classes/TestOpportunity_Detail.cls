@isTest

public class TestOpportunity_Detail 
{
    public static testMethod void TestMethod1()
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        Opportunity_Detail  objOpp1 = new  Opportunity_Detail('oop','2343');
        Opportunity_Detail  objOpp2 = new  Opportunity_Detail('oop','2343','1234');
        Opportunity_Detail  objOpp3 = new Opportunity_Detail('oop','2343','1234','2345');
        
        Opportunity_Detail  objOpp4 = new Opportunity_Detail('oop','23435');
        objOpp4.opprtunityName ='TestopprtunityName';
        objOpp4.opportunityNumber = 'TestNumber';
        objOpp4.accountName ='TestaccountName';
        objOpp4.accountOwnerName ='TestaccountOwnerName';
        objOpp4.ownerName ='TestOwnerName';
        objOpp4.objOpportunity = new Opportunity();
        objOpp4.objOpportunity.Name ='TestOppName';
        Test.stopTest();
     
    }
}