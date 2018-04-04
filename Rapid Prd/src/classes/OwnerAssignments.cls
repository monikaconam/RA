public class OwnerAssignments {
   public static void Record(String[] Ids, String[] OldOwners, String[] NewOwners) {
      List<Ownership_Change__c> toInsert = new List<Ownership_Change__c>();
      Integer counter = 0;
      for (String id : Ids) {
         Ownership_Change__c oc = new Ownership_Change__c (
            Old_OwnerId__c = OldOwners[counter],
            New_OwnerId__c = NewOwners[counter]
         );
         if (id.substring(0, 3) == '006') {   // Carry out additional instructions for Opps
         }
         else { oc.LeadId__c = id; }   // Populate Lead Id
         toInsert.add(oc);
         counter++;
      }  // end for
      if (toInsert.size() > 0) {
         try { insert toInsert; }
         catch (DMLException e) {   }
      }
   }     // end Record method
}    // end class