public class BatchUpdtOppWithLstFive9CallDetails implements Database.Batchable<SObject>
{

    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query='Select id,Last_Call_Activity__c,StageName from Opportunity where CreatedDate= LAST_N_DAYS:365 and (StageName!= \'Closed Won\' and StageName != \'Closed Lost\')';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc , List<Opportunity> scope)
    {
        List<Opportunity> lstOpportunity =  new List<Opportunity>();
        Set<Id> oppIds =new Set<Id>();
        for(Opportunity oppTmp : scope)
        {
            oppIds.add(oppTmp.id);
        }
        List<Opportunity> lsOpp = [Select id,Last_Call_Activity__c,(Select id,subject,Five9_start_time__c  from Tasks order by CreatedDate desc) from Opportunity where Id in :oppIds];
        for(Opportunity oppTemp : lsOpp){
            Datetime lastCallActivityDate = null;
            for(Task tsk : oppTemp.Tasks){
                system.debug(oppTemp.Tasks);
                 if(tsk.subject.tolowercase().contains('call') && tsk.Five9_start_time__c!=null && lastCallActivityDate == null)
                 {
                    lastCallActivityDate = tsk.Five9_start_time__c;
                 }
            }
            oppTemp.Last_Call_Activity__c = lastCallActivityDate ;
            lstOpportunity.add(oppTemp);
        }
        if(lstOpportunity.size()>0){
           update lstOpportunity;
        }
    }
    
    public void finish(Database.BatchableContext bc)
    {
    }
}