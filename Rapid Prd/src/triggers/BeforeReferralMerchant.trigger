trigger BeforeReferralMerchant on Lead (before insert,before update) {

   Set<Id> toCheck     = new Set<Id>();    // Merchant IDs to check
   Map<Id, Id> lastAE  = new Map<Id,Id>(); // Most recent AE/owner (Referral ID, AE ID)
   Map<Id, Id> checked = new Map<Id,Id>(); // Cached AE values that were checked (may have Manager ID)
   Set<Id> active = new Set<Id>(); // Cached AE values that are active
   Map<Id, String> OwnerNames = new Map<Id,String>();
   Map<Id, String> MerchantNames = new Map<Id,String>();

   // Trigger to populate the Referral AE Owner field for Leads that have a Referral Merchant ID
   for (Lead l : Trigger.new) {
      Boolean toProcess = false;  // Boolean flag to add this Merchant AE for processing or not
      
      if (Trigger.isInsert && l.Referral_Merchant_ID__c != NULL) { toProcess = true; }
      else if (l.Referral_Merchant_ID__c != NULL) {    // Check for update to save time
         Lead oldLead = Trigger.oldMap.get(l.Id);
         if (oldLead.Referral_Merchant_ID__c != l.Referral_Merchant_ID__c) { toProcess = true; }
      }
      if (toProcess) { toCheck.add(l.Referral_Merchant_ID__c); }
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

}