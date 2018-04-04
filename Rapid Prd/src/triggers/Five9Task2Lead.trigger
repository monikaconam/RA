trigger Five9Task2Lead on Task (after insert, after update, after delete, after undelete) {
  /*
   * Author: Sam Hart Five9, Inc sam.hart@five9.com
   * Modified 05/29/2015    DS-CONAM
   * Trigger to update parent lead of Task if WhoId is a Lead.
   * Update Lead.status based on the CallDisposition based on pre-defined mapping:
     * These mappings are stored in a Custom Settings object called Five9Task2LeadMappings__c
   * ==================================================================================
      Five9 Disposition            |  Lead Status
        Number out of service          |  Not Legitimate
        Wrong Number              |  Not Legitimate
        No Contact - No Voicemail Left      |  Calling - No Contact Made
        No Contact - Left Voicemail        |  Calling - No Contact Made
        Add to Do No Call List          |  Not Interested - Do Not Contact
        Not Interested              |  Not Interested - Follow Up Later
        Contact Unavailable/Busy        |  In Progress - Follow Up Call Needed
        In Progress - No Voicemail Left      |  In Progress - Follow Up Call Needed
        In Progress - Left Voicemail      |  In Progress - Follow Up Call Needed
        Awaiting Statements - Left Voicemail  |  In Progress - Awaiting Statements
        Awaiting Statements - No Voicemail    |  In Progress - Awaiting Statements
        Transferred to Sales          |  In Progress - Awaiting Statements
        Transferred to GTF            |  GTF - Initial Call Needed
        Unqualified - Time in Biz        |  Unqualified *(Less thank 1 year)
        Unqualified - Monthly Sales        |  Unqualified *(Less than then $2500 /V/MC)
        Unqualified - Other            |  Unqualified *(Other)
        Converted                |  Converted
        Withdrawn                |  Withdrawn
        Transferred - Out            |  [No change]
        Follow Up Call Needed          |  In Progress - Follow Up Call Needed
        Awaiting Statements            |  In Progress - Awaiting Statements
   * ==================================================================================
     * 
   * This trigger will also update a custom field on the lead called Five9_Call_Counter__c with a
     * count of child
   * call activities that meet the following criteria: Call Type in (Agent, Preview, Outbound) 
   * */
    List<Five9Task2LeadMappings__c> mappings = Five9Task2LeadMappings__c.getAll().values();
    Map<String, String> statusMap = new Map<String, String>();
    Map<String, String> unqualifiedReasons = new Map<String, String>();
    Map<String, String> leadCallDispositionMap = new Map<String, String>();
    List<Lead> leads = new List<Lead>();
   // Set<Lead> leadSet = new Set<Lead>();
    List<Id> leadId = new List<Id>();  
    
    Map<Id,Lead> mapLead =new  Map<Id,Lead>();
    String unqualifiedReason;
    
    try{
            for(Five9Task2LeadMappings__c m: mappings)
            {
            
                statusMap.put(m.Five9Disposition__c, m.LeadStatus__c);
                if(m.UnqualifiedReason__c != null)
                {
                    unqualifiedReasons.put(m.Five9Disposition__c, m.UnqualifiedReason__c);
                }
            }
            system.debug(' statusMap '+statusMap);
            system.debug(' mappings '+mappings);
                
            if((Trigger.isInsert) || (Trigger.isUndelete))
            {   
                Set<ID> lListTemp=new Set<Id>();
                
                for(Task t: Trigger.new)
                {
                    
                    if(t.WhoId != null && t.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                        {
                            //Lead l = new Lead(Id=t.WhoId); 
                            lListTemp.add(t.WhoId);
                        }
                }
                

                Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT whoid Id, COUNT(Id) CallCount 
                                              FROM Task WHERE Five9__Five9CallType__c IN ('Agent', 'Preview', 'Outbound') 
                                              and who.Id in :lListTemp group by whoid]);
                    for(Task t: Trigger.new)
                    {
                                //On insert we need to update the status
                                if(t.WhoId != null && t.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                                {
                                    Lead l = new Lead(Id=t.WhoId);
                                    
                                    String newStatus = statusMap.get(t.CallDisposition);
                                    
                                    System.debug('newStatus ' +newStatus );
                                    System.debug('t.CallDisposition ' +t.CallDisposition);
                                    
                                    if(newStatus != null)
                                    {
                                            l.Status = newStatus;
                                            unqualifiedReason=unqualifiedReasons.get(t.CallDisposition);
                                            if(unqualifiedReason != null)
                                            {
                                                l.Unqualified_Reason__c = unqualifiedReason;
                                            }
                                             
                                    }
        
                                    System.debug(' numTasks '+numTasks);
                                    
                                    Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(l.id).get('CallCount')));
                                    l.Five9_Call_Counter__c = count;
                                    mapLead.put(l.id,l);
                                }
                      }  
                     if(mapLead.size()>0)
                     {    
                         for(Id iTemp : mapLead.keyset())
                             leads.add(mapLead.get(iTemp));
                         update leads;
                     }
            }
            
            if(Trigger.isUpdate)
            {   
                for(Task t: Trigger.new)
                {
                    if(t.WhoId != null && t.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                    {
                        if(Trigger.oldMap.get(t.Id).CallDisposition != t.CallDisposition)
                        {
                            leadId.add(t.whoID);
                            leadCallDispositionMap.put(t.whoID,t.CallDisposition);
                        }   
                    }
                }
                
                //System.debug('leadCallDispositionMap '+leadCallDispositionMap);
            
                if(leadId.size()>0)
                {   
                    List<Lead> lList=[select id, status,Unqualified_Reason__c from lead where id in : leadId];
                                                                         
                    Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT whoid Id, COUNT(Id) CallCount 
                                                      FROM Task WHERE Five9__Five9CallType__c IN ('Agent', 'Preview', 'Outbound') 
                                                      and who.Id in :LeadID group by whoid]);
                    
                    //System.debug(' numTasks  ' +numTasks);
                   
                        for(Lead lTemp: lList)
                        {
                            lTemp.Status=statusMap.get(leadCallDispositionMap.get(lTemp.id));
                            //System.debug('lTemp.Status '+lTemp.Status);
                            unqualifiedReason=unqualifiedReasons.get(leadCallDispositionMap.get(lTemp.id));
                                if(unqualifiedReason != null)
                                {
                                    lTemp.Unqualified_Reason__c = unqualifiedReasons.get(leadCallDispositionMap.get(lTemp.id));
                                    
                                }
                            Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(lTemp.id).get('CallCount')));
                            lTemp.Five9_Call_Counter__c = count;
                            leads.add(lTemp);   
                        }
                } 
                
                if(leads.size()>0) 
                    update leads;
               }
           
            if(Trigger.isDelete)
            {
                leads = new List<Lead>();
                for (Task t : Trigger.old) 
                {
                    if(t.WhoId != null && t.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                    {
                        leadID.add(t.WhoId);
                    }
                }
                
                if(leadId.size()>0)
                {   
                    List<Lead> lList=[select id, status,Unqualified_Reason__c from lead where id in : leadId];
                    Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT whoid Id, COUNT(Id) CallCount 
                                                      FROM Task WHERE Five9__Five9CallType__c IN ('Agent', 'Preview', 'Outbound') 
                                                      and who.Id in :LeadID group by whoid]);
                                                      
                        for(Lead lTemp: lList)
                        {
                            Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(lTemp.id).get('CallCount')));
                            lTemp.Five9_Call_Counter__c = count;
                            leads.add(lTemp); 
                        }
                }
                
                if(leads.size()>0) 
                {
                    update leads;
                }
                  
                
            }
    
    }
    catch(Exception e)
    {
        System.debug('An exception has been generated '+ e.getMessage()+ ' ' +e.getLineNumber());   
    }
   
}