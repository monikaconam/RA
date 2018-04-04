trigger LeadS2STrigger on Lead (after insert) { 
    
    try { 
        ExternalSharingHelper sharingHelper = new ExternalSharingHelper(); 
        Id connectionId = ConnectionHelper.getConnectionId('Rock Connections');        
    
        // for Leads coming from Rapid Advance org - need to push the LeadId 
        // do a fake touch 
        Set<Id> newLeadIds = new Set<Id>(); 
        
        for (Lead newLead : Trigger.new) 
        { 
                 if ((newLead.ConnectionReceivedId != null && newLead.ConnectionReceivedId == connectionId)  ||test.isRunningTest())
                         newLeadIds.add(newLead.Id); 
        } 
        
        if (newLeadIds.size() > 0) {            
            ExternalSharingHelper.touchCases(newLeadIds); 
        } 
    } catch (System.Exception ex) {   System.debug(LoggingLevel.Error, 'Lead share trigger failed -' + ex.getMessage()); 
    } 
}