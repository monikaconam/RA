public class BatchUpdtConWithLstFive9CallDetails implements Database.Batchable<SObject>
{

    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query='Select id,Last_Call_Activity__c from  Contact where CreatedDate= LAST_N_DAYS:365';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc , List<Contact> scope)
    {
        List<Contact> lstContact =  new List<Contact>();
        Set<Id> conIds =new Set<Id>();
        for(Contact conTmp : scope)
        {
            conIds.add(conTmp.id);
        }
        List<Contact> lstCon = [Select id,Last_Call_Activity__c,(Select id,subject,Five9_start_time__c  from Tasks order by CreatedDate desc) from Contact where Id in :conIds];
        for(Contact conTemp : lstCon){
            Datetime lastCallActivityDate = null;
            for(Task tsk : conTemp.Tasks){
                 if(tsk.subject.tolowercase().contains('call') && tsk.Five9_start_time__c!=null && lastCallActivityDate == null)
                 {
                     lastCallActivityDate = tsk.Five9_start_time__c;
                 }
            }
            conTemp.Last_Call_Activity__c = lastCallActivityDate ;
            lstContact.add(conTemp);
        }
        if(lstContact.size()>0){
           update lstContact;
        }
    }
    
    public void finish(Database.BatchableContext bc)
    {
    }
}