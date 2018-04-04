@isTest
public class TestCategoryAccountContoller
{
    private static testMethod void unitTest1()
    {
        Test.startTest();      
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        acc.Partner_Channel__c ='Partner';
        insert acc;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        insert cm;    
       
        PartnerCategoryAccount__c pca = new PartnerCategoryAccount__c();
        pca.Name ='Test';
        insert pca;
               
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);        
        PageReference P=Page.CategoryAccount;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', acc.Id);
        ApexPages.currentPage().getParameters().put('accId', acc.Id);
        
        CategoryAccountContoller cpObj = new CategoryAccountContoller(sc);
        cpObj.outputMessage ='A.....Z';
        cpObj.Message ='TestMessage';
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage';
        Test.stopTest();
    }
    
    private static testMethod void unitTest2()
    {
        Test.startTest();      
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        acc.Partner_Channel__c ='Partner';
        insert acc;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        cm.Partner_Account__c = acc.Id;
        insert cm;        
       
        PartnerCategoryAccount__c pca = new PartnerCategoryAccount__c();
        pca.Name ='Test';        
        insert pca;
               
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);        
        PageReference P=Page.PartnerCategoryAccount;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', acc.Id);
        ApexPages.currentPage().getParameters().put('accId', acc.Id);
        
        CategoryAccountContoller cpObj = new CategoryAccountContoller(sc);
        cpObj.outputMessage ='';
        cpObj.Message ='TestMessage2';
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage2';
        Test.stopTest();
    }    
    
    private static testMethod void unitTest3()
    {
        Test.startTest();      
        
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        acc.Partner_Channel__c ='Partner';
        // insert acc;
        
        Partner_Category__c cm = new Partner_Category__c();
        cm.Name = 'Test';
        cm.Partner_Account__c = acc.Id;
        insert cm;        
       
        PartnerCategoryAccount__c pca = new PartnerCategoryAccount__c();
        pca.Name ='Test';        
        insert pca;
        
        String  message3 ='';
        message3+= 'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
        message3+=  'TestStringMessage01212121212121212121212121212121212121212121212121212121212121212121212121';
               
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);        
        PageReference P=Page.PartnerCategoryAccount;
        Test.setCurrentPage(p);
        ApexPages.currentPage().getParameters().put('Id', acc.Id);
        ApexPages.currentPage().getParameters().put('accId', acc.Id);
        
        CategoryAccountContoller cpObj = new CategoryAccountContoller(sc);
        cpObj.outputMessage =Message3;
        cpObj.outputMessage.length();
        cpObj.PrimaryMessage ='TestPMessage2';
        Test.stopTest();
    }  
 }