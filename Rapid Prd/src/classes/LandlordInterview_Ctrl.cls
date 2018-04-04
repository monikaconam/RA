/**
*********************************************************************************************************************
* Module Name   :   LandlordInterview_Ctrl
* Description   :   Controller for LandlordInterviewPage and is responsible capturing details from the business owner.
                    It is used for inserting / updating the Merchant Interview, Landlord Interview, Pre-Funding Call 
                    and Additional Location information regarding the Landlord
* 
*  
* Revision History:-
* Organization  : ConAm Technologies Pvt. Ltd.
* Version  Date           Author           Description of Action
* 1.0      08/07/2015     DS-CONAM         
*   
*******************************************************************************************************************
**/


public class LandlordInterview_Ctrl {

    public Opportunity oppRecord {get;set;}
    public Merchant__c objMerchant {get;set;}
    public Contact objContact {get;set;}
    public String primaryContactInfo {get;private set;}
    public String additionalContactInfo {get;private set;}

    public LandlordInterview_Ctrl() 
    {
        String oppId = ApexPages.currentPage().getParameters().get('Id');

        if (oppId != null && oppId.trim() != '')
        {
            List < Opportunity > oppList = [SELECT 
                                                    Id, Type_of_Landlord__c, Landlord_Address__c, Confirmed_wire_amount_with__c,Notes_from_Prefunding_Call__c,
                                                    Landlord_Phone_Number__c, Landlord_Contact_Name__c,
                                                    Processing_and_or_Origination_Fee_s__c, Wire_Amount__c,  
                                                    Merchant_Website__c, Interview_Additional_Comments__c, Account.Id, Contact__r.Name, Landlord_Interview_Complete__c
                                            FROM 
                                                    Opportunity
                                            WHERE 
                                                    Id = : oppId LIMIT 1];
            if (!oppList.isEmpty())
            {
                oppRecord = oppList.get(0);
            }

            List <Contact> objContacts = [SELECT FirstName, LastName, OwnershipPercentage__c, Principal_1_Street_Address__c, Principal_1_City__c,
                                                Principal_1_State__c, Principal_1_Zip__c, Principal_Home_Phone__c, MobilePhone, Fax, Email,
                                                Principal_2_First_Name__c, Principal_2_Last_Name__c, Principal_2_Street_Address__c, Principal_2_City__c,
                                                Principal_2_State__c, Principal_2_Zip__c, Principal_2_Phone__c, Principal_2_Mobile__c, Principal_2_Email__c,
                                                Principal_2_Percent_Ownership__c
                                        FROM 
                                                Contact 
                                        WHERE 
                                                AccountId = : oppRecord.Account.Id];
            if (!objContacts.isEmpty())
            {
                objContact = objContacts.get(0);
            } 
            else
            {
                objContact = new Contact();
            }

            list <Merchant__c> objMerchants = [SELECT 
                                                        Current_Balance_With_Competitor_RA__c, Gross_Monthly_Sales_of_the_Business__c,
                                                        Confirm_length_of_time_with_processor__c, Will_the_business_close_for_any_reason__c,
                                                        When_was_business_opened__c, When_does_your_lease_expire__c, What_type_of_Business_is_it__c,
                                                        When_did_you_purchase_start_the_business__c, What_type_of_Business_Location__c,
                                                        What_is_your_mobile_phone_number__c, What_is_your_busy_season__c,What_businesses_are_nearby__c, 
                                                        What_hours_are_you_open__c, What_do_you_plan_to_use_the_money_for__c,What_is_your_home_phone_number__c,
                                                        SystemModstamp, OwnerId, Opportunity__c, Name, Merchant_Interview_Phone_Number__c,
                                                        Merchant_Interview_Completed_Date__c, Is_this_business_a_franchise__c,
                                                        IsDeleted, Id, How_much_of_the_business_do_you_own__c,
                                                        How_many_square_feet_is_the_business__c, How_many_part_time_employees_do_you_have__c,
                                                        How_many_locations_for_this_business__c, How_long_have_you_used_current_processor__c,
                                                        Have_you_had_a_cash_advance_before__c,  Do_you_plan_to_sell_the_business_soon__c,
                                                        Do_you_own_any_other_businesses__c, Contact__c, Are_you_late_with_any_of_your_vendors__c,
                                                        if_other_locat_of_terminals_at_each_c__c, Comments_on_Business_Sale_Response__c,
                                                        Do_you_have_contracts_with_customers__c, Number_of_Full_Time_Employees__c,
                                                        How_much_is_the_rent_for_the_business__c, If_closing_in_the_next_year_what_period__c,
                                                        If_so_are_you_current_on_franchise_dues__c, If_so_then_what_type__c, Late_w_Vendors_Details__c,
                                                        Overall_Merchant_Interview_Assessment__c, What_is_your_current_balance__c,Additional_References__c,
                                                        What_is_your_email_address__c, What_is_your_slow_season__c, of_cc_card_terminal_at_this_location__c
                                                FROM 
                                                        Merchant__c
                                                WHERE 
                                                        Opportunity__c = : oppId];
            if (objMerchants != null && !objMerchants.isEmpty())
            {
                objMerchant = objMerchants.get(0);
                oppId = objMerchant.Opportunity__c;
            }
            else
            {
                objMerchant = new Merchant__c();
                objMerchant.Opportunity__c = OppId;
            }
            primaryContactInfo = FormulaFieldUtility.primaryContactInfo;
            additionalContactInfo = FormulaFieldUtility.additionalContactInfo;
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity Id Does not Exist!'));
        }
    }

    public PageReference doSave() 
    {
        Savepoint sp = Database.setSavepoint();
        try
        {
            if (oppRecord != null) 
                upsert oppRecord;

            if (objMerchant != null) 
                upsert objMerchant;

            if (objContact != null) 
                upsert objContact;

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm, 'Interview Information Saved Successfully!'));
        } 
        catch (Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
            Database.rollback(sp);
        }
        return null;
    }
}