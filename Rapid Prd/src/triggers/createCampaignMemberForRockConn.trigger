trigger createCampaignMemberForRockConn on Lead(after insert, after update) {
    
    List<PartnerNetworkConnection> pncList=[select id,connectionname from PartnerNetworkConnection where connectionname='Rock Connections' and ConnectionStatus='Accepted'];
    Set <id> lId = new Set <id> ();

    Map <id, id> leadCampMap = new Map <id, id> ();
    Map <String, String> leadCampCst = new Map <String, String> ();
    List <CampaignMember> newMember = new List <CampaignMember> ();
    for (Lead lTemp: Trigger.new) {
    System.debug('Recieving conn '+lTemp.ConnectionReceivedId+'   '+pncList[0].id);
    //04P700000000HMfEAM
    if(!test.isRunningTest())
    {
        if(lTemp.ConnectionReceivedId==pncList[0].id) lId.add(lTemp.id);
       
    }
    else
    {
         lId.add(lTemp.id);
    }
    }
    if (lId.size()> 0) {
        List <Lead> lList = [select id, RC_Lead_Type__c from lead where id in : lId and(RC_Lead_Type__c != ''
        OR RC_Lead_Type__c != null)];

        // get values from custom settings
        if (lList.size()> 0) {
            Set <String> lListName = new Set <String> ();

            for (Lead lTemp: lList) {

                lListName.add(lTemp.RC_Lead_Type__c);
            }

            List <CampaignByLeadType__c> lCst = [select name, CampaignID__c from CampaignByLeadType__c];

            //generate set for comparison

            Set <String> lCstName = new Set <String> ();
            Set <String> lCstID = new Set <String> ();
            if (lCst.size()> 0) {
                for (CampaignByLeadType__c ctemp: lCst) {

                    lCstName.add(ctemp.name);
                    lCstID.add(ctemp.CampaignID__c);
                    leadCampCst.put(ctemp.name, ctemp.CampaignID__c);
                }

                for (Lead lTemp: lList) {
                    if (lCstName.contains(lTemp.RC_Lead_Type__c)) {
                        leadCampMap.put(lTemp.id, leadCampCst.get(lTemp.RC_Lead_Type__c));
                    }
                    else
                    {
                        leadCampMap.put(lTemp.id, leadCampCst.get('DEFAULTCAMPAIGN'));
                    
                    }
                  
                }
                
                system.debug('leadCampCst.keyset() ' +leadCampCst.keyset());
                
                List<CampaignMember> existingMemberList=[select id,leadid,campaignid from campaignmember where campaignid in :lCstID  and leadid in:lId];
                Map<String,Integer>existingMemberMap=new Map<String,Integer>();
                for(CampaignMember cTemp: existingMemberList)
                {
                    String temp=cTemp.leadid+''+cTemp.campaignid;
                    
                    existingMemberMap.put(temp,1);
                }
                
                system.debug('existingMemberMap ' +existingMemberMap.size());

                if (leadCampMap.size()> 0) {
                    for (String stemp: leadCampMap.keyset()) {
                    //create the member only if it is not the member in cmpaign
                        if(!existingMemberMap.containskey(stemp+''+leadCampMap.get(stemp)))
                        {
                            CampaignMember cMemberTemp = new CampaignMember();
                            System.debug('SSSSSSSS '+leadCampMap.get(stemp) +'    '+stemp);
                            cMemberTemp.CampaignId = leadCampMap.get(stemp);
                            cMemberTemp.leadId = stemp;
                            cMemberTemp.Status= 'Sent';
                            newMember.add(cMemberTemp);
                        }

                    }
                }


                if (newMember.size()> 0) 
                {
                upsert newMember;
                
                }
            }
        }
    }
}