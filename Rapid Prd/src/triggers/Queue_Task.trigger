trigger Queue_Task on Task (after insert,after update) {
   
   // Trigger to create/update the relevant Priority Queue object following Lead insert/modification
   List<Lead>        toSyncLead = new List<Lead>();
   List<Opportunity> toSyncOpp  = new List<Opportunity>();
   Set<Id> fetchLead = new Set<Id>();
   Set<Id> fetchOpp  = new Set<Id>();

   for (Task t : Trigger.new) {
      String potentialOppId = t.WhatId;
      if      (t.WhatId != NULL && potentialOppId.substring(0, 3) == '006') { fetchOpp.add(t.WhatId); }
      else if (t.WhoId != NULL && t.WhatId == NULL)                         { fetchLead.add(t.WhoId); }
   }   // end for Task loop

   Boolean success;
   if (fetchLead.size() > 0) {
      toSyncLead = [SELECT Id,Company,status,ConvertedOpportunityId FROM Lead WHERE Id IN: fetchLead];
      success = Queue_Sync.syncQueue(toSyncLead);   // Add try/except
   }
   if (fetchOpp.size() > 0) {
      toSyncOpp = [SELECT Id,Name FROM Opportunity WHERE Id IN: fetchOpp];
      success = Queue_Sync.syncQueue(toSyncOpp);   // Add try/except   
   }
}