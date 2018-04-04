@isTest

public class TestFormulaFieldUtiity 
{
    public static TestMethod void TestFormulaFieldUtility_Method()
    {
        Test.startTest();
        Account acc= new Account();
        acc.Name='test1';
        acc.BusinessType__c='Auto Service';
        acc.Owned_Business_Since__c=System.today().addYears(-10);
        acc.Number_of_Terminals_at_Location__c=10;
        acc.Number_of_Locations__c=1;
        Insert acc;
        
        Campaign camp=new Campaign();
        camp.Name= 'test1campaign';
        camp.Type='Internet';
        Insert camp;
            
        Opportunity opp=new Opportunity();
        opp.AccountId=acc.Id;
        opp.ForecastCategoryName='Pipeline';
        opp.Name='test1opportunity';
        opp.LeadSource='A001';
        opp.CampaignID=camp.Id;
        opp.CloseDate=System.Today();
        opp.StageName='Prospecting';
        opp.Current_Processor__c='Alpha Card';
        opp.CH_Business_Ownership_Confirmed__c= 'No';
        opp.B__c='06422';
        opp.Business_Category__c='Consumer Electronics';
        opp.BA_Split_is_40__c='Yes';
        opp.BA_X2_years_in_business__c='Yes';
        opp.BA_I_year_with_current_processor__c='Yes';
        opp.BA_X9_months_remaining_on_the_lease__c='Yes';
        opp.BA_Business_is_a_sole_proprietor__c='Yes';
        opp.Decision_Date__c=System.today();
        opp.Underwriting_Approval__c='Auto Declined';

        opp.New_Payback_Price__c=2500;
        opp.New_Percent_Payback__c=2500;
        opp.Est_Days_to_Repay__c=50;
        opp.New_Advance_Price__c=500;
        opp.Applicant_2_FICO__c=50;
        opp.Business_Category__c = 'Restaurant - Fine Dining';
        opp.Average_Ticket__c ='$50 - $75';
        insert opp;
       
        try
        {
            Merchant__c Merchnt = FormulaFieldUtility.objMerchant;
        }
        catch(Exception ex)   
        {   
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'An exception occurred');    
            ApexPages.addMessage(msg);  
        }
        
        Apexpages.currentpage().getparameters().put('oppId',opp.Id);
        /** =============================== Added Code ================================== **/
        
        String accountDatabaseEntryDaysCount = FormulaFieldUtility.accountDatabaseEntryDaysCount;
        String accountDatabaseEntryFlag = FormulaFieldUtility.accountDatabaseEntryFlag;
        String accRollupApproval = FormulaFieldUtility.accRollupApproval;
        
        /* ========= Added Code Ends here =========== */
        String TMWebDeclineReasons = FormulaFieldUtility.TMWebDeclineReasons;
        String totalDaysForDataEntry = FormulaFieldUtility.totalDaysForDataEntry;
        String totalDaysToDecision = FormulaFieldUtility.totalDaysToDecision;
        String totalDaysInQQAndUnderwriting = FormulaFieldUtility.totalDaysInQQAndUnderwriting;
        String totalDaysToRepay = FormulaFieldUtility.totalDaysToRepay;
        String typeOfBusiness = FormulaFieldUtility.typeOfBusiness;
        //String uCCBusinessStructure = FormulaFieldUtility.uCCBusinessStructure;
        //String mercIntDate = FormulaFieldUtility.merchantInterviewCompleted;
        Decimal applicant1PrevFICO = FormulaFieldUtility.applicant1PrevFICO;
        Decimal ccApplicant1PrevFICO = FormulaFieldUtility.ccApplicant1PrevFICO;
        Contact c  = FormulaFieldUtility.objContact;
        /*opp.Data_Entry_Date__c = Datetime.now();

        opp.Decision_Date__c = Datetime.now();
        update opp;
        
        TMWebDeclineReasons = FormulaFieldUtility.TMWebDeclineReasons;
        totalDaysForDataEntry = FormulaFieldUtility.totalDaysForDataEntry;
        totalDaysToDecision = FormulaFieldUtility.totalDaysToDecision;
        totalDaysInQQAndUnderwriting = FormulaFieldUtility.totalDaysInQQAndUnderwriting;
        totalDaysToRepay = FormulaFieldUtility.totalDaysToRepay;
        typeOfBusiness = FormulaFieldUtility.typeOfBusiness;
        uCCBusinessStructure = FormulaFieldUtility.uCCBusinessStructure;
        mercIntDate = FormulaFieldUtility.merchantInterviewCompleted;
        applicant1PrevFICO = FormulaFieldUtility.applicant1PrevFICO;
        ccApplicant1PrevFICO = FormulaFieldUtility.ccApplicant1PrevFICO;*/
       
