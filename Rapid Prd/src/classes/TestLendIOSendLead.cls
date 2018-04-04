@isTest
private class TestLendIOSendLead{

     static testmethod void testMethod1()
     {
        
        Test.startTest();
        Lead  ld = new Lead ();
        ld.FirstName = 'Test';
        ld.LastName  = 'Testlastname';
        ld.Company   = 'Test Industrie';
        ld.Email     = 'testing@test.com';
        ld.Phone     = '9998485452';
        ld.Status = 'Unqualified';
        ld.Legal_Business_Name__c='AB and BA';
        ld.Lendio_Timestamp__c =DateTime.now();
        ld.Partners__c = 'Lendio;RocketLoans';
        ld.Accounts_Receivable_Amount__c = 'Do not have accounts receivable';
        ld.Purpose_of_Funds__c = 'Buyout a partner';
        ld.Personal_Credit_Score_text__c = '620';
        ld.Collateral_Available__c = 'Cash / Investments';
        insert ld;
        Test.stopTest();
    }
       static testmethod void testMethod2()
        {   
            Test.startTest();       
            Lead  ld2 = new Lead ();
            ld2.FirstName = 'Test';
            ld2.LastName  = 'Testlastname';
            ld2.Company   = 'Test Industrie';
            ld2.Email     = 'testing@test.com';
            ld2.Phone     = '9998485452';
            ld2.Status = 'Unqualified';
            ld2.Legal_Business_Name__c='AB and BA';
            ld2.Personal_Credit_Score_text__c = '498';
            ld2.Principal_1_Email__c = 'test@gmail.com';
            ld2.Gross_Monthly_Sales_Cur__c = 20000;
            ld2.DateBusinessStarted__c = System.Today().addMonths(-1);
            ld2.Principal_Home_Phone_Number__c = '59568956';
            ld2.Industry = 'Agriculture';
            ld2.Purpose_of_Funds__c = 'Open a new location';
            ld2.Accounts_Receivable_Amount__c = '800';
            ld2.Partners__c = 'Lendio';
            ld2.Collateral_Available__c = 'Purchase Order';
            insert ld2;
            Test.stopTest();
            }
        
       static testmethod void testMethod3() {
        Test.startTest();
        
        Lead  ld3 = new Lead ();
        ld3.FirstName = 'Test';
        ld3.LastName  = 'Testlastname';
        ld3.Company   = 'Test Industrie';
        ld3.Email     = 'testing@test.com';
        ld3.Phone     = '9998485452';
        ld3.Status = 'Unqualified';
        ld3.Legal_Business_Name__c='AB and BA';
        ld3.Industry = 'Automotive';
        ld3.Personal_Credit_Score_text__c = '510';
        ld3.Principal_1_Email__c = 'test@gmail.com';
        ld3.Gross_Monthly_Sales_Cur__c = 40000;
        ld3.DateBusinessStarted__c = System.Today().addMonths(-1);
        ld3.Principal_Home_Phone_Number__c = '59568956';
        ld3.Industry = 'Agriculture';
        ld3.Accounts_Receivable_Amount__c = '18000';
        ld3.Amount_Requested__c = '5';
        ld3.Partners__c = 'Lendio;RocketLoans';
        insert ld3;
        Test.stopTest();
        }
       static testmethod void testMethod4() {        
        Test.startTest();
        Lead  ld4 = new Lead ();
        ld4.FirstName = 'Test';
        ld4.LastName  = 'Testlastnamenew3';
        ld4.Company   = 'Test Industrie';
        ld4.Email     = 'testing@test.com';
        ld4.Phone     = '9998485452';
        ld4.Status = 'Unqualified';
        ld4.Legal_Business_Name__c='AB and BA';
        ld4.Personal_Credit_Score_text__c = '510';
        ld4.Amount_Requested__c = '5005';
        ld4.Accounts_Receivable_Amount__c = '40000';
        ld4.Partners__c = 'Lendio;RocketLoans';
        insert ld4;  
        Test.stopTest();
        }
        
