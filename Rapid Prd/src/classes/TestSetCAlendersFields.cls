@isTest
private class TestSetCAlendersFields
{
    static testMethod void unitTest()
    {
        Test.startTest();
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        List<Partner_Category__c> pList=new List<Partner_Category__c>();
        Partner_Category__c p1=new Partner_Category__c();
        p1.Partner_Account__c=acc.id;
        p1.Sort_Order__c=1;
        p1.Name='Banks';
        pList.add(p1);
        
        Partner_Category__c p2=new Partner_Category__c();
        p2.Partner_Account__c=acc.id;
        p2.Sort_Order__c=2;
        p2.Name='CUSO';
        pList.add(p2);
        
        Partner_Category__c p3=new Partner_Category__c();
        p3.Partner_Account__c=acc.id;
        p3.Sort_Order__c=3;
        p3.Name='Credit Unions';
        pList.add(p3);
        
        insert pList;
        
        Account accQ=[Select Category_Contains_Banks__c from account where id=: acc.id Limit 1];
        System.assertEquals(accQ.Category_Contains_Banks__c,true);
        Test.stopTest();
    }
    
    
    static testMethod void unitTestUpdate()
    {
        Test.startTest();
        
        Account acc = new Account();
        acc.Name = 'Test Account1';
        acc.businessType__c = 'testBusiness';
        insert acc;
        
        Lead lTemp = new Lead();
        lTemp.Status = 'Inital Call Needed';
        lTemp.LeadSource = 'A001';
        lTemp.Company = 'Krell Audio/Video';
        lTemp.Legal_Business_Name__c = 'Krell Audio/Video';
        lTemp.Phone = '3132329090';
        lTemp.Type_Of_Business__c = 'Entertainment';
        lTemp.Operating_Since__c = 'More than 2 years';
        lTemp.DateBusinessStarted__c = system.today();
        lTemp.Owned_Business_Since__c = system.today();
        lTemp.FirstName = 'Jake';
        lTemp.LastName = 'Jones';
        lTemp.Principal_1_Street_Address__c = '1000 West Street';
        lTemp.Principal_1_City__c = 'Washington';
        lTemp.Principal_1_State__c = 'DC';
        lTemp.Principal_1_Zip__c = '20012';
        insert lTemp;
        
        List<Partner_Category__c> pList=new List<Partner_Category__c>();
        Partner_Category__c p1=new Partner_Category__c();
        p1.Partner_Lead__c=lTemp.id;
        p1.Sort_Order__c=1;
        p1.Name='Banks';
        pList.add(p1);
        
        Partner_Category__c p2=new Partner_Category__c();
        p2.Partner_Lead__c=lTemp.id;
        p2.Sort_Order__c=2;
        p2.Name='CUSO';
        pList.add(p2);
        
        Partner_Category__c p3=new Partner_Category__c();
        p3.Partner_Lead__c=lTemp.id;
        p3.Sort_Order__c=3;
        p3.Name='Credit Unions';
        pList.add(p3);
        
        insert pList;
        
        pList=new List<Partner_Category__c>();
        p1.Partner_Account__c=acc.id;
        p1.Partner_Lead__c=null;
        
        p2.Partner_Account__c=acc.id;
        p2.Partner_Lead__c=null;
        
        p3.Partner_Account__c=acc.id;
        p3.Partner_Lead__c=null;
        
        pList.add(p1);
        pList.add(p2);
        pList.add(p3);
        
        update pList;
        Test.stopTest();
    }
}