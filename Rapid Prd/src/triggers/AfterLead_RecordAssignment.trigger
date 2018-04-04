trigger AfterLead_RecordAssignment on Lead (after update) {

   /* Trigger to create a new Ownership Change (Ownership_Change__c) object
      upon each assignment
   */
   
   List<String> Ids = new List<String>();
   List<String> OldOwners = new List<String>();
   List<String> NewOwners = new List<String>();
   
   for(Lead l: Trigger.New) {
      Lead oldLead = Trigger.oldMap.get(l.Id);
      if (l.OwnerId != oldLead.OwnerId) {   // Lead assignment change, create a note/object
         Ids.add(l.Id);
         OldOwners.add(oldLead.OwnerId);
         NewOwners.add(l.OwnerId);
      }  // end if
   }     // end for loop
   
   if (Ids.size() > 0) { OwnerAssignments.Record(Ids, OldOwners, NewOwners); }
}        // end trigger