public class UpdateLastActivityFields {
    
    public static void updateLastBDCallActivity(List<Task> tskNewList){
        
        try{
            List<User> usrList = [Select Id,UserRole.Name From User Where UserRole.Name = 'Business Development' And isActive = true];
            Map<Id,String> userMap = new Map<Id,String>();
            Map<Id,Task> taskMap = new Map<Id,Task>();
            
            for(User usr : usrList){
                userMap.put(usr.Id,usr.UserRole.Name);       
            }
            
            for(Task taskTemp : tskNewList){
                if(taskTemp.Five9__Five9HandleTime__c != null && taskTemp.subject.tolowercase().contains('call') && 
                    (taskTemp.Object_Type__c == 'Account' || taskTemp.Object_Type__c == 'Contact' || taskTemp.Object_Type__c == 'Opportunity')
                    && userMap.containsKey(taskTemp.OwnerId)){
                        
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
}