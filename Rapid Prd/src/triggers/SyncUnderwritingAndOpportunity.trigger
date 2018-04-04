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
trigger SyncUnderwritingAndOpportunity on Underwriting__c (after insert, after update) {

    List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
    
    if(trigger.isInsert) {
        for(Underwriting__c underwriting : Trigger.new) {
            opportunitiesToUpdate.add(getUpdatedOpportunity(underwriting));
        }
    } else if (trigger.isUpdate) {
        for(Underwriting__c underwriting : Trigger.new) {
            if(underWritingChanged(underwriting))
                opportunitiesToUpdate.add(getUpdatedOpportunity(underwriting));
        }
    }
    
    if(!opportunitiesToUpdate.isEmpty())
        update opportunitiesToUpdate;
    
    /* SUPPORT FUNCTIONS */
        
    private boolean underwritingChanged(Underwriting__c underwriting) {
        Underwriting__c oldUnderwriting = trigger.oldMap.get(underwriting.id);
        return oldUnderwriting.ucc_filings__c != underwriting.ucc_filings__c ||
            oldUnderwriting.UCC_Request_Date__c != underwriting.UCC_Request_Date__c ||
            oldUnderwriting.ucc_filing_reason__c != underwriting.ucc_filing_reason__c ||
            oldUnderwriting.decision_date__c != underwriting.decision_date__c ||
            oldUnderwriting.Underwriting_Decision__c != underwriting.Underwriting_Decision__c ||
            oldUnderwriting.Re_decision_date__c != underwriting.Re_decision_date__c ||
            oldUnderwriting.Third_party_underwriting_notes__c != underwriting.Third_party_underwriting_notes__c ||
            oldUnderwriting.Internal_underwriting_notes__c != underwriting.Internal_underwriting_notes__c ||
            oldUnderwriting.Decline_Reason__c != underwriting.Decline_Reason__c ||
            oldUnderwriting.Unqualified_Reason__c != underwriting.Unqualified_Reason__c ||
            oldUnderwriting.Rescind_Reason__c != underwriting.Rescind_Reason__c ||
            oldUnderwriting.Approved_With_Conditions__c != underwriting.Approved_With_Conditions__c ||
            oldUnderwriting.Exceptions__c != underwriting.Exceptions__c ||           
            oldUnderwriting.Third_Party_Payoff__c!= underwriting.Third_Party_Payoff__c ||
            oldUnderwriting.Third_Party_Company_Name__c!= underwriting.Third_Party_Company_Name__c ||
            oldUnderwriting.Third_Party_Payoff_Amount__c!= underwriting.Third_Party_Payoff_Amount__c;



    }
    
    private Opportunity getUpdatedOpportunity(Underwriting__c underwriting) {
        Opportunity opportunityToUpdate = new Opportunity(id = underwriting.opportunity__c);
        opportunityToUpdate.ucc_filing__c = underwriting.ucc_filings__c;
        opportunityToUpdate.UCC_Date__c = underwriting.UCC_Request_Date__c;
        opportunityToUpdate.ucc_filing_reason__c = underwriting.ucc_filing_reason__c;
        opportunityToUpdate.underwriting__c = underwriting.id;
        opportunityToUpdate.Decision_Date__c = underwriting.decision_date__c;
        opportunityToUpdate.Underwriting_Approval__c = underwriting.Underwriting_Decision__c;
        opportunityToUpdate.Re_Decision_Date__c = underwriting.Re_decision_date__c;
        opportunityToUpdate.Internal_Underwriting_Notes__c = underwriting.Internal_underwriting_notes__c;
        opportunityToUpdate.Decline_Reason__c=underwriting.Decline_Reason__c ;
        opportunityToUpdate.Unqualified_Reason__c = underwriting.Unqualified_Reason__c;
        opportunityToUpdate.Rescind_Reason__c=underwriting.Rescind_Reason__c ;
        opportunityToUpdate.Approved_With_Conditions__c=underwriting.Approved_With_Conditions__c ;
        opportunityToUpdate.Exceptions__c=underwriting.Exceptions__c ;
        opportunityToUpdate.Third_Party_Payoff__c =underwriting.Third_Party_Payoff__c;
        opportunityToUpdate.Third_Party_Company_Name__c =underwriting.Third_Party_Company_Name__c;
        opportunityToUpdate.Third_Party_Payoff_Amount__c =underwriting.Third_Party_Payoff_Amount__c;


        return opportunityToUpdate;
    }

}