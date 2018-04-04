@isTest
private class TestMasterOpportunityTrigger7
{
    @testSetup
    static void setup()
    {
        Test.startTest();
        List<lead> leadList=new List<lead>();
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;

        Lead lTemp= new Lead();
        lTemp.Company ='lead 1';
        lTemp.Email='Test@test.com';
        lTemp.FirstName='test';
        lTemp.LastName='last name97';
        lTemp.state='CT';
        insert lTemp;

        Lead lTemp2= new Lead();
        lTemp2.Company ='referral lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='tes t';
        lTemp2.LastName='lastname97';
        lTemp2.state='CT';
        lTemp2.referral_merchant_id__c=lTemp.id;
        insert lTemp2;
        
        Test.stopTest();
    }
    static testmethod void unitTest()
    {
        Test.startTest();
        Lead lTemp2=[Select id from lead where lastname='lastname97' Limit 1];
        Lead lTemp=[Select id from lead where lastname='last name97' Limit 1];
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
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
    
    static testmethod void unitTest2()
    {
        Test.startTest();
         
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
               
        Lead lTemp2= new Lead();
        lTemp2.Company ='referral lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='tes t';
        lTemp2.LastName='lastname97';
        lTemp2.state='CT';
        lTemp2.referral_merchant_id__c=acc.id;
        insert lTemp2;
        
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
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
    
    static testmethod void unitTest3()
    {
        Test.startTest();
        
        Campaign camp = new Campaign();
        camp.Name = 'TestCamp';
        camp.type = 'Internet';
        insert camp;
        /*
        Lead lTemp= new Lead();
        lTemp.Company ='lead 1';
        lTemp.Email='Test@test.com';
        lTemp.FirstName='test';
        lTemp.LastName='lastname97';
        lTemp.state='CT';
        insert lTemp;
        */
        
        Lead lTemp=[Select id from lead where Company ='lead 1' Limit 1];
        
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