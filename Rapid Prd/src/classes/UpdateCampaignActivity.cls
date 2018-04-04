public class UpdateCampaignActivity
{
    public static void updateActivity(List<CampaignMember> newMembers)
    {
        Set<Id> campIds=new Set<Id>();
        for(CampaignMember cTemp : newMembers)
        {
            campIds.add(cTemp.campaignid); 
        }
        
        if(campIds.size()>0)
        {
            List<Campaign> cmpList=new List<Campaign>();
            
            List<Campaign> cmList=[Select id, Activity__c from Campaign where id in :campIds and type='partners' and Activity__c in (null,'Inactive','Dormant')];
            if(cmList.size()>0)
            {
                for(Campaign cTemp : cmList)
                {
                    sYSTEM.DEBUG(cTemp.Activity__c);
                    if(cTemp.Activity__c!='Funding' && cTemp.Activity__c!='Submitting' && cTemp.Activity__c!='High Signing Activity')
                    {
                        cTemp.Activity__c='Submitting';
                        cmpList.add(cTemp);
                    }
                }
                
                if(cmpList.size()>0)
                    update cmpList;
            }
        }
    }
}