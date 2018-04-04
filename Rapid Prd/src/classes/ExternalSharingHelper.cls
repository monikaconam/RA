public class ExternalSharingHelper{ 
    
@future 
    public static void touchCases(Set<Id> Leadids) { 
        List<Lead> LeadList = [SELECT Id FROM Lead Where id in :Leadids and isconverted=false]; 
        update LeadList; 
    } 
}