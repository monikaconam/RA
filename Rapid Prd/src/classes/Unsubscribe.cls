Global class Unsubscribe implements Messaging.inboundEmailHandler
{
    Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                            Messaging.InboundEnvelope env ) 
    {
        // Create an inboundEmailResult object for returning 
        //the result of the Apex Email Service
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
         
        // Contact and Lead lists to hold all the updated records
        List<Contact> lc = new List <contact>();
        List<Lead> ll = new List <lead>();
         
        // Convert the subject line to lower case, so I can match on lower case
        String mySubject = email.subject.toLowerCase();
        // String I am searching for in the subject line
        String s = 'unsubscribe';
         
        // Check variable to see if the word "unsubscribe" was found in the subject line 
        Boolean unsubMe;
        // Look for the unsubcribe word in the subject line, 
        // if it is found return true, otherwise false is returned
        unsubMe = mySubject.contains(s);
 
        // If unsubscribe is found in the subject line enter the if statement 
        if (unsubMe == true) 
        {    
            try 
            {        
                // Lookup all contacts with a matching email address        
                for (Contact c : [SELECT 
                                        Id, Name, Email, HasOptedOutOfEmail
                                    FROM 
                                        Contact
                                    WHERE 
                                        Email = :env.FROMAddress
                                    AND 
                                        hasOptedOutOfEmail = false
                                    LIMIT 100]) 
                {                        
                    // Add all the contacts into the List   
                    c.hasOptedOutOfEmail = true;
                    lc.add(c);                                 
                }    
                // update all the Contact records        
                update lc;
            }
            catch (System.QueryException e) 
            {
                system.debug('Contact Query Issue: ' + e);
            }   

            try 
            {
                // Lookup all leads matching the email address
                for (Lead l : [SELECT 
                                    Id, Name, Email, HasOptedOutOfEmail
                                FROM 
                                    Lead
                                WHERE 
                                    Email = :env.FROMAddress
                                AND 
                                    isConverted = false
                                AND 
                                    hasOptedOutOfEmail = false
                                LIMIT 100]) 
                {
                    // Add all the leads to the List        
                    l.hasOptedOutOfEmail = true;
                    ll.add(l);                             
                }    
                // Update all Lead records in the query
                update ll;
            }
            catch (System.QueryException e) 
            {
                system.debug('Lead Query Issue: ' + e);
            }   
        } 
        else 
        {
            system.debug('No Unsuscribe word found in the subject line.' );
        }
        // Return true and exit
        // True will confirm it is complete and no bounced email 
        // should be send the sender of the unsubscribe request. 
        result.success = true;
        return result;
    }  

}