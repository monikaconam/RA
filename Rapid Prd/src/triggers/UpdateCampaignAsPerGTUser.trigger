//Deactivated as per Ticket 16721
trigger UpdateCampaignAsPerGTUser on Opportunity (before update) {

    Set<id> oppIdSet=new Set<id>();
    Set<id> gtUserSet=new Set<id>();
    gtUserSet.add('00570000001vLfn');
    gtUserSet.add('00570000001xmui');
    
    Map<id,Id> userCampMap=new Map<id,id>();
    userCampMap.put('00570000001vLfn','70170000000mJTv');
    userCampMap.put('00570000001xmui','70170000000u4k6');
    
    Id rID = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('GreenTree').getRecordTypeId();

        if(rId!=null)
        {
            for(Opportunity opp: Trigger.new)
            {
                if((opp.RecordTypeId==rId) && (Trigger.oldMap.get(opp.id).ownerID=='00570000001BNFy')&&(opp.Gross_monthly_sales__c<7000 ||opp.Gross_monthly_sales__c==null))
                {
                    if((opp.ownerID!=Trigger.oldMap.get(opp.id).ownerID) && (gtUserSet.contains(opp.ownerID)))
                    {
                        if(opp.ownerID=='00570000001xmui')
                        {
                            opp.CampaignId=userCampMap.get(opp.ownerID);
                        } 
                        
                        if(opp.ownerID=='00570000001vLfn')
                        {
                            opp.CampaignId=userCampMap.get(opp.ownerID);
                        }
                    }
                }
            }
        }
    }