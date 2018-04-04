/**
@Name            : TestMasterTaskTrigger
@Author          : DS CONAM
@Date            : Sept 21 2016
@Description     : Test class for 'BatchLeadProsContact' Batch Class and 'LeadProspectContactedHandler' Handler
**/
@isTest

private class TestMasterTaskTrigger2 
{
    static testmethod void UpdateLeadProspectContacted() {
        Test.startTest();  
        try{
            Lead ld=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=false);
            insert ld;  
            
            Task newTask=new Task();
            newTask.whoid=ld.id;
            newTask.Subject='test call';
            newTask.CallDurationinSeconds= 90;            
            insert newTask;
            
            newTask.CallDurationinSeconds= 120;
            update newTask;
            
            Lead ld1=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=True);
            insert ld1;
            
            Task newTask1=new Task();
            newTask1.whoid=ld1.id;
            newTask1.Subject='test call';
            newTask1.CallDurationinSeconds= 90;            
            insert newTask1;
            
            //System.assertEquals(true, [Select Prospect_Contacted__c FROM Lead where id= :ld.id][0].Prospect_Contacted__c);
            //System.assertEquals(true, [Select Prospect_Contacted__c FROM Lead where id= :ld1.id][1].Prospect_Contacted__c);
        }        
        catch(Exception e)
        {
            System.debug(e.getMessage());
        }
             
        Test.stopTest();
    }
    static testmethod void BatchLeadProsContact () {
        Test.startTest();
        try{ 
            Lead ld=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=false);
            insert ld;  
            
            Task newTask=new Task();
            newTask.whoid=ld.id;
            newTask.Subject='test call';
            newTask.CallDurationinSeconds= 90;
            insert newTask;    
            
            //System.assertEquals(true, [Select Prospect_Contacted__c FROM Lead where id= :ld.id][0].Prospect_Contacted__c);
            
            ld.Prospect_Contacted__c=False;//to nullify the trigger effect
            Update ld;
           
            
            Lead ld1=new Lead(LastName='Doe1',FirstName='John1',Company='Test1',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=True);
            insert ld1;
            
            Task newTask1=new Task();
            newTask1.whoid=ld1.id;
            newTask1.Subject='test call';
            newTask1.CallDurationinSeconds= 90;            
            insert newTask1;
                
            BatchLeadProsContact  objTest = new BatchLeadProsContact();
            Database.executebatch(objTest);
            
           
            System.assertEquals(true, [Select Prospect_Contacted__c FROM Lead where id= :ld1.id][1].Prospect_Contacted__c);
        }
        catch(Exception e)
        {
            System.debug(e.getMessage());
        }
          
        Test.stopTest();
    }
 }