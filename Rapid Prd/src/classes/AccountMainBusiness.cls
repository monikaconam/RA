global class AccountMainBusiness
{
    global boolean isVisible {get;set;}
    global String btnText{get;set;}
    global Account objAccount {get;set;}
    global Opportunity opp {get;set;}


    global AccountMainBusiness()
    {
        try
        {
            btnText = 'Edit';
            isVisible = false;
            String oppId = ApexPages.currentPage().getParameters().get('id');
            if (oppId.trim() != '' && oppId != null)
            {
                System.debug('I am here');
                opp = [select 
                            accountId 
                        from
                            Opportunity 
                        where 
                            id = : oppId];
                if (opp.accountId != null)
                {
                    objAccount = [Select 
                                            Legal_Name__c, Phone, Name, Fax, BillingState, Billingcity, Billingstreet, Billingcountry,
                                            Email_Address__c, Mailing_Address_For_Statements_etc__c, BillingPostalCode, Website, DateBusinessStarted__c, 
                                            FederalTaxID__c, BusinessType__c, Owned_Business_Since__c, Landlord_Agent_Name__c, Present_Management_Since__c,
                                            Landlord_Agent_Phone__c, Number_of_Locations__c, Time_Remaining_On_Lease__c, Number_of_Terminals_at_Location__c,
                                            Federal_or_State_Tax_Liens__c, Flag_Account_for_Renewal__c, Pricing_on_New_Deals__c, Sic, Pricing_on_Renewals__c,
                                            BusinessStructure__c 
                                    From 
                                            Account 
                                    where 
                                            id = : opp.accountId];
                }
                else 
                {
                    /* commentted out DS-Conam 08-04-2015
                    ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Opportunity does not have an Account ');
                    ApexPages.addMessage(msg);
                    */
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Opportunity does not have an Account '));
                    
                }

            }
            else
            {
                System.debug('I should be here');
                /* commentted out DS-Conam 08-04-2015
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Please Provide Opportunity Id');
                ApexPages.addMessage(msg);
                */
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Please Provide Opportunity Id'));
            }
        }
        catch (Exception ex) 
        {
            /* commentted out DS-Conam 08-04-2015
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'An exception occurred' + ex.getMessage());
            ApexPages.addMessage(msg);
            */
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'An exception occurred' + ex.getMessage()));
        }
    }
    
    global PageReference onEdit()
    {

        try {
            if (btnText == 'Edit') 
            {
                isVisible = true;
                btnText = 'Save';
            }
            else
            {
                update objAccount;
                btnText = 'Edit';
                isVisible = false;
            }

        } 
        catch (Exception ex) {
            /* commentted out DS-Conam 08-04-2015
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'An exception occurred');
            ApexPages.addMessage(msg);
            */
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'An exception occurred'));
        }
        return null;
    }
    
    global PageReference onCancel()
    {
        btnText = 'Edit';
        isVisible = false;
        return null;
    }
}