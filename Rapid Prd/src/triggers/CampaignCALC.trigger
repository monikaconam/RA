trigger CampaignCALC on Campaign (after insert, after update) 
{   
    for(Campaign c: Trigger.new)
    {
        String campaignId = String.valueOf(c.Id);
        if (trigger.isInsert)
        {
            System.debug('>>> CREATE Campaign=' + c.Name);
        }
        else if (trigger.isUpdate)
        {
            System.debug('>>> UPDATE Campaign=' + c.Name);
        }
        
        System.debug('>>> ID=' + campaignId);
        System.debug('>>> Type=' + c.Type);
        
        // Modified to include all Campaign types - CY, 10/21/2014
        //if (campaignId != null && (c.Type != null && c.Type.equals('Partners'))) 
        if (campaignId != null && c.Type != null) 
        {                   
            CALC.CampaignRequest(campaignId);
        }
    }
}