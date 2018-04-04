trigger trgUpdateOpportunity on Lead (after Update) 
{

   /* Map<ID, ID> m = new Map<ID, ID>();  
    List<ID> opportunityID = new List<ID>();
    List<Opportunity> oppsToUpdate = new List<Opportunity>(); 
  
   for(integer i = 0; i<Trigger.new.size(); i++)     
    {
      if(Trigger.new[i].IsConverted == true)
      {
          m.put(Trigger.new[i].ConvertedOpportunityId,Trigger.new[i].ConvertedContactId);
          opportunityID.add(Trigger.new[i].ConvertedOpportunityId);
        
      }
    }
    for(opportunity opp : [select id, contact__c from opportunity where id in :opportunityID])
    {
         opp.contact__c= m.get(opp.id);
         oppsToUpdate.add(opp);   
    }
    update oppsToUpdate;
    */
    if(CheckRecursiveTrgUpdateOpportunity.runOnce())
    {
        Map<ID, ID> oppContactMap = new Map<ID, ID>();  
        List<ID> opportunityID = new List<ID>();
        List<Opportunity> oppsToUpdate = new List<Opportunity>(); 
        
        for(Lead lTemp : Trigger.new)     
        {
            if((Trigger.oldMap.get(lTemp.id).IsConverted == false)&&(lTemp.IsConverted==true))
            {
              oppContactMap .put(lTemp.ConvertedOpportunityId,lTemp.ConvertedContactId);
              opportunityID.add(lTemp.ConvertedOpportunityId);
            }
        }
        
        for(opportunity opp : [select id, contact__c from opportunity where id in :opportunityID])
        {
         opp.contact__c= oppContactMap.get(opp.id);
         oppsToUpdate.add(opp);   
        }
        if(oppsToUpdate.size()>0)
        {
            try
            {
                Database.update(oppsToUpdate,false);
            }
            catch(Exception e)
            {
                System.debug('An exception has occurred at -'+e.getLineNumber()+'-'+e.getMessage());
            }
        }
    }
}