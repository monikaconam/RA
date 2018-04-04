/**
@Name            : ParentCampaignTriggerHandler
@Author          : JD Conam
@Date            : March 7 2018
@Description     : This class prevents the ability to associate a parent and child campaign that have mismatching Funding Channels. 
**/

public with sharing class ParentCampaignTriggerHandler
{
    public static void checkMismatchFundingChannelIns(List<Campaign> listCmp)
    {
        Set<Id> setParentId = new Set<Id>();
        for(Campaign camp : listCmp)
        {
            if(camp.ParentId !=null)
                setParentId.add(camp.ParentId);
        }
        if(setParentId.size()>0)
        {
            checkMismatchFundingChannelhelp(setParentId, listCmp);
        }
    }
    
    public static void checkMismatchFundingChannelUPD(List<Campaign> listCmp,Map<Id, Campaign> oldMap)
    {
        Set<Id> setParentId = new Set<Id>();
        for(Campaign camp : listCmp)
        {
            if((camp.ParentId !=null) && (oldMap.get(camp.id).ParentId!=camp.ParentId))
                setParentId.add(camp.ParentId);
        }
        if(setParentId.size()>0)
        {
            checkMismatchFundingChannelhelp(setParentId,listCmp);
        }
    }
    
    public static void checkMismatchFundingChannelhelp(Set<Id> setParentId, List<Campaign> listCmp )
    {
        if(setParentId.size()>0)
        {
            Map<Id,Campaign> campaignIdMap = new Map<Id,Campaign>(); 
            
            for(Campaign camp : [Select Id,Funding_Channel__c,ParentId,name from Campaign where Id IN : setParentId])
            {
                if(camp.Funding_Channel__c != NULL)
                    campaignIdMap.put(Camp.Id, camp);
            }
            for(Campaign camp: listCmp)
            {
                if((camp.ParentId != NULL) && (campaignIdMap.containsKey(camp.ParentId)) && (campaignIdMap.get(camp.ParentId).Funding_Channel__c!= Camp.Funding_Channel__c))
                {
                    String parentMsg=campaignIdMap.get(camp.ParentId).Funding_Channel__c;
                    String currentMsg=camp.Funding_Channel__c;
                    camp.addError('Campaigns can only be linked if they have the matching Funding Channel. Current record has '+ camp.Funding_Channel__c+' as Funding Channel and the campaing being linked has '+ parentMsg);
                }
            }
        }
    }            
}