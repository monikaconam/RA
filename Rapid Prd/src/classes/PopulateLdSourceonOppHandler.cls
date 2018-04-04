/**************************
Name : GopalConam
Changes : Addon Oppy, Leadsource not populated, Closed Won Stage changes
Date : 9/27/2016
**************************/

public class PopulateLdSourceonOppHandler
{

    public static void populateLdSourceonRenewalOpps(List<Opportunity> oppNewList){
    
        List<Opportunity> opplst = new List<Opportunity>();
        Set<Id> acc = new Set<Id>();
        for(Opportunity oppTemp : oppNewList){
            if((oppTemp.Renewal__c || oppTemp.Addon_Oppy__c) && (oppTemp.LeadSource==null || oppTemp.LeadSource=='') && oppTemp.AccountId!=null){
                acc.add(oppTemp.AccountId);
            }
        }
        if(acc.size()>0){
            Map<Id,String> leadsourcemap = new Map<Id,String>();
            List<Account> accnew =[Select id,(Select Id,LeadSource,AccountId from Opportunities Where StageName = 'Closed Won' and Renewal__c=False and Addon_Oppy__c=False order by CreatedDate asc limit 1) from Account where  Id In: acc]; 
            for(Account accTemp: accnew) {
                for(Opportunity opp:accTemp.opportunities){
                    leadsourcemap.put(opp.AccountId,opp.LeadSource);
                }
            }
            for(Opportunity opp: oppNewList){
                if((opp.Renewal__c || opp.Addon_Oppy__c) && (opp.LeadSource==null || opp.LeadSource=='') && opp.AccountId!=null){
                    opp.LeadSource=leadsourcemap.get(opp.AccountId); 
                }
            }
        }
    } 
}