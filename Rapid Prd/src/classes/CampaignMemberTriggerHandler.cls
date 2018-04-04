public class CampaignMemberTriggerHandler
{
    public static void afterInsert(List<CampaignMember> newMember,List<CampaignMember> oldMember)
    {
        assignLeadOwner(newMember, oldMember);
        updateLeadInfo(newMember); 
        UpdateCampaignActivity.updateActivity(newMember);
    }
    
    private static void assignLeadOwner(List<CampaignMember> newMember,List<CampaignMember> oldMember )
    {
        List<Lead> lstLead =  new List<Lead>();
        User u =[Select id from User where ID=:Label.Lead_Owner_Distribution];
        
        List<CampaignMember> currentMembers = [SELECT Id, LeadId, Lead.OwnerId, CampaignId, Lead.Owner.Name,Campaign.Funding_Channel__c 
                                                    FROM CampaignMember WHERE Id IN :newMember];
        
        for(CampaignMember campMem : currentMembers)
        {
            if(campMem.LeadId!=null && campMem.Lead.Owner.Name==Label.Lead_Owner_Default && campMem.Campaign.Funding_Channel__C=='Distribution')
            {
                campMem.Lead.OwnerId= u.id;
                lstLead.add(campMem.Lead);
            }
        }
        if(lstLead.size()>0){
            update lstLead;
        }
    }
    
    public static void updateLeadInfo(List<CampaignMember> newlist)
    {
        List<Lead>  leadToUpdate = new List<Lead>();
        Map<Id,List<Id>>  CampIdToLeadId   = new MAp<Id,List<Id>>();
        for(CampaignMember camp : newlist)
        {
            if(!CampIdToLeadId.containsKey(camp.CampaignId))
            CampIdToLeadId.put(camp.CampaignId,new List<Id>());
            CampIdToLeadId.get(camp.CampaignId).add(camp.leadId);
        }
        
        for(Campaign camp :[Select id,Name ,Partner_Campaign_Team__c ,Funding_Channel__c from Campaign where Id IN : CampIdToLeadId.keySet()])
        {
            for(Id leadIds : CampIdToLeadId.get(camp.id))
            {
                lead lea = new Lead();
                lea.id                  = leadIds;
                lea.Funding_Channel__c  = camp.Funding_Channel__c;
                lea.Campaign_Name__c    = camp.name;
                lea.Tiger_Team__c       = camp.Partner_Campaign_Team__c;
                leadToUpdate.add(lea);
            }
        }
        if(!leadToUpdate.isEmpty()) 
            update leadToUpdate;
    }
}