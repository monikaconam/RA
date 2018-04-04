@isTest

private class TestMasterTaskTrigger 
{
    public static testmethod void checkExecution1()
    {         
        test.startTest();  
              
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
        insert cTest;
        
        Five9Task2LeadMappings__c newRecord=new Five9Task2LeadMappings__c();
        newRecord.Five9Disposition__c ='No Contact - No Voicemail Left';
        newRecord.LeadStatus__c='Calling - No Contact Made';
        newRecord.name='24';
        insert newRecord;
        
        
        Five9Task2LeadMappings__c newRecord2=new Five9Task2LeadMappings__c();
        newRecord2.Five9Disposition__c ='Awaiting Statements - Left Voicemail';
        newRecord2.LeadStatus__c='In Progress - Awaiting Statements';
        newRecord2.name='25';
        insert newRecord2;
        
        Five9Task2LeadMappings__c newRecord3=new Five9Task2LeadMappings__c();
        newRecord3.Five9Disposition__c ='Unqualified - Time in Biz';
        newRecord3.LeadStatus__c='Unqualified *(Less thank 1 year)';
        newRecord3.UnqualifiedReason__c='Less than 1 Year';
        newRecord3.name='26';
        insert newRecord3;
 
        Lead lTest=new Lead();        
        lTest.LeadSource='Partner-Web';
        lTest.Company='test company';
        lTest.Phone='415789415';
        lTest.Lastname='lastname';
        lTest.Campaign_Name_Upload__c=cTest.id;     
        insert lTest;
        
        Task newTask=new Task();
        newTask.whoid=lTest.id;
        newTask.Subject='test call';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        newTask.Five9__Five9CallType__c='Agent';
        insert newTask;
        
       /* Task newTask2=new Task();
        newTask2.whoid=lTest.id;
        newTask2.Subject='test call';
        newTask2.CallDisposition='Unqualified - Time in Biz';
        newTask2.Five9__Five9CallType__c='Agent';
        insert newTask2;*/
        
        List<Task> newTaskUp=[SELECT 
                                    CallDisposition 
                                FROM 
                                    Task 
                                WHERE 
                                    Id =: newTask.id];
        if(newTaskUp.size()>0)
        {
            newTaskUp[0].CallDisposition='Awaiting Statements - Left Voicemail';
            update newTaskUp;            
        }        
        
        delete newTask;        
        try
        {
            delete newTask;
        }        
        catch(Exception e)
        {
            System.debug(e.getMessage());
            System.assertEquals(e.getMessage().contains('Delete failed'), true);
        }
        test.StopTest();       
    }    
    
    public static testmethod void checkExecution2()
    {         
        test.startTest();  
              
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
        insert cTest;
        
        Five9Task2LeadMappings__c newRecord=new Five9Task2LeadMappings__c();
        newRecord.Five9Disposition__c ='No Contact - No Voicemail Left';
        newRecord.LeadStatus__c='Calling - No Contact Made';
        newRecord.name='TestName1';
        insert newRecord;
        
        
        Five9Task2LeadMappings__c newRecord2=new Five9Task2LeadMappings__c();
        newRecord2.Five9Disposition__c ='Awaiting Statements - Left Voicemail';
        newRecord2.LeadStatus__c='In Progress - Awaiting Statements';
        newRecord2.name='TestName2';
        insert newRecord2;
        
        Five9Task2LeadMappings__c newRecord3=new Five9Task2LeadMappings__c();
        newRecord3.Five9Disposition__c ='Unqualified - Time in Biz';
        newRecord3.LeadStatus__c='Unqualified *(Less thank 1 year)';
        newRecord3.UnqualifiedReason__c='Less than 1 Year';
        newRecord3.name='TestName3';
        insert newRecord3;
 
        Lead lTest=new Lead();        
        lTest.LeadSource='Partner-Web';
        lTest.Company='test company';
        lTest.Phone='415789415';
        lTest.Lastname='lastname';
        lTest.Campaign_Name_Upload__c=cTest.id;     
        insert lTest;
        
        Task newTask=new Task();
        newTask.whoid=lTest.id;
        newTask.Subject='test call';
        newTask.CallDisposition='No Contact - No Voicemail Left';
        newTask.Five9__Five9CallType__c='Agent';
        insert newTask;
        
        /*Task newTask2=new Task();
        newTask2.whoid=lTest.id;
        newTask2.Subject='test call';
        newTask2.CallDisposition='Unqualified - Time in Biz';
        newTask2.Five9__Five9CallType__c='Agent';
        insert newTask2;*/
        
        lTest.LastName = 'TestName';
        update lTest;
        
        List<Task> newTaskUp=[SELECT 
                                    CallDisposition 
                                FROM 
                                    Task 
                                WHERE 
                                    Id =: newTask.id];
        if(newTaskUp.size()>0)
        {
            newTaskUp[0].CallDisposition='No Contact - No Voicemail Left';
            update newTaskUp;            
        }        
        
        delete newTask;        
        try
        {
            undelete newTask;
        }        
        catch(Exception e)
        {
            System.debug(e.getMessage());
            System.assertEquals(e.getMessage().contains('Delete failed'), true);
        }
        test.StopTest();        
    }   
 }