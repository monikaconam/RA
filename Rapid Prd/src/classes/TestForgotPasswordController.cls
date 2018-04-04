@isTest

public class TestForgotPasswordController
{ 
    public static testMethod void testForgotPassword() 
    {
        Test.startTest();
         PageReference pageRef = Page.ForgotPassword;      //Observe how we set the Page here
         Test.setCurrentPage(pageRef);         //Applying page context here
        // Instantiate a new controller with all parameters in the page
        
        ForgotPasswordController controller = new ForgotPasswordController();
        controller.username = 'test@salesforce.com';       
    
        System.assertEquals(controller.forgotPassword(),null); 
        SiteRegisterController srController = new SiteRegisterController();
        srController.username = 'test@force.com';
        srController.email = 'test@force.com';
        srController.communityNickname = 'test';
        srController.password = 'abcd1234';
        srController.confirmPassword = 'abcd123';
        srController.registerUser();
        
        controller.username = 'test@force.com'; 
        controller.forgotPassword();
        Test.stopTest();
    }
}