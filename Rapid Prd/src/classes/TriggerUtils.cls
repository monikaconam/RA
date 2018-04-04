/**
*********************************************************************************************************************
* Module Name   :  TriggerUtils
* Description   :  
* Throws        : <Any Exceptions/messages thrown by this class/triggers>
* Calls         : <Any classes/utilities called by this class | None if it does not call>
* Test Class    :  
* 
* Organization  : Rainmaker Associates LLC
*  
* Revision History:-
* Version  Date        	  Author      	   WO#         Description of Action
* 1.0      05/15/2013     Milligan                 		Initial Version
*   
*******************************************************************************************************************
**/ 
public with sharing class TriggerUtils {


	public boolean checkForContactDup(Contact c){
		
      Duplicate_Contact_Blocker_Setup__c setup;
      List<Duplicate_Contact_Blocker_Setup__c> dcbs = [select id, Name, Match_Phone__c, Match_Last_Name__c,
                                                              Match_First_Name__c, Match_Email__c, Match_Account_Name__c 
                                                       from Duplicate_Contact_Blocker_Setup__c];
   	  if (dcbs.isEmpty()) {
   	    Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();
   	  	newDCBS.Name = 'Duplicate Criteria';
   	  	newDCBS.Match_First_Name__c = true;
   	  	newDCBS.Match_Last_Name__c = true;
   	  	newDCBS.Match_Email__c = false;
   	  	newDCBS.Match_Phone__c = false;
   	  	newDCBS.Match_Account_Name__c = false;
        insert newDCBS;
        setup = newDCBS;
   	  } else {
   	    setup = dcbs[0];
   	  }
   	  String theQuery = 'select id from Contact where ';
   	  List<String>params = new List<String>();
      if (setup.Match_First_Name__c) {

   	  	params.add('FirstName = \'' + c.FirstName + '\'');
      }
   	  if (setup.Match_Last_Name__c) {
   	  	if(c.LastName <> null && c.LastName <> ''){
   	  		String last = c.LastName;	
   	    	last = last.replace('\'', '\\\''); 
   	  		params.add('LastName = \'' + last + '\'');
   	  	}
   	  } 
   	  
   	  if (setup.Match_Email__c) {
   	  	if(c.email <> null && c.email <> ''){
   	  		params.add('Email = \'' + c.Email + '\'');
   	  	}
   	  }
   	  
   	  if (setup.Match_Phone__c) {
   	  	if(c.Phone <> null && c.Phone <> ''){
   	  		String phone = c.Phone;
   	  		//phone = phone.replace('(', '');
   	  		//phone = phone.replace(')', '-');
   	  		//phone = phone.replace(' ', '');
   	  		params.add('Phone = \'' + phone + '\'');
   	  	}
   	  }
   	  if (setup.Match_Account_Name__c) {
   	  	params.add('AccountId = \'' + c.AccountId + '\'');
   	  }
   	  if (params.isEmpty()) {
   	  	theQuery = 'select id from Contact';
   	  } else {
   	  	for (String curString : params) {
   	  	  theQuery += curString + ' and ';	
   	  	} 
   	  	theQuery = theQuery.substring(0, theQuery.length() - 4);
   	  }
	  System.debug('Trigger.Utils -- the Query -->' + theQuery);
   	  
      List<Contact> contacts = Database.query(theQuery);
       
     if (contacts.size() > 0) { 
 	  	   System.debug('Trigger.Utils -- Contact size -->' + contacts.size());
           return false;
      }else{
      	   return true;
      }
	}
}