        FormulaFieldUtility ffu=new FormulaFieldUtility();
       
        FormulaFieldUtility.objMerchant=null;
        FormulaFieldUtility.opportunity = null;
        
        FormulaFieldUtility.objMerchant=null;
        FormulaFieldUtility.objContact=null;
        //FormulaFieldUtility.objUnderwriting=null;
        //FormulaFieldUtility.accountDatabaseEntryDaysCount=System.Today();
        //system.assert(System.Today(),opp.Account_Database_Entry_Due_Date__c);
        
        // Added by DS-CONAM
        String adlLocationInformation= FormulaFieldUtility.additionalLocationInformation;
        String adlContactInfo= FormulaFieldUtility.additionalContactInfo;
        String approvalRate= FormulaFieldUtility.approvalRate;
        String BABusinessAlertCount= FormulaFieldUtility.BABusinessAlertCount;
        String QCBusinessCategoryAlert= FormulaFieldUtility.QCBusinessCategoryAlert;
        String businessInformation= FormulaFieldUtility.businessInformation;
        String fax= FormulaFieldUtility.fax;
        String cardTypesSelectedByUW= FormulaFieldUtility.cardTypesSelectedByUW;
        String CHCharacterAlertCount= FormulaFieldUtility.CHCharacterAlertCount;
        String conditionalPricingCriteria= FormulaFieldUtility.conditionalPricingCriteria;
        String contactEmail= FormulaFieldUtility.contactEmail;
        String contactID= FormulaFieldUtility.contactID;
        String QCConditionalCriteria= FormulaFieldUtility.QCConditionalCriteria;
        
