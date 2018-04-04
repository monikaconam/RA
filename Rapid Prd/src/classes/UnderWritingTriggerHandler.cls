/*
@Name               : UnderWritingTriggerHandler 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field Signed Loan_Docs_Received__c 
                      Commented/Removed By MK Conam 2 Dec 2015
*/
public with sharing class UnderWritingTriggerHandler 
{
    
    public static void aiSyncUnderwritingAndOpportunity(List<Underwriting__c> newList)
    {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        for(Underwriting__c underwriting : newList) {
            opportunitiesToUpdate.add(getUpdatedOpportunity(underwriting));
        }
        
        if(!opportunitiesToUpdate.isEmpty())
        {
            try
            {
                Database.update (opportunitiesToUpdate,false);
            } 
            catch(Exception e)
            {
                opportunitiesToUpdate[0].addError('An exception has occured -' +e.getMessage()+' - '+e.getLineNumber());
            }
        }
    }

    public static void auSyncUnderwritingAndOpportunity(Map<id, Underwriting__c> newMap, Map<id, Underwriting__c> oldMap)
    {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        for(Id iTemp : newMap.keyset()) {
            Underwriting__c oldUnderWriting=oldMap.get(iTemp);
            Underwriting__c newUnderWriting=newMap.get(iTemp);
            if(underWritingChanged(oldUnderWriting, newUnderWriting))
                opportunitiesToUpdate.add(getUpdatedOpportunity(newUnderWriting));
        }
        
        if(!opportunitiesToUpdate.isEmpty())
            try
            {
                Database.update(opportunitiesToUpdate,false);
            } 
            catch(Exception e)
            {
               opportunitiesToUpdate[0].addError('An exception has occured -' +e.getMessage()+' - '+e.getLineNumber());
            }
    
    }
    
    private static boolean underwritingChanged(Underwriting__c oUnderwriting, Underwriting__c underwriting) {
        Underwriting__c oldUnderwriting = oUnderwriting;
        Boolean retVal;
        Boolean retVal1 = oldUnderwriting.ucc_filings__c != underwriting.ucc_filings__c ? true : false; 
        Boolean retVal2 = oldUnderwriting.UCC_Request_Date__c != underwriting.UCC_Request_Date__c ? true : false;
        Boolean retVal3 = oldUnderwriting.ucc_filing_reason__c != underwriting.ucc_filing_reason__c ? true : false; 
        Boolean retVal4 = oldUnderwriting.decision_date__c != underwriting.decision_date__c ? true : false;
        Boolean retVal5 = oldUnderwriting.Underwriting_Decision__c != underwriting.Underwriting_Decision__c ? true : false; 
        Boolean retVal6 = oldUnderwriting.Re_decision_date__c != underwriting.Re_decision_date__c ? true : false;
        Boolean retVal7 = oldUnderwriting.Third_party_underwriting_notes__c != underwriting.Third_party_underwriting_notes__c ? true : false; 
        Boolean retVal8 = oldUnderwriting.Internal_underwriting_notes__c != underwriting.Internal_underwriting_notes__c ? true : false;
        Boolean retVal9 = oldUnderwriting.Decline_Reason__c != underwriting.Decline_Reason__c ? true : false; 
        Boolean retVal10 = oldUnderwriting.Unqualified_Reason__c != underwriting.Unqualified_Reason__c ? true : false;
        Boolean retVal11 = oldUnderwriting.Rescind_Reason__c != underwriting.Rescind_Reason__c ? true : false; 
        Boolean retVal12 = oldUnderwriting.Approved_With_Conditions__c != underwriting.Approved_With_Conditions__c ? true : false;
        Boolean retVal14 = oldUnderwriting.Exceptions__c != underwriting.Exceptions__c ? true : false; 
        Boolean retVal15 = oldUnderwriting.Confirmed_FRSA_Dates__c != underwriting.Confirmed_FRSA_Dates__c ? true : false;
       
        Boolean retVal18 = oldUnderwriting.Third_Party_Payoff__c!= underwriting.Third_Party_Payoff__c ? true : false;
        Boolean retVal19 = oldUnderwriting.Third_Party_Company_Name__c!= underwriting.Third_Party_Company_Name__c ? true : false;
        Boolean retVal20 = oldUnderwriting.Third_Party_Payoff_Amount__c!= underwriting.Third_Party_Payoff_Amount__c ? true :false;
        
        retVal=retVal1|| retVal2|| retVal3|| retVal4|| retVal5|| retVal6|| retVal7|| retVal8|| retVal9|| retVal10|| retVal11|| retVal12|| retVal14|| retVal15|| retVal18 || retVal9 || retVal20 ;
        return  retVal;



    }
    
    private static Opportunity getUpdatedOpportunity(Underwriting__c underwriting) {
        Opportunity opportunityToUpdate = new Opportunity(id = underwriting.opportunity__c);
        opportunityToUpdate.ucc_filing__c = underwriting.ucc_filings__c;
        opportunityToUpdate.UCC_Date__c = underwriting.UCC_Request_Date__c;
        opportunityToUpdate.ucc_filing_reason__c = underwriting.ucc_filing_reason__c;
        opportunityToUpdate.underwriting__c = underwriting.id;
        opportunityToUpdate.Decision_Date__c = underwriting.decision_date__c;
        opportunityToUpdate.Underwriting_Approval__c = underwriting.Underwriting_Decision__c;
        opportunityToUpdate.Re_Decision_Date__c = underwriting.Re_decision_date__c;
        opportunityToUpdate.Internal_Underwriting_Notes__c = underwriting.Internal_underwriting_notes__c;
        opportunityToUpdate.Underwriting_Notes__c=underwriting.Third_party_underwriting_notes__c ;
        opportunityToUpdate.Decline_Reason__c=underwriting.Decline_Reason__c ;
        opportunityToUpdate.Unqualified_Reason__c = underwriting.Unqualified_Reason__c;
        opportunityToUpdate.Rescind_Reason__c=underwriting.Rescind_Reason__c ;
        opportunityToUpdate.Approved_With_Conditions__c=underwriting.Approved_With_Conditions__c ;
        opportunityToUpdate.Exceptions__c=underwriting.Exceptions__c ;
        opportunityToUpdate.Confirmed_FRSA_Dates__c =underwriting.Confirmed_FRSA_Dates__c;

        opportunityToUpdate.Third_Party_Payoff__c =underwriting.Third_Party_Payoff__c;
        opportunityToUpdate.Third_Party_Company_Name__c =underwriting.Third_Party_Company_Name__c;
        opportunityToUpdate.Third_Party_Payoff_Amount__c =underwriting.Third_Party_Payoff_Amount__c;


        return opportunityToUpdate;
    }


}