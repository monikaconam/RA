trigger UpdatePrimaryCampaignSource on Lead(after update)
{
    Set<Id> oppId;
    
    List<Opportunity> opps = new List<Opportunity>();
    
    Set<Id> Ids = new Set<Id>();
    
    Map<Id,Id> mapCamp = new Map<Id,Id>();
    List<Opportunity> upOpp=new List<Opportunity>();

    for(Lead l : Trigger.new)
    {
        Ids.add(l.Id);
    }

    /*Querying the Campaign Member records which are leads and where the Campaigns, to which they were assigned,
      have been responded to.*/
      
    List<CampaignMember> camp = [select Id,CampaignId,FirstRespondedDate,First_Responded_Date__c 
                                 from CampaignMember where LeadId =:Ids AND HasResponded = True
                                 Order By First_Responded_Date__c ASC ];

    if(camp.size()>0)
    {
    /* Assigning the first CampaignId from the List above, to the a Map with Corresponding Converted OpportunityId
       of this Lead.*/

    for(Lead l : Trigger.new)
        {
           if((l.IsConverted==true) && (l.ConvertedOpportunityId != null) )
            {
                 mapCamp.put(l.ConvertedOpportunityId, camp[0].CampaignId);
            }
        }
  
           //Updating the Opportunity with CampaignId, which would set the Primary Campaign Source on Opportunity.
   
          opps = [SELECT CampaignId FROM Opportunity WHERE Id IN : mapCamp.keySet()]; 
        
          for (Opportunity o: opps)
          {           
              o.CampaignId = mapCamp.get(o.Id);
              upOpp.add(o);
          }
          
          
          if(upOpp.size()>0)
              update upOpp;          
          System.debug('upOpp '+upOpp);
          }
   
}