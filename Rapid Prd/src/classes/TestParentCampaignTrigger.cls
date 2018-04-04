@isTest

private class TestParentCampaignTrigger
{
    static testMethod void campaignMismatchingFundingChannel()
    {
        test.startTest();
        Campaign cmp= new Campaign();
        cmp.Name = 'Test Campaign';
        cmp.Type= 'Partners';
        cmp.Payment_Type__c= 'Pay-Per-Funding';
        insert cmp;
        
        Campaign pCamp= new Campaign();
        pCamp.Name= 'Test Parent Campaign';
        pCamp.Type= 'Partners';
        pCamp.Payment_Type__c= 'Pay-Per-Funding';
        pCamp.ParentId= cmp.Id;
        insert pCamp;
        
        
        Campaign pCamp2= new Campaign();
        pCamp2.Name= 'Test Parent Campaign';
        pCamp2.Type= 'Partners';
        pCamp2.Payment_Type__c= 'Pay-Per-Lead';
        pCamp2.ParentId= cmp.Id;
        try
        {
            insert pCamp2; 
        }
        catch(exception e) 
        {
            System.assertEquals(true, e.getMessage().contains('Campaigns can only be linked if they have the matching Funding Channel'), 'Assert Failed');
        }
        
        test.stopTest();
    }
}