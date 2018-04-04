trigger LeadSharing on Lead (after insert, after update) {

    // Lookup the owner of Rock Connections Leads
    User_Default__c ud = User_Default__c.getInstance('Rock Connections');

    String Reassign_OwnerId;
    if (ud != NULL) { Reassign_OwnerId = ud.UserID__c; }
    else            { Reassign_OwnerId = '005700000036cqlAAA'; }
    Set<Id> toSend = new Set<Id>();

    for(Lead l: Trigger.new)
    {
        Boolean sendToPartner = false;
    
        // Modification by Chris Yau, 2014/8/6: "Legacy" after insert code
        if ( Trigger.isInsert && (l.LeadSource == 'Lead Generation' || l.LeadSource == 'Web-To-Lead' ||
             l.LeadSource == 'Calc Lander Web to Lead' || l.LeadSource == 'Partner') &&
             l.OwnerId == Reassign_OwnerId) { sendToPartner = true; }
/* Removed 2014/8/6, Chris Yau: Deployment of Distribution Engine
             (l.Campaign_Name_Upload__c.startsWithIgnoreCase('business.com') || 
              l.Campaign_Name_Upload__c.startsWithIgnoreCase('financing factory')) &&
*/
        else if (Trigger.isUpdate && l.OwnerId == Reassign_OwnerId) { // Check against Marketing
            Lead oldLead = Trigger.oldMap.get(l.Id);
            if ( (l.LeadSource == 'Lead Generation' || l.LeadSource == 'Web-To-Lead' ||
                  l.LeadSource == 'Calc Lander Web to Lead') && oldLead.Id != l.OwnerId) { sendToPartner = true; }
        }  // end else if

        if (sendToPartner) { toSend.add(l.Id); }

    }  // end main FOR loop
    
    if (toSend.size() > 0) { // Send out Leads via Partner Connection
        toSend = LeadUtils.toConnect(toSend);
        List<PartnerNetworkRecordConnection> connections = new List<PartnerNetworkRecordConnection>();
        if (toSend.size() > 0) {
            for (Id i : toSend) {
                PartnerNetworkRecordConnection newConnection =
                new PartnerNetworkRecordConnection(
                    //ConnectionId = '04PS00000004JYoMAM', // CustomApps
                    ConnectionId = '04P700000000HMfEAM', // Production              
                    LocalRecordId = i,
                    SendClosedTasks = false,
                    SendOpenTasks = false,
                    SendEmails = false
                );
                connections.add(newConnection);
            }
            if (! LeadUtils.isTesting() ) { insert connections; }  // Insert if not a test
        }   // end if toSend
    }       // end bigger if toSend
}