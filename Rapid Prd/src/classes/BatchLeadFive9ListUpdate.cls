global class BatchLeadFive9ListUpdate implements Database.Batchable<sObject>,Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select asap_flag_new__c,Scheduled_Follow_Up__c,Last_Five9_List__c From Lead Where LeadSource != \'Partner\' AND Owner.Name NOT In (\'Brian Klenk\', \'Alyssa Palafox\') AND isConverted = false';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Lead> ldList)
    {
        try
        {
            Set<Id> five9Ids = new Set<Id>();
            Set<Id> ldIds = new Set<Id>();
            List<Five9LSP__Five9_List_Item__c> five9DelList = new List<Five9LSP__Five9_List_Item__c>();
            List<Five9LSP__Five9_List_Item__c> five9InsertList = new List<Five9LSP__Five9_List_Item__c>();
            Integer dtNow = System.now().minute();
            
            System.debug('dtNow..'+dtNow);
            for(Lead ld : ldList)
            {
                if(ld.Scheduled_Follow_Up__c !=null)
                {
                    System.debug('Integer....'+Integer.valueOf(ld.Scheduled_Follow_Up__c.minute()));

                    if(Integer.valueOf(ld.Scheduled_Follow_Up__c.minute()) == dtNow + 5)
                    {
                        five9Ids.add(ld.Last_Five9_List__c);
                        ldIds.add(ld.Id);
                                
                    }
                }  
            }
            
            System.debug('five9Ids..'+five9Ids);
            System.debug('ldIds..'+ldIds);
            List<Lead> upLead=new List<Lead>();
            
            if(five9Ids.size()>0)
            {
                List<Five9LSP__Five9_List_Item__c> five9List = [Select Five9LSP__Lead__c,Five9LSP__Five9_List__c From Five9LSP__Five9_List_Item__c Where Five9LSP__Five9_List__c In : five9Ids AND Five9LSP__Lead__c In : ldIds];
                
                System.debug('five9List...'+five9List);

                List<Five9LSP__Five9_List__c> five9Id = [Select Id From Five9LSP__Five9_List__c Where Name = '007 - SFU Leads' LIMIT 1];
                
                // for delete
                for(Five9LSP__Five9_List_Item__c f9ListItem : five9List)
                {
                    five9DelList.add(f9ListItem);
                    System.debug(' f9ListItem .Five9LSP__Lead__c ' +f9ListItem .Five9LSP__Lead__c);
                    
                    
                }
                
                for(Id iTemp : ldIds)
                {
                    Five9LSP__Five9_List_Item__c five9ListItem = new Five9LSP__Five9_List_Item__c();
                    five9ListItem.Five9LSP__Lead__c = iTemp ;
                    
                    if(five9Id.size() != 0)
                        five9ListItem.Five9LSP__Five9_List__c = five9Id.get(0).Id;
                    
                    Lead uLead=new Lead(id=iTemp);
                    uLead.asap_flag_new__c=true;
                    upLead.add(uLead);
                    
                    
                    five9InsertList.add(five9ListItem);
                }
                
                
                System.debug('five9DelList...'+five9DelList);
                System.debug('five9InsertList...'+five9InsertList);
                
                if(five9InsertList.size()>0){
                    insert five9InsertList;
                }
                
                
                
                if(five9DelList.size()>0){
                    delete five9DelList;
                }
                
                if(upLead.size()>0)
                    update upLead;
                
            }  
        }
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
        }
    }
    global void execute(SchedulableContext ctx) {
        BatchLeadFive9ListUpdate batch1 = new BatchLeadFive9ListUpdate();
        ID batchprocessid = Database.executeBatch(batch1);
    }
    
    global void finish(Database.BatchableContext bc) {}
}