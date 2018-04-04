/*
@Name               : 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field Account_In_Risk__c Commented/Removed By MK Conam 2 Dec 2015
*/
global class MainClass 
{
    public Note_Detail objNoteDetail {get;set;}
    public Opportunity_Detail objOpportunityDetail {get;set;}
    public oppDetail oppDetail {get;set;}
    
    public MainClass() 
    {
        try 
        {
            Opportunity objOpportunity = [Select 
                                                Renewal_Number__c, Renewal__c, Account_Database_Entry_Due_Date__c, Account_Database_Entry__c, Id,
                                                Name, StageName, Type, AccountId, Account.BillingCity, Account.BillingCountry, Account.BillingState,
                                                Account.BillingStreet, Account.BillingPostalCode, Account.Roll_up_Approved__c, Account.Fax, 
                                                Account.DateBusinessStarted__c, Account.Phone, Account.Name, Account.FederalTaxID__c, 
                                                Account.First_Funding_Date__c, Account.Most_Recent_Funded_Renewal_Date__c, Time_For_Renewal_Date__c, 
                                                Account.Last_Renewal_Date__c, CreatedDate, Account.Last_Created_Opportunity__c, Account.Legal_Name__c, 
                                                Account.Months_with_Current_Processor__c, Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c, 
                                                Syndication_Amount__c, Product__c, PrimaryCampaignSource__c, OwnerId, LastModifiedById, CreatedById, 
                                                Amount, Advance_ID__c, Account.Owned_Business_Since__c, Account.BusinessType__c,
                                                Account.ownerId, Account.Type, Opportunity_Number__c 
                                        From 
                                                Opportunity 
                                        WHERE 
                                                Id = : ApexPages.currentPage().getParameters().get('Id')];
            if (objOpportunity != null) 
            {
                oppDetail = new oppDetail(objOpportunity, getAllUsers.get(objOpportunity.LastModifiedById).Name, getAllUsers.get(objOpportunity.CreatedById).Name);
                objOpportunityDetail = new Opportunity_Detail(objOpportunity);
            }
            objNoteDetail = new Note_Detail('Note');
        }
        catch (Exception ex) 
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: Please contact your Administrator!'));
        }
    }

    public static map <Id, User> getAllUsers {
        get {
            if (getAllUsers == null) {
                getAllUsers = new map <Id, User> ([select Id, Name from User where isActive = true]); //FullPhotoUrl
            }
            return getAllUsers;
        }
        private set;
    }

    @RemoteAction
    public static void createNote(String noteContent, String recordTypeId1, String oppId) {
        try
        {
            Note__c objNote = new Note__c(Note_Content__c = noteContent, RecordTypeId = recordTypeId1, Opportunity__c = oppId);
            insert objNote;
            System.debug('>>>>>>>>>>>>>>>>>>>' + objNote);
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    @RemoteAction
    public static void updateAccount(String name, String billingCity, String billingCountry, String billingState, String billingStreet, 
                                    String billingPostalCode, String fax, String dateBusinessStarted, String phone, String federalTaxID, 
                                    String monthsWithCurrentProcessor, String numberOfLocations, String numberOfTerminalsAtLocation, 
                                    String ownedBusinessSince, String accountId) 
    {
        try
        {
            Account objAccount = [Select 
                                        Type, Phone, Owned_Business_Since__c, Number_of_Terminals_at_Location__c, Number_of_Locations__c,
                                        Name, Most_Recent_Funded_Renewal_Date__c, Months_with_Current_Processor__c, Last_Created_Opportunity__c, 
                                        First_Funding_Date__c, FederalTaxID__c, Fax, DateBusinessStarted__c, BillingStreet, BillingState, 
                                        BillingPostalCode, BillingCountry, BillingCity 
                                From 
                                        Account 
                                where   
                                        Id = : accountId];
            if (objAccount != null)
            {
                objAccount.Name = name;
                objAccount.BillingCity = billingCity;
                objAccount.BillingCountry = billingCountry;
                objAccount.BillingPostalCode = billingPostalCode;
                objAccount.BillingState = billingState;
                objAccount.BillingStreet = billingStreet;
                if (dateBusinessStarted != null && dateBusinessStarted.trim() != '') {
                    objAccount.DateBusinessStarted__c = Date.valueOf(dateBusinessStarted);
                }
                objAccount.Fax = fax;
                objAccount.FederalTaxID__c = federalTaxID;
                //objAccount.First_Funding_Date__c = Datetime.valueOf(firstFundingDate);
                //objAccount.Last_Created_Opportunity__c = Datetime.valueOf(lastOpp); 
                if (monthsWithCurrentProcessor != null && monthsWithCurrentProcessor.trim() != '') 
                {
                    objAccount.Months_with_Current_Processor__c = decimal.valueOf(monthsWithCurrentProcessor);
                }
                //objAccount.Most_Recent_Funded_Renewal_Date__c = Date.valueOf(mostRecentOpp);
                if (numberOfLocations != null && numberOfLocations.trim() != '')
                {
                    objAccount.Number_of_Locations__c = decimal.valueOf(numberOfLocations);
                }
                if (numberOfTerminalsAtLocation != null && numberOfTerminalsAtLocation.trim() != '')
                {
                    objAccount.Number_of_Terminals_at_Location__c = decimal.valueOf(numberOfTerminalsAtLocation);
                }
                if (ownedBusinessSince != null && ownedBusinessSince.trim() != '')
                {
                    objAccount.Owned_Business_Since__c = Date.valueOf(ownedBusinessSince);
                }
                objAccount.Phone = phone;
                update objAccount;
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
    }

    public void createNote1(String noteContent, String recordTypeId1, String oppId) {
        try 
        {
            Note__c objNote = new Note__c(Note_Content__c = noteContent, RecordTypeId = recordTypeId1, Opportunity__c = oppId);
            insert objNote;
            System.debug('>>>>>>>>>>>>>>>>>>>' + objNote);
        } catch (Exception e) {
            throw e;
        }
    }

    public MainClass(ApexPages.StandardController controller) {
        try {
            Opportunity objOpportunity = [Select 
                                                Renewal_Number__c, Renewal__c, Account_Database_Entry_Due_Date__c, Account_Database_Entry__c, Id, 
                                                Name, StageName, Type, AccountId, Account.BillingCity, Account.BillingCountry, Account.BillingState,
                                                Account.BillingStreet, Account.BillingPostalCode, Account.Roll_up_Approved__c, Account.Fax, 
                                                Account.DateBusinessStarted__c, Account.Phone, Account.Name, Account.FederalTaxID__c, 
                                                Account.First_Funding_Date__c, Account.Most_Recent_Funded_Renewal_Date__c, Time_For_Renewal_Date__c, 
                                                Account.Last_Renewal_Date__c, CreatedDate, Account.Last_Created_Opportunity__c, Account.Legal_Name__c,
                                                Account.Months_with_Current_Processor__c, Account.Number_of_Locations__c, Account.Number_of_Terminals_at_Location__c,
                                                Syndication_Amount__c, Product__c, PrimaryCampaignSource__c, OwnerId, LastModifiedById, CreatedById, Amount, 
                                                Advance_ID__c,  Account.Owned_Business_Since__c, Account.BusinessType__c,
                                                Account.ownerId, Account.Type, Opportunity_Number__c 
                                        From 
                                                Opportunity 
                                        WHERE Id = : ApexPages.currentPage().getParameters().get('Id')];
            if (objOpportunity != null)
            {
                oppDetail = new oppDetail(objOpportunity, getAllUsers.get(objOpportunity.LastModifiedById).Name, getAllUsers.get(objOpportunity.CreatedById).Name);
                objOpportunityDetail = new Opportunity_Detail(objOpportunity);
            }
            objNoteDetail = new Note_Detail('Note');
        }
        catch (Exception ex)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: Please contact your Administrator!'));
        }
    }

    public class oppDetail {
        public String createdByUserName{get;set;}
        public String modifiedByUserName {get;set;}
        public Opportunity opp {get;set;}
        public String dbaName {get;set;}
        
        public oppDetail(Opportunity opp, String modifiedByUserName, String createdByUserName)
        {
            this.createdByUserName = createdByUserName;
            this.modifiedByUserName = modifiedByUserName;
            this.opp = opp;
            this.dbaName = FormulaFieldUtility.DBA_Name;
        }
    }
}