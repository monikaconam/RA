@isTest
private class TestWebServicePartnerAccountInfoToCALC
{
    static testMethod void unitTest()
    {
        Test.startTest();
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.Phone=''; 
        insert acc;
        
        WebServicePartnerAccountInfoToCALC.sendData(acc.id);
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.lastName = 'test';
        insert con;

        WebServicePartnerAccountInfoToCALC.sendData(con.id);
        
        WebServicePartnerAccountInfoToCALC.sendData('ABCDEFG');
        
        WebServicePartnerAccountInfoToCALC.sendData(null);
        Test.stopTest();
    }
}