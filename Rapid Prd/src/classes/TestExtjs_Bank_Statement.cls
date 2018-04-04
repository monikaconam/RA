@isTest 
private class TestExtjs_Bank_Statement  
{
/*
    static testMethod void Extjs_Bank_Statement_UnitTest2() 
    {
    
        // DS-CONAM CALC.ApexTesting();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        try
        {
            Extjs_Bank_Statement.describeFields('Additional_Locations', new List<String>{'DBA_Name__c'});
        }
        catch(Exception e)
        {
        }
    }
    
     static testMethod void Extjs_Bank_Statement_UnitTest4() 
    {
    
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
        
    }
    */
    static testMethod void Extjs_Bank_Statement_UnitTest3() 
    {
        Test.startTest();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
        
        Extjs_Bank_Statement.CRUDData crudObj = new  Extjs_Bank_Statement.CRUDData();
        crudObj.sobjname = 'Additional_Locations__c';
        crudObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj.oppId = testAccount.Id;
        crudObj.parentFieldName = 'Account__c';
        
      /*  Extjs_Bank_Statement.CRUDData crudObj2 = new  Extjs_Bank_Statement.CRUDData();
        crudObj2.sobjname = '';
        crudObj2.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj2.oppId = testAccount.Id;
        crudObj2.parentFieldName = 'Account__c';
        
        Extjs_Bank_Statement.CRUDData crudObj3 = new  Extjs_Bank_Statement.CRUDData();
        crudObj3.sobjname = null;
        crudObj3.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj3.oppId = testAccount.Id;
        crudObj3.parentFieldName = 'Account__c';
        
        Extjs_Bank_Statement.CRUDData crudObj4 = new  Extjs_Bank_Statement.CRUDData();
        crudObj4.sobjname = 'Additional_Locations__c';
        crudObj4.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj4.oppId = testAccount.Id;
        crudObj4.parentFieldName = 'Account__c';
        
        Map<String, String> fieldMap4 = new Map<String, String>{'Street__c' => aloc.Street__c, 'Phone__c' => aloc.Phone__c};
        crudObj4.records = new List<Map<String, String>>{fieldMap4};
        */
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc );
        
        Map<String, String> fieldMap = new Map<String, String>{'Id' => aloc.Id, 'Street__c' => aloc.Street__c, 'Phone__c' => aloc.Phone__c};
        crudObj.records = new List<Map<String, String>>{fieldMap};
       // crudObj2.records = null;
        
        Extjs_Bank_Statement.refreshObjects(crudObj, sobjList);
        Extjs_Bank_Statement.create(crudObj);
        Extjs_Bank_Statement.updat(crudObj);
        Extjs_Bank_Statement.CRUDResponse crdrespose = Extjs_Bank_Statement.delet(crudObj);
        /*
        Extjs_Bank_Statement.create(crudObj2);
        Extjs_Bank_Statement.updat(crudObj2);
        
        Extjs_Bank_Statement.create(crudObj3);
        Extjs_Bank_Statement.create(crudObj4);
        */
        Test.stopTest();
    }
    
    
    static testMethod void Extjs_Bank_Statement_UnitTest31() 
    {
        Test.startTest();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
               
        Extjs_Bank_Statement.CRUDData crudObj2 = new  Extjs_Bank_Statement.CRUDData();
        crudObj2.sobjname = '';
        crudObj2.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj2.oppId = testAccount.Id;
        crudObj2.parentFieldName = 'Account__c';
        
       
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc );
        
        crudObj2.records = null;
        
        Extjs_Bank_Statement.create(crudObj2);
        Extjs_Bank_Statement.updat(crudObj2);
        Test.stopTest();
      
    }
    
    static testMethod void Extjs_Bank_Statement_UnitTest32() 
    {
        Test.startTest();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
        
        
        
        Extjs_Bank_Statement.CRUDData crudObj3 = new  Extjs_Bank_Statement.CRUDData();
        crudObj3.sobjname = null;
        crudObj3.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj3.oppId = testAccount.Id;
        crudObj3.parentFieldName = 'Account__c';
        
       
        
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc );
        

        Extjs_Bank_Statement.create(crudObj3);
         Test.stopTest();
    }
    
    static testMethod void Extjs_Bank_Statement_UnitTest33() 
    {
        Test.startTest();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusibess';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
        
        
        
        Extjs_Bank_Statement.CRUDData crudObj4 = new  Extjs_Bank_Statement.CRUDData();
        crudObj4.sobjname = 'Additional_Locations__c';
        crudObj4.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj4.oppId = testAccount.Id;
        crudObj4.parentFieldName = 'Account__c';
        
        Map<String, String> fieldMap4 = new Map<String, String>{'Street__c' => aloc.Street__c, 'Phone__c' => aloc.Phone__c};
        crudObj4.records = new List<Map<String, String>>{fieldMap4};
        
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc );
        

        Extjs_Bank_Statement.create(crudObj4);
        Test.stopTest();
    }
    
    /*
    static testMethod void Extjs_Bank_Statement_UnitTest1() 
    {
    
        // DS-CONAM CALC.ApexTesting();
        Account testAccount1 = new Account();
        testAccount1.name = 'Test Account1';
        testAccount1.BusinessType__c = 'testBusibess';
        insert testAccount1;
        
        Additional_Locations__c  aloc1 = new Additional_Locations__c();
        aloc1.DBA_Name__c = 'test';
        aloc1.Account__c = testAccount1.Id;
        insert aloc1;
        
        Extjs_Bank_Statement.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Bank_Statement.QueryObj queryObj = new Extjs_Bank_Statement.QueryObj( );
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount1.Id;
        queryObj.start = 0;
        queryObj.recordCount = 210;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> param1Map = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        Map<String, String> param2Map = new Map<String, String>{'direction' => 'DESC', 'property' => 'Street__c'};
        
        queryObj.sortParams.add(param1Map );
        queryObj.sortParams.add(param2Map );
        Extjs_Bank_Statement.query(queryObj);
        
        Extjs_Bank_Statement.CRUDData crudObj = new  Extjs_Bank_Statement.CRUDData();
        crudObj.sobjname = 'Additional_Locations__c';
        crudObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj.oppId = testAccount1.Id;
        crudObj.parentFieldName = 'Account__c';
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc1 );
        Map<String, String> fieldMap = new Map<String, String>{'Id' => aloc1.Id, 'Street__c' => aloc1.Street__c, 'Phone__c' => aloc1.Phone__c};
        crudObj.records = new List<Map<String, String>>{fieldMap};
        
        Extjs_Bank_Statement.refreshObjects(crudObj, sobjList);
        Extjs_Bank_Statement.create(crudObj);
        Extjs_Bank_Statement.updat(crudObj);
        Extjs_Bank_Statement.CRUDResponse crdrespose = Extjs_Bank_Statement.delet(crudObj);
    }
    */
}