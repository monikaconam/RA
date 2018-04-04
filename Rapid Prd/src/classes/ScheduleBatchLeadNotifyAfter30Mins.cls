/*

@Name            : ScheduleBatchLeadNotifyAfter30Mins  
@Author          : DS-Conam
@Date            : Oct 28, 2015
@Description     : This class is the scheduler for BatchLeadNotificationAfter30Mins. The batch will be scheduled to execute from
                   9AM - 7 PM every other minute from Monday to Friday. 
*/

global class ScheduleBatchLeadNotifyAfter30Mins  implements Schedulable 
{
    global static dateTime dTest;
    
    global void execute(SchedulableContext sc)
    {
        List<String> retVal=new List<String>();
        BatchLeadNotificationAfter30Mins blna30 = new BatchLeadNotificationAfter30Mins();
        Integer bSize = 1500;
        
        Database.executeBatch(blna30 , bSize);
        
        if(Test.isRunningTest()){
            DateTime now=dTest;
            DateTime nextRun=now.addMinutes(1);
            retVal=generateSchedule(nextRun, nextRun.minute());
            System.debug('XXXXXXXXXX 2 '+retVal[0]);
            System.debug('XXXXXXXXXX 2 '+retVal[1]);
        }
        else{
            DateTime now=System.now();
            DateTime nextRun=now.addMinutes(1);
            retVal=generateSchedule(nextRun, nextRun.minute());
            System.debug('XXXXXXXXXX 222** '+retVal[0]);
            System.debug('XXXXXXXXXX 2222**'+retVal[1]);
        }
        
        
        String jobName='';
        
        jobName=Test.isRunningTest() ? retVal[1]+' ' +System.now().millisecond() :  retVal[1];
        System.debug('XXXXXXXXXXXXXXXXXXXXXXX '+ jobName);
        System.schedule(jobName, retVal[0], new ScheduleBatchLeadNotifyAfter30Mins());

    }

    global static String scheduleMethod(DateTime t)
    {
        dTest = t;
        Integer min;
        
        ScheduleBatchLeadNotifyAfter30Mins sbatch = new ScheduleBatchLeadNotifyAfter30Mins();
        
        System.debug('dTest'+dTest);
        String strSchedule;
        List<String> retVal=new List<String>();
        
        //DateTime now=System.now();   
        DateTime now=dTest;       
        
        System.debug(' now ' +now.hour());
        System.debug('min i ' +min);
        
        if(now.minute()>=50)
            min=now.addMinutes(2).minute();
        else
            min=now.addMinutes(5).minute();

        retVal=generateSchedule(now, min);
        
        System.debug('XXXXXXXXXX 0 '+retVal[0]);
        System.debug('XXXXXXXXXX 1 '+retVal[1]);

        return System.schedule(retVal[1], retVal[0], sbatch );
    }
    
    
    private static List<String> generateSchedule(DateTime dNow ,Integer min)
    {
        /* This method will return 2 strings - the cron job expression and the second one would be the Job name the (0) index
           will contain the cron expression and the  index 1 will contain the string message
        */
        DateTime now=dNow; 
        List<String> result=new List<String>();
        String strSchedule;
        
        Set<String> executeOnDays=new Set<String>();
        executeOnDays.add('MON');
        executeOnDays.add('TUE');
        executeOnDays.add('WED');
        executeOnDays.add('THU');
        executeOnDays.add('FRI');
        
        String wMin=String.valueOf(min);
        String wHour='';
        String wDay='';
        String wMonth='';
        String wYear='';
        
        Integer startHour=9;
        Integer endHour=19;
        System.debug('now.hour()'+now.hour());
        if(now.hour()<startHour)
        {
            if(executeOnDays.contains(now.format('EEE').toUpperCase()))
            {
               System.debug('>>>>>1');
               strSchedule= '0 0 '+startHour+' '+ now.day()+' '+ now.month()+' ? ' +now.year();
               wHour=String.valueOf(startHour);
               wMin='0';
               wDay=String.valueOf(now.day());
               wMonth=String.valueOf(now.month());
               wYear=String.valueOf(now.year());
            }
            else
            {
                System.debug('>>>>>1.1'+now.format('EEE').toUpperCase());
                if(now.format('EEE').toUpperCase()=='SAT')
                {
                    DateTime nNow=System.now().addDays(2);
                    strSchedule= '0 0 '+startHour+' '+ nNow.day()+' '+ nNow.month()+' ? ' +nNow.year();  
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year());
                }
                if(now.format('EEE').toUpperCase()=='SUN')
                {
                    DateTime nNow=System.now().addDays(1);
                    strSchedule= '0 0 '+startHour+' '+ nNow.day()+' '+ nNow.month()+' ? ' +nNow.year();
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year());
                }
            }
        }
        else if(now.hour()>=startHour && now.hour()<endHour)
        {
            System.debug('>>>>>2');
            System.debug('executeOnDays.contains(now.format(EEE) )   '+executeOnDays.contains(now.format('EEE').toUpperCase()));
            System.debug('now.format(EEE) '+now.format('EEE'));
            if(executeOnDays.contains(now.format('EEE').toUpperCase()))
            {
               System.debug('>>>>>2.1');
               strSchedule= '0 '+min+' ' +now.hour() +' '+ now.day()+' '+ now.month()+' ? ' +now.year(); 
               wHour=String.valueOf(now.addhours(1).hour());
               wMin=String.valueOf(min);
               wDay=String.valueOf(now.day());
               wMonth=String.valueOf(now.month());
               wYear=String.valueOf(now.year()); 
            }
            else
            {
                System.debug('>>>>>2.2');
                if(now.format('EEE').toUpperCase()=='SAT')
                {
                    DateTime nNow=System.now().addDays(2); 
                    strSchedule= '0 0 '+startHour+' '+ nNow.day()+' '+ nNow.month()+' ? ' +nNow.year();
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year());    
                }
                
                if(now.format('EEE').toUpperCase()=='SUN')
                {
                    DateTime nNow=System.now().addDays(1); 
                    strSchedule= '0 0 '+startHour+' '+ nNow.day()+' '+ nNow.month()+' ? ' +nNow.year();
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year()); 
                }
            }
        }
        else if (now.hour()>=endHour)
        {   
            DateTime nnNow=now.addDays(1); 
            System.debug('executeOnDays.contains(nnNow.format(EEE) )   '+executeOnDays.contains(nnNow.format('EEE').toUpperCase()));
            System.debug('nnNow.format(EEE) '+nnNow.format('EEE'));
           
            if(executeOnDays.contains(nnNow.format('EEE').toUpperCase()))
            {
                System.debug('>>>>>3.1');
                strSchedule= '0 0 '+startHour+' '+ nnNow.day()+' '+ nnNow.month()+' ? ' +nnNow.year(); 
                wHour=String.valueOf(startHour);
                wMin='0';
                wDay=String.valueOf(nnNow.day());
                wMonth=String.valueOf(nnNow.month());
                wYear=String.valueOf(nnNow.year());  
            }
            else
            {
                System.debug('>>>>>3.2');
                if(nnNow.format('EEE').toUpperCase()=='SAT')
                {
                    DateTime nNow=nnNow.addDays(2);
                    strSchedule= '0 0 '+startHour+' '+ nNow.day()+' '+ nNow.month()+' ? ' +nNow.year();  
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year()); 
                }
                
                if(nnNow.format('EEE').toUpperCase()=='SUN')
                {
                    DateTime nNow=nnNow.addDays(1);
                    strSchedule= '0 0 '+startHour+' '+nNow.day()+' '+ nNow.month()+' ? ' +nNow.year(); 
                    wHour=String.valueOf(startHour);
                    wMin='0';
                    wDay=String.valueOf(nNow.day());
                    wMonth=String.valueOf(nNow.month());
                    wYear=String.valueOf(nNow.year());  
                }
            }
        
        }
        
        System.debug(wYear +' /// '+wMonth+' /// '+wDay+' /// '+wHour+' /// '+wMin+' /// '+0);
        DateTime messageDT=Datetime.newInstance(Integer.valueOf(wYear),Integer.valueOf(wMonth),Integer.valueOf(wDay),
                                                Integer.valueOf(wHour), Integer.valueOf(wMin) , 0);
        String strJobName = 'Leads Notification for 30 mins scheduled at - '+System.now();
        
        result.add(strSchedule);
        result.add(strJobName) ;
        
        return result;
    }
    
}