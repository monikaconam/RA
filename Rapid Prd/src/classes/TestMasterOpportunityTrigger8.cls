@isTest
private class TestMasterOpportunityTrigger8
{
    @isTest(SeeAllData=true)
    static void unitTest4()
    {
        Test.startTest();
        
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        
        List<User> usrid = [Select Id from User where IsActive=TRUE];
        
        Lead lTemp= [Select 
                            id 
                    from 
                            lead 
                    where 
                            isConverted=True 
                    and 
                            ConvertedOpportunityId!=null 
                    and 
                            ConvertedAccountID!=null 
                    and     
                            OwnerId In : usrid Limit 1];
        
        Lead lTemp2= new Lead();
        lTemp2.Company ='referral lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='tes t';
        lTemp2.LastName='lastname97';
        lTemp2.state='CT';
        lTemp2.referral_merchant_id__c=lTemp.id;
        insert lTemp2;
        
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
        ext.autoConvert(); 
        
        cont = new ApexPages.standardController(lTemp); 
        ext = new leadConvertButtonOverride(cont); 
        ext.autoConvert(); 
        
        List<lead> lRec=[select id, number_of_funded_referrals__c, convertedOpportunityId from lead where id=: lTemp2.id];
        
        if(lRec.size()>0)
        {
            Opportunity opp=[Select stagename from opportunity where id =: lRec.get(0).convertedOpportunityId ];
            opp.stageName='Closed Won';
            update opp;
        }
        Test.stopTest();
    }
}