trigger Queue_Lead on Lead (after insert,after update) {
   
   // Trigger to create/update the relevant Priority Queue object following Lead insert/modification
   List<Lead> toSync = new List<Lead>();

   for (Lead l : Trigger.new) {
      toSync.add(l);
   }   // end for Lead loop

   // Call the sync class
   Boolean success = Queue_Sync.syncQueue(toSync);   // Add try/except
}