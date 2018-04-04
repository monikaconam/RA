public with sharing class DuplicateCheck {

   public Set<String> toSearchPhone {get; set;}
   public Set<String> toSearchEmail {get; set;}
   public Set<String> checkUsers {get; set;}
   public Map<String,Id> Matched {get; set;}    // Map of the phone/email (key) and the Contact/Lead it maps to  
   public Map<Id,Id> Owners {get; set;}         // Map of the Contact/Lead (key) and the current Owner it maps to

   public DuplicateCheck() {   // Expose the Phone/Email to outside
      toSearchPhone = new Set<String>();
      toSearchEmail = new Set<String>();
      Matched = new Map<String,Id>();
      Owners = new Map<Id,Id>();
   }

   public List<Id> MatchingContacts() {   // Parse the values in Matched and return contacts
      List<String> buffer = Matched.values();
      List<Id> output = new List<Id>();
      for (String i : buffer) { if (i.substring(0, 3) == '003') { output.add(i); } }        
      return output;
   }

   public void doSearch() {   // Populates the maps based on the criteria in sets
      // Get a list of matching Contacts
      String contactQuery = 'SELECT Id,OwnerId,Phone,MobilePhone,Email FROM Contact WHERE ';
      if (toSearchPhone.size() > 0 && toSearchEmail.size() > 0) {
         contactQuery += 'Phone IN: toSearchPhone OR MobilePhone IN: toSearchPhone OR Email IN: toSearchEmail';
      }
      else if (toSearchPhone.size() > 0) {
         contactQuery += 'Phone IN: toSearchPhone OR MobilePhone IN: toSearchPhone';
      }
      else if (toSearchEmail.size() > 0) {
         contactQuery += 'Email IN: toSearchEmail';
      }
      else { contactQuery += 'CreatedDate = TODAY'; }
      //contactQuery += ' ORDER BY LastModifiedDate DESC';
      for (Contact c : Database.query(contactQuery)) {
         if (Matched.get(c.Phone) == NULL && toSearchPhone.contains(c.Phone)) {
            Matched.put(c.Phone, c.Id);
            Owners.put(c.Id,c.OwnerId);
            toSearchPhone.remove(c.Phone);
         }
         else if (Matched.get(c.MobilePhone) == NULL && toSearchPhone.contains(c.MobilePhone)) {
            Matched.put(c.MobilePhone, c.Id);
            Owners.put(c.Id,c.OwnerId);
            toSearchPhone.remove(c.MobilePhone);
         }
         else if (Matched.get(c.Email) == NULL && toSearchEmail.contains(c.Email)) {
            Matched.put(c.Email, c.Id);
            Owners.put(c.Id,c.OwnerId);
            toSearchEmail.remove(c.Email);
         }
      }   // end for/Contact lookup
      
      // Get a list of matching Leads
      String leadQuery = 'SELECT Id,OwnerId,Phone,MobilePhone,Email FROM Contact WHERE ';
      if (toSearchPhone.size() > 0 && toSearchEmail.size() > 0) {
         leadQuery += '(Phone IN: toSearchPhone OR MobilePhone IN: toSearchPhone OR Email IN: toSearchEmail)';
      }
      else if (toSearchPhone.size() > 0) {
         leadQuery += '(Phone IN: toSearchPhone OR MobilePhone IN: toSearchPhone)';
      }
      else if (toSearchEmail.size() > 0) {
         leadQuery += 'Email IN: toSearchEmail';
      }
      else { leadQuery += 'CreatedDate=TODAY'; }
      leadQuery += ' AND CreatedDate=LAST_YEAR';
      //contactQuery += ' ORDER BY LastModifiedDate DESC';
      for (Lead ml : Database.query(leadQuery)) {
         if (Matched.get(ml.Phone) == NULL && toSearchPhone.contains(ml.Phone)) {
            Matched.put(ml.Phone, ml.Id);
            Owners.put(ml.Id,ml.OwnerId);
            toSearchPhone.remove(ml.Phone);
         }
         else if (Matched.get(ml.MobilePhone) == NULL && toSearchPhone.contains(ml.MobilePhone)) {
            Matched.put(ml.MobilePhone, ml.Id);
            Owners.put(ml.Id,ml.OwnerId);
            toSearchPhone.remove(ml.MobilePhone);
         }
         else if (Matched.get(ml.Email) == NULL && toSearchEmail.contains(ml.Email)) {
            Matched.put(ml.Email, ml.Id);
            Owners.put(ml.Id,ml.OwnerId);
            toSearchEmail.remove(ml.Email);
         }
      }   // end for/Lead lookup

   }   // end doSearch()


}