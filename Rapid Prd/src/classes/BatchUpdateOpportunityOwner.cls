global class BatchUpdateOpportunityOwner implements Database.Batchable<sObject>,Schedulable,Database.AllowsCallouts {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select Last_Five9_List__c,ASAP_Flag__c,Campaign.Name, OwnerId,(Select Id, CreatedDate From Tasks) From Opportunity Where LeadSource != \'Partner\' AND StageName = \'Credit Pulled\' AND Scheduled_Follow_Up__c = null AND CreatedDate < LAST_N_DAYS:1';
        //System.debug('query..'+ Database.getQueryLocator(query));
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Opportunity> oppList) {
    
        try{
            System.debug('oppList.....'+oppList);
            
            Set<Id> five9Ids = new Set<Id>();
            Set<Id> oppIds = new Set<Id>();
            List<Five9LSP__Five9_List_Item__c> five9DelList = new List<Five9LSP__Five9_List_Item__c>();
            List<Five9LSP__Five9_List_Item__c> five9InsertList = new List<Five9LSP__Five9_List_Item__c>();
            
            DateTime past24 = System.now().addDays(-1);
            List<Opportunity> oppUpdateList = new List<Opportunity>();
            List<User> usrList = [Select Id,Name From User Where Name In ('Brian Klenk','Alyssa Palafox')];
            Map<String,Id> usrMap = new Map<String,Id>();
            
            for(User usrTemp : usrList){
                usrMap.put(usrTemp.Name,usrTemp.Id);    
            }
            
            for(Opportunity oppTemp : oppList){
                Boolean recentActivity = false;
                for(Task taskTemp : oppTemp.Tasks){
                    if(taskTemp.CreatedDate > past24){
                        recentActivity = true;        
                    }  
                }
                if(oppTemp.Tasks.size() == 0 || recentActivity == false){
                    
                    System.debug('oppTemp.Last_Five9_List__c...'+oppTemp.Last_Five9_List__c);
                    System.debug('oppTemp.Id...'+oppTemp.Id);
                    
                    if(oppTemp.Last_Five9_List__c != null){
                        five9Ids.add(oppTemp.Last_Five9_List__c);
                        oppIds.add(oppTemp.Id);
                    } 
                    oppTemp.ASAP_Flag__c = true;
                    
                    if(oppTemp.CampaignId != null && (oppTemp.Campaign.Name == 'Quicken Loans Hot Transfer' || oppTemp.Campaign.Name == 'Quicken Loans Email Transfer')){
                        oppTemp.OwnerId = usrMap.get('Alyssa Palafox');    
                    }else{
                        oppTemp.OwnerId = usrMap.get('Brian Klenk'); 
                    }
                }
                oppUpdateList.add(oppTemp);
            }
            System.debug('five9Ids...'+five9Ids);
            System.debug('oppIds...'+oppIds);
            
            if(five9Ids.size()>0){
                List<Five9LSP__Five9_List_Item__c> five9List = [Select Five9LSP__Opportunity__c,Five9LSP__Five9_List__c From Five9LSP__Five9_List_Item__c Where Five9LSP__Five9_List__c In : five9Ids AND Five9LSP__Opportunity__c In : oppIds];
                System.debug('five9List...'+five9List);
                
                List<Five9LSP__Five9_List__c> five9Id = [Select Id From Five9LSP__Five9_List__c Where Name = '015 - BA Opps' LIMIT 1];
                
                for(Five9LSP__Five9_List_Item__c f9ListItem : five9List){
                    five9DelList.add(f9ListItem);
                                        
                    Five9LSP__Five9_List_Item__c five9ListItem = new Five9LSP__Five9_List_Item__c();
                    five9ListItem.Five9LSP__Opportunity__c = f9ListItem.Five9LSP__Opportunity__c;
                    if(five9Id.size() != 0)
                        five9ListItem.Five9LSP__Five9_List__c = five9Id.get(0).Id;
                    five9InsertList.add(five9ListItem);
                }
                System.debug('five9DelList...'+five9DelList);
                System.debug('five9InsertList...'+five9InsertList);
                
                if(five9InsertList.size()>0){
                    Database.insert(five9InsertList,false);
                }
                if(five9DelList.size()>0){
                    Database.delete(five9DelList,false);
                }
                if(oppUpdateList.size()>0){
                    Database.update(oppUpdateList,false);
                }
            }
            if(oppUpdateList.size()>0){
                Database.update(oppUpdateList,false);
            }
        }
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
        }
    }
    global void execute(SchedulableContext ctx) {
        BatchUpdateOpportunityOwner batch1 = new BatchUpdateOpportunityOwner();
        ID batchprocessid = Database.executeBatch(batch1);
    }
    
    global void finish(Database.BatchableContext bc) {}
}