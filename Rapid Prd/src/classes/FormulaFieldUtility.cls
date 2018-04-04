public with sharing class FormulaFieldUtility {
        // sentv  fromm server
        public static Opportunity opportunity{
                get{
                    if(opportunity == null){
                        list<Opportunity> objOpportunities = [Select EC_X12_separate_daily_deposits_per_month__c, CRR__r.TotalOfMortgageTrades90DaysPastDue__c, CRR__r.TotalOfMortgageTrades60DaysPastDue__c,
                        CRR__r.NumberOfBankruptcies__c, CRR__r.TotalPastDueAmount__c, CRR__r.OldestOpenDateOfATrade__c, 
                        Previous_Opportunity__r.CRR__c,Previous_Opportunity__c, Manual_Applicant_1_FICO__c, Processing_Rep_Assigned__c, CRR__c, CRR__r.FICO__c,Processing_Initial_Review_Complete__c, Account.Current_Balance__c, 
                        Percent_Paid_Off__c, Underwriter_Assigned__c, New_Payback_Price__c, New_Percent_Payback__c, Est_Days_to_Repay__c, New_Advance_Price__c, UWEligible_for_Rapid_Funding__c, 
                        CloseDate, Signed_Contract_Received__c, B__c, Account.BusinessStructure__c, Campaign.SWIFT_Campaign__c, Site_Survey_Ordered_Due_Date__c, Initial_underwriting_approval__c, 
                        Tracking_Code_Opp__c, Pre_Qual_Decision__c, Campaign.Campaign_Contact_Email__c, Campaign.Campaign_Contact_Number__c, Campaign.Campaign_Contact__c,  
                        Month_Average_Gross_Sales_2__c, Month_Average_Gross_Sale_1__c, 
                        BA_FICO_score_500__c, Does_Merchant_Own_The_Business_Location__c, Business_name_check_match_contract__c, Other_UCC_Filings__c, BAM_Match_Selection__c, Business_Status__c, Confirmed_Westlaw_real_property_search__c, 
                        Eligible_Photo_ID__c, Confirmed_legal_name_in_Westlaw__c, FRSA_legal_name_same_as_in_Salesforce__c, Type_of_Entity__c, Routing_Number__c, Account_Number_For_Funding__c, Bank_Name__c, Judgements_Open__c, Tax_Liens_Open__c,
                        International_Sale_Hidden_Text__c, ImageNow_Complete__c, Submit_to_UW_Processing__c, Site_Survey_Available__c, Site_Survey_Ordered__c, Campaign.Update_Partner_Email_1__c, Campaign.Update_Partner_Email_2__c, 
                        Campaign.Update_Partner_Email_3__c, Campaign.Update_Partner_Email_4__c, Campaign.Update_Partner_Email_5__c, Campaign.Update_Partner_Email_6__c,
                        Funded_by_WC__c, Mortgage_Delinquent__c, Applicant_2_FICO__c, Pay_Back_Amount__c, Loan_Term_Days__c, CH_Business_Ownership_Confirmed__c,
                        Decision_Date__c, EC_Company_in_business_6_months__c, 
                        EC_X4_consecutive_months_of_processing__c, Product__c, Renewal__c, Individual_Bankruptcies__c, Percent_Payback__c, Estimated_Days_to_Repay__c, Amount, Campaign.Type,AE_Calculator_Average__c, 
                        QC_Calculator_Average__c, Account.Federal_or_State_Tax_Liens__c, Account.Time_Remaining_On_Lease__c, Account.Landlord_Agent_Phone__c, Account.Landlord_Agent_Name__c, Account.Does_the_Merchant_Own_the_Building__c,
                        Account.Email_Address__c, Average_Ticket__c, Business_Category__c, BA_Business_is_a_sole_proprietor__c, BA_X9_months_remaining_on_the_lease__c, BA_I_year_with_current_processor__c, BA_Split_is_40__c, 
                        Decline_Letter_Sent_Due_Date__c, Decline_Letter_Sent__c, Begin_Activity_Monitoring__c, Begin_Activity_Monitoring_Due_Date__c, Data_Entry_Date__c, New_Advance_Amount__c, Underwriting_Approval__c, 
                        Pre_Qual_Decision_Date__c, Approval_Process_Entry_Time__c, Account.Location_1_DBA_NAME__c , Account.Location_2_DBA_NAME__c , Account.Location_3_DBA_NAME__c, Account.Location_4_DBA_NAME__c, 
                        Account.Location_1_Address__c, Account.Location_2_Address__c, Account.Location_3_Address__c, Account.Location_4_Address__c, Previous_Opportunity__r.Manual_Applicant_1_FICO__c,
                        Account_Database_Entry_Due_Date__c,Account_Database_Entry__c,Id, Name,StageName, Type,AccountId,Account.BillingPostalCode, Account.Roll_up_Approved__c, Account.Fax, Account.DateBusinessStarted__c, Account.Phone, 
                        Account.Name, Account.FederalTaxID__c, Account.First_Funding_Date__c, Account.Most_Recent_Funded_Renewal_Date__c, Account.Last_Renewal_Date__c,
                        CreatedDate, Account.Last_Created_Opportunity__c, Account.Legal_Name__c, Account.Months_with_Current_Processor__c, 
                        Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c, Account.Owned_Business_Since__c, Account.BusinessType__c, 
                        Account.ownerId,Account.Type,Opportunity_Number__c,BA_X2_years_in_business__c,Previous_Opportunity__r.CRR__r.FICO__c  From Opportunity where id=:apexpages.currentpage().getparameters().get('oppId') limit 1];
                        opportunity = objOpportunities.get(0);
                     }
                     return opportunity;
                }private set;
        } 

        public static Merchant__c objMerchant{
                get{
                    if(objMerchant == null){
                        list<Merchant__c> objMerchants = [SELECT Merchant_Interview_Completed_Date__c
                        FROM Merchant__c WHERE Opportunity__c=: opportunity.Id]; 
                        if(!objMerchants.isEmpty()){                        
                            objMerchant = objMerchants.get(0);
                        }else{
                            objMerchant = new Merchant__c(); 
                        }
                    }
                    return objMerchant;
                }private set;
        }     
        
        public static Contact objContact{
                get{
                    if(objContact == null){
                        list<Contact> objContacts = [SELECT pi__utm_term__c, pi__utm_source__c, pi__utm_medium__c, pi__utm_content__c, 
                        pi__utm_campaign__c, pi__url__c, pi__score__c, pi__notes__c, pi__last_activity__c, pi__grade__c, pi__first_touch_url__c, 
                        pi__first_search_type__c, pi__first_search_term__c, pi__first_activity__c, pi__created_date__c, pi__comments__c, 
                        pi__campaign__c, Years_at_Current__c, Title, SystemModstamp, Suffix__c, Subscribed_to_Newsletter__c, SoftPhone_Test__c, 
                        Salutation, SS__c, ReportsToId, Relationship__c, Principal_Type__c, 
                        Principal_Home_Phone__c, Principal_2_Zip__c, Principal_2_Street_Address__c, Principal_2_State__c, 
                        Principal_2_Social_Security_Number__c, Principal_2_Phone__c, Principal_2_Percent_Ownership__c, Principal_2_Mobile__c, 
                        Principal_2_Last_Name__c, Principal_2_First_Name__c, Principal_2_Email__c, Principal_2_Date_of_Birth__c, 
                        Principal_2_City__c, Principal_1_Zip__c, Principal_1_Street_Address__c, Principal_1_State__c, Principal_1_City__c, 
                        Phone, Partner_User__c, Partner_User_Name__c, OwnershipPercentage__c, OwnerId, OtherStreet, OtherState, OtherPostalCode, 
                        OtherPhone, OtherCountry, OtherCity, Name_of_Bank_Personal__c, Name, Months_at_Previous_Address__c, 
                        Months_at_Current_Address__c, Monthly_Gross_Salary__c, MobilePhone, Middle_Name__c, MasterRecordId, MailingStreet, 
                        MailingState, MailingPostalCode, MailingCountry, MailingCity, LeadSource, Last_Temporary_Password__c, LastName, 
                        LastCUUpdateDate, LastCURequestDate, LastActivityDate, JigsawContactId, Jigsaw, Import_ID__c, Id, HomePhone, 
                        HasOptedOutOfFax, HasOptedOutOfEmail, FirstName, Filed_for_bankruptcy__c, Fax, Email_Present__c, EmailBouncedReason, 
                        EmailBouncedDate, Email, Efax__c, Efax_Status__c, Efax_Notes__c, DoNotCall, Description, Department, Date_of_Birth__c, 
                        Date_Bounced__c, DO_NOT_FAX__c, CreatedDate, CreatedById, Campaign_Name__c, Birthdate, AssistantPhone, 
                        AssistantName,  Additional_Contact_Phone__c, Additional_Contact_Name__c, Additional_Contact_Mobile__c, Additional_Contact_Fax__c, Additional_Contact_Email__c, Additional_Contact_Address__c, AccountId
                        FROM Contact WHERE AccountId=:opportunity.Account.Id];
                        if(!objContacts.isEmpty()){                        
                            objContact = objContacts.get(0);
                        }else{ objContact = new Contact(); }                  
                    }
                    return objContact;
                }private set;
        }   
                
        public static String accountDatabaseEntryDaysCount{
            get{
                return ''+opportunity.Account_Database_Entry_Due_Date__c;//+(System.TODAY() - opportunity.Account_Database_Entry_Due_Date__c) - (System.NOW() - opportunity.Account_Database_Entry__c);
            }private set;
        }
        
        public static String accountDatabaseEntryFlag{
            get{
                String imageURL ='/img/samples/flag_red.gif';
                String imageURLSecond = '/s.gif';
                if(opportunity.Account_Database_Entry__c == null /*&& accountDatabaseEntryDaysCount < System.TODAY()*/){
                    return imageURL;
                }
                else{ return imageURLSecond;}
            }private set;           
        }
        
        public static String accRollupApproval{
            get{                                            
                return ''+opportunity.Account.Roll_up_Approved__c;
            }private set;
        }
        
        public static String additionalLocationInformation{
            get{    
                return 'Location 2:' + '\n'
                + ' DBA Name:' + opportunity.Account.Location_2_DBA_NAME__c + '\n' 
                + ' Address:' + opportunity.Account.Location_2_Address__c + '\n' + '\n' 
                + 'Location 3:' + '\n' 
                + ' DBA Name:' + opportunity.Account.Location_3_DBA_NAME__c + '\n' 
                + ' Address:' + opportunity.Account.Location_3_Address__c + '\n' + '\n' 
                + 'Location 4:' + '\n' 
                + ' DBA Name:' + opportunity.Account.Location_4_DBA_NAME__c + '\n' 
                + ' Address:' + opportunity.Account.Location_4_Address__c + '\n' 
                + 'Location 5:' + '\n' 
                + ' DBA Name:' + opportunity.Account.Location_1_DBA_NAME__c + '\n' 
                + ' Address:' + opportunity.Account.Location_1_Address__c + '\n' + '\n';                                            
            }private set;
        }
        
        public static String additionalContactInfo{
            get{
                String Principal2FirstName = '';
                if(objContact.Principal_2_First_Name__c != null){
                    Principal2FirstName = objContact.Principal_2_First_Name__c;
                }
                String Principal2LastName = '';
                if(objContact.Principal_2_Last_Name__c != null){
                    Principal2LastName = objContact.Principal_2_Last_Name__c;
                }
                String Principal2StreetAddress = '';
                if(objContact.Principal_2_Street_Address__c != null){
                    Principal2StreetAddress = objContact.Principal_2_Street_Address__c;
                }
                String Principal2City = '';
                if(objContact.Principal_2_City__c != null){
                    Principal2City = objContact.Principal_2_City__c;
                }
                String Principal2State = '';
                if(objContact.Principal_2_State__c != null){
                    Principal2State = objContact.Principal_2_State__c;
                }
                String Principal2Zip = '';
                if(objContact.Principal_2_Zip__c != null){
                    Principal2Zip = objContact.Principal_2_Zip__c;
                }
                String Principal2Phone = '';
                if(objContact.Principal_2_Phone__c != null){
                    Principal2Phone = objContact.Principal_2_Phone__c;
                }
                String Principal2Mobile = '';
                if(objContact.Principal_2_Mobile__c != null){
                    Principal2Mobile = objContact.Principal_2_Mobile__c;
                }
                String Principal2Email = '';
                if(objContact.Principal_2_Email__c != null){
                    Principal2Email = objContact.Principal_2_Email__c;
                }
                
                Decimal principal2PercentOwnership = 0;             
                if(objContact.Principal_2_Percent_Ownership__c != null){
                    principal2PercentOwnership = objContact.Principal_2_Percent_Ownership__c;
                }
                return 'Additional Contact Info:' + '<br/>'
                + 'Full Name: ' + Principal2FirstName + ' ' + Principal2LastName + '<br/>' 
                + 'Ownership: ' +  principal2PercentOwnership*100 + '%' +  '<br/>'
                + 'Address: ' + '<br/>'
                + Principal2StreetAddress + '<br/>' 
                + Principal2City  + ', ' +  Principal2State + ' ' +  Principal2Zip + '<br/>'
                + 'Phone: ' + Principal2Phone +  '<br/>'
                + 'Mobile: ' +  Principal2Mobile + '<br/>'
                + 'Email: ' + Principal2Email;
            }private set;
        }
        
        public static String additionalSignerSSN{
            get{                                            
                return objContact.Principal_2_Social_Security_Number__c;
            }private set;
        }
        
        public static String AE_PrimarySignerInfo{
            get{
                if(objContact != null){
                    Decimal str = 0;
                    if(objContact.OwnershipPercentage__c != null)
                        str = objContact.OwnershipPercentage__c*100;
                    return 'Primary Contact Info:' +  '\n'
                    + 'Full Name: ' + objContact.FirstName + ''  + objContact.LastName +  '\n' 
                    + 'Ownership: ' + str + '%' +  '\n' 
                    + 'Address:' + '\n' 
                    + objContact.Principal_1_Street_Address__c +  '\n' 
                    + objContact.Principal_1_City__c + ', ' + objContact.Principal_1_State__c + ' ' +  objContact.Principal_1_Zip__c + '\n' 
                    + 'Business Phone: ' + objContact.Phone + '\n' 
                    + 'Home Phone: ' + homePhone + '\n' 
                    + 'Mobile: ' + objContact.MobilePhone +  '\n' 
                    + 'Fax: ' + objContact.Fax + '\n' 
                    + 'Email: ' + objContact.Email;
                }
                else{ return  '';}         
            }private set;
        }
        
        public static Decimal ccApplicant1FICO{
            get{
                if(opportunity.CRR__c == null){
                        return null;
                }
                else{
                    if(opportunity.CRR__r != null && opportunity.CRR__r.FICO__c<1000){
                            return opportunity.CRR__r.FICO__c;
                    }
                    else { return null;}
                }               
            }private set;
        }
        
        public static String approvalProcessTime{
            get{                                            
                return '';//+(opportunity.Pre_Qual_Decision_Date__c.getTime() - opportunity.Approval_Process_Entry_Time__c.getTime());
            }private set;
        }
        
        public static String approvalRate{
            get{                                            
                return ''+approvedFlag;
            }private set;
        }
        
        public static String approvedFlag{
            get{    
                if(opportunity.Underwriting_Approval__c != null && ( opportunity.Underwriting_Approval__c == 'Approved') ||
                ( opportunity.Underwriting_Approval__c =='Approved by Credit Committee') ||
                ( opportunity.Underwriting_Approval__c == 'Approved by Credit Committee but change in advance amount and split') ||
                ( opportunity.Underwriting_Approval__c == 'Approved by Credit Committee but change in split') ||
                ( opportunity.Underwriting_Approval__c == 'Approved by Credit Committee with conditions') ||
                ( opportunity.Underwriting_Approval__c == 'Approved - Pending Management Review') ||
                ( opportunity.Underwriting_Approval__c == 'Auto Approved') ||
                ( opportunity.Underwriting_Approval__c == 'Approved by Credit Committee but change in advance amount')){
                    return ''+1;
                }
                else{ return ''+0;}                               
            }private set;
        }
        
        public static String approvedAmount{
            get{                                            
                if( approvedFlag != null && integer.ValueOf(approvedFlag) == 1){ 
                    return ''+opportunity.New_Advance_Amount__c ;
                }
                else{
                    return null;
                }
            }private set;
        }
        
        public static String bakerFlag{
            get{                                            
                if( opportunity.Data_Entry_Date__c == null ){
                    return ''+0;
                }
                else{
                    return ''+1;
                }
            }private set;
        }
        
        public static String beginActivityMonitoringDaysCount{
            get{
                return 'sdf'; 
                //(System.TODAY()-opportunity.Begin_Activity_Monitoring_Due_Date__c) - (NOW()- opportunity.Begin_Activity_Monitoring__c);
            }private set;
        }
        
        public static String beginActivityMonitoringFlag{
            get{
                String imageURL='/img/samples/flag_red.gif';
                String imageURLSecond = '/s.gif';
                if(opportunity.Decline_Letter_Sent__c  == Null || opportunity.Decline_Letter_Sent_Due_Date__c < System.TODAY()){
                    return imageURL;
                }
                else{
                    return imageURLSecond;
                }                                               
            }private set;           
        }
        
        public static String BABusinessAlertCount{
            get{    
                String str = '';                                        
                if(zipAlert == 'Yes'){
                    str = str+ 1;
                }
                else{
                    str = str+ 0;
                }
                if(BAIsTheBusinessTypeConsideredLuxury == 'Yes'){
                    str = str+ 1;
                }
                else{
                      str = str+ 0;
                }
                if( opportunity.BA_Split_is_40__c == 'Yes') {
                     str = str+ 1;
                }
                else{
                      str = str+ 0;
                }
                if(opportunity.BA_X2_years_in_business__c == 'Yes') {
                     str = str+ 1;
                }
                else{
                      str = str+ 0;
                }
                if( opportunity.BA_I_year_with_current_processor__c == 'Yes') {
                     str = str+ 1;
                }
                else{
                      str = str+ 0;
                }
                if( opportunity.BA_X9_months_remaining_on_the_lease__c == 'Yes') {
                      str = str+ 1;
                }
                else{
                      str = str+ 0;
                 }
                if( opportunity.BA_Business_is_a_sole_proprietor__c == 'Yes') {
                     str = str+ 1;
                 }
                else{
                      str = str+ 0;
                }
                return str;     
            }private set;
        }
        
        public static String QCBusinessCategoryAlert{
            get{                                            
                if( (opportunity.Business_Category__c == 'Restaurant - Fine Dining' ||opportunity.Business_Category__c == 'Restaurant - Casual Dining') &&
                    (opportunity.Average_Ticket__c =='$50 - $75' || opportunity.Average_Ticket__c =='> $75' || opportunity.BA_X2_years_in_business__c =='Yes')){
                    return 'Auto Decline under Business Type' ;
                } 
                else{
                    return 'No Alert' ;
                }                       
            }private set;
        }
        
        public static String fax{
            get{                                            
                return opportunity.Account.Fax;                 
            }private set;
        }
        
        public static String businessInfo{
            get{                                            
                return 'Address:' + '\n'               
                + 'Business Phone:' + opportunity.Account.Phone + '\n' 
                + 'Fax:' + opportunity.Account.Fax + '\n' 
                + 'Email:' + opportunity.Account.Email_Address__c;                      
            }private set;
        }
        
        public static String businessInformation{
            get{                                            
                return 'Legal Name: ' + opportunity.Account.Legal_Name__c + '\n' 
                + 'DBA Name: ' + opportunity.Account.Name + '\n' + '\n'                      
                + 'Phone: ' + opportunity.Account.Phone + '\n'
                + 'Fax: '+ opportunity.Account.Fax + '\n'
                /*this field has been deleted*/ 
                //+ 'Best Number to Call: '+  Best_Number_To_Call__c + '\n' 
                + 'Email: ' + opportunity.Account.Email_Address__c + ' ' + '\n' + '\n' 
                + 'Federal Tax ID: ' + opportunity.Account.FederalTaxID__c + ' ' + '\n' + '\n' 
                + 'Number of Businesses Included In Advance: ' + NumberOfLocations + '\n' 
                + 'Number of Terminals at Location: ' + NumberOfTerminalsAtLocation  + '\n' + '\n' 
                + 'Business Open Date: '+  opportunity.Account.DateBusinessStarted__c + '\n' 
                + 'Owned Business Since: ' + OwnedBusinessSince + '\n' + '\n' 
                + 'Does the Merchant Own the Building: ' + opportunity.Account.Does_the_Merchant_Own_the_Building__c +  '\n' 
                + 'Landlord/Agent Name: ' + opportunity.Account.Landlord_Agent_Name__c + '\n' 
                + 'Landlord/Agent Phone: ' + opportunity.Account.Landlord_Agent_Phone__c + '\n' 
                + 'Time Remaining on Site Lease/Mortgage: ' + opportunity.Account.Time_Remaining_On_Lease__c + '\n' + '\n' 
                + 'Federal or State Tax Liens?: ' + opportunity.Account.Federal_or_State_Tax_Liens__c  + '\n';                 
            }private set;
        }
        
        public static String businessOpenDate{
            get{                                            
                return ''+opportunity.Account.DateBusinessStarted__c;                   
            }private set;
        }
        
        public static String businessPhone{
            get{                                            
                return ''+opportunity.Account.Phone;                    
            }private set;
        }
        
        public static String calculatorVariance{
            get{    
                if(opportunity.QC_Calculator_Average__c != null && opportunity.AE_Calculator_Average__c != null && opportunity.AE_Calculator_Average__c > 0){
                    return ''+ (1 - ( Decimal.valueOf(''+opportunity.QC_Calculator_Average__c) / Decimal.valueOf(''+opportunity.AE_Calculator_Average__c) ));
                }
                else{
                    return ''+ 1;
                }
            }private set;
        }
        
        public static String campaignType{
            get{                                            
                if(opportunity.Campaign.Type =='Partners'){
                    return 'Partners';
                }
                else if(opportunity.Campaign.Type == 'Internet'){
                    return 'Internet' ;
                }
                else{
                    return 'Rapid Advance Internal Campaign' ;
                }
            }private set;
        }
        
        public static String cardTypesSelectedByUW{
            get{    
                String str = '';                                        
                
                return str;
            }private set;
        }
        
        public static String CHCharacterAlertCount{
            get{    
                Integer i = 0;                                  
                if(opportunity.CH_Business_Ownership_Confirmed__c == 'No'){
                        i = i + 1;
                }
                return ''+i;    
            }private set;
        }
        
        public static String conditionalPricingCriteria{
            get{            
                String str= '';                         
                if (QCBusinessCategoryAlert == 'No Alert' && QCSCFAlert == 'No Alert'){
                    str = str +  'Not Relevant' ;
                }
                else{
                    if ((QCSCFAlert == 'Yes' && opportunity.BA_X2_years_in_business__c== 'No') && opportunity.Amount>75000){
                        str = str + 'Advance cannot exceed $75,000. ' ;
                    }                           
                }               
                if((QCSCFAlert =='Yes' || QCBusinessCategoryAlert == 'Yes') && opportunity.BA_X2_years_in_business__c== 'No' && opportunity.Estimated_Days_to_Repay__c > 189){
                    str = str + 'Estimated Term cannot exceed 189 days.' ;
                }
                if(QCSCFAlert =='Yes' && QCBusinessCategoryAlert == 'Yes' && opportunity.BA_X2_years_in_business__c == 'No' && opportunity.Percent_Payback__c > 20){
                    str = str + 'Percent Payback cannot exceed 20%' ;
                }                                       
                else{
                    if (QCBusinessCategoryAlert == 'Yes' && opportunity.BA_X2_years_in_business__c== 'No' && opportunity.Percent_Payback__c > 20){
                        str = str + 'Percent Payback cannot exceed 20%' ;
                    } 
                    else{
                        if (QCSCFAlert =='Yes' && opportunity.BA_X2_years_in_business__c== 'No' && opportunity.Percent_Payback__c > 40){
                            str = str + 'Percent Payback cannot exceed 40%' ;
                        }                                       
                    }
                }
                return str;
            }private set;
        }
        
        public static String contactEmail{
            get{                                            
                return objContact.Email;
            }private set;
        }
        
        public static String contactID{
            get{                                            
                return objContact.Id;
            }private set;
        }
        
        public static String count{
            get{                                            
                return '1';
            }private set;
        }
        
        public static String QCConditionalCriteria{
            get{
                if( opportunity.Renewal__c){
                    if((QCSCFAlert == 'Yes' && flag1FICO == 1) || flag3Mortgage == 1 || opportunity.Individual_Bankruptcies__c == 'yes'){
                        return 'Auto Credit Decline for renewals' ;
                    }
                    else{
                        return 'No Alert' ;
                    }
                }
                else{
                    if (flag1FICO == 1 || flag3Mortgage == 1 || flag3Mortgage == 2 || opportunity.Individual_Bankruptcies__c == 'YES'){
                        return 'Auto Credit Decline for New Deals' ;
                    }
                    else{ return 'No Alert' ; }                              
                }
            }private set;
        }
        
        public static String creditBureauSummary{
            get{
                Decimal totalOfMortgageTrades60DaysPastDue = 0;
                if(opportunity.CRR__r.TotalOfMortgageTrades60DaysPastDue__c != null){
                    totalOfMortgageTrades60DaysPastDue = opportunity.CRR__r.TotalOfMortgageTrades60DaysPastDue__c;
                }
                Decimal totalOfMortgageTrades90DaysPastDue = 0;
                if(opportunity.CRR__r.TotalOfMortgageTrades90DaysPastDue__c != null){
                    totalOfMortgageTrades90DaysPastDue = opportunity.CRR__r.TotalOfMortgageTrades90DaysPastDue__c;
                }
                Decimal numberOfBankruptcies = 0;
                if(opportunity.CRR__r.NumberOfBankruptcies__c != null){
                    numberOfBankruptcies = opportunity.CRR__r.NumberOfBankruptcies__c;
                }
                Decimal totalPastDueAmount = 0;
                if(opportunity.CRR__r.TotalPastDueAmount__c != null){
                    totalPastDueAmount = opportunity.CRR__r.TotalPastDueAmount__c;
                }
                String oldestOpenDateOfATrade = '';
                if(opportunity.CRR__r.OldestOpenDateOfATrade__c != null){
                    oldestOpenDateOfATrade = '' + opportunity.CRR__r.OldestOpenDateOfATrade__c;
                }
                String s;
                s = 'Total Of Mortgage Trades 60 DPD: ' + totalOfMortgageTrades60DaysPastDue + '<br/>' 
                + 'Total Of Mortgage Trades 90 DPD: ' + totalOfMortgageTrades90DaysPastDue + '<br/>' 
                + 'Number Of Bankruptcies: ' + numberOfBankruptcies + '<br/>' 
                + 'Total Past Due Amount: ' + totalPastDueAmount + '<br/>' 
                + 'Oldest Open Date Of A Trade: ' + oldestOpenDateOfATrade;
                return s;
            }private set;
        }
        
        public static String ECCriteriaDecision{
            get{
                if(opportunity.Product__c == 'MCA'){
                    if(opportunity.EC_X4_consecutive_months_of_processing__c == 'Yes'){
                        return 'INELIGIBLE - STOP RIGHT NOW' ;
                    }
                    else if(opportunity.EC_X12_separate_daily_deposits_per_month__c == 'Yes'){
                        return 'INELIGIBLE - STOP RIGHT NOW' ;
                    }else if(opportunity.EC_Company_in_business_6_months__c == 'Yes'){
                        return  'INELIGIBLE - STOP RIGHT NOW' ;
                    }else{
                        return 'Eligible Criteria Met';
                    }          
                }
                else if(opportunity.Product__c == 'Loan'){
                    if(opportunity.EC_Company_in_business_6_months__c == 'Yes'){
                        return 'INELIGIBLE - STOP RIGHT NOW' ;
                    }
                    else{
                        return 'Eligible Criteria Met' ;
                    }
                }
                else{
                    return 'Eligible Criteria Met' ;
                }       
            }private set;
        }
        
        public static String daysSinceDecisionDate{
            get{
                return ''; //+ System.NOW() - opportunity.Decision_Date__c;                             
            }private set;
        }
        
        public static String DBA_Name{
            get{
                return '';
            }private set;
        }
        
        /*public static String dealDefaultedFlag{
            get{
                String imageURL='/img/samples/flag_red.gif';
                String imageURLSecond= '/s.gif';
                if(opportunity.Deal_Defaulted__c){
                        return imageURL;
                }
                else{
                        return imageURLSecond;
                }                       
            }private set;
        }*/
        
        public static String decisionFlag{
            get{
                if(opportunity.Decision_Date__c == Null){
                    return '' + 0;
                }
                else{
                    return '' + 1;
                }
            }private set;
        }
        
        public static String declinedFlag{
            get{
                if (opportunity.Underwriting_Approval__c=='Auto Declined' || opportunity.Underwriting_Approval__c=='Declined' || opportunity.Underwriting_Approval__c=='Declined by Credit Committee' ||
                opportunity.Underwriting_Approval__c=='Declined - Pending Management Review'){
                    return '' + 1;
                }
                else{
                    return '' + 0;
                }
            }private set;
        }
        
        public static String declineLetterSentDaysCount{
            get{
                return ''; //'(TODAY()-opportunity.Decline_Letter_Sent_Due_Date__c) - (System.NOW()- opportunity.Decline_Letter_Sent__c);
            }private set;
        }
        
        public static String declineLetterSentFlag{
            get{
                String imageURL = '/img/samples/flag_red.gif';
                String imageURLSecond = '/s.gif';
                if(opportunity.Decline_Letter_Sent__c  == Null || opportunity.Decline_Letter_Sent_Due_Date__c < System.TODAY()){
                    return imageURL;
                }
                else{
                    return imageURLSecond;
                }
            }private set;
        }
        /*
        public static String equityInHome{
            get{
                if(opportunity.What_ is_the_value_of_their_home__c != null && opportunity.What_is_ their_home_mortgage_balance__c != null){
                    return '' + (Double.valueOf('' + opportunity.What  _is_the_value_of_their_home__c) - Double.valueOf('' +opportunity.What  _is_their_home_mortgage_balance__c));     
                }
                else{
                    return '';
                }   
            }private set;
        }        
        */
        /********* START undewritting oject fields**********/
        /*
        public static String UWDealRepricedNeedNewFRSA{
            get{
                if(opportunity.Deal _Repriced_Need_New_FRSA__c != null){
                    return ''+opportunity.Deal _Repriced_Need_New_FRSA__c;                   
                }
                else{
                    return '';
                }                               
            }private set;
        }
        */
        public static String eligibleForRapidFunding{
            get{
                return opportunity.UWEligible_for_Rapid_Funding__c;               
            }private set;
        }
        
        public static String UWNewPaybackPrice{
            get{
                if(opportunity.New_Payback_Price__c != null){
                    return ''+opportunity.New_Payback_Price__c;                 
                }
                else{
                    return '';
                }                               
            }private set;
        }
        
        public static String UWNewPercentPayback{
            get{
                if(opportunity.New_Percent_Payback__c != null){
                    return ''+opportunity.New_Percent_Payback__c;                   
                }
                else{
                    return '';
                }                               
            }private set;
        }
        
        public static String UWEstDaysToRepay{
            get{
                if(opportunity.Est_Days_to_Repay__c != null){
                     return ''+opportunity.Est_Days_to_Repay__c;    
                }
                else{
                    return '';
                }                              
            }private set;
        }
        
        public static String UWNewAdvancePrice{
            get{
                if(opportunity.New_Advance_Price__c != null){
                    return ''+opportunity.New_Advance_Price__c;     
                }
                else{ return '';}
                                 
            }private set;
        }
        

        
        public static String estimatedDailyRepay{
            get{
                if(opportunity.Product__c != null && (opportunity.Product__c == 'Loan' || opportunity.Product__c == 'Loan w/MCA pricing' || 
                                                      opportunity.Product__c == 'High Risk Loan' || opportunity.Product__c == 'Syndication Loan w/MCA Pricing'))
                {
                    if(opportunity.Pay_Back_Amount__c == null || opportunity.Loan_Term_Days__c == null || opportunity.Loan_Term_Days__c == 0 ){
                        return '' + 0;
                    }
                    else{
                        return '' + (opportunity.Pay_Back_Amount__c / opportunity.Loan_Term_Days__c) ;
                    }
                }
                else{
                    if(opportunity.Pay_Back_Amount__c == null || opportunity.Estimated_Days_to_Repay__c == null || opportunity.Estimated_Days_to_Repay__c == 0){
                        return '' + 0;
                    }
                    else{
                        return '' + (opportunity.Pay_Back_Amount__c / opportunity.Estimated_Days_to_Repay__c);
                    }
                } 
            }private set;
        }
        
        /*public static String federalTaxID{
            get{
                if(opportunity.Account.FederalTaxID__c != null){
                    return opportunity.Account.FederalTaxID__c;                 
                }
                else{
                    return '';
                }
            }private set;
        }*/
  
        
        public static integer flag1FICO{
            get{
                if(ccApplicant1FICO < 500 || (opportunity.Applicant_2_FICO__c < 500 && opportunity.Applicant_2_FICO__c > 0)){
                    return 1;
                }
                else{
                    return 0;
                }
            }private set;
        }
        
        public static Integer flag3Mortgage{
            get{
                if(opportunity.Mortgage_Delinquent__c =='MODIFICATION AGREEMENT' || opportunity.Mortgage_Delinquent__c =='NO' || opportunity.Mortgage_Delinquent__c =='30 DPD'){
                    return 0;
                }
                else if(opportunity.Mortgage_Delinquent__c =='60 DPD' ){
                    return 2;
                }
                else{
                    return 1;
                }
            }private set;
        }
        
     
        
        public static Integer fundedFlag{
            get{
                if(opportunity.Funded_by_WC__c == null){
                    return 0;
                }
                else{
                    return 1;
                }
            }private set;
        }
        
        public static String fundedAmount{
            get{
                if(fundedFlag != null && fundedFlag == 1){
                    return '' + opportunity.New_Advance_Amount__c;
                }
                else{
                    return '';
                }
            }private set;
        }
        
  
        public static String homePhone{
            get{ 
                if(objContact.Principal_Home_Phone__c != null){
                    return objContact.Principal_Home_Phone__c;
                }
                else{
                    return '';
                }                                         
                
            }private set;
        }
        

        public static String BAIsTheBusinessTypeConsideredLuxury{
            get{
                if(opportunity.Business_Category__c != null && opportunity.Business_Category__c == '') {
                    return '';
                }
                if(opportunity.Business_Category__c != null && (opportunity.Business_Category__c== 'Computer-Related Retail' 
                    || opportunity.Business_Category__c== 'Consumer Electronics' 
                    || opportunity.Business_Category__c== 'Furniture'
                    || opportunity.Business_Category__c == 'Golf - Stores, Driving Ranges, Country Clubs'
                    || opportunity.Business_Category__c== 'Health Club'
                    || opportunity.Business_Category__c== 'Housing-Related'
                    || opportunity.Business_Category__c == 'Jewelry'
                    || opportunity.Business_Category__c== 'Limosine & Transportation'
                    || opportunity.Business_Category__c == 'Restaurant - Fine Dining' 
                    || opportunity.Business_Category__c== 'Maid and Cleaning Service'
                    || opportunity.Business_Category__c== 'Music and Music Instrument'
                    || opportunity.Business_Category__c== 'Tanning and Tattoo' 
                    || opportunity.Business_Category__c== 'Other Service Retail'
                    || opportunity.Business_Category__c== 'Other Product Retail'
                    || opportunity.Business_Category__c== 'Promotions & Advertising'
                    || opportunity.Business_Category__c== 'Automotive - Transmission')){
                    return 'Yes';
                }
                else{
                    return 'No';
                }
            }private set;
        }
        
 
        
        public static String NumberOfLocations{
            get{
                if(opportunity.Account.Number_of_Locations__c != null){
                    return '' + opportunity.Account.Number_of_Locations__c;
                }
                else{
                    return '';
                }
            }private set;
        }
        
        public static String NumberOfTerminalsAtLocation{
            get{
                if(opportunity.Account.Number_of_Terminals_at_Location__c != null){
                    return '' + opportunity.Account.Number_of_Terminals_at_Location__c;
                }
                else{
                    return '';
                }
            }private set;
        }
        
      
        
        public static String OwnedBusinessSince{
            get{
                if(opportunity.Account.Owned_Business_Since__c != null){
                    return '' + opportunity.Account.Owned_Business_Since__c;
                }
                else{
                    return '';
                }
            }private set;
        }
        
       
        public static String primaryContactInfo{
            get{
                if(objcontact != null){
                    String firstName = '';
                    if(objContact.FirstName != null){
                        firstName = objContact.FirstName;
                    }
                    String lastName = '';
                    if(objContact.LastName != null){
                        lastName = objContact.LastName;
                    }
                    Decimal ownerShipPer = 0;
                    if(objcontact.OwnershipPercentage__c != null){
                        ownerShipPer = objcontact.OwnershipPercentage__c;
                    }
                    String principal1StreetAddress = '';
                    if(objContact.Principal_1_Street_Address__c != null){
                        principal1StreetAddress = objContact.Principal_1_Street_Address__c;
                    }
                    String principal1City = '';
                    if(objContact.Principal_1_City__c != null){
                        principal1City = objContact.Principal_1_City__c;
                    }
                    String principal1State = '';
                    if(objContact.Principal_1_State__c != null){
                        principal1State = objContact.Principal_1_State__c;
                    }
                    String principal1Zip = '';
                    if(objContact.Principal_1_Zip__c != null){
                        principal1Zip = objContact.Principal_1_Zip__c;
                    }                   
                    
                    String mobilePhone = '';
                    if(objContact.MobilePhone != null){
                        mobilePhone = objContact.MobilePhone;
                    }
                    
                    if(objContact.Fax != null){
                        fax = objContact.Fax;
                    }
                    String email = '';
                    if(objContact.Email != null){
                        email = objContact.Email;
                    }
                    return 'Primary Contact Info:'+ '<br/>'
                    + 'Full Name: '+  firstName +  ' ' + lastName +'<br/>' 
                    + 'Ownership: '+ ownerShipPer*100 +'%'+ '<br/>' 
                    + 'Address: ' +'<br/>' 
                    + principal1StreetAddress +'<br/>' 
                    +  principal1City +', '+ principal1State +' '+ principal1Zip +'<br/>' 
                    + 'Phone: '+ homePhone +'<br/>' 
                    + 'Mobile: ' + '' + mobilePhone +'<br/>' 
                    + 'Fax: '+fax+'<br/>' 
                    + 'Email: ' + email; 
                }
                else{
                    return '';
                }                             
            }private set;
        }
        
        public static String QCSCFAlert{
            get{
                if(opportunity.Account.BillingPostalCode != null)
                {
                    String value=opportunity.Account.BillingPostalCode.trim().substring(0,2);
                    String s1 = '327,328,329,330,334,335,336,337,338,339,341,342,346,347,349,850,852,853,889, 890,891,900,901,902,903,904,905,906,907,908,910,911,912,913,914,915,916,917,918,922,923,924,925,926,927,928,930,931,932,933,934,935,936,937,938,939';
                    if(s1.Contains(value)){
                        return 'Yes';
                    }
                    else{
                        return 'No Alert';
                    }
                }
                else{
                    return 'No Alert';
                }                
            }private set;
        }

        public static String siteSurveyAvailableDaysCount{
            get{
                
                return ''; 
            }private set;
        }
        
        public static String SiteSurveyAvailableFlagDel{
            get{
               
                return '';        
            }private set;
        }
        
        public static String SiteSurveyOrderedFlag{
            get{
                
                return '';
            }private set;
        }
        
        public static String siteSurveysOrdredDaysCount{
            get{
                //Site_Survey_Available_Due_Date__c has been deleted
                return ''; // + (System.TODAY() - opportunity.Site_Survey_Ordered_Due_Date__c)-(System.NOW() - opportunity.Site_Survey_Ordered__c);              
            }private set;
        }
        
        public static String submittedToUWFlag{
            get{
                
                return '';
            }private set;
        }
        
       
        public static Date timeForRenewalDate{
            get{                                
                return (opportunity.CloseDate + 150);
            }private set;
        }
        
        public static String TMWebDeclineReasons{
            get{
                String TMWebDeclineReasonsStr = '';
                //Test_Program_Flag__c has been deleted
                /*if(opportunity.Test_Program_Flag__c == 1){
                    TMWebDeclineReasonsStr='Pass';
                }
                else{
                    TMWebDeclineReasonsStr = 'Failed:'+'\n';
                }*/
                if( QCSCFAlert == 'Yes'){
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+'SCF'+'\n';
                }
                else{
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+'';
                } 
                if(ccApplicant1FICO  <460){
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+'FICO' + '\n';
                }
                else{
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+'';
                } 
                if(opportunity.Mortgage_Delinquent__c == '90 days+' || opportunity.Mortgage_Delinquent__c == 'Foreclosure/Forbearance < 1yr out'){
                    TMWebDeclineReasonsStr = TMWebDeclineReasonsStr +'Mortgage' + '\n';
                }
                else{
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr;
                }
                if(opportunity.BAM_Match_Selection__c == 'YES'){
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+ 'BAM' + '\n';
                }
                else{
                    TMWebDeclineReasonsStr=TMWebDeclineReasonsStr+'';
                } 
                
               return TMWebDeclineReasonsStr;
            }private set;
        }
        
        public static String totalDaysForDataEntry{
            get{                                
                if(opportunity.Data_Entry_Date__c != null ){
                    return  '' + (opportunity.Data_Entry_Date__c.getTime());       
                }
                else{ return '';}
            }private set;
        }

        public static String totalDaysInQQAndUnderwriting{
            get{                                
                if(opportunity.Decision_Date__c != null ){
                    return  '' + (opportunity.Decision_Date__c.getTime() );     
                }
                else{               
                    return '';
                }
            }private set;
        }
        
        public static String totalDaysToRepay{
            get{                                
               
                return '';
            }private set;
        }
        
        public static String totalDaysToDecision{
            get{                                
                if(opportunity.Decision_Date__c != null && opportunity.Data_Entry_Date__c != null){
                    return  '' + (opportunity.Decision_Date__c.getTime() - opportunity.Data_Entry_Date__c.getTime());       
                }
                else{               
                    return '';
                }
            }private set;
        }
        
        public static String typeOfBusiness{
            get{                                
                if(opportunity.Account.BusinessType__c != null){
                    return  '' + (opportunity.Account.BusinessType__c);     
                }
                else{ return '';}            
            }private set;
        }

        public static Decimal yrsInBusiness{
            get{    
                if(opportunity.CreatedDate != null && opportunity.Decision_Date__c == null && OwnedBusinessSince != ''){
                    Date OppCreatedDate = Date.newInstance(opportunity.CreatedDate.year(),opportunity.CreatedDate.month(),opportunity.CreatedDate.day());
                    return (Date.valueOf(OwnedBusinessSince).daysBetween(OppCreatedDate)/365.2425).setScale(2);
                    //(OppCreatedDate.year() - Date.valueOf(OwnedBusinessSince).year());
                }
                else if(opportunity.Decision_Date__c != null && OwnedBusinessSince != ''){
                    Date OppDecisionDate = Date.newInstance(opportunity.Decision_Date__c.year(),opportunity.Decision_Date__c.month(),opportunity.Decision_Date__c.day());
                    return (Date.valueOf(OwnedBusinessSince).daysBetween(OppDecisionDate)/365.2425).setScale(2);                    
                    //return ((Date.newInstance(opportunity.Decision_Date__c.year(),opportunity.Decision_Date__c.month(),opportunity.Decision_Date__c.day())  - OwnedBusinessSince )/365.2425 );
                }
                return 0.0;
            }private set;
        }
        
        public static String zipAlert{
            get{    
                String zipAlertStr = '';  
                if(opportunity.B__c == null || opportunity.B__c == ''){
                    zipAlertStr='';
                }
                else{
                    String zipStr = opportunity.B__c.substring(0,2);
                    String s1 = '064, 086, 212, 300, 302, 303, 311, 334, 335, 336, 337, 338, 342, 346, 350, 351, 352, 380, 381, 383, 399, 440, 442, 450, 451, 452, 461, 462, 551, 553, 554, 555, 601, 631, 750, 751, 752, 753, 754, 760, 761, 762, 765, 766, 767, 770, 772, 773, 774, 775, 786, 787, 800, 801, 802, 804, 806, 807, 850, 852, 853, 853, 900, 901, 902, 903, 906, 906, 907, 908, 910, 911, 912, 913, 914, 915, 916, 917, 918, 935, 945, 946, 947, 953';
                    if(s1.Contains(zipStr)){
                        zipAlertStr='Yes';
                    }
                    else{ zipAlertStr='No'; }                    
                }
                return zipAlertStr;
            }private set;
        }
        
       /* DS-CONAM - applicant1PrevFICO IS CHECKING FOR 0 BUT THE GETTER WOULD RETURN NULL 
        public static Decimal ccApplicant1PrevFICO{
            get{
                if(opportunity.Previous_Opportunity__r.CRR__c == null){
                    return null ;
                }
                else{
                    if(opportunity.Previous_Opportunity__r.CRR__c != null && opportunity.Previous_Opportunity__r.CRR__r.FICO__c<1000){
                        return opportunity.Previous_Opportunity__r.CRR__r.FICO__c;
                    }
                    else {
                        return null;
                    }
                }                
            }private set;
        }
**/
        public static Decimal ccApplicant1PrevFICO{
            get{
                if(opportunity.Previous_Opportunity__r.CRR__c == null){
                    return 0 ;
                }
                else{
                    if(opportunity.Previous_Opportunity__r.CRR__c != null && opportunity.Previous_Opportunity__r.CRR__r.FICO__c<1000){
                        return opportunity.Previous_Opportunity__r.CRR__r.FICO__c;
                    }
                    else {
                        return 0;
                    }
                }                
            }private set;
        }
        public static Decimal applicant1PrevFICO{
            get{
                if(ccApplicant1PrevFICO == 0){
                    return opportunity.Previous_Opportunity__r.Manual_Applicant_1_FICO__c;
                }
                else{
                    if((ccApplicant1PrevFICO <= 0 || ccApplicant1PrevFICO > 900) && (opportunity.Previous_Opportunity__r.Manual_Applicant_1_FICO__c != 0)){              
                        return opportunity.Previous_Opportunity__r.Manual_Applicant_1_FICO__c;
                    } 
                    else{                     
                     return ccApplicant1PrevFICO;
                    }                   
                }                
            }private set;
        }
}