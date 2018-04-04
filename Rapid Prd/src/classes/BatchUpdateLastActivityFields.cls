global class BatchUpdateLastActivityFields implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select Id,AccountId,Five9__Five9HandleTime__c,Object_Type__c,Owner.UserRole.Name,CreatedDate,';
        query +=  'Subject From Task Where Five9__Five9HandleTime__c != null And Object_Type__c In (\'Account\',\'Contact\',\'Opportunity\')';
        query +=  'And Owner.UserRole.Name = \'Business Development\' Order By CreatedDate ASC';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Task> tskNewList) {
    
        try{
            Map<Id,Task> taskMap = new Map<Id,Task>();
                        
            for(Task taskTemp : tskNewList){
                if(taskTemp.Five9__Five9HandleTime__c != null && taskTemp.subject.tolowercase().contains('call')){
                        
                    Integer callTime = Integer.valueOf(taskTemp.Five9__Five9HandleTime__c.split(':').get(1));
                                        
                    if(callTime >= 2){
                        taskMap.put(taskTemp.AccountId,taskTemp);
                    }
                }
            }            
            if(taskMap.keySet().size()>0){
                List<Account> accList = [Select Id,Last_BD_Call_Activity__c,Last_BD_Owner_Call_Activity__c,OwnerId,Description
                                            From Account Where Id In : taskMap.keySet()];
                                                            
                List<Account> accUpdateList = new List<Account>();
                
                for(Account accTemp : accList){
                    if(taskMap.containsKey(accTemp.Id)){
                        //accTemp.Last_BD_Call_Activity__c = taskMap.get(accTemp.Id).CreatedDate;
                        
                        if(accTemp.OwnerId == taskMap.get(accTemp.Id).OwnerId){
                            accTemp.Last_BD_Owner_Call_Activity__c =  taskMap.get(accTemp.Id).CreatedDate;
                        }else{
                            accTemp.Last_BD_Call_Activity__c = taskMap.get(accTemp.Id).CreatedDate;
                        }
                        
                        accUpdateList.add(accTemp);
                    }
                }
                if(accUpdateList.size()>0){
                    update accUpdateList;
                }      
            }   
        }
        catch(Exception e){
            System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
        }
    }
    
    global void finish(Database.BatchableContext bc) {}
}