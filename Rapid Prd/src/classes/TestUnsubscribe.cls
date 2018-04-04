@isTest

public class TestUnsubscribe
{
    // Test method to ensure you have enough code coverage
    // Have created two methods, one that does the testing
    // with a valid "unsubcribe" in the subject line
    // and one the does not contain "unsubscribe" in the
    // subject line
    
    static testMethod void testUnsubscribe() 
    {

        // Create a new email and envelope object
        Test.startTest();
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env    = new Messaging.InboundEnvelope();
        
        // Create a new test Lead and insert it in the Test Method        
        Lead l = new lead(firstName='Rasmus', 
                            lastName='Mencke',
                            Company='Salesforce', 
                            Email='rmencke@salesforce.com', 
                            phone='111-111-1111',
                            HasOptedOutOfEmail=false);
        insert l;
        // Create a new test Contact and insert it in the Test Method  
        Contact c = new Contact(firstName='Rasmus', 
                                    lastName='Mencke', 
                                    Email='rmencke@salesforce.com', 
                                    phone='111-111-1111',
                                    HasOptedOutOfEmail=false);
        try
        {
            insert c;
        }
        catch(Exception e)
        {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Info,'An exception occurred');    
            ApexPages.addMessage(msg); 
        }  

        // test with subject that matches the unsubscribe statement
        email.subject = 'test unsubscribe test';
        env.fromAddress = 'rmencke@salesforce.com';

        // call the class and test it with the data in the testMethod
        unsubscribe unsubscribeObj = new unsubscribe();
        unsubscribeObj.handleInboundEmail(email, env ); 
        Test.stopTest();                       
    } 
    static testMethod void testUnsubscribe2() 
    {
        Test.startTest();
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Create a new test Lead and insert it in the Test Method        
        Lead l = new lead(firstName='Rasmus', 
                        lastName='Mencke',
                        Company='Salesforce', 
                        phone='111-111-1111',
                        Email='rmencke@salesforce.com', 
                        HasOptedOutOfEmail=false);
        insert l;

        // Create a new test Contact and insert it in the Test Method    
        Contact c = new Contact(firstName='Rasmus', 
                                lastName='Mencke', 
                                Email='rmencke@salesforce.com', 
                                phone='111-111-1111',
                                HasOptedOutOfEmail=false);
        try
        {
            insert c;
        }
        catch(Exception e)
        {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Info,'An exception occurred');    
            ApexPages.addMessage(msg); 
        }   
        // Test with a subject that does Not contain unsubscribe
        email.subject = 'test';
        env.fromAddress = 'rmencke@salesforce.com';

        // call the class and test it with the data in the testMethod
        unsubscribe unsubscribeObj = new unsubscribe();
        unsubscribeObj.handleInboundEmail(email, env ); 
        Test.stopTest();                     
   } 
}