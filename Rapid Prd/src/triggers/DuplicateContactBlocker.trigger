trigger DuplicateContactBlocker on Contact (before insert) {
    List<Contact> contacts=new List<Contact>();
   for (Contact c : Trigger.new){
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
        if(c.Email <> null && c.Email <> ''){
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
      
      
      if(((c.LastName!=null)&&(c.LastName!=''))&&(c.accountid!=null))
      {
        contacts = Database.query(theQuery);
      }
      
     if (contacts.isEmpty() == false) {
          c.LastName.addError('Contact cannot be created - Contact already exists');
      }    
   }
}