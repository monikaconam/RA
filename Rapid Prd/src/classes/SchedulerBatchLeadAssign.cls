/*
@Name            : BatchLeadAssign 
@Author          : MK-Conam
@Date            : Aug 12  , 2015
@Description     : This class is the scheduler for BatchLeadAssign and will execute on hourly basis from the time it has been scheduled 
*/
global class SchedulerBatchLeadAssign implements Schedulable 
{
    //static String sch =  '0 0 * * * ?';
    global void execute(SchedulableContext sc) {
        BatchLeadAssign bla = new BatchLeadAssign();
        Integer bSize = 500;
        Database.executeBatch(bla, bSize);
        
        DateTime now=System.now();
        DateTime nextRun=now.addMinutes(60);
        
        //String strJobName = 'Transfer Leads for Calling - ' + now.year()+ '-' + now.month()+ '-' + now.day()+ ' ' + now.hour()+ ':' + now.minute()+ ':'+now.second();
        String strJobName = 'Transfer Leads for Calling - '+now.format('yyyy-MM-dd HH:mm:ss');
        String strSchedule= '' +nextRun.second()+ ' ' +nextRun.minute()+ ' ' +nextRun.hour()+ ' ' +nextRun.day()+ ' ' +nextRun.month() + ' ? ' + nextRun.year(); 
        System.schedule(strJobName, strSchedule, new SchedulerBatchLeadAssign());

    }

    global static String scheduleMethod() {
        SchedulerBatchLeadAssign SC = new SchedulerBatchLeadAssign();
        DateTime now=System.now();
        DateTime nextRun=now.addMinutes(60);
        
        String strSchedule= '' +nextRun.second()+ ' ' +nextRun.minute()+ ' ' +nextRun.hour()+ ' ' +nextRun.day()+ ' ' +nextRun.month() + ' ? ' + nextRun.year(); 
        
       // String strJobName = 'Transfer Leads for Calling - ' + now.year()+ '-' + now.month()+ '-' + now.day()+ ' ' + now.hour()+ ':' + now.minute()+ ':'+now.second();
        String strJobName = Test.isRunningTest() ? 'Transfer test Leads for Calling - '+now.format('yyyy-MM-dd HH:mm:ss') : 'Transfer Leads for Calling - '+now.format('yyyy-MM-dd HH:mm:ss');
        return System.schedule(strJobName, strSchedule, sc);
    }
    
}