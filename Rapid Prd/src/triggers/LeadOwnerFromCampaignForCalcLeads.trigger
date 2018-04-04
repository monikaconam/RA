trigger LeadOwnerFromCampaignForCalcLeads on Lead (before insert) 
{
/*
A lead should be assigned an owner based on the custom field created on Campaign named "Default Lead Owner", only if  
1. Created By has value "Web Apps" (lead originated from Calc), and
2. Lead Source has value "Partner-Web", and
3. Lead Owner is blank (value not passed through API), and
4. Campaign Name Upload has the Campaign value specified (not blank or null)

*/
    List<CalcLeadCreator__c> lCreator=[select name from CalcLeadCreator__C limit 1];
    Set<String> campId=new Set<String>();
    Map<String,String> campNameIdMap=new Map<String,String>();
    List<CampaignMember> cms=[SELECT CampaignID, LeadID, Status FROM CampaignMember WHERE LeadID in : Trigger.new];
    System.debug('cms is '+cms );
    for(Lead lTemp :Trigger.new)
    {
        System.debug('Owner id  '+lTemp.ownerID);
        System.debug('lead  '+lTemp);
        
        
        if((lTemp.Campaign_Name_Upload__c!=null)&&(lTemp.Campaign_Name_Upload__c!=''))
        {
            campId.add(lTemp.Campaign_Name_Upload__c);
            
        }
    }
    
    Map<id,Campaign> mapCampaign=new Map<id,Campaign>([select id, Default_Lead_Owner__c from campaign where name in :campId]);
    List<Campaign> listCampaign=[select id,name, Default_Lead_Owner__c from campaign where name in :campId];
    
    for(Campaign cTemp : listCampaign)
    {
    
        campNameIdMap.put(cTemp.name,cTemp.id); 
    }
    
    
    for(Lead lTemp :Trigger.new)
    {
        if((lTemp.Campaign_Name_Upload__c!=null)&&(lTemp.Campaign_Name_Upload__c!=''))
        {
            if(lTemp.LeadSource=='Partner-Web')
            {
                system.debug(' lCreator '+ lCreator);
                Id lCreatorTemp=lCreator.size()>0 ? lCreator[0].name : null;
                if(lTemp.createdbyId==lCreatorTemp)
                {
                    if(lTemp.ownerID==lCreatorTemp) 
                    {
                        if(campNameIdMap.get(lTemp.Campaign_Name_Upload__c)!=null)
                        {                        
                            lTemp.ownerID=mapCampaign.get(campNameIdMap.get(lTemp.Campaign_Name_Upload__c)).Default_Lead_Owner__c;
                        }
                    }
                }        
            }   
    
        }

    }
}