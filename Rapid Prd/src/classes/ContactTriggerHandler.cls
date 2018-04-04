/**
@Name            : ContactTriggerHandler
@Author          : MK-Conam
@Date            : Aug 24  , 2015
@Description     : Handler Class for Contact Triggers
**/

public with sharing class ContactTriggerHandler
{
    /*
    public static void biDuplicateContactBlocker(list<Contact>listCon)  
    {
        List<Contact> contacts=new List<Contact>();
        List<Duplicate_Contact_Blocker_Setup__c> dcbs = [SELECT 
                                                                    Id, Name, Match_Phone__c, Match_Last_Name__c,
                                                                    Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                         FROM 
                                                                    Duplicate_Contact_Blocker_Setup__c];
        for (Contact con : listCon)
        {
            Duplicate_Contact_Blocker_Setup__c setup;
            
            if (dcbs.isEmpty()) 
            {
                Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();                
                newDCBS.Name = 'Duplicate Criteria';
                newDCBS.Match_First_Name__c = true;
                newDCBS.Match_Last_Name__c = true;
                newDCBS.Match_Email__c = false;
                newDCBS.Match_Phone__c = false;
                newDCBS.Match_Account_Name__c = false;
                    
                insert newDCBS;        
                setup = newDCBS;                 
            }            
            else 
            {
                setup = dcbs[0];
            }
            
            String theQuery = 'SELECT Id FROM Contact WHERE ';
            List<String>params = new List<String>();                  
            if (setup.Match_First_Name__c) 
            {
                String first=con.FirstName!=null ? String.escapeSingleQuotes(con.FirstName) : '';
                params.add('FirstName = \'' + first + '\'');
            }                        
            if (setup.Match_Last_Name__c)
            {
                if(con.LastName <> null && con.LastName <> '')
                {
                    String last = String.escapeSingleQuotes(con.LastName);   
                    //last = last.replace('\'', '\\\''); 
                    params.add('LastName = \'' + last + '\'');
                }
            } 
            
            if (setup.Match_Email__c) 
            {
                if(con.Email <> null && con.Email <> '')
                {
                    String emailTemp= String.escapeSingleQuotes(con.Email );
                    params.add('Email = \'' + emailTemp + '\'');
                }
            }
                      
            if (setup.Match_Phone__c) 
            {
                if(con.Phone <> null && con.Phone <> '')
                {
                    String phone = con.Phone;
                    params.add('Phone = \'' + phone + '\'');
                }
            }
  
            if (setup.Match_Account_Name__c) 
            {                           
                params.add('AccountId = \'' + con.AccountId + '\'');
            }
            if (params.isEmpty())
            {
                theQuery = 'SELECT Id FROM Contact';
            }
            else
            {
                for (String curString : params) 
                {
                    theQuery += curString + ' and ';  
                } 
                theQuery = theQuery.substring(0, theQuery.length() - 4);
            }                
            
            if(((con.LastName!=null)&&(con.LastName!=''))&&(con.accountid!=null))
            {
                contacts = Database.query(theQuery);
            }
            
            if (contacts.isEmpty() == false)
            {
                con.LastName.addError('Contact cannot be created - Contact already exists');
            }    
        }
    }
   */
    public static void aiContactAfterInsertTrigger(list<Contact>listCon) 
    {    
        List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
        List<String> lids = new List<String>();    
        for(Contact con: listCon)
        {        
            if(con.Created_By_Conversion__c <> null && con.Created_By_Conversion__c <> '')
            {          
               lids.add(con.Created_By_Conversion__c);          
            }
        }       
        Map<id, Opportunity> oppMap = new Map<id, Opportunity>([SELECT 
                                                                        Id, Name 
                                                                    FROM 
                                                                        Opportunity
                                                                    WHERE 
                                                                        Id IN: lids]);      
        for(Contact con1: listCon)
        {        
            if(con1.Created_By_Conversion__c <> null && con1.Created_By_Conversion__c <> '')
            {          
                Opportunity opp = oppMap.get(con1.Created_By_Conversion__c);
                OpportunityContactRole oc = new OpportunityContactRole();
                oc.OpportunityId = opp.id;
                oc.ContactId = con1.id;
                oc.Role = 'Principal 2';                 
                ocrList.add(oc);          
            }
        }  
              
        if(!ocrList.IsEmpty())
        {
            try
            {
                Database.insert (ocrList,false);
            }
            catch (Exception ex) 
            {
                ocrList[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }   
    }
    
     public static void PreventDelete(list<Contact>listCon) 
     {    
        try
        {
            Id profileId=userinfo.getProfileId();
            String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
           
            if(profileName == 'Sales-Inside Sales Rep-Direct-Console'  || profileName == 'Sales - Inside Sales Rep. - Direct'){
                listCon[0].addError('you cant delete record');
            }
        }
         catch (Exception ex) 
        {
           
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'An exception occurred' + ex.getMessage()));
        }
     }
}