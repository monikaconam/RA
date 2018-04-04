@isTest

public class TestOpportunityOffer
{
    private static testMethod void testOppOffer() 
    { 
        Test.startTest();
        OpportunityOffer oppOff = new OpportunityOffer();
        oppOff.OfferID ='';
        oppOff.Amount =100;
        oppOff.DailyCollection=1010;
        oppoff.Duration= 100;
        oppOff.ProductName='TestProduct';
        oppOff.Purchase = 1000;
        oppOff.DailyPayment =10101;
        oppOff.NumOfPayments=100;
        oppOff.ExternalID='';
        oppOff.Source='Web';
        oppOff.Notes ='TestNotes';
        oppOff.LOC_Fee =1010;
        oppOff.LOC_Limit=10;
        oppOff.LOC_Drawterm =1212;
        oppOff.LOC_totalterm=1211;
        Test.stopTest();
    }
}