/**
 * An apex page controller that exposes the site forgot password functionality
 */
public class ForgotPasswordController 
{
    public String username {get; set;}   
       
    public ForgotPasswordController() 
    {
    }    
    public PageReference forgotPassword() 
    {
        boolean success = Site.forgotPassword(username);
        /*	DS-CONAM
         * PageReference pr = Page.ForgotPasswordConfirm;
        	pr.setRedirect(true);
            if (success) 
            {              
                return pr;
            }
            return null;
		*/
        
        PageReference pr =(success) ? new PageReference('/apex/ForgotPasswordConfirm').setRedirect(true) : null;
        return pr;
    }

}