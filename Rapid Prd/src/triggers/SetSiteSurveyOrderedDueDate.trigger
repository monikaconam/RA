/*
Deactivated 02/03/2016
SiteInspection now handled by CALC
*/
trigger SetSiteSurveyOrderedDueDate on Opportunity (before insert, before update) {
/*
c.      Location (Country) equals US left

*/
    List<id> campIds = new List<id>();
    
    Id rtID=[select
                    id 
            from
                    recordtype
            where
                    sobjecttype='Opportunity'
            and
                    developername='GreenTree' Limit 1].id;
                    
     
    for (Opportunity opp : Trigger.new)
    {
        System.debug('opp.campaignId '+ opp.campaignId);
        if (opp.campaignId != null) 
        {
            campIds.add(opp.campaignId);
        }
    } 
    System.debug('campIds '+ campIds);
    Map<id, campaign> campaignMap = new Map<id, campaign>([select 
                                                                    id, Suppress_Site_Inspection__c 
                                                            from 
                                                                    Campaign 
                                                            where 
                                                                    id in :campIds]);
                                                         
    for(Opportunity opp : Trigger.new)
    {
        if(opp.campaignId!=null)
        {
            System.debug('opp.campaignId '+ opp.campaignId);
            System.debug('opp.recordTypeId '+ opp.recordTypeId);
                        System.debug('opp.rtID'+ rtID);
            if((campaignMap.get(opp.campaignId).Suppress_Site_Inspection__c==false) && (opp.recordTypeID!=rtID))
            {
                if((opp.StageName=='Submitted Deal' || opp.StageName=='Approved') && (opp.Site_Survey_Ordered_Due_Date__c==null))
                {
                    String temp=opp.Billing_Country__c!=null ? opp.Billing_Country__c.toUpperCase() : '' ;
                    if((opp.Billing_Country__c!='CANADA') && (opp.Billing_Country__c!='CN'))
                    {
                            //if a new deal
                            if(opp.Renewal__c==false &&  opp.amount >= 50000)
                            {
                                opp.Site_Survey_Ordered_Due_Date__c=System.today();
                            }
                            // if it is a renewal
                            if(opp.Renewal__c==true &&  opp.amount >= 100000)
                            {                 
                                opp.Site_Survey_Ordered_Due_Date__c=System.today();
                            }
                    }
                }
            }
        }
    }
}