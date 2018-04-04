@isTest

private class TestLeadCloneController
{  
    static testMethod void unitTest1()
    {
        Test.startTest();     

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
        
        CampaignMember cmpM = [select LeadId from CampaignMember 
                               where Leadid =:led.Id AND CampaignId=:cmp.Id Limit 1];
        
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
                                
        PageReference pPage=Page.LeadCloneRedirection;
        Test.setCurrentPage(pPage);
        
        ApexPages.StandardController sc=new ApexPages.StandardController(aTemp);
        LeadCloneController ctrl=new LeadCloneController(sc);
        
        ApexPages.CurrentPage().getParameters().put('parentId',aTemp.id);
        ctrl=new LeadCloneController(sc);
        ctrl.onSave();
        ctrl.onCancel() ;
        
        Partner_Category__c p1=new Partner_Category__c();
        p1.name='Leadant';
        p1.Partner_Lead__c=aTemp.id;
        p1.Sort_Order__c= 0;
        insert p1;
        
        p1=new Partner_Category__c();
        p1.Partner_Lead__c=aTemp.id;
        p1.name='Franchise';
        p1.Sort_Order__c=0;
        insert p1;      
        
        PageReference pPage1=Page.LeadCloneRedirection;
        Test.setCurrentPage(pPage1);
        LeadCloneController ctrl3=new LeadCloneController(); 
        Id testId =Apexpages.currentPage().getParameters().get('aTemp');
        
        ctrl=new LeadCloneController(sc);
        ctrl.onCancel();     
        ctrl.rightOptionsHidden ='ValueCon';       
        
        Test.stopTest();        
    }   
    static testMethod void unitTest2()
    {
        Test.startTest();     
    
        Lead led = new Lead();
        led.Company = 'Test Company1';
        led.FirstName='First Name1';
        led.LastName='Last Name1';
        led.LeadSource='Twitter';
        led.Status='Initial Call Made';
        
        insert led;
        
        PartnerCategoryLead__c pcObj=new PartnerCategoryLead__c();
        pcObj.Name='Leadant';
        insert pcObj; 
        
        Partner_Category__c p1=new Partner_Category__c();
        p1.name='Leadant';
        p1.Partner_Lead__c=led.id;
        p1.Sort_Order__c=1;
        insert p1;
        
        Partner_Category__c pcc = new Partner_Category__c (Partner_Lead__c = led.Id); 
        
        PageReference pPage1=Page.LeadCloneRedirection;
        Test.setCurrentPage(pPage1); 
        
        ApexPages.currentPage().getParameters().put('parentId',led.Id);
        String id = ApexPages.currentPage().getParameters().get('parentId');        
        
        ApexPages.StandardController sc = new ApexPages.StandardController(led);
        LeadCloneController ac = new LeadCloneController (sc);
        
        system.assertNotEquals(true,Id==null);
        LeadCloneController acs = new LeadCloneController();
        acs.onSave();
        acs.onCancel();
        
        Test.stopTest();        
    } 
     static testMethod void unitTest3()
    {
        Test.startTest();     
    
        Lead led = new Lead();
        led.Company = 'Test Company1';
        led.FirstName='First Name1';
        led.LastName='Last Name1';
        led.LeadSource='Twitter';
        led.Status='Initial Call Made';
        insert led;
        
        campaign cm =new campaign ();
        cm.Name='TestCamp';
        insert cm; 
        
        CampaignMember cmem =new CampaignMember();     
        cmem.CampaignId = cm.id;
        cmem.LeadId= led.Id;
        cmem.Status ='TestStatus';
       insert cmem;
        
        PageReference pPage1=Page.LeadCloneRedirection;
        Test.setCurrentPage(pPage1); 
        
        ApexPages.currentPage().getParameters().put('parentId',led.Id);
        String id = ApexPages.currentPage().getParameters().get('parentId');        
        
        ApexPages.StandardController sc = new ApexPages.StandardController(led);
        LeadCloneController ac = new LeadCloneController (sc);
        
        system.assertNotEquals(true,Id==null);
        LeadCloneController acs = new LeadCloneController();
        acs.onCancel();
      //  acs.CampaignMember.campaignId=cm.id;
         try{
             acs.onSave();
             database.insert(cmem);
             String message='';
             integer sortOrderL = 0;
             System.debug('the Value is ##############'+ cmem); 
             System.assert(false, 'Exception expected');  
                   
         }
         catch(Exception e){
          System.debug('The following exception has occurred: ' + e.getMessage());
         }  
        
        Test.stopTest();        
    } 
        
        
 }