        String ECCriteriaDecision= FormulaFieldUtility.ECCriteriaDecision;
        String daysSinceDecisionDate= FormulaFieldUtility.daysSinceDecisionDate;
        String DBA_Name= FormulaFieldUtility.DBA_Name;
        Decimal ficoScore=FormulaFieldUtility.ccApplicant1FICO;
        String luxuryB=FormulaFieldUtility.BAIsTheBusinessTypeConsideredLuxury;
        String value11 = FormulaFieldUtility.campaignType;
        String count=FormulaFieldUtility.count;
        //String dealDefaultedFlag=FormulaFieldUtility.dealDefaultedFlag;
        String decisionFlag=FormulaFieldUtility.decisionFlag;
        String declinedFlag=FormulaFieldUtility.declinedFlag;
        String eligibleForRapidFunding=FormulaFieldUtility.eligibleForRapidFunding;
        String UWNewPaybackPrice=FormulaFieldUtility.UWNewPaybackPrice;
        String UWNewPercentPayback=FormulaFieldUtility.UWNewPercentPayback;
        String UWEstDaysToRepay=FormulaFieldUtility.UWEstDaysToRepay;
        String UWNewAdvancePrice=FormulaFieldUtility.UWNewAdvancePrice;
        String OwnedBusinessSince=FormulaFieldUtility.OwnedBusinessSince;
        String NumberOfTerminalsAtLocation=FormulaFieldUtility.NumberOfTerminalsAtLocation;
        String NumberOfLocations=FormulaFieldUtility.NumberOfLocations;
        String homePhone=FormulaFieldUtility.homePhone;
        String fundedAmount=FormulaFieldUtility.fundedAmount;
        //String UWDealRepricedNeedNewFRSA=FormulaFieldUtility.UWDealRepricedNeedNewFRSA;
        Test.stopTest();
    } 

    public static TestMethod void TestFormulaFieldUtility_Method2()
    {
        Test.startTest();
        /*DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm);
        */
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        acc.BillingPostalCode='06327';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='Partners';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        opp.Business_Category__c = 'Restaurant - Fine Dining';
        opp.Average_Ticket__c ='$50 - $75' ;
        opp.BA_X2_years_in_business__c='No';
        opp.amount=80000;
        opp.Estimated_Days_to_Repay__c=190;
        opp.Percent_Payback__c=25;
        opp.Renewal__c=true;
        opp.Funded_by_WC__c=System.now();
        insert opp;
        
        Credit_Related_Reporting__c cReport=new Credit_Related_Reporting__c();
        cReport.Opp_ID__c=opp.id;
        cReport.FICO__c=1001;
        cReport.Opportunity__c=opp.id;
        cReport.TotalOfMortgageTrades60DaysPastDue__c=1;
        cReport.TotalOfMortgageTrades90DaysPastDue__c=1;
        cReport.NumberOfBankruptcies__c=1;
        cReport.TotalPastDueAmount__c=1;
        cReport.OldestOpenDateOfATrade__c=System.today().addDays(-365);
        insert cReport;
        
        opp.QC_Calculator_Average__c=500;
        opp.AE_Calculator_Average__c=400;
        opp.CRR__c=cReport.id;
        update opp;
        
        Contact con = new Contact();
        con.FirstName='test';
        con.OwnershipPercentage__c=5;
        con.Principal_1_Street_Address__c='123 Main St';
        con.Principal_1_City__c='Las Vegas';
        con.Principal_1_State__c='CT';
        con.Principal_1_Zip__c='09601';
        con.MobilePhone='1234567890';
        con.Principal_Home_Phone__c='1234567890';
        con.Fax='1234567890';
        con.Email='test@test.com';
        con.Principal_2_First_Name__c = 'test1';
        con.Principal_2_Last_Name__c = 'test2';
        con.Principal_2_Street_Address__c='123 Main St';
        con.Principal_2_City__c='Las Vegas';
        con.Principal_2_State__c='CT';
        con.Principal_2_Zip__c='09601';
        con.Principal_2_Phone__c='1234567890';
        con.Principal_2_Mobile__c='12345678990';
        con.Principal_2_Email__c='test@test.com';
        con.Principal_2_Percent_Ownership__c =10;
        con.AccountId = acc.Id;
        con.LastName = 'test';
        con.OwnershipPercentage__c=5;
        insert con;
    
        /* DS-CONAM
        Merchant__c merchnt= TestUtils.createMerchant(opp);    
        */
        
        Merchant__c  merchnt = new Merchant__c ();
        merchnt.Opportunity__c = opp.Id;
        insert merchnt;
        
        Apexpages.currentpage().getparameters().put('oppId',opp.Id);    
        con  = FormulaFieldUtility.objContact;
        Merchnt = FormulaFieldUtility.objMerchant;
        
        String value1 = FormulaFieldUtility.approvalProcessTime;
        
        String value2 = FormulaFieldUtility.approvedFlag;
        String value3 = FormulaFieldUtility.approvedAmount;
        String value4 = FormulaFieldUtility.bakerFlag;
        String value5 = FormulaFieldUtility.beginActivityMonitoringDaysCount;
        String value6 = FormulaFieldUtility.beginActivityMonitoringFlag;
        String value7 = FormulaFieldUtility.businessInfo;
        String value8 = FormulaFieldUtility.businessOpenDate;
        String value9 = FormulaFieldUtility.businessPhone;
        String value10 = FormulaFieldUtility.calculatorVariance;
        String value11 = FormulaFieldUtility.campaignType;
        //added by DS-CONAM
        String value12 = FormulaFieldUtility.additionalContactInfo;
        String value14 = FormulaFieldUtility.AE_PrimarySignerInfo;
        Decimal ficoScore=FormulaFieldUtility.ccApplicant1FICO;
        String QCConditionalCriteria=FormulaFieldUtility.QCConditionalCriteria;
        String creditBureauSummary= FormulaFieldUtility.creditBureauSummary;
       // String dealDefaultedFlag=FormulaFieldUtility.dealDefaultedFlag;
        String decisionFlag=FormulaFieldUtility.decisionFlag;
        String declinedFlag=FormulaFieldUtility.declinedFlag;
        String declineLetterSentDaysCount=FormulaFieldUtility.declineLetterSentDaysCount;
        String declineLetterSentFlag=FormulaFieldUtility.declineLetterSentFlag;
       // String equityInHome=FormulaFieldUtility.equityInHome;
      //  String UWDealRepricedNeedNewFRSA=FormulaFieldUtility.UWDealRepricedNeedNewFRSA;
        String UWNewPaybackPrice=FormulaFieldUtility.UWNewPaybackPrice;
        String UWNewPercentPayback=FormulaFieldUtility.UWNewPercentPayback;
        String siteSurveyAvailableDaysCount=FormulaFieldUtility.siteSurveyAvailableDaysCount;
        String SiteSurveyAvailableFlagDel=FormulaFieldUtility.SiteSurveyAvailableFlagDel;
        String SiteSurveyOrderedFlag=FormulaFieldUtility.SiteSurveyOrderedFlag;
        String siteSurveysOrdredDaysCount=FormulaFieldUtility.siteSurveysOrdredDaysCount;
        String submittedToUWFlag=FormulaFieldUtility.submittedToUWFlag;
        Date timeForRenewalDate=FormulaFieldUtility.timeForRenewalDate;
        String primaryContactInfo=FormulaFieldUtility.primaryContactInfo;
        String OwnedBusinessSince=FormulaFieldUtility.OwnedBusinessSince;
        String NumberOfTerminalsAtLocation=FormulaFieldUtility.NumberOfTerminalsAtLocation;
        String NumberOfLocations=FormulaFieldUtility.NumberOfLocations;
        String homePhone=FormulaFieldUtility.homePhone;
        String fundedAmount=FormulaFieldUtility.fundedAmount;
        String UWEstDaysToRepay=FormulaFieldUtility.UWEstDaysToRepay;
        String UWNewAdvancePrice=FormulaFieldUtility.UWNewAdvancePrice;
        Test.stopTest();        
    }    
     public static TestMethod void TestFormulaFieldUtility_Method3()
     {
        Test.startTest();
         /*DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm);
        */
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign  cm = new Campaign();
        cm.name = 'Test';
        cm.type='test';
        insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;
        
        Credit_Related_Reporting__c cReport=new Credit_Related_Reporting__c();
        cReport.Opp_ID__c=opp.id;
        cReport.Fico__c=500;
        cReport.Opportunity__c=opp.id;
        insert cReport;
        
        opp.Account_Database_Entry_Due_Date__c = Date.today();
        opp.Account_Database_Entry__c = Datetime.now();
        opp.CRR__c=cReport.id;
        update opp;
        
        Apexpages.currentpage().getparameters().put('oppId',opp.Id);
        
        String value = FormulaFieldUtility.additionalSignerSSN;
        String value1 = FormulaFieldUtility.AE_PrimarySignerInfo;
        //added by DS-CONAM
        String value2 = FormulaFieldUtility.accountDatabaseEntryFlag;
        Decimal ficoScore=FormulaFieldUtility.ccApplicant1FICO;
        String approvalProcessTime=FormulaFieldUtility.approvalProcessTime;
        String value13 = FormulaFieldUtility.campaignType;
        String declineLetterSentFlag=FormulaFieldUtility.declineLetterSentFlag;
       // String equityInHome=FormulaFieldUtility.equityInHome;
      //  String UWDealRepricedNeedNewFRSA=FormulaFieldUtility.UWDealRepricedNeedNewFRSA;
        String primaryContactInfo=FormulaFieldUtility.primaryContactInfo;
        Test.stopTest();
    }
    
    public static TestMethod void unitTest()
    {
        test.startTest();
        Account acc= new Account();
        acc.Name='test1';
        acc.BusinessType__c='Auto Service';
        Insert acc;
        
        Campaign camp=new Campaign();
        camp.Name= 'test1campaign';
        camp.Type='Internet';
        Insert camp;
        
        Opportunity oppTemp=new Opportunity();
        oppTemp.AccountId=acc.Id;
        oppTemp.ForecastCategoryName='Pipeline';
        oppTemp.Name='test1opportunity';
        oppTemp.LeadSource='A001';
        oppTemp.CampaignID=camp.Id;
        oppTemp.CloseDate=System.Today();
        oppTemp.StageName='Prospecting';
        insert oppTemp;
        
        Credit_Related_Reporting__c cReport=new Credit_Related_Reporting__c();
        cReport.Opp_ID__c=oppTemp.id;
        cReport.Fico__c=500;
        cReport.Opportunity__c=oppTemp.id;
        insert cReport;
        
        Opportunity opp=new Opportunity();
        opp.AccountId=acc.Id;
        opp.ForecastCategoryName='Pipeline';
        opp.Name='test1opportunity';
        opp.LeadSource='A001';
        opp.CampaignID=camp.Id;
        opp.CloseDate=System.Today();
        opp.StageName='Prospecting';
        opp.Current_Processor__c='Alpha Card';
        opp.CH_Business_Ownership_Confirmed__c= 'No';
        opp.Previous_Opportunity__c=oppTemp.id;
        opp.Decline_Letter_Sent__c=System.now();
        opp.BA_X2_years_in_business__c= 'No';
        opp.Amount=77000;
        opp.Percent_Payback__c = 21;
        opp.Estimated_Days_to_Repay__c = 190;
        opp.Percent_Payback__c = 50;
        opp.Decision_Date__c = System.Today(); 
        opp.Data_Entry_Date__c=System.Today();
        opp.Business_Category__c= 'Maid and Cleaning Service';
        opp.Business_Category__c= 'Music and Music Instrument';
        opp.Business_Category__c= 'Tanning and Tattoo'; 
        opp.Business_Category__c= 'Other Service Retail';
        opp.Business_Category__c= 'Other Product Retail';
        opp.Business_Category__c= 'Promotions & Advertising';
        opp.Business_Category__c= 'Automotive - Transmission';
        opp.Product__c = 'MCA';
        opp.Amount=76000;
        
        // opp.Previous_Opportunity__r.Manual_Applicant_1_FICO__c=10;
        insert opp;
        
        Apexpages.currentpage().getparameters().put('oppId',opp.Id);
        
        Decimal ccApplicant1PrevFICO = FormulaFieldUtility.ccApplicant1PrevFICO;
        String baBusinessAlertCount=FormulaFieldUtility.BABusinessAlertCount;
        String declineLetterSentFlag=FormulaFieldUtility.declineLetterSentFlag;
        String QCBusinessCategoryAlert= FormulaFieldUtility.QCBusinessCategoryAlert;
        Decimal yrsInBusiness = FormulaFieldUtility.yrsInBusiness; 
        String TMWebDeclineReasons = FormulaFieldUtility.TMWebDeclineReasons;
        Date timeForRenewalDate =FormulaFieldUtility.timeForRenewalDate;
        String submittedToUWFlag =FormulaFieldUtility.submittedToUWFlag;
        String siteSurveysOrdredDaysCount = FormulaFieldUtility.siteSurveysOrdredDaysCount;
        String SiteSurveyOrderedFlag = FormulaFieldUtility.SiteSurveyOrderedFlag;
        String SiteSurveyAvailableFlagDel = FormulaFieldUtility.SiteSurveyAvailableFlagDel;
        String siteSurveyAvailableDaysCount = FormulaFieldUtility.siteSurveyAvailableDaysCount; 
        String estimatedDailyRepay = FormulaFieldUtility.estimatedDailyRepay; 
        String conditionalPricingCriteria= FormulaFieldUtility.conditionalPricingCriteria;
        Test.stopTest();
    }
    public static TestMethod void TestFormulaFieldUtility_Method5()
    {
        Test.startTest();
        
        Account acc= new Account();
        acc.Name='test1';
        acc.BusinessType__c='Auto Service';
        acc.Owned_Business_Since__c=System.today().addYears(-10);
        acc.Number_of_Terminals_at_Location__c=10;
        acc.Number_of_Locations__c=1;
        Insert acc;
        
        Campaign cm=new Campaign();
        cm.Name= 'test1campaign';
        cm.Type='Internet';
        Insert cm;
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        opp.Product__c ='MCA';
        opp.EC_X4_consecutive_months_of_processing__c ='Yes';
        opp.EC_X12_separate_daily_deposits_per_month__c = 'Yes';
        opp.EC_Company_in_business_6_months__c = 'Yes';
        opp.Pay_Back_Amount__c =100;
        opp.Loan_Term_Days__c= 50;
        opp.Loan_Term_Days__c = 0;
        opp.Loan_Term_Days__c = Null;
        opp.Decision_Date__c = System.Today()+20;
        opp.Data_Entry_Date__c =System.Today();
        opp.Business_Category__c = 'TestBusiness';
        opp.Mortgage_Delinquent__c ='MODIFICATION AGREEMENT';
        opp.Mortgage_Delinquent__c ='NO';
        opp.Mortgage_Delinquent__c ='30 DPD';
        opp.Mortgage_Delinquent__c ='60 DPD';
        opp.Pay_Back_Amount__c =Null;
        opp.EC_X12_separate_daily_deposits_per_month__c = 'Yes';
        opp.EC_Company_in_business_6_months__c ='Yes';
        
        
        insert opp;
        
        Credit_Related_Reporting__c cReport=new Credit_Related_Reporting__c();
        cReport.Opp_ID__c=opp.id;
        cReport.Fico__c=500;
        cReport.Opportunity__c=opp.id;
        insert cReport;
        
        opp.Account_Database_Entry_Due_Date__c = Date.today();
        opp.Account_Database_Entry__c = Datetime.now();
        opp.CRR__c=cReport.id;
        update opp;
        
        Apexpages.currentpage().getparameters().put('oppId',opp.Id);
        
        String ECCriteriaDecision =FormulaFieldUtility.ECCriteriaDecision; 
        String estimatedDailyRepay = FormulaFieldUtility.estimatedDailyRepay; 
        String totalDaysInQQAndUnderwriting = FormulaFieldUtility.totalDaysInQQAndUnderwriting;
        Integer flag3Mortgage =FormulaFieldUtility.flag3Mortgage;
        
        Test.stopTest();
    }
}