       static testmethod void testMethod78() {
        Test.startTest();
        Lead  ld5 = new Lead ();
        ld5.FirstName = 'Test';
        ld5.LastName  = 'Testlastnamenew4';
        ld5.Company   = 'Test Industries';
        ld5.Email     = 'testing@test.com';
        ld5.Phone     = '9998485452';
        ld5.Status = 'Unqualified';
        ld5.Legal_Business_Name__c='AB and BA';
        ld5.Personal_Credit_Score_text__c = '498';
        ld5.Principal_1_Email__c = 'test@gmail.com';
        ld5.Gross_Monthly_Sales_Cur__c = 60000;
        ld5.Principal_Home_Phone_Number__c = '59568956';
        ld5.DateBusinessStarted__c = System.Today().addMonths(-1);
        ld5.Industry = 'Automotive';
        ld5.Accounts_Receivable_Amount__c = '70000';
        ld5.Partners__c = 'Lendio';
        insert ld5;
            
        Test.stopTest();
    }
    
    static testmethod void testMethod6() {
    
        Test.startTest();
        Lead  ldnew2 = new Lead ();
        ldnew2.FirstName = 'Test';
        ldnew2.LastName  = 'Testnewlastname';
        ldnew2.Company   = 'Test Industrie';
        ldnew2.Email     = 'testing@test.com';
        ldnew2.Phone     = '9998485452';
        ldnew2.Status = 'Unqualified';
        ldnew2.Legal_Business_Name__c='AB and BA';
        ldnew2.Personal_Credit_Score_text__c = '660';
        ldnew2.Principal_1_Email__c = 'testnew2@gmail.com';
        ldnew2.Gross_Monthly_Sales_Cur__c = 80000;
        ldnew2.Principal_Home_Phone_Number__c = '5956008956';
        ldnew2.DateBusinessStarted__c = System.Today().addMonths(-1);
        ldnew2.Industry = 'Agriculture';
        ldnew2.Purpose_of_Funds__c = 'Open a new location';
        ldnew2.Accounts_Receivable_Amount__c = '800';
        ldnew2.Partners__c = 'Lendio';
        ldnew2.Collateral_Available__c = 'Purchase Order';
        insert ldnew2;
        Test.stopTest();
        }
       static testmethod void testMethod7() {
       Test.startTest();
        Lead  ldnew3 = new Lead ();
        ldnew3.FirstName = 'Test';
        ldnew3.LastName  = 'Testlastnamenew';
        ldnew3.Company   = 'Test Industrie';
        ldnew3.Email     = 'testing@test.com';
        ldnew3.Phone     = '9998485452';
        ldnew3.Status = 'Unqualified';
        ldnew3.Legal_Business_Name__c='AB and BA';
        ldnew3.Personal_Credit_Score_text__c = '700';
        ldnew3.Principal_1_Email__c = 'testnew3@gmail.com';
        ldnew3.Gross_Monthly_Sales_Cur__c = 100000;
        ldnew3.DateBusinessStarted__c = System.Today().addMonths(-1);
        ldnew3.Principal_Home_Phone_Number__c = '5956895226';
        ldnew3.Industry = 'Agriculture';
        ldnew3.Purpose_of_Funds__c = 'Open a new location';
        ldnew3.Accounts_Receivable_Amount__c = '800';
        ldnew3.Partners__c = 'Lendio';
        ldnew3.Collateral_Available__c = 'Purchase Order';
        insert ldnew3;
        Test.stopTest();
        }
       static testmethod void testMethod8() {
       Test.startTest();
        Lead  ldnew4 = new Lead ();
        ldnew4.FirstName = 'Test';
        ldnew4.LastName  = 'Testlastnamenew2';
        ldnew4.Company   = 'Test Industrie';
        ldnew4.Email     = 'testing@test.com';
        ldnew4.Phone     = '9998485452';
        ldnew4.Status = 'Unqualified';
        ldnew4.Legal_Business_Name__c='AB and BA';
        ldnew4.Personal_Credit_Score_text__c = '800';
        ldnew4.Principal_1_Email__c = 'testnew4@gmail.com';
        ldnew4.Gross_Monthly_Sales_Cur__c = 200000;
        ldnew4.Principal_Home_Phone_Number__c = '5956338956';
        ldnew4.DateBusinessStarted__c = System.Today().addMonths(-1);
        ldnew4.Industry = 'Agriculture';
        ldnew4.Purpose_of_Funds__c = 'Open a new location';
        ldnew4.Accounts_Receivable_Amount__c = '800';
        ldnew4.Partners__c = 'Lendio';
        ldnew4.Collateral_Available__c = 'Purchase Order';
        insert ldnew4;
        Test.stopTest();
    }
}