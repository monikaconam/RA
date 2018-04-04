/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestSubmitApplication {

    static testMethod void myUnitTest() {
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        app.AgeOfBusinessYrs = '20130404';
        
        app.HomeZip = '20716';
        app.DateOfBirth = '20130404';   
        
        app.CloseDate = '20130404';
        
        app.HomeState = 'MD';
        app.ResidenceStatus = 'Yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
       
        Test.stopTest();
    }
    
    
    static testmethod void unitTest2()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '2076';
        app.AgeOfBusinessYrs = '2013040';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '1999040';
        
        app.CloseDate='2013040';

        
        app.HomeState='CT';
        app.ResidenceStatus='Yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest3()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        app.AgeOfBusinessYrs = '2013040';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '1999040';
        
        app.CloseDate='2013040';

        
        app.HomeState='C';
        app.ResidenceStatus='Reserved';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest5()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        app.AgeOfBusinessYrs = 'AbCdefgh';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='2013040';

        
        app.HomeState='C';
        app.ResidenceStatus='Reserved';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest6()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '1999040';
        
        app.CloseDate='20130404';

        
        app.HomeState='C';
        app.ResidenceStatus='Reserved';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    static testmethod void unitTest7()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= 'abcdefgh';
        
        app.CloseDate='19990404';

        
        app.HomeState='CT';
        app.ResidenceStatus='yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    static testmethod void unitTest8()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='20130404';

        
        app.HomeState='C';
        app.ResidenceStatus='Reserved';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    static testmethod void unitTest9()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '2076';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='20130404';

        
        app.HomeState='Ct';
        app.ResidenceStatus='YES';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    static testmethod void unitTest10()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='20130404';

        
        app.HomeState='CT';
        app.ResidenceStatus='Reserved';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest11()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='2013040';

        
        app.HomeState='CT';
        app.ResidenceStatus='Yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest12()
    {
       
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACH';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
        app.CloseDate='abcdefgh';

        
        app.HomeState='CT';
        app.ResidenceStatus='yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
    
    static testmethod void unitTest13()
    {
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.LastName = 'Jones';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        app.MerchantID = 'Merchant 2000';
        
        app.Product = 'ACX';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
       
        app.HomeState='CT';
        app.ResidenceStatus='yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit2';
        insert cm;
        RestContext.response= res;
        try
        {
            SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        }
        catch(Exception e)
        {
        }
        
        Test.stopTest();
    }
    
    static testmethod void unitTest14()
    {
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        Application app = new Application();
        
        // Using unique identifier of source system for Acct and opportunity Name
        //Get List Of required fields - contact     
        app.FirstName = 'James';
        app.HomeCity = 'Washington';
        app.LegalBusName = 'Test Business Merchant';
        
        //Get List Of required fields - account
        app.BusinessCity = 'Washington DC';
        app.FederalTaxId = '111155555';
        
        //Get List Of required fields - opportunity
        app.AvgMonthSales = 50000;
        app.MajorCreditCardsProc = 'Visa';
        app.AvgMonthTrans = 45000;
        app.CCSalesLastMonth = 100000;
        app.CCSalesLast1Month = 45000;
        app.CCSalesLast2Month = 55000;
        app.CCSalesLast3Month = 65000;
        app.NumOfTransLastMonth = 300;
        app.NumOfTrans1Month = 250;
        app.NumOfTrans2Month = 350;
        app.NumOfTrans3Month = 450;
        app.SourceSystem = 'Biz2Credit';
        app.ExternalID = 'ExtID 10001';
        
        app.Product = 'ACX';
        app.BusinessZip = '20716';
        
        app.HomeZip = '20716';
        app.DateOfBirth= '19990404';
        
       
        app.HomeState='CT';
        app.ResidenceStatus='yes';
        
        RestRequest req = new RestRequest();  
        RestResponse res = new RestResponse();
        req.addHeader('Content-Type','application/x-www-form-urlencoded');  
        
        Campaign cm = new Campaign();
        cm.Name = 'Biz2Credit';
        insert cm;
        RestContext.response= res;
        SubmitApplication.ReturnSubmitAppDetails resp = SubmitApplication.doPost(app);
        
        Test.stopTest();

    }
}