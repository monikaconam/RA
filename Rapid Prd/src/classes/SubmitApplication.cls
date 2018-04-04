/**
 *********************************************************************************************************************
 * Module Name   : SubmitApplication Webservice
 * Description   :  This method will  create SF objects for Biz2Credit
 * Throws        : <Any Exceptions/messages thrown by this class/triggers>
 * Calls         : <Any classes/utilities called by this class | None if it does not call>
 * Test Class    :
 *
 * Organization  : Rainmaker Associates LLC
 * @RestResource(urlMapping='/rest/SubmitApplication/*')
 * Revision History:-
 * Version  Date           Author           WO#         Description of Action
 * 1.0      12/16/2012     Milligan                 Initial Version
 * //Validation fields : BusinessZip AgeOfBusinessYrs DateOfBirth HomeState  HomeZip ResidenceStatus CloseDate
 *******************************************************************************************************************
 **/
 /*
@Name               : SubmitApplication
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  

*/
 
@RestResource(urlMapping = '/rest/SubmitApplication/*')
global with sharing class SubmitApplication
{
    @HttpPost
    global static ReturnSubmitAppDetails doPost(Application app)
    {
        RestResponse res = RestContext.response; 
        Account acct = new Account();
        Contact con = new Contact();
        Opportunity opp = new Opportunity();

        System.debug('tester ---> Submit App Merchant' + app.MerchantID);

        if (app.MerchantID != null && app.LastName != null) 
        {
            //Create Account  
            //Required: City, FederalTaxID__c       

            acct.FederalTaxID__c = app.FederalTaxId;
            acct.Legal_Name__c = app.LegalBusName;
            acct.Int_Industry__c = app.Industry;
            acct.SubIndustry__c = app.SubIndustry;
            acct.BillingStreet = app.BusinessAddress1;
            acct.BillingCity = app.BusinessCity;
            acct.BillingState = app.BusinessState;
            acct.BillingCountry = 'US';

            if (app.BusinessZip != null && app.BusinessZip != '')
            {
                if (app.BusinessZip.length() < 5) {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Account Postal Code length must have minimum of 5 characters!');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Account Postal Code length must have minimum of 5 characters!', 'Null', 'Null', 'Null');
                }
            }
            
            acct.BillingPostalCode = app.BusinessZip;
            acct.Phone = app.BusinessMobilePhone;
            acct.BusinessStructure__c = app.LegalStructure;

            if (app.AgeOfBusinessYrs != null && app.AgeOfBusinessYrs != '')
            {
                if (app.AgeOfBusinessYrs.length() != 8) {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Account Age Of Business length must be 8 Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Account Age Of Business length must be 8 Format: YYYYMMDD', 'Null', 'Null', 'Null');
                }
                if (!app.AgeOfBusinessYrs.isNumeric()) {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Account Age Of Business  must be numeric Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Account Age Of Business  must be numeric Format: YYYYMMDD', 'Null', 'Null', 'Null');

                }
                acct.DateBusinessStarted__c = Biz2CreditUtils.dateConversion(app.AgeOfBusinessYrs);
            }

            acct.AnnualRevenue = app.AvgAnnualRevenue;
            acct.Name = app.LegalBusName;
            acct.BusinessType__c = 'Other'; 
            insert(acct);

            //Create Contact
            // Required: FirstName, LastName, City

            con.FirstName = app.FirstName;
            con.LastName = app.LastName;
            con.Title = app.JobTitle;

            if (app.DateOfBirth != null && app.DateOfBirth != '')
            {
                if (app.DateOfBirth.length() != 8)
                {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Date Of Birth length must be 8 Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Date Of Birth length must be 8 Format: YYYYMMDD', 'Null', 'Null', 'Null');
                }
                if (!app.DateOfBirth.isNumeric())
                {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Date Of Birth length must be 8 Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Date of Birth  must be numeric Format: YYYYMMDD', 'Null', 'Null', 'Null');
                }

                con.Birthdate = Biz2CreditUtils.dateConversion(app.DateOfBirth);
                con.Date_of_Birth__c = Biz2CreditUtils.dateConversion(app.DateOfBirth);
            }
            con.MailingStreet = app.HomeAddress1;
            con.Principal_1_Street_Address__c = app.HomeAddress1;

            con.MailingCity = app.HomeCity;
            con.Principal_1_City__c = app.HomeCity;

            if (app.HomeState != null && app.HomeState != '')
            {
                if (app.HomeState.length() != 2)
                {
                    res.StatusCode = 400;                   
                    res.addHeader('Error', 'Application Error: Check Contact State length must be equal to 2!');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Check Contact State length must be equal to 2!', 'Null', 'Null', 'Null');
                }
            }

            con.MailingState = app.HomeState;
            con.Principal_1_State__c = app.HomeState;

            if (app.HomeZip != null && app.HomeZip != '')
            {
                if (app.HomeZip.length() < 5)
                {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Contact Postal Code length must have minimum of 5 characters!');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Contact Postal Code length must have minimum of 5 characters!', 'Null', 'Null', 'Null');
                }
            }
            con.MailingPostalCode = app.HomeZip;
            con.Principal_1_Zip__c = app.HomeZip;

            con.MailingCountry = 'US';
            con.Principal_1_Country__c = 'US';

            con.MobilePhone = app.HomeMobilePhone;
            con.OwnershipPercentage__c = app.BorrowerOwnershipPct;

            if (app.ResidenceStatus != null && app.ResidenceStatus != '') 
            {
                if (app.ResidenceStatus != 'Yes' && app.ResidenceStatus != 'No')
                {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Residence Status must be Yes or No!');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Residence Status must be Yes or No!', 'Null', 'Null', 'Null');
                }
            }
            con.Does_the_Merchant__c = app.ResidenceStatus;
            con.SS__c = app.SSN;
            con.LeadSource = 'Partner';
            con.AccountId = acct.Id;
            insert con;

            //Create Opportunity 
            // Required fields: See Spreadsheet     
            opp.AE_Calculator_Average__c = app.AvgMonthSales;
            opp.Intended_use_of_cash__c = app.LoanIntent;
            opp.Existing_Competitor_Advance2__c = app.ExistingCashAdvance;
            opp.LeadSource = 'Partner';
            
            if (app.Product.equals('ACH')) {
                opp.Product__c = 'Loan';
            } else {
                opp.Product__c = 'MCA';
            }

    

            opp.Source_System__c = 'Biz2Credit';
            opp.Name = app.LegalBusName;
            opp.External_ID__c = app.ExternalID;
            opp.Contact__c = con.id;
            opp.StageName = 'Prospecting';
            //opp.RecordTypeId = '01270000009IkCAAU';
            try
            {
                Campaign camp = [select 
                                        id 
                                from 
                                        Campaign 
                                where 
                                        name = 'Biz2Credit' LIMIT 1];   
                opp.CampaignId = camp.id;
            } 
            catch (QueryException ex) {}
            //opp.CampaignId = '701V0000005mVrIAI';
            //opp.CloseDate = Date.valueOf(app.OppCloseDate);
            if (app.CloseDate != null && app.CloseDate != '')
            {
                if (app.CloseDate.length() != 8) {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Close Date length must be 8 Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Close Date length must be 8 Format: YYYYMMDD', 'Null', 'Null', 'Null');
                }
                if (!app.CloseDate.isNumeric()) {
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Application Error: Close Date  must be numeric Format: YYYYMMDD');
                    return new ReturnSubmitAppDetails('false', 'Application Error: Close Date  must be numeric Format: YYYYMMDD', 'Null', 'Null', 'Null');
                }
                opp.CloseDate = Biz2CreditUtils.dateConversion(app.CloseDate);
            }
            else 
            {
                opp.CloseDate = system.today() + 365;
            }

            opp.Status__c = 'File Accepted';
            opp.AccountId = acct.Id;
            insert opp;
            
            Boolean isACH = false;
            if ((app.Product != null) && (app.Product.Contains('ACH')))
            {
                isACH = true;
            }

            OpportunityContactRole ocr = new OpportunityContactRole();
            ocr.ContactId = con.id;
            ocr.OpportunityId = opp.id;
            ocr.Role = 'Partner 1';
            ocr.IsPrimary = true;
            insert ocr;
            
            // Create Documents For Opportunity Documents
            Oppr_Document__c od1 = new Oppr_Document__c();
            od1.document_name__c = 'Voided Check Copy  (ID)';
            od1.Opportunity__c = opp.Id;
            od1.status__c = 'Requested';
            od1.RequiredDoc__c = true;
            insert od1;

            Oppr_Document__c od2 = new Oppr_Document__c();
            od2.document_name__c = 'Copy of Drivers License  (ID)';
            od2.Opportunity__c = opp.Id;
            od2.status__c = 'Requested';
            od2.RequiredDoc__c = true;
            insert od2;
            
            if (isACH) 
            {
                Oppr_Document__c od5 = new Oppr_Document__c();
                od5.document_name__c = 'Four Months of Bank Statements (For Loan Products)';
                od5.Opportunity__c = opp.Id;
                od5.status__c = 'Requested';
                od5.RequiredDoc__c = true;
                insert od5;
            }
            //Only for MCA Products
            else 
            {
                Oppr_Document__c od3 = new Oppr_Document__c();
                od3.document_name__c = 'Four Months of Credit Statements (For MCA Products)';
                od3.Opportunity__c = opp.Id;
                od3.status__c = 'Requested';
                od3.RequiredDoc__c = true;
                insert od3;

                Oppr_Document__c od4 = new Oppr_Document__c();
                od4.document_name__c = 'Two Months of Bank Statements (For MCA Products)';
                od4.Opportunity__c = opp.Id;
                od4.status__c = 'Requested';
                od4.RequiredDoc__c = true;
                insert od4;
            }

            // All types of products
            Oppr_Document__c od6 = new Oppr_Document__c();
            od6.document_name__c = 'Credit Review acknowledgement';
            od6.Opportunity__c = opp.Id;
            od6.status__c = 'Requested';
            od6.RequiredDoc__c = true;
            insert od6;

            Oppr_Document__c od7 = new Oppr_Document__c();
            od7.document_name__c = 'Bank Statement Summary';
            od7.Opportunity__c = opp.Id;
            od7.status__c = 'Requested';
            od7.RequiredDoc__c = false;
            insert od7;

            //Lead also should be created when a Biz2Credit application is submitted
            //The source of the lead should be Partner
            //When the contact is created, the Lead Source should also be "Partner"
            //The Lead should be attached to "Biz2Credit" campaign.  
            //See Production to get the details of Biz2Credit campaign.  
            //As the source system is B2C.  Also the same campaign should be reflected in the sandbox

            Lead ld = new Lead();

            //ld.Status = 'Open';
            //ld.Phone = '3013330000';  //?? 
            
            ld.LeadSource = 'Partner';
            ld.Company = 'Biz2Credit'; //or app.ExternalID
            ld.LastName = app.ExternalID;
            ld.Monthly_Visa_Mastercard_Volume__c = string.valueOf(app.AvgMonthSales);
            ld.Operating_Since__c = app.AgeOfBusinessYrs;
            insert ld;

            opp.Lead_ID_Opp__c = ld.id;
            opp.Lead_Created_Dated_Opp__c = system.today();

            System.debug('Submit Application WS Lead ID --->' + ld.id);
            
            Campaign cmp = new Campaign();
            cmp = [SELECT 
                            id 
                    FROM 
                            Campaign 
                    WHERE 
                            name = 'Biz2Credit'];

            if (cmp.id != null)
            {
                System.debug('Submit Application WS Campaign ID --->' + cmp.id);
                CampaignMember cm = new CampaignMember();
                cm.CampaignId = cmp.Id;
                cm.Status = 'Sent';
                cm.LeadId = ld.Id;
                insert cm;

            }
        } 
        else 
        {
            res.StatusCode = 400;
            res.addHeader('Error', 'Application Error: Check Required Fields: LastName; MerchantID;');
            return new ReturnSubmitAppDetails('false', 'Application Error: Check Required Fields: LastName; MerchantID;', 'Null', 'Null', 'Null');
        }
        return new ReturnSubmitAppDetails('true', 'Success', acct.id, con.id, opp.id);
    }

    global class ReturnSubmitAppDetails
    {
        global Integer totalSize = 0;
        global String message;
        global String opportunityCreatedID;
        global String accountCreatedID;
        global String contactCreatedID;

        global ReturnSubmitAppDetails(String success, String message, String acctID, String contactID, String oppID) {
            this.totalSize = 1;
            this.message = message;
            this.accountCreatedID = acctID;
            this.opportunityCreatedID = oppID;
            this.contactCreatedID = contactID;
        }
    }
}