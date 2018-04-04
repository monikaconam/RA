public class PopulateLeadSourceOnClonedDeals
{
    public static void populateLeadSource(List<Opportunity> newList)
    {
        for(Opportunity OTempItr : newList)
        {
            if(OTempItr.leadSource==null)
            {
                updateLeadSourceIfBlank(OTempItr.id);
            }
        }
    }
            
    @future
    public static void updateLeadSourceIfBlank(Id iTemp)
    {
        Set<id> accountIds=new Set<Id>();

        Map<id, Opportunity> accountOppMap=new Map<id, Opportunity>();
        Map<id, String> accountOppLeadSource=new Map<id, String>();
        
        for(Opportunity OTempItr : [Select leadSource, accountId from Opportunity  where id = : iTemp])
        {
            if(OTempItr.leadSource==null)
            {
                if(OTempItr.accountId!=null)
                {
                    accountOppMap.put(OTempItr.accountId,OTempItr);
                }   
            }
        }
        
        System.debug(accountOppMap);
        
        if(accountOppMap.size()>0)
        {            
            for(Account accTemp : [Select
                                            id,(select id,accountId, leadsource from Opportunities order by Createddate desc)
                                    from
                                            Account
                                    where
                                            id in : accountOppMap.keyset()])
            {
                for(Opportunity oTemp : accTemp.Opportunities)
                {
                    if(oTemp.leadSource!=null)
                    {
                        accountOppLeadSource.put(oTemp.accountId,oTemp.leadSource);
                    }
                }
            }
            
            for(Opportunity OTempItr : [Select leadSource, accountId from Opportunity  where id = : iTemp] )
            {
                if(OTempItr.leadSource==null)
                {
                    if(OTempItr.accountId!=null)
                    {
                        if(accountOppLeadSource.containsKey(OTempItr.accountId))
                        {
                            OTempItr.leadsource=accountOppLeadSource.get(OTempItr.accountId);
                            update OTempItr;
                        }
                    }
                }
            }
            
        }
    }
}