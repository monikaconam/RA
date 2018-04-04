/*
Created Date: April 26th, 2010
Developer Name: Ralph Callaway
Case Number: 03461744
Description:
Maintain a one-to-one relationship between the opportunity and underwriting object.

Mirror certain underwriting fields on the opportunity without using formulas

Functional Logic:
Whenever an underwriting is created, populate the underwriting lookup field on the related Opportunity.

Whenever any of the following underwriting fields change update the corresponding fields on the Opportunity Object:
•   UCC Filings
•   UCC Request Date
•   UCC Filing Reason
•   Decision Date
•   Re-Decision Date
•   Underwriting Decision
•   Third party underwriting notes
•   Internal underwriting notes
•   Decline Reason
•   Rescind Reason
•   Unqualified Reason
•   Approved With Conditions
•   Confirmed_FRSA_Dates 
•   Exceptions

*/
trigger MasterUnderWritingTrigger on Underwriting__c (after insert, after update) {
    
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            UnderWritingTriggerHandler.aiSyncUnderwritingAndOpportunity(Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            UnderWritingTriggerHandler.auSyncUnderwritingAndOpportunity(Trigger.newMap,Trigger.oldMap);
        }
        
    }

}