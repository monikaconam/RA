@isTest 

private class TestExtjs_Applicant_Credit 
{
    static testMethod void Extjs_Applicant_Credit_UnitTest() 
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        Account testAccount = new Account();
        testAccount.name = 'Test Account1';
        testAccount.BusinessType__c = 'testBusiness';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Contact c = new Contact();
        c.AccountId = testAccount.Id;
        c.LastName = 'test';
        insert c;
        
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test';
        cmObj.Type='Internet';
        insert cmObj;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity';
        opp.LeadSource = 'web';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 20;
        opp.CampaignId = cmObj.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.CloseDate = System.today() + 50;
        opp.AccountId = testAccount.id;
        insert opp;
        
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = c.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 2'; 
        insert oppRole;      
        
        Extjs_Applicant_Credit.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Applicant_Credit.QueryObj queryObj = new Extjs_Applicant_Credit.QueryObj( );
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 0;
        queryObj.recordCount = 10;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> paramMap = new Map<String, String>{'direction' => 'ASC', 'property' => 'DBA_Name__c'};
        queryObj.sortParams.add(paramMap );
        Extjs_Applicant_Credit.query(queryObj);
        
        Extjs_Applicant_Credit.CRUDData crudObj = new  Extjs_Applicant_Credit.CRUDData();
        crudObj.sobjname = 'Additional_Locations__c';
        crudObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj.oppId = testAccount.Id;
        crudObj.parentFieldName = 'Account__c';
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc );
        Map<String, String> fieldMap = new Map<String, String>{'Id' => aloc.Id, 'Street__c' => aloc.Street__c, 'Phone__c' => aloc.Phone__c,'State__c' => aloc.State__c, 'Time_Remaining_on_Lease__c' => aloc.Time_Remaining_on_Lease__c};
        crudObj.records = new List<Map<String, String>>
        {
            fieldMap
        };
        
        Extjs_Applicant_Credit.CRUDData crudObj1 = new  Extjs_Applicant_Credit.CRUDData();
        crudObj1.sobjname = 'Additional_Locations__c';
        crudObj1.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj1.oppId = testAccount.Id;
        crudObj1.parentFieldName = 'Account__c';
        List<SObject> sobjList1 = new List<SObject>();
        sobjList.add(oppRole );
        Map<String, String> fieldMap1 = new Map<String, String>{'Id' => oppRole.Id};
        crudObj1.records = new List<Map<String, String>>
        {
            fieldMap
        };
        
        Extjs_Applicant_Credit.refreshObjects(crudObj, sobjList);
        Extjs_Applicant_Credit.create(crudObj);
        Extjs_Applicant_Credit.updat(crudObj);
        Extjs_Applicant_Credit.CRUDResponse crdrespose = Extjs_Applicant_Credit.delet(crudObj);
        
        Extjs_Applicant_Credit.refreshObjects(crudObj1, sobjList1);
        Extjs_Applicant_Credit.create(crudObj1);
        Extjs_Applicant_Credit.updat(crudObj1);
        Extjs_Applicant_Credit.CRUDResponse crdrespose1 = Extjs_Applicant_Credit.delet(crudObj1);
        
        Test.stopTest();
    }   
    
    static testMethod void Extjs_Applicant_Credit_UnitTest2() 
    {
        Test.startTest();
        // DS-CONAM CALC.apexTesting();        
        Account testAccount = new Account();
        testAccount.name = 'Test Account2';
        testAccount.BusinessType__c = 'testBusiness2';
        insert testAccount;
        
        Additional_Locations__c  aloc = new Additional_Locations__c();
        aloc.DBA_Name__c = 'test2';
        aloc.Account__c = testAccount.Id;
        insert aloc;
        
        Contact con = new Contact();
        con.AccountId = testAccount.Id;
        con.LastName = 'test2';
        insert con;
        
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test2';
        cmObj.Type='Internet2';
        insert cmObj;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'testOpportunity2';
        opp.LeadSource = 'web2';
        opp.StageName = 'Prospecting2';
        opp.CloseDate = System.today() + 50;
        opp.CampaignId = cmObj.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL2';
        opp.AccountId = testAccount.id;
        insert opp;
        
        OpportunityContactRole  oppRole = new OpportunityContactRole();
        oppRole.ContactId = con.Id;
        oppRole.OpportunityId  = opp.Id;
        oppRole.Role = 'Principal 2'; 
        insert oppRole;      
        
        Extjs_Applicant_Credit.describeFields('Additional_Locations__c', new List<String>{'DBA_Name__c','Street__c','City__c','State__c','Postal_Code__c','Phone__c','Fax__c','Landlord__c','Landlord_Phone__c','Time_Remaining_on_Lease__c'});
        Extjs_Applicant_Credit.QueryObj queryObj = new Extjs_Applicant_Credit.QueryObj( );
        queryObj.sobjname = 'Additional_Locations__c';
        queryObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        queryObj.parentFieldName = 'Account__c';
        queryObj.oppId = testAccount.Id;
        queryObj.start = 10;
        queryObj.recordCount = 100;
        queryObj.sortParams = new List<Map<String, String>>();
        Map<String, String> paramMap = new Map<String, String>{'direction' => 'DES', 'property' => 'DBA_Name__c'};
        queryObj.sortParams.add(paramMap );
        Extjs_Applicant_Credit.query(queryObj);
        
        Extjs_Applicant_Credit.CRUDData crudObj = new  Extjs_Applicant_Credit.CRUDData();
        crudObj.sobjname = 'Additional_Locations__c';
        crudObj.fields = 'DBA_Name__c,Street__c,City__c,State__c,Postal_Code__c,Phone__c,Fax__c,Landlord__c,Landlord_Phone__c,Time_Remaining_on_Lease__c';
        crudObj.oppId = testAccount.Id;
        crudObj.parentFieldName = 'Account__c';
        List<SObject> sobjList = new List<SObject>();
        sobjList.add(aloc);
        Map<String, String> fieldMap = new Map<String, String>{'Id' => aloc.Id, 'Street__c' => aloc.Street__c, 'Phone__c' => aloc.Phone__c,'State__c' => aloc.State__c, 'Time_Remaining_on_Lease__c' => aloc.Time_Remaining_on_Lease__c};
        crudObj.records = new List<Map<String, String>>
        {
            // fieldMap
        };
        
        Extjs_Applicant_Credit.refreshObjects(crudObj, sobjList);
        Extjs_Applicant_Credit.create(crudObj);
        Extjs_Applicant_Credit.updat(crudObj);
        Extjs_Applicant_Credit.CRUDResponse crdrespose = Extjs_Applicant_Credit.delet(crudObj);
        
        test.stopTest();
    }  
}