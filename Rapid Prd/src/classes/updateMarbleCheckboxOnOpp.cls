public class updateMarbleCheckboxOnOpp
{
    public static void deleteScanerio(List<Marble__c> lstMarble)
    {
        set<Id> oppId = new set<Id>();
        
        for(Marble__c marbTemp : lstMarble)
        {
            {
                oppId.add(marbTemp.Opportunity_Reference__c);
            }                
            
        }
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity oppTemp : [Select Id,(Select Opportunity_Reference__c from Marbles__r) from Opportunity where Id IN : oppId])
        {
            if(oppTemp.Marbles__r.size() <= 0)
            {
                oppTemp.Marble__c = false;
                
            }
            
            oppList.add(oppTemp);
        }
        
        if(!oppList.isEmpty()) update oppList;
    }    
}