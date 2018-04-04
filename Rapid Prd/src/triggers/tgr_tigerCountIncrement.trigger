trigger tgr_tigerCountIncrement on CampaignMember (after insert) {

    Try{
        Set<Id> setCampignId = new Set<Id>();
        Set<Id> setLeadID = new Set<Id>();
        List<Lead> leadList = new List<Lead>();
        Map<Id,Id> leadCampaignIdMap = new Map<Id,Id>();
        
        
        List<Open_Dialer_Team_Counter__c> panList = new  List<Open_Dialer_Team_Counter__c>();
        panList = Open_Dialer_Team_Counter__c.getall().values();
                
        List<Tiger_Team_1_Counter__c> team1counter = new List<Tiger_Team_1_Counter__c>();
        team1counter = Tiger_Team_1_Counter__c.getall().values();
        
        List<Tiger_Team_2_Counter__c> team2counter = new List<Tiger_Team_2_Counter__c>();
        team2counter = Tiger_Team_2_Counter__c.getall().values();
        
        List<Tiger_Team_3_Counter__c> team3counter = new List<Tiger_Team_3_Counter__c>();
        team3counter = Tiger_Team_3_Counter__c.getall().values();
        
        List<Tiger_Team_4_Counter__c> team4counter = new List<Tiger_Team_4_Counter__c>();
        team4counter = Tiger_Team_4_Counter__c.getall().values();
        
        
        for(CampaignMember  cms : trigger.New){
            if(cms.leadId != null){
                setCampignId.add(cms.CampaignId);
                setLeadID.add(cms.LeadId);
                leadCampaignIdMap.put(cms.CampaignId,cms.LeadId);
            }
        }
        
        Map<Id,Lead> leadMap = new Map<Id,Lead>([SELECT Id,DMSDocsFirstRoundComplete__c,OPEN_Tiger_Team_Counter__c,Tiger_Team_1_Counter__c,Tiger_Team_2_Counter__c,Tiger_Team_3_Counter__c,Tiger_Team_4_Counter__c      from lead where id =: setLeadID]);
        
        Map<Id,Campaign> cmapaignMap = new map<Id,Campaign>([SELECT Id,Name,Partner_Campaign_Team__c from Campaign where id =: setCampignId]);
        
        for(campaign cmp :cmapaignMap.values()){
            lead ld = leadMap.get(leadCampaignIdMap.get(cmp.Id));
            
            if(cmp.Partner_Campaign_Team__c == NULL && ld.DMSDocsFirstRoundComplete__c != null){
                    ld.OPEN_Tiger_Team_Counter__c = panList[0].counter__c;
                    panList[0].counter__c = panList[0].counter__c + 1;
                    leadList.add(ld);
            }
            else if(cmp.Partner_Campaign_Team__c == 'T1' && ld.DMSDocsFirstRoundComplete__c != null){
                    ld.Tiger_Team_1_Counter__c = team1counter[0].Partner_Number__c;
                    team1counter[0].Partner_Number__c = team1counter[0].Partner_Number__c + 1;
                    leadList.add(ld);
            }
            else if(cmp.Partner_Campaign_Team__c == 'T2' && ld.DMSDocsFirstRoundComplete__c != null){
                    ld.Tiger_Team_2_Counter__c = team2counter[0].Partner_Number__c;
                    team2counter[0].Partner_Number__c = team2counter[0].Partner_Number__c + 1;
                    leadList.add(ld);
            }
            
            else if(cmp.Partner_Campaign_Team__c == 'T3' && ld.DMSDocsFirstRoundComplete__c != null){
                    ld.Tiger_Team_3_Counter__c = team3counter[0].Partner_Number__c;
                    team3counter[0].Partner_Number__c = team3counter[0].Partner_Number__c + 1;
                    leadList.add(ld);
            }
            
            else if(cmp.Partner_Campaign_Team__c == 'T4' && ld.DMSDocsFirstRoundComplete__c != null){
                    ld.Tiger_Team_4_Counter__c = team4counter[0].Partner_Number__c;
                    team4counter[0].Partner_Number__c = team4counter[0].Partner_Number__c + 1;
                    leadList.add(ld);
           }
        } 
        
        if(!leadList.isEmpty())
            update leadList;
        
        if(!panList.isEmpty())
            update panList;
            
        if(!team1counter.isEmpty())
            update team1counter;
            
        if(!team2counter.isEmpty())
            update team2counter;
            
        if(!team3counter.isEmpty())
            update team3counter;
            
        if(!team4counter.isEmpty())
            update team4counter;
    }
    
    catch(Exception e){
    
    }
}