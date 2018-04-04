trigger Queue_Opp on Opportunity (after insert,after update) {
   
   // Trigger to create/update the relevant Priority Queue object following Opp insert/modification
   List<Opportunity> toSync = new List<Opportunity>();

   for (Opportunity o : Trigger.new) {
      toSync.add(o);
   }   // end for Lead loop

   // Call the sync class
   Boolean success = Queue_Sync.syncQueue(toSync);   // Add try/except
}