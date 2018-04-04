@isTest
    public class TestGetDocumentList
    {
        private static testMethod void testDoGet() 
        {
             Test.startTest();
            // DS-CONAM CALC.ApexTesting();            
            Application app = new Application();
            
            // Using unique identifier of source system for Acct and opportunity Name
            //Get List Of required fields - contact     
            app.FirstName = 'James';
            app.LastName = 'Jones';
            app.HomeCity = 'Washington';
            
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
            app.ExternalID = 'ExtID10001';
            app.MerchantID = 'Merchant 2000';
            
            Opportunity opp = Biz2CreditUtils.createOpportunity(app);
            
            
            OpportunityOffer oppOff = new OpportunityOffer();
            
            // Correctly Entered data should give successful resp
            oppOff.OfferID = '100333r0';
            oppOff.Amount = 1000;
            oppOff.DailyCollection = 1000;
            oppOff.Duration = 5;
            oppOff.ProductName = 'Product 1';
            oppOff.DailyPayment = 1000;
            oppOff.NumOfPayments = 6;
            oppOff.ExternalID = 'ExtID10001';
            oppOff.Source = 'Biz2Credit';
            
            Oppr_Document__c od = new Oppr_Document__c();
            od.document_name__c = 'Doc Test 1';
            od.Opportunity__c = opp.Id;
            od.Status__c = 'Requested';
            insert od;
        
            RestRequest req = new RestRequest();  
            RestResponse res = new RestResponse();
            req.addHeader('Content-Type','application/x-www-form-urlencoded');  
            
            
            req.addParameter('id', opp.External_ID__c);
            req.addParameter('SourceSystem', 'Biz2Credit');
            
            
            String instanceUrl = Biz2CreditUtils.getInstanceURL();
            req.requestURI = 'https://'+instanceUrl+'/services/apexrest/GetDocumentList';  
            req.httpMethod = 'GET';
            
            RestContext.request = req;
            RestContext.response = res;
            
            // request 1 No docList
            GetDocumentList.doGet();
            
            
            req.addParameter('id', opp.External_ID__c);
            req.addParameter('SourceSystem', 'B2C');
            
            
            instanceUrl = Biz2CreditUtils.getInstanceURL();
            req.requestURI = 'https://'+instanceUrl+'/services/apexrest/GetDocumentList';  
            req.httpMethod = 'GET';
            
            RestContext.request = req;
            RestContext.response = res;
            
            // request 1 No docList
            GetDocumentList.doGet();
            
             req.addParameter('id', opp.External_ID__c);
            req.addParameter('SourceSystem', 'BC');
            
            
            instanceUrl = Biz2CreditUtils.getInstanceURL();
            req.requestURI = 'https://'+instanceUrl+'/services/apexrest/GetDocumentList';  
            req.httpMethod = 'GET';
            
            RestContext.request = req;
            RestContext.response = res;
            
            // request 1 No docList
            GetDocumentList.doGet();
            Test.stopTest();
            
         }
    
 }