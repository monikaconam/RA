@isTest
public class TestCategoryLeadContoller
{
    private static testMethod void unitTest1()
    {
        Test.startTest();      
        
        Lead lTemp = new lead();
        lTemp.lastname= 'Test Account1';
        lTemp.company= 'testBusiness';
        lTemp.LeadSource='Partner';
        lTemp.Phone='2200000000';
        insert lTemp;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        insert cm;    
       
        PartnerCategoryLead__c pca = new PartnerCategoryLead__c();
        pca.Name ='Test';
        insert pca;
               
        ApexPages.StandardController sc = new ApexPages.StandardController(lTemp);        
        PageReference P=Page.CategoryLead;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', lTemp.Id);
        //ApexPages.currentPage().getParameters().put('accId', lTemp.Id);
        
        CategoryLeadContoller cpObj = new CategoryLeadContoller (sc);
        cpObj.outputMessage ='A.....Z';
        cpObj.Message ='TestMessage';
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage';
        Test.stopTest();
    }
    
    private static testMethod void unitTest2()
    {
        Test.startTest();      
        
        Lead lTemp = new lead();
        lTemp.lastname= 'Test Account1';
        lTemp.company= 'testBusiness';
        lTemp.LeadSource='Partner';
        lTemp.Phone='2200000000';
        insert lTemp;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        cm.Partner_Lead__c = lTemp.Id;
        insert cm;        
       
        PartnerCategoryLead__c pca = new PartnerCategoryLead__c();
        pca.Name ='Test';
        insert pca;
               
        ApexPages.StandardController sc = new ApexPages.StandardController(lTemp);        
        PageReference P=Page.PartnerCategoryLead;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', lTemp.Id);

        
        CategoryLeadContoller cpObj = new CategoryLeadContoller (sc);
        cpObj.outputMessage ='';
        cpObj.Message ='TestMessage2';
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage2';
        Test.stopTest();
    }    
    
    private static testMethod void unitTest3()
    {
        Test.startTest();      
        
        Lead lTemp = new lead();
        lTemp.lastname= 'Test Account1';
        lTemp.company= 'testBusiness';
        lTemp.LeadSource='Partner';
        lTemp.Phone='2200000000';
        insert lTemp;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        cm.Partner_Lead__c = lTemp.Id;
        insert cm;        
       
        PartnerCategoryLead__c pca = new PartnerCategoryLead__c();
        pca.Name ='Test';        
        insert pca;
        
        String  message3 ='';
        message3+= 'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
               
        ApexPages.StandardController sc = new ApexPages.StandardController(lTemp);        
        PageReference P=Page.PartnerCategoryAccount;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', null);
        //ApexPages.currentPage().getParameters().put('accId', acc.Id);
        
        CategoryLeadContoller cpObj = new CategoryLeadContoller (sc);
        cpObj.outputMessage =Message3;
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage2';
        Test.stopTest();
    }  
 }