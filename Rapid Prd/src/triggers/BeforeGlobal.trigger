trigger BeforeGlobal on Lead (before insert,before update) {

   Set<Id> toCheck     = new Set<Id>();    // Merchant IDs to check
   Map<Id, Id> lastAE  = new Map<Id,Id>(); // Most recent AE/owner (Referral ID, AE ID)
   Map<Id, Id> checked = new Map<Id,Id>(); // Cached AE values that were checked (may have Manager ID)
   Set<Id> active = new Set<Id>(); // Cached AE values that are active
   Map<Id, String> OwnerNames = new Map<Id,String>();
   Map<Id, String> MerchantNames = new Map<Id,String>();
   List<Task> newTasks = new List<Task>();

/* Disable duplicate checking ***
   DuplicateCheck dupechk = new DuplicateCheck();

   if (Trigger.isInsert) {    // Look for duplicates if it's an insert     
      Pattern digit = Pattern.compile('^.*\\d+.*$');
      for (Lead l : Trigger.new) {
         if (l.Phone != NULL && digit.matcher(l.Phone).matches()) { dupechk.toSearchPhone.add(l.Phone); }
         if (l.MobilePhone != NULL && digit.matcher(l.MobilePhone).matches()) { dupechk.toSearchPhone.add(l.MobilePhone); }
         if (l.Email != NULL) { dupechk.toSearchEmail.add(l.Email); }
      }  
      dupechk.doSearch();   // Populating the matching maps
   }  // end duplicate search/before insert


   if (Trigger.isInsert) {    // Look for duplicates if it's an insert     
      Map<Id,Id> Managers = new Map<Id,Id>();   // If a User is inactive, add hid/her ID (key) and the corresponding Manager Id
      Map<Id,Id> AcctContact = new Map<Id,Id>();   // Account (key), matching Contact
      Map<Id,Id> Opps = new Map<Id,Id>();   // Contact (key), matching Opp 
      Set<Id> contactsToSearch = new Set<Id>();  // List of related contacts to search
      List<Id> ownerLookups = dupechk.Owners.values();
      for (User u : [SELECT Id,Alias,ManagerId,IsActive FROM User WHERE Id IN: ownerLookups]) {
         if (u.Id != NULL && u.ManagerId != NULL && u.IsActive==false) {
           Managers.put(u.Id,u.ManagerId); }   // Cache if needed
      }  // end for loop/user lookup

      // Find all the related Opps (to add tasks)
      List<Id> contacts = dupechk.MatchingContacts();
      for (Contact c : [SELECT Id,AccountId FROM Contact WHERE Id IN: contacts]) {
         AcctContact.put(c.AccountId,c.Id);
      }
      Set<Id> acctIds = AcctContact.keySet();
      for (Opportunity o : [SELECT Id,AccountId,CreatedDate FROM Opportunity WHERE AccountId IN: acctIds ORDER BY CreatedDate DESC]) {
         if (Opps.get(AcctContact.get(o.AccountId)) == NULL) {
            Opps.put(AcctContact.get(o.AccountId),o.Id);
         }  // end if
      }

      // Mark as leads as duplicate
      for (Lead l : Trigger.new) {
         String objMatch;   // Object (Lead/Contact) that matches for this Lead
         if      (l.Phone != NULL && dupechk.Matched.get(l.Phone) != NULL) { objMatch = dupechk.Matched.get(l.Phone); }
         else if (l.MobilePhone != NULL && dupechk.Matched.get(l.MobilePhone) != NULL) { objMatch = dupechk.Matched.get(l.Phone); }
         else if (l.Email != NULL && dupechk.Matched.get(l.Email) != NULL) { objMatch = dupechk.Matched.get(l.Email); }
          
         if (objMatch != NULL) {
            if      (objMatch.substring(0, 3) == '00Q') { l.Status = 'Duplicate - Lead'; }  // Is a Lead
            else if (objMatch.substring(0, 3) == '003') {  // Contact (look up last related Opp)
               l.Status = 'Duplicate - Customer';
               contactsToSearch.add(objMatch);
            }
            // Reassign owner
            Id newOwner = dupechk.Owners.get(objMatch);
            if (Managers.get(newOwner) != NULL) { newOwner = Managers.get(newOwner); }
            l.OwnerId = newOwner;
            //newOwner = checked.get(newOwner);   // Pass from map obtained to filter out inactives

            Task t = new Task();
            t.OwnerId = l.OwnerId;
            t.Subject = l.Status + ' (' + l.Company + ')';
            t.Priority = 'Normal';
            t.Status = 'In Progress';
            t.WhoId = objMatch;
            if (Opps.get(objMatch) != NULL) { t.WhatId = Opps.get(objMatch); }
            newTasks.add(t);
         } // end if duplicate match
      }  // end for Lead loop
   }   // end if insert
*/

   // Trigger to populate the Referral AE Owner field for Leads that have a Referral Merchant ID
   for (Lead l : Trigger.new) {
      if (l.Status == 'Duplicate - Customer' || l.Status == 'Duplicate - Lead') { continue; } // Skip if we're a dupe
      Boolean toProcess = false;  // Boolean flag to add this Merchant AE for processing or not
      
      if (Trigger.isInsert && l.Referral_Merchant_ID__c != NULL) 
          { toProcess = true; }
      else if (l.Referral_Merchant_ID__c != NULL) {    // Check for update to save time
         Lead oldLead = Trigger.oldMap.get(l.Id);
         if (oldLead.Referral_Merchant_ID__c != l.Referral_Merchant_ID__c) { toProcess = true; }
      }
      if (toProcess) { toCheck.add(l.Referral_Merchant_ID__c); }
      
      
      if(Trigger.isInsert)
      {
          if (l.RC_Status__c != NULL) {
             System.debug(' ++++ ' + l.RC_Status__c);
             
             // Is Rock Connections, Set the local status
             RC_Status__c rcs = new RC_Status__c();
             rcs = RC_Status__c.getInstance(l.RC_Status__c);
             if (rcs != NULL) { l.Status = rcs.Local_Status__c; }         
          }
      }
      
      if(Trigger.isUpdate)
      {
         if ((l.RC_Status__c != NULL)&&(Trigger.oldMap.get(l.id).RC_Status__c!= l.RC_Status__c)){
             System.debug(' ++++ ' + l.RC_Status__c);
             
             // Is Rock Connections, Set the local status
             RC_Status__c rcs = new RC_Status__c();
             rcs = RC_Status__c.getInstance(l.RC_Status__c);
             if (rcs != NULL) { l.Status = rcs.Local_Status__c; }         
          } 
      }
   } // end for Lead loop
   
   // Watch governor limits
   for (Id MerchantId : toCheck) {
      Opportunity[] o_query = [SELECT Id,Account.Name,OwnerId FROM Opportunity WHERE AccountId =: MerchantId
                               ORDER BY CreatedDate DESC LIMIT 1];
      if (o_query.size() == 0) { continue; }   // skip if not found
      if (checked.get(o_query[0].OwnerId) == NULL) {  // not cached, must check if active or not
         User[] u_query = [SELECT Id,Name,IsActive FROM User WHERE Id=:o_query[0].OwnerId];
         if (u_query.size() == 0) { continue; }   // skip if not found (should be rare in production)
         Id thisId;
         thisId = u_query[0].Id;
         if (u_query[0].IsActive == true) { active.add(thisId); }
         lastAE.put(MerchantId,thisId);
         checked.put(o_query[0].OwnerId,thisId);
         MerchantNames.put(MerchantId,o_query[0].Account.Name);
         OwnerNames.put(u_query[0].Id,u_query[0].Name);
      }
   }
   
   // Back to Lead cycle
   for (Lead l : Trigger.new) {
      Id AE_Id;
      if (l.Referral_Merchant_ID__c != NULL) { AE_Id = lastAE.get(l.Referral_Merchant_ID__c); }
      if (AE_Id != NULL) {
         l.Referral_AE_Owner_ID__c = AE_Id;
         l.Referral_AE_Owner_Name__c = OwnerNames.get(AE_Id);
         l.Referral_Merchant_Name__c = MerchantNames.get(l.Referral_Merchant_ID__c);
         if (active.contains(AE_Id)) { l.OwnerId = AE_Id; }
      }
   }

   if (newTasks.size() > 0) { insert newTasks; }
}