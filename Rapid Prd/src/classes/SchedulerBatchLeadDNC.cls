public class SchedulerBatchLeadDNC implements Schedulable 
{
public void execute(SchedulableContext  sc)
    {
        List<AsyncApexJob> a=[select id from asyncapexjob where apexclassid='01p39000000FAuv' and status='Processing' and ExtendedStatus='ConcurrentPerOrgApex Limit exceeded.' limit 100];
        for(AsyncApexJob at : a)
            System.abortJob(at.id);
        
        Integer bsize=Integer.valueOf(Limit_batch__c.getValues('BatchSize').Limit__c);
        Database.executeBatch(new BatchDNCScrubAllLead(), bsize);
        scheduleMe();
    }
    
    public static void scheduleMe()
    {
        Integer minu=Integer.valueOf(Limit_batch__c.getValues('TimeSched').Limit__c);
        Integer bsize=Integer.valueOf(Limit_batch__c.getValues('BatchSize14').Limit__c);
        DateTime dt=system.now().addMinutes(minu);
        String day = string.valueOf(dt.day());
        String month = string.valueOf(dt.month());
        String hour = string.valueOf(dt.hour());
        String minute = string.valueOf(dt.minute());
        String second = string.valueOf(dt.second());
        String year = string.valueOf(dt.year());
        
        String strJobName = 'DNC-'+year+ '-' +month+ '-' + day+' '+hour+':'+minute  ;
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        if(Test.isRunningTest())
            strJobName=strJobName +DateTime.now().getTime();
        Database.executeBatch(new BatchDNCScrubAllLead(),bsize);
        System.schedule(strJobName, strSchedule, new SchedulerBatchLeadDNC());
    }
}