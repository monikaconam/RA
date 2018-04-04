trigger beforeOwnerChange on Campaign (before insert, before update) {

   Set<Id> OwnerIds = new Set<Id>();
   Map<Id, String> OwnerEmails = new Map<Id, String>();

   // Make a Map of all the Owner Emails
   for (Campaign c : Trigger.new) {
      OwnerIds.add(c.OwnerId);
      if (c.Additional_Owner__c != NULL) { OwnerIds.add(c.Additional_Owner__c); }
   }
   for (User u : [SELECT Id,Email FROM User WHERE Id IN : OwnerIds]) {
      OwnerEmails.put(u.Id, u.Email);
   }
   
   // Cycle through
   for (Campaign c : Trigger.new) {
      Boolean toProcess = false;
      if (Trigger.isUpdate) {
         Campaign oldCampaign = Trigger.oldmap.get(c.Id);
         if (oldCampaign.OwnerId != c.OwnerId || oldCampaign.Additional_Owner__c != c.Additional_Owner__c) {
            toProcess = true;
         }
      }
      else if (trigger.isInsert) { toProcess = true; }

      if (toProcess) {
         c.BD_Send_Cmpn_Owner__c = OwnerEmails.get(c.OwnerId);
         if (c.Additional_Owner__c != NULL) {
            c.BD_Send_Addtl_Owner__c = OwnerEmails.get(c.Additional_Owner__c);
         }
      }  // end if to Process
      
   }    // end main FOR loop
}