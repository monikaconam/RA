public class UpdateAccountWithLastFive9CallDetails
{
    public static void onAfterInsert(List<Task> taskList)
    {
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(task newTask : taskList)
            {
                System.debug('newTask.accountId '+ newTask.accountId);
                System.debug('newTask.Object_type__c.tolowercase() '+ newTask.Object_type__c.tolowercase());
                System.debug('newTask.Five9_start_time__c '+ newTask.Five9_start_time__c);
                System.debug('newTask.subject'+ newTask.subject);
                
                if((newTask.subject.tolowercase().contains('call')) && (newTask.Five9_start_time__c!=null)
                && (newTask.Object_type__c.tolowercase()=='account'|| newTask.Object_type__c.tolowercase()=='contact' ||
                newTask.Object_type__c.tolowercase()=='opportunity') && newTask.accountId!=null)
                {
                    taskUpdate.put(newTask.accountId, newTask);
                }
            }
            System.debug(taskUpdate);
            if(taskUpdate.size()>0)
            {
                List<Account> acList=new List<Account>();
                for(Account accTemp : [Select id,Last_Five9_Disposition__c from Account where id in : taskUpdate.keyset()])
                {
                    if(taskUpdate.get(accTemp.id).calldisposition!=null)
                        accTemp.Last_Five9_Disposition__c =taskUpdate.get(accTemp.id).calldisposition;
                        
                    if(taskUpdate.get(accTemp.id).Five9_start_time__c!=null)
                        accTemp.Last_Call_Activity__c=taskUpdate.get(accTemp.id).Five9_start_time__c;

                    acList.add(accTemp);
                }
                
                if(acList.size()>0)
                    update acList;
            }
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }
    
    
    public static void onAfterUpdate(Map<id,Task> newtaskMap,Map<id,Task> oldtaskMap)
    {
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(Id iTemp : newtaskMap.keyset())
            {
                if((newtaskMap.get(iTemp).subject.toLowerCase()!=oldtaskMap.get(iTemp).subject.toLowerCase()) &&
                     (newtaskMap.get(iTemp).subject.tolowercase().contains('call')))
                {
                    if(newtaskMap.get(iTemp).Five9_start_time__c!=null)
                    {
                        if((newtaskMap.get(iTemp).Object_type__c.tolowercase()=='account'|| 
                            newtaskMap.get(iTemp).Object_type__c.tolowercase()=='contact' ||
                            newtaskMap.get(iTemp).Object_type__c.tolowercase()=='opportunity'))
                        {
                           taskUpdate.put(newtaskMap.get(iTemp).accountId, newtaskMap.get(iTemp)); 
                        }
                    }
                }
                
                else if((newtaskMap.get(iTemp).Five9_start_time__c!=oldtaskMap.get(iTemp).Five9_start_time__c) &&
                     (newtaskMap.get(iTemp).Five9_start_time__c!=null))
                {
                    if(newtaskMap.get(iTemp).subject.tolowercase().contains('call'))
                    {
                        if((newtaskMap.get(iTemp).Object_type__c.tolowercase()=='account'|| 
                            newtaskMap.get(iTemp).Object_type__c.tolowercase()=='contact' ||
                            newtaskMap.get(iTemp).Object_type__c.tolowercase()=='opportunity'))
                        {
                            taskUpdate.put(newtaskMap.get(iTemp).accountId, newtaskMap.get(iTemp)); 
                        }
                    }
                }
            }

            if(taskUpdate.size()>0)
            {
                List<Account> acList=new List<Account>();
                for(Account accTemp : [Select id,Last_Five9_Disposition__c from Account where id in : taskUpdate.keyset()])
                {
                    if(taskUpdate.get(accTemp.id).calldisposition!=null)
                        accTemp.Last_Five9_Disposition__c =taskUpdate.get(accTemp.id).calldisposition;
                        
                    if(taskUpdate.get(accTemp.id).Five9_start_time__c!=null)
                        accTemp.Last_Call_Activity__c=taskUpdate.get(accTemp.id).Five9_start_time__c;
                    
                    acList.add(accTemp);
                }
                
                if(acList.size()>0)
                    update acList;
            }
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }
}