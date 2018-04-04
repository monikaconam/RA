public class GenerateRenewalNumberHelper
{
    public static void onInsert(List<Opportunity> newList)
    {
        Set<id>accId=new Set<id>();
        List<Opportunity> oppUpdateList=new List<Opportunity>();
        List<Database.SaveResult> srList=new List<Database.SaveResult>();
        
        try
        {
            for(Opportunity opp : newList)
            {
                if(opp.Renewal__c==true && opp.Addon_Oppy__c==false && opp.accountId!=null)
                {
                    accId.add(opp.accountID);
                    //opp.Renewal_Number__c=opp.account.renewal_count__c==null ? 1 : opp.account.renewal_count__c+1;
                }
            }
            
            Map<id,Account> accMap=new Map<id,Account>([select id,renewal_count__c from account where id in :accId]);
           
            for(Opportunity opp : newList)
            {
                if(opp.Renewal__c==true && opp.Addon_Oppy__c==false && opp.accountId!=null)
                {
                    opp.Renewal_Number__c=accMap.get(opp.accountId).renewal_count__c==null ? 1 : accMap.get(opp.accountId).renewal_count__c+1;
                }
            }
            
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+'-'+e.getLineNumber());
        }

    }
    
    public static void onUpdate(Map<id,Opportunity> oldOMap, Map<id,Opportunity> newOMap)
    {
        Set<id> oppIds=new Set<id>();
        for(Id iTemp : newOMap.keyset())
        {
            if((newOMap.get(iTemp).Renewal__c==true && newOMap.get(iTemp).Addon_Oppy__c==false && newOMap.get(iTemp).accountId!=null) &&
                (oldOMap.get(iTemp).Renewal__c!=newOMap.get(iTemp).Renewal__c) || 
                (oldOMap.get(iTemp).Addon_Oppy__c!=newOMap.get(iTemp).Addon_Oppy__c))
            {
                oppIds.add(iTemp);
            }
        }
        if(oppIds.size()>0)
            onInsertUpdateHelper(oppIds);
        
    }
    
    private Static void onInsertUpdateHelper(Set<id> oppIDSet)
    {
        List<Opportunity> oppUpdateList=new List<Opportunity>();
        List<Database.SaveResult> srList=new List<Database.SaveResult>();
        try
        {
        
            for(Opportunity oppTemp : [select id, accountId, account.renewal_count__c,Renewal_Number__c from Opportunity where id in :oppIDSet])
            {
                System.debug('oppTemp.account.renewal_count__c' +oppTemp.account.renewal_count__c);
                oppTemp.Renewal_Number__c=oppTemp.account.renewal_count__c==null ? 1 : oppTemp.account.renewal_count__c+1;
                oppUpdateList.add(oppTemp);
            }
        
            if(oppUpdateList.size()>0)
            {    
                srList =DataBase.update(oppUpdateList,false);
            }
        }
        catch(Exception e)
        {
            System.debug('An Exception has occurred - '+e.getMessage()+'-'+e.getLineNumber());
            if(srList.size()>0)
            {    
                Integer counter=0;
                for (Database.SaveResult sr : srList) 
                {
                    counter++;
                    for(Database.Error err : sr.getErrors()) 
                    {
                        System.debug('The following error has occurred for record ID' +oppUpdateList.get(counter).id);                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Opportunity fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
    }
}