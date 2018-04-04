trigger AssignLeadOwner on CampaignMember (after insert) 
{
    List<Lead> lstLead =  new List<Lead>();
    User u =[Select id from User where ID=:Label.Lead_Owner_Distribution];
    
    List<CampaignMember> currentMembers = [SELECT Id, LeadId, Lead.OwnerId, CampaignId, Lead.Owner.Name,Campaign.Funding_Channel__c 
                        FROM CampaignMember 
                        WHERE Id IN :Trigger.new];

    for(CampaignMember campMem : currentMembers){
        if(campMem.LeadId!=null && campMem.Lead.Owner.Name==Label.Lead_Owner_Default && campMem.Campaign.Funding_Channel__C=='Distribution'){
            campMem.Lead.OwnerId= u.id;
            lstLead.add(campMem.Lead);
        }
    }
    if(lstLead.size()>0){
        update lstLead;
    }
     
}