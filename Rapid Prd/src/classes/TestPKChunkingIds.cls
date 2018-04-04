@isTest
private class TestPKChunkingIds
{
    static testmethod void unitTest()
    {
        Test.startTest();
        
        Lead lTest=new Lead();        
        lTest.LeadSource='Partner-Web';
        lTest.Company='test company';
        lTest.Phone='415789415';
        lTest.Lastname='lastname'; 
        insert lTest;
        
        Task newTask=new Task();
        newTask.whoid=lTest.id;
        newTask.Subject='test call';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        insert newTask;
        /*
        Task newTask2=new Task();
        newTask2.whoid=lTest.id;
        newTask2.Subject='test call';
        newTask2.CallDisposition='No Contact - No Voicemail Left';
        insert newTask2;
        */
        PageReference cPage=Page.AllTasks;
        
        ApexPages.StandardController sc=new ApexPages.StandardController(newTask);
        PKChunkingIDs pClass=new PKChunkingIDs(sc);
        PKChunkingIDs.queryChunk(newTask.id,newTask.id,true);
        Test.stopTest();
    }
}