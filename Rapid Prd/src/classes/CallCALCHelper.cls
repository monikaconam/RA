public class CallCALCHelper
{
    public static void callAccount(Map<id, Opportunity>oppMap)
    {
        Set<Id> iList=new Set<id>();
        Set<Id> accList=new Set<id>();
        for(Id iTemp : oppMap.keyset())
        {
            iList.add(oppMap.get(iTemp).campaignID);
        }
        
        
        for(Campaign cTemp : [Select ISO_Account__c from campaign where type='Partners' and ISO_Account__c!=null and id in :iList Limit 10000])
        {
            accList.add(cTemp.ISO_Account__c);
        }
        
        for(Id iTemp : accList)
        {
            if(Limits.getCallouts()<=Limits.getLimitCallouts())
            {
                CALC.partnerAccountRequest(iTemp);
            }
        }
    }
}