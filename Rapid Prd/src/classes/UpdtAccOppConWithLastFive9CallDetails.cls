public class UpdtAccOppConWithLastFive9CallDetails
{
    public static void updateAccountWithLastFive9CallDetails(List<Task> taskList)
    {
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(task newTask : taskList)
            {
                if((newTask.subject.toLowerCase().contains('call')) && (newTask.Five9_start_time__c!=null) && (newTask.Object_type__c.tolowercase()=='account') && newTask.accountId!=null)
                {
                    taskUpdate.put(newTask.accountId, newTask);
                }
            }
            if(taskUpdate.size()>0)
            {
                List<Account> acList=new List<Account>();
                for(Account accTemp : [Select id,Last_Five9_Disposition__c,Last_Call_Activity__c from Account where id in : taskUpdate.keyset()])
                {
                    if(taskUpdate.get(accTemp.id).calldisposition!=null)
                        accTemp.Last_Five9_Disposition__c =taskUpdate.get(accTemp.id).calldisposition;
                        
                    if(taskUpdate.get(accTemp.id).Five9_start_time__c!=null)
                        accTemp.Last_Call_Activity__c=taskUpdate.get(accTemp.id).createddate;

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
    public static void updateLeadWithLastFive9CallDetails(List<Task> taskList)
    {
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(task newTask : taskList)
            {
                if((newTask.subject.toLowerCase().contains('call')) && (newTask.Five9_start_time__c!=null) && (newTask.Object_type__c.tolowercase()=='Lead') && newTask.whoid!=null)
                {
                    taskUpdate.put(newTask.whoid, newTask);
                }
            }
            if(taskUpdate.size()>0)
            {
                List<Lead> ldList=new List<Lead>();
                for(Lead lTemp : [Select id,Last_Call_Activity__c from Lead where id in : taskUpdate.keyset()])
                {                       
                    if(taskUpdate.get(lTemp.id).Five9_start_time__c!=null)
                        lTemp.Last_Call_Activity__c=taskUpdate.get(lTemp .id).createddate;

                    ldList.add(lTemp );
                }
                
                if(ldList.size()>0)
                    update ldList;
            }
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }
    
    
    /*public static void onAfterUpdate(Map<id,Task> newtaskMap,Map<id,Task> oldtaskMap)
    {
        try
        {
            Map<Id,dateTime> oppOMap = new Map<Id,dateTime>();
            Map<Id,dateTime> accOMap = new Map<Id,dateTime>();
            Map<Id,dateTime> conOMap = new Map<Id,dateTime>();
            for(Id iTemp : newtaskMap.keyset())
            {
                if((newtaskMap.get(iTemp).Five9_start_time__c!=oldtaskMap.get(iTemp).Five9_start_time__c) &&
                     (newtaskMap.get(iTemp).Five9_start_time__c!=null))
                {
                    if(newtaskMap.get(iTemp).what.type=='account')
                    {
                       accOMap.put(newtaskMap.get(iTemp).accountId, newtaskMap.get(iTemp).createddate); 
                    }
                    if(newtaskMap.get(iTemp).who.type=='contact')
                    {
                       conOMap .put(newtaskMap.get(iTemp).whoid, newtaskMap.get(iTemp).createddate); 
 
                    }
                    if(newtaskMap.get(iTemp).what.type=='opportunity')
                    {
                       oppOMap.put(newtaskMap.get(iTemp).whatid, newtaskMap.get(iTemp).createddate);
                    }
                }
            }
            
            if(conOMap .size()>0)
            {
                Map<Id,dateTime> accMap = new Map<Id,dateTime>();
                Map<Id,dateTime> conMap = new Map<Id,dateTime>();
                for(Contact conTemp : [Select id,Last_Call_Activity__c,AccountId from Contact where id in : conMap.keyset()])
                {
                    DateTime nowTimeStamp=conMap.get(conTemp.id);
                    if(conTemp.accountId!=null)
                    {
                        if(accMap.get(conTemp.AccountId)!=null)
                        {
                            // incase of bulk data upload the task createddate can be in any order so only the latest call
                            // activity needs to be preserved
                            
                            DateTime storedTimeStamp=accMap.get(conTemp.AccountId);
                            
                            if(nowTimeStamp > storedTimeStamp)
                                accMap.put(conTemp.AccountId,nowTimeStamp);
                        }
                        else
                        {
                            accMap.put(conTemp.AccountId,nowTimeStamp);
                        }
                    }
                    
                    if(conMap.get(conTemp.id)!=null)
                    {
                        // incase of bulk data upload the task createddate can be in any order so only the latest call
                        // activity needs to be preserved
                        
                        DateTime storedTimeStamp=conMap.get(conTemp.id);
                        
                        if(nowTimeStamp > storedTimeStamp)
                            conTemp.put(conTemp.id,nowTimeStamp);
                    }
                    else
                    {
                        conMap.put(conTemp.id,nowTimeStamp);
                    }
                }
                if(conMap.size()>0)
                {
                    List<Contact> conUpdateList = new List<Contact>();
                    for(Contact con :[Select id,Last_Call_Activity__c From Contact Where id in : conMap.keyset()])
                    {
                        con.Last_Call_Activity__c =conMap.get(con.id);
                        conUpdateList.add(con);
                    }
                    if(conUpdateList.size()>0){
                        Database.update(conUpdateList,false);
                    }
                }
                if(accMap.size()>0)
                {   
                    List<Account> accUpdateList = new List<Account>();
                    List<Account> accList = [Select Id,Last_Call_Activity__c From Account Where Id In : accMap.keyset()];
                    
                    for(Account acc : accList)
                    {
                        acc.Last_Call_Activity__c = accMap.get(acc.id);
                        accUpdateList.add(acc);
                    }
                    if(accUpdateList.size()>0){
                        Database.update(accUpdateList,false);
                    }
                }
            }
            
            if(oppOMap.size()>0)
            {
                Map<Id,dateTime> accMap = new Map<Id,dateTime>();
                Map<Id,dateTime> oppMap = new Map<Id,dateTime>();
                for(Opportunity oppTemp : [Select id,Last_Call_Activity__c,AccountId from Opportunity where id in : oppOMap.keyset()])
                {
                    DateTime nowTimeStamp=oppOMap.get(oppTemp.id);
                    if(oppTemp.accountId!=null)
                    {
                        if(accMap.get(oppTemp.AccountId)!=null)
                        {
                            // incase of bulk data upload the task createddate can be in any order so only the latest call
                            // activity needs to be preserved
                            
                            DateTime storedTimeStamp=accMap.get(oppTemp.AccountId);
                            
                            if(nowTimeStamp > storedTimeStamp)
                                accMap.put(oppTemp.AccountId,nowTimeStamp);
                        }
                        else
                        {
                            accMap.put(oppTemp.AccountId,nowTimeStamp);
                        }
                    }
                    
                    if(oppMap.get(oppTemp.id)!=null)
                    {
                        // incase of bulk data upload the task createddate can be in any order so only the latest call
                        // activity needs to be preserved
                        
                        DateTime storedTimeStamp=oppMap.get(oppTemp.id);
                        
                        if(nowTimeStamp > storedTimeStamp)
                            oppMap.put(oppTemp.AccountId,nowTimeStamp);
                    }
                    else
                    {
                        oppMap.put(oppTemp.id,nowTimeStamp);
                    }
                }
                if(oppMap.size()>0)
                {
                    List<Opportunity > oppUpdateList = new List<Opportunity >();
                    for(Opportunity opp :[Select id,Last_Call_Activity__c From Opportunity Where id in : oppMap.keyset()])
                    {
                        opp.Last_Call_Activity__c =oppMap.get(opp.id);
                        oppUpdateList.add(opp);
                    }
                    if(oppUpdateList.size()>0){
                        Database.update(oppUpdateList,false);
                    }
                }
                if(accMap.size()>0)
                {   
                    List<Account> accUpdateList = new List<Account>();
                    List<Account> accList = [Select Id,Last_Call_Activity__c From Account Where Id In : accMap.keyset()];
                    
                    for(Account acc : accList)
                    {
                        acc.Last_Call_Activity__c = accMap.get(acc.id);
                        accUpdateList.add(acc);
                    }
                    if(accUpdateList.size()>0){
                        Database.update(accUpdateList,false);
                    }
                }
            } 
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }*/
    public static void updateOppWithLastFive9CallDetails(List<Task> taskList){
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(task newTask : taskList)
            {
                if(newTask.subject.toLowerCase().contains('call') &&newTask.Five9_start_time__c!=null && newTask.Object_type__c.tolowercase()=='opportunity' && newTask.whatid!=null)
                {
                    if(String.valueof(newTask.whatid).startsWith('006'))
                    {
                        taskUpdate.put(newTask.whatid, newTask);
                    }
                }
            }
            System.debug(taskUpdate);
            if(taskUpdate.size()>0)
            {
                Map<Id,dateTime> accMap = new Map<Id,dateTime>();
                Map<Id,dateTime> oppMap = new Map<Id,dateTime>();
                for(Opportunity oppTemp : [Select id,Last_Call_Activity__c,AccountId from Opportunity where id in : taskUpdate.keyset()])
                {
                    if(taskUpdate.get(oppTemp.id).Five9_start_time__c!=null)
                    {
                        DateTime nowTimeStamp=taskUpdate.get(oppTemp.id).createddate;
                        if(oppTemp.accountId!=null)
                        {
                            if(accMap.get(oppTemp.AccountId)!=null)
                            {
                                // incase of bulk data upload the task createddate can be in any order so only the latest call
                                // activity needs to be preserved
                                
                                DateTime storedTimeStamp=accMap.get(oppTemp.AccountId);
                                
                                if(nowTimeStamp > storedTimeStamp)
                                    accMap.put(oppTemp.AccountId,nowTimeStamp);
                            }
                            else
                            {
                                accMap.put(oppTemp.AccountId,nowTimeStamp);
                            }
                        }
                        
                        if(oppMap.get(oppTemp.id)!=null)
                        {
                            // incase of bulk data upload the task createddate can be in any order so only the latest call
                            // activity needs to be preserved
                            
                            DateTime storedTimeStamp=oppMap.get(oppTemp.id);
                            
                            if(nowTimeStamp > storedTimeStamp)
                                oppMap.put(oppTemp.AccountId,nowTimeStamp);
                        }
                        else
                        {
                            oppMap.put(oppTemp.id,nowTimeStamp);
                        }
                    }
                }
                if(oppMap.size()>0)
                {
                    List<Opportunity > oppUpdateList = new List<Opportunity >();
                    for(Opportunity opp :[Select id,Last_Call_Activity__c From Opportunity Where id in : oppMap.keyset()])
                    {
                        opp.Last_Call_Activity__c =oppMap.get(opp.id);
                        oppUpdateList.add(opp);
                    }
                    if(oppUpdateList.size()>0){
                        Database.update(oppUpdateList,false);
                    }
                }
                if(accMap.size()>0)
                {   
                    List<Account> accUpdateList = new List<Account>();
                    List<Account> accList = [Select Id,Last_Call_Activity__c From Account Where Id In : accMap.keyset()];
                    
                    for(Account acc : accList)
                    {
                        acc.Last_Call_Activity__c = accMap.get(acc.id);
                        accUpdateList.add(acc);
                    }
                    if(accUpdateList.size()>0){
                        Database.update(accUpdateList,false);
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }
    public static void updateContactWithLastFive9CallDetails(List<Task> taskList){
        try
        {
            Map<id,Task> taskUpdate=new Map<id,Task>();
            for(task newTask : taskList)
            {  
                system.debug(taskList);
                if(newTask.subject.toLowerCase().contains('call') && newTask.Five9_start_time__c!=null && newTask.Object_type__c.tolowercase()=='contact' && newTask.whoid!=null)
                {
                    if(String.valueof(newTask.WhoId).startsWith('003'))
                    {
                        taskUpdate.put(newTask.whoid, newTask);
                    }
                }
            }
            System.debug(taskUpdate);
            if(taskUpdate.size()>0)
            {
                Map<Id,dateTime> accMap = new Map<Id,dateTime>();
                Map<Id,dateTime> conMap = new Map<Id,dateTime>();
                for(Contact conTemp : [Select id,Last_Call_Activity__c,AccountId from Contact where id in : taskUpdate.keyset()])
                {
                    if(taskUpdate.get(conTemp.id).Five9_start_time__c!=null)
                    {
                        DateTime nowTimeStamp=taskUpdate.get(conTemp.id).createddate;
                        if(conTemp.accountId!=null)
                        {
                            if(accMap.get(conTemp.AccountId)!=null)
                            {
                                // incase of bulk data upload the task createddate can be in any order so only the latest call
                                // activity needs to be preserved
                                
                                DateTime storedTimeStamp=accMap.get(conTemp.AccountId);
                                
                                if(nowTimeStamp > storedTimeStamp)
                                    accMap.put(conTemp.AccountId,nowTimeStamp);
                            }
                            else
                            {
                                accMap.put(conTemp.AccountId,nowTimeStamp);
                            }
                        }
                        
                        if(conMap.get(conTemp.id)!=null)
                        {
                            // incase of bulk data upload the task createddate can be in any order so only the latest call
                            // activity needs to be preserved
                            
                            DateTime storedTimeStamp=conMap.get(conTemp.id);
                            
                            if(nowTimeStamp > storedTimeStamp)
                                conTemp.put(conTemp.id,nowTimeStamp);
                        }
                        else
                        {
                            conMap.put(conTemp.id,nowTimeStamp);
                        }
                    }
                }
                if(conMap.size()>0)
                {
                    List<Contact> conUpdateList = new List<Contact>();
                    for(Contact con :[Select id,Last_Call_Activity__c From Contact Where id in : conMap.keyset()])
                    {
                        con.Last_Call_Activity__c =conMap.get(con.id);
                        conUpdateList.add(con);
                    }
                    if(conUpdateList.size()>0){
                        Database.update(conUpdateList,false);
                    }
                }
                if(accMap.size()>0)
                {   
                    List<Account> accUpdateList = new List<Account>();
                    List<Account> accList = [Select Id,Last_Call_Activity__c From Account Where Id In : accMap.keyset()];
                    
                    for(Account acc : accList)
                    {
                        acc.Last_Call_Activity__c = accMap.get(acc.id);
                        accUpdateList.add(acc);
                    }
                    if(accUpdateList.size()>0){
                        Database.update(accUpdateList,false);
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.debug(e.getMessage()+'@'+e.getLineNumber());
        }
    }
}