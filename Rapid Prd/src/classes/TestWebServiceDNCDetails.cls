@isTest

private class TestWebServiceDNCDetails
{
    static testMethod void unitTest()
    {
         Test.startTest();
         Lead lTemp = new Lead();
         lTemp.FirstName = 'Test';
         lTemp.LastName = 'Test & offerson';
         lTemp.Company= 'Test & Industries LLC';
         lTemp.Email= 'test@test.com';
         lTemp.Phone = '2200000000';
         lTemp.Status= 'Test';
         lTemp.Legal_Business_Name__c='AB & BA';
         lTemp.Scrubbed_With_DNC__c=true;
         lTemp.DNC_Response__c='W';
         lTemp.state='WY';
         insert lTemp;
         
         WebServiceDNCDetails.getPhoneDNCInfo(lTemp.phone);
         Test.stopTest();

    }
    
    static testMethod void unitTestWOtherState()
    {
         Test.startTest();
         Lead lTemp = new Lead();
         lTemp.FirstName = 'Test';
         lTemp.LastName = 'Test & offerson';
         lTemp.Company= 'Test & Industries LLC';
         lTemp.Email= 'test@test.com';
         lTemp.Phone = '2200000000';
         lTemp.Status= 'Test';
         lTemp.Legal_Business_Name__c='AB & BA';
         lTemp.Scrubbed_With_DNC__c=true;
         lTemp.DNC_Response__c='W';
         insert lTemp;
         
         WebServiceDNCDetails.getPhoneDNCInfo(lTemp.phone);
         Test.stopTest();
    }
    
    static testMethod void unitTest3()
    {
         Test.startTest();
         Lead lTemp = new Lead();
         lTemp.FirstName = 'Test';
         lTemp.LastName = 'Test & offerson';
         lTemp.Company= 'Test & Industries LLC';
         lTemp.Email= 'test@test.com';
         lTemp.Phone = '2200000000';
         lTemp.Status= 'Test';
         lTemp.Legal_Business_Name__c='AB & BA';
         lTemp.Scrubbed_With_DNC__c=true;
         lTemp.DNC_Response__c='C';
         insert lTemp;
         
         WebServiceDNCDetails.getPhoneDNCInfo(lTemp.phone);
         WebServiceDNCDetails.getPhoneDNCInfo('2200000001');
         WebServiceDNCDetails.getPhoneDNCInfo('2200000001EXTENSION1234');
         WebServiceDNCDetails.getPhoneDNCInfo('2200000001EXT1234');
         Test.stopTest();
    }
    
    static testMethod void unitTest4()
    {
         Test.startTest();
         Lead lTemp = new Lead();
         lTemp.FirstName = 'Test';
         lTemp.LastName = 'Test & offerson';
         lTemp.Company= 'Test & Industries LLC';
         lTemp.Email= 'test@test.com';
         lTemp.Phone = '2200000000';
         lTemp.Status= 'Test';
         lTemp.Legal_Business_Name__c='AB & BA';
         lTemp.Scrubbed_With_DNC__c=true;
         lTemp.DNC_Response__c='D';
         insert lTemp;
         
         WebServiceDNCDetails.getPhoneDNCInfo(lTemp.phone);
         Test.stopTest();
    }
}