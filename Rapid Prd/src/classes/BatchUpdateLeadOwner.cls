global class BatchUpdateLeadOwner implements Database.Batchable<sObject>,Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select ASAP_Flag_New__c,Campaign_Name__c,Last_Five9_List__c,OwnerId,(Select Id, CreatedDate From Tasks),(Select Id,Campaign.Name From CampaignMembers) From Lead Where LeadSource != \'Partner\' AND Status != \'In Progress - Follow Up Call Needed\' AND Scheduled_Follow_Up__c = null AND CreatedDate < LAST_N_DAYS:1 AND isConverted = false';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Lead> ldList) {
    
        try{
            
            System.debug('ldList...'+ ldList);
            
            Set<Id> five9Ids = new Set<Id>();
            Set<Id> ldIds = new Set<Id>();
            List<Five9LSP__Five9_List_Item__c> five9DelList = new List<Five9LSP__Five9_List_Item__c>();
            List<Five9LSP__Five9_List_Item__c> five9InsertList = new List<Five9LSP__Five9_List_Item__c>();
                        
            DateTime past24 = System.now().addDays(-1);
            List<Lead> ldUpdateList = new List<Lead>();
            List<User> usrList = [Select Id,Name From User Where Name In ('Brian Klenk','Alyssa Palafox')];
            Map<String,Id> usrMap = new Map<String,Id>();
            
            for(User usrTemp : usrList){
                usrMap.put(usrTemp.Name,usrTemp.Id);    
            }
            
            for(Lead ldTemp : ldList){
                Boolean recentActivity = false;
                
                if(ldTemp.Tasks.size()>0){
                    for(Task taskTemp : ldTemp.Tasks){
                        if(taskTemp.CreatedDate > past24){
                            recentActivity = true;        
                        }  
                    }
                }
                
                if(ldTemp.Tasks.size() == 0 || recentActivity == false){
                    ldTemp.ASAP_Flag_New__c = true;
                    Boolean campName = false;
                    
                    System.debug('ldTemp.Last_Five9_List__c...'+ldTemp.Last_Five9_List__c);
                    System.debug('ldTemp.Id...'+ldTemp.Id);
                    
                    if(ldTemp.Last_Five9_List__c != null){
                        five9Ids.add(ldTemp.Last_Five9_List__c);
                        ldIds.add(ldTemp.Id);
                    } 
                    
                    if(ldTemp.CampaignMembers.size() != 0){
                        for(CampaignMember campMem : ldTemp.CampaignMembers){
                            if(campMem.Campaign.Name == 'Quicken Loans Hot Transfer' || campMem.Campaign.Name == 'Quicken Loans Email Transfer'){
                                campName = true;    
                            }    
                        }
                    }
                    if(campName == true){
                        ldTemp.OwnerId = usrMap.get('Alyssa Palafox');    
                    }else{
                        ldTemp.OwnerId = usrMap.get('Brian Klenk'); 
                    }
                }
                ldUpdateList.add(ldTemp);
            }
            
            System.debug('five9Ids...'+five9Ids);
            System.debug('ldIds...'+ldIds);
            
            if(five9Ids.size()>0){
                List<Five9LSP__Five9_List_Item__c> five9List = [Select Five9LSP__Lead__c,Five9LSP__Five9_List__c From Five9LSP__Five9_List_Item__c Where Five9LSP__Five9_List__c In : five9Ids AND Five9LSP__Lead__c In : ldIds];
                System.debug('five9List...'+five9List);
                
                List<Five9LSP__Five9_List__c> five9Id = [Select Id From Five9LSP__Five9_List__c Where Name = '015 - BA Leads' LIMIT 1];
                
                for(Five9LSP__Five9_List_Item__c f9ListItem : five9List){
                    five9DelList.add(f9ListItem);
                                        
                    Five9LSP__Five9_List_Item__c five9ListItem = new Five9LSP__Five9_List_Item__c();
                    five9ListItem.Five9LSP__Lead__c = f9ListItem.Five9LSP__Lead__c;
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
            }
            if(ldUpdateList.size()>0){
                Database.update(ldUpdateList,false);
            }
            
        }
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
        }
    }
    global void execute(SchedulableContext ctx) {
        BatchUpdateLeadOwner batch1 = new BatchUpdateLeadOwner();
        ID batchprocessid = Database.executeBatch(batch1);
    }
    
    global void finish(Database.BatchableContext bc) {}
}