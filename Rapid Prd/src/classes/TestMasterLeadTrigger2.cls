@isTest
private class TestMasterLeadTrigger2 {

    static testMethod void unitTest()
    {
        Profile p=[Select id from profile where name ='System Administrator'];
        User uNew=new User(profileId = p.id, username = 'webapps@rapidadvance.com.conam1', 
                            email = 'testemail@test.com', 
                           emailencodingkey = 'UTF-8', localesidkey = 'en_US', 
                           languagelocalekey = 'en_US', timezonesidkey = 'America/Los_Angeles', 
                           alias='cspu', lastname='lastname');
       System.runAs(uNew)
       {
            Campaign cmp = new campaign();
            cmp.Name = 'TestCamp';
            insert cmp;
            
            Lead lTemp=new Lead();
            lTemp.lastName='lastname';
            lTemp.Company='Company';
            lTemp.Phone='2200000000';
            lTemp.Principal_1_email__c='test@conam.com';
            insert lTemp;
            
            Lead lTemp2=[Select email from lead where id=:ltemp.id];
            System.debug(lTemp2.email);
            //System.assertEquals(lTemp2.email,'test@conam.com');
       }
    }
}