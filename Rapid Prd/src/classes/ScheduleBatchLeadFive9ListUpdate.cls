public class ScheduleBatchLeadFive9ListUpdate implements Schedulable 
{
    public void execute(SchedulableContext sc)
    {
        Database.executeBatch(new BatchLeadFive9ListUpdate(), 2000);
        scheduleMe();
    }
    
    public static void scheduleMe()
    {
        DateTime dt=system.now().addMinutes(1);
        String day = string.valueOf(dt.day());
        String month = string.valueOf(dt.month());
        String hour = string.valueOf(dt.hour());
        String minute = string.valueOf(dt.minute());
        String second = string.valueOf(dt.second());
        String year = string.valueOf(dt.year());
        

        String strJobName = 'BatchLeadFive9ListUpdate scheduled for-'+year+ '-' +month+ '-' + day+' '+hour+':'+minute  ;
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        if(Test.isRunningTest())
            strJobName=strJobName +DateTime.now().getTime();
        Database.executeBatch(new BatchLeadFive9ListUpdate(),2000);
        System.schedule(strJobName, strSchedule, new ScheduleBatchLeadFive9ListUpdate());
    }
}