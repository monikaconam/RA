@isTest
Public class TestPopulateLeadOppNumHandler
{
    static testmethod void TestPopulateLeadOppNumMethod() {
        
        try{
            Lead ld=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=false);
            insert ld; 
            
            Lead ld2=new Lead(LastName='TestDoe',FirstName='TestJohn',Company='Test',Status='Initial Call Needed',LeadSource='Referral',Prospect_Contacted__c=false);
            insert ld2; 
            
            Account Acc = new Account();
            Acc.name = 'Test Account1';
            Acc.BusinessType__c = 'testBusibess';
            insert Acc;
        
            Campaign cam = new Campaign();
            cam.Name = 'Test';
            cam.Type='Internet';
            insert cam ;
        
            Opportunity opp = new Opportunity();
            opp.Name = 'testOpportunity';
            opp.LeadSource = 'web';
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today() + 20;
            opp.CampaignId = cam.Id;
            opp.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp.CloseDate = System.today() + 50;
            opp.AccountId = acc.id;
            insert opp;
            
            Opportunity opp2 = new Opportunity();
            opp2.Name = 'testOpportunity2';
            opp2.LeadSource = 'web';
            opp2.StageName = 'Prospecting';
            opp2.CloseDate = System.today() + 20;
            opp2.CampaignId = cam.Id;
            opp2.Current_Processor__c = 'Abanco INTERNATIONAL';
            opp2.CloseDate = System.today() + 50;
            opp2.AccountId = acc.id;
            insert opp2;
            
            Task newTask=new Task();
            newTask.whoid=ld.id;
            newTask.Subject='test call';
            newTask.CallDurationinSeconds= 90;            
            insert newTask;
            
            newTask.whoid=ld2.id;
            update newTask;
            
            Task newTask1=new Task();
            newTask1.whoid=ld.id;
            newTask1.whatid=opp.id;
            newTask1.Subject='test call';
            newTask1.CallDurationinSeconds= 90;            
            insert newTask1;
            
            newTask1.whatid=opp2.id;
            update newTask1;
        }        
        catch(Exception e)
        {
            System.debug(e.getMessage());
        }
    }
}