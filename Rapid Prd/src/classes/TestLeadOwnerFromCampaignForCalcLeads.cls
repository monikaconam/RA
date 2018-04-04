@isTest(SeeAllData=true)
//(SeeAllData=true) is only to access custom settings
private class TestLeadOwnerFromCampaignForCalcLeads
{
	static testmethod void testLead()
    {
		User u=[select id from user where profile.name ='System Administrator' and isactive=true Limit 1];
        List<CalcLeadCreator__c> lCreator=[select name from CalcLeadCreator__C limit 1];
        System.debug(lCreator);
        
        CALC.ApexTesting();   
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet',default_opportunity_owner__C=u.id,default_lead_owner__c=u.id);
        insert cTest;
                
        User uNew=[select id from user where id=:lCreator[0].name];
         
		System.runAs(uNew ) {
		Lead lTest=new Lead();
		lTest.Status='Calling - No Contact Made';
		lTest.LeadSource='Partner-Web';
		lTest.Company='test company';
		lTest.Phone='415789415';
		lTest.Lastname='lastname';
		lTest.Campaign_Name_Upload__c=cTest.id;     
		insert lTest;

        }
    
    }

}