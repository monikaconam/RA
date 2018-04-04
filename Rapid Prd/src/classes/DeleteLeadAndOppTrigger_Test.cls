@istest
public class DeleteLeadAndOppTrigger_Test
{

    public Static testmethod void deleteLead()
    {
        Test.startTest();
        try
        {
        CALC.ApexTesting();
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
        insert cTest;
        
        Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company',Phone='415789415',Lastname='lastname'
                           );
        insert lTest;
        
        CampaignMember newMember = new CampaignMember (campaignid=cTest.id, leadid=lTest.id);
        insert newMember;
        
        delete lTest;
        
        delete lTest;
        
        }
        catch(Exception e)
        {
            System.debug(e.getMessage() +'  '+ e.getLineNumber()+' '+ e.getStackTraceString());
            Boolean expectedExceptionThrown =  e.getMessage().contains('Delete failed') ? true : false;
            System.AssertEquals(expectedExceptionThrown, true);
        
        }
        Test.stopTest();
    }
    public Static testmethod void deleteOpp()
    {
        Test.startTest();
        try
        {
        CALC.ApexTesting();
        Campaign cTest=new Campaign(name='Test Campagin',type='Internet');
        insert cTest;
   
        Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company',Phone='415789415',Lastname='lastname'
                           );
        insert lTest;
        
        CampaignMember newMember = new CampaignMember (campaignid=cTest.id, leadid=lTest.id);
        insert newMember;
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(lTest.id);
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
       // Database.LeadConvertResult lcr = Database.convertLead(lc);
        
        Lead lQuery=[select ConvertedOpportunityId from lead where id=:lTest.id limit 1];
        
        Opportunity oppQuery=[select id, state_of_location__C,name ,Percent_Paid_Off__c,accountid from opportunity where id=: lQuery.ConvertedOpportunityId limit 1];
        oppQuery.Percent_Paid_Off__c=51;
        oppQuery.state_of_location__C='CT';
        oppQuery.StageName='C-1 Contract Signed - More Info Needed';
        
        update oppQuery;
        delete oppQuery;
       
        }
        catch(Exception e)
        {
            System.debug(e.getMessage() +'  '+ e.getLineNumber()+' '+ e.getStackTraceString());
           
            
        
        }
        Test.stopTest();
    }
    
    
   public Static testmethod void dedupeOpportunity()
    { 
        CALC.ApexTesting();
        List<opportunity> oppList=new List<opportunity>();
        Account acc=new Account();
        acc.name='test';
        acc.recordtypeid='0125000000099ajAAA';
        acc.BusinessType__c='Small Business';
        acc.FederalTaxID__c='123457896';
        acc.Owned_Business_Since__c=System.today().addYears(-10);
        acc.DateBusinessStarted__c=System.today().addYears(-10);
        insert acc;
        
        Contact con=new Contact();
        con.lastname='test name';
        con.accountID=acc.id;
        con.Principal_1_State__c ='CT';
        con.Principal_1_Street_Address__c ='123';
        con.Principal_1_City__c='Stamford';
        con.Principal_1_Zip__c='06901';
        con.SS__c='1234567890';
        insert con;
        
        Opportunity opp=new Opportunity();
        opp.name='testopp';
        opp.StageName = 'Open';
        opp.CloseDate = Date.today();
        opp.Submit_to_UW_Processing__c=System.now();
        opp.accountid=acc.id;
        opp.Product__c='Loan';
        opp.Percent_Paid_Off__c=55;
        opp.State_Of_Location__c='CT';
        //insert opp;
        
        Opportunity opp1=new Opportunity();
        opp1.name='testopp1';
        opp1.StageName = 'Open';
        opp1.CloseDate = Date.today();
        opp1.Submit_to_UW_Processing__c=System.now();
        opp1.accountid=acc.id;
        opp1.Product__c='Loan';
        opp1.Percent_Paid_Off__c=55;
        opp1.State_Of_Location__c='CT';
       
        
        Opportunity opp2=new Opportunity();
        opp2.name='testopp1';
        opp2.StageName = 'Open';
        opp2.CloseDate = Date.today();
        opp2.Submit_to_UW_Processing__c=System.now();
        opp2.accountid=acc.id;
        opp2.Product__c='Loan';
        opp2.Percent_Paid_Off__c=55;
        opp2.State_Of_Location__c='CT';
        
        
        
        
        Opportunity opp3=new Opportunity();
        opp3.name='testopp';
        opp3.StageName = 'Open';
        opp3.CloseDate = Date.today();
        opp3.Submit_to_UW_Processing__c=System.now();
        opp3.accountid=acc.id;
        opp3.Product__c='Loan';
        opp3.Percent_Paid_Off__c=55;
        opp3.State_Of_Location__c='CT';
        
        
        
        Account accnew=new Account();
        accnew.name='test2';
        accnew.recordtypeid='0125000000099ajAAA';
        accnew.BusinessType__c='Small Business';
        accnew.FederalTaxID__c='123457896';
        accnew.Owned_Business_Since__c=System.today().addYears(-10);
        accnew.DateBusinessStarted__c=System.today().addYears(-10);
        insert accnew;
        
        Contact connew=new Contact();
        connew.lastname='test name2';
        connew.accountID=accnew.id;
        connew.Principal_1_State__c ='CT';
        connew.Principal_1_Street_Address__c ='123';
        connew.Principal_1_City__c='Stamford';
        connew.Principal_1_Zip__c='06901';
        connew.SS__c='1234567890';
        insert connew;
        
        Opportunity opp4=new Opportunity();
        opp4.name='testopp';
        opp4.StageName = 'Open';
        opp4.CloseDate = Date.today();
        opp4.Submit_to_UW_Processing__c=System.now();
        opp4.accountid=accnew.id;
        opp4.Product__c='Loan';
        opp4.Percent_Paid_Off__c=55;
        opp4.State_Of_Location__c='CT';
        
        sYSTEM.DEBUG('TEST1');
        oppList.add(opp1);
        oppList.add(opp2);
        oppList.add(opp3);
        oppList.add(opp4);
                sYSTEM.DEBUG('TEST2');
                sYSTEM.DEBUG('oppList '+oppList);
        insert oppList;

    }
}