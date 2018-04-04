public with sharing class LeadUtils 
{

    // Collection of various Lead-related utilities and methods
    
    private static Boolean isTest = false; // Variable used for Apex code coverage testing
   
    public static Boolean isTesting() { return isTest; }
   
    public static void setTesting() { isTest = true; }

    // Test against PartnerNetworkRecordConnection to see which records are connected
    public static Set <Id> toConnect(Set <Id> to_check) {
        Set <Id> output = new Set <Id> ();
        Set <Id> alreadyExists = new Set <Id> ();
        for (PartnerNetworkRecordConnection cnct: [SELECT Id, LocalRecordId FROM PartnerNetworkRecordConnection WHERE LocalRecordId IN: to_check])
        {
            alreadyExists.add(cnct.LocalRecordId);
        }

        for (Id iTemp: to_check)
        {
            // Add to output if it's NOT contained in previous results
            if (!alreadyExists.contains(iTemp)) 
            {
                output.add(iTemp);
            }
        }

        return output;
    } // end toConnect method
}