@istest

private class Test_Utils
{
    static testMethod void unitTest()
    {
        DateTime dt=Datetime.newInstance(2015,09,25,18,0,0);
        Utils.AddWeekdays(dt,15);
        Utils.AddWeekdays1730(dt,15);
    }
    static testMethod void unitTest2()
    {
        DateTime dt1=Datetime.newInstance(2015,09,26,23,50,0);
        Utils.AddWeekdays(dt1,15);
        Utils.AddWeekdays1730(dt1,15);
        
        
    }
    static testMethod void unitTest3()
    {
        DateTime dt3=Datetime.newInstance(2015,09,29,18,0,0);
        Utils.AddWeekdays(dt3,15);
        Utils.AddWeekdays1730(dt3,15);
        Utils.ConvertDateTimeToDate(dt3);
    }
}