trigger UpdateOpportunityOwner on Opportunity (before insert) {

List<id> cList=new List<id>();
for (Opportunity o : Trigger.new)
    {
        if (o.CampaignId != NULL)
            {
                cList.add(o.CampaignId);
            }   
        
    }   
 Map<id, campaign> cMap=new Map<id,campaign>([select id, default_opportunity_owner__C from campaign where id in :clist]);
 
 if(cMap.size()>0)
 {
         for(Opportunity o : Trigger.new)
         {
             if(cMap.get(o.CampaignId).default_opportunity_owner__C!=null)
                 o.ownerID=cMap.get(o.CampaignId).default_opportunity_owner__C;
         
         
         }     
 }


}