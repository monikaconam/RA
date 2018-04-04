/**
@Name            : TestLeadPartnerCategoryEditExtn
@Author          : Mk-Conam
@Date            : Nov 12  , 2015
@Description     : Test Class for AccountPartnerCategoryEditExtn
**/

@isTest

private class TestLeadPartnerCategoryEditExtn
{  
    static testMethod void unitTest()
    {
        Test.startTest();     
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;
        
        Campaign cmp = new campaign();
        cmp.Name = 'TestCamp';
        insert cmp;
        
        Lead led = new Lead();
        led.Company = 'Test Company1';
        led.FirstName='First Name1';
        led.LastName='Last Name1';
        led.LeadSource='Twitter';
        led.Status='Initial Call Made';
        insert led;
        
        CampaignMember newMember = new CampaignMember();
        newMember.campaignid=cmp.id;
        newMember.leadid=led.id;
        newMember.status='sent';
        insert newMember; 
        
        CampaignMember cmpM = [select LeadId from CampaignMember where Leadid =:led.Id Limit 1];
        
        PartnerCategoryLead__c pcObj=new PartnerCategoryLead__c();
        pcObj.Name='Leadant';
        insert pcObj; 
        
        pcObj=new PartnerCategoryLead__c();
        pcObj.Name='Agent/MLS-US';
        insert pcObj;
                
        pcObj=new PartnerCategoryLead__c();
        pcObj.Name='Franchise';
        insert pcObj; 
 
        Lead aTemp=[Select 
                                id, name
                       from
                                Lead
                       where 
                                Company ='Test Company1' Limit 1];
                                
        PageReference pPage=Page.AccountPartnerCategoryEdit;
        Test.setCurrentPage(pPage);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(aTemp);
        LeadPartnerCategoryEditExtn ctrl=new LeadPartnerCategoryEditExtn(sc);
        
        ApexPages.CurrentPage().getParameters().put('id',aTemp.id);
        ctrl=new LeadPartnerCategoryEditExtn(sc);
        ctrl.onSave();
        
        Partner_Category__c p1=new Partner_Category__c();
        p1.name='Leadant';
        p1.Partner_Lead__c=aTemp.id;
        p1.Sort_Order__c=1;
        insert p1;
        
        p1=new Partner_Category__c();
        p1.Partner_Lead__c=aTemp.id;
        p1.name='Franchise';
        p1.Sort_Order__c=1;
        insert p1;      
        
        ctrl=new LeadPartnerCategoryEditExtn(sc);
        ctrl.onSave();        
        
        String  message3 ='';
        message3+= 'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        ctrl.outputMessage =message3;
        
        String sTemp=ctrl.outputMessage;
        
        Test.stopTest();
        
    }
    
    static testMethod void unitTest2()
    {
        Test.startTest(); 
         
        Lead led = new Lead();     

        PageReference pPage=Page.LeadPartnerCategoryEdit;
        Test.setCurrentPage(pPage);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(led );
        LeadPartnerCategoryEditExtn ctrl=new LeadPartnerCategoryEditExtn(sc);
        ctrl.message ='TestMessage';
        ctrl.PrimaryMessage ='TestPrimary';
        ctrl.outputMessage ='';
        ctrl.led= ((Lead)new Lead());
        
        try
        {
            ctrl.onSave();
        }
        catch(Exception e)
        {
        }
        Test.stopTest();    
    } 
  
}