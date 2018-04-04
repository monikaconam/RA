/**
   * Author: MK-Conam
   * Handler class of Trigger to update parent lead of Task if WhoId is a Lead.
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
   * This will also update a custom field on the lead called Five9_Call_Counter__c with a
   * count of child
   * call activities that meet the following criteria: Call Type in (Agent, Preview, Outbound) 
   * Version  Date           Author           WO#         Description of Action
   * 1.0      08/24/2015     MKConAm                      Initial Version
* */

public with sharing class TaskTriggerHandler 
{
    
    public static void aiFive9Task2Lead(List <Task> listTsk)       
    {
        List<Five9Task2LeadMappings__c> mappings = Five9Task2LeadMappings__c.getAll().values();
        Map<String, String> statusMap = new Map<String, String>();
        Map<String, String> unqualifiedReasons = new Map<String, String>();
        Map<String, String> leadCallDispositionMap = new Map<String, String>();
        List<Lead> leads = new List<Lead>();
        // Set<Lead> leadSet = new Set<Lead>();
        List<Id> leadId = new List<Id>(); 
        Map<Id,Lead> mapLead =new  Map<Id,Lead>();
        String unqualifiedReason;
        try
        {
            for(Five9Task2LeadMappings__c m: mappings)
            {
                statusMap.put(m.Five9Disposition__c.toUpperCase(), m.LeadStatus__c);
                if(m.UnqualifiedReason__c != null)
                {
                    unqualifiedReasons.put(m.Five9Disposition__c, m.UnqualifiedReason__c);
                }
            }
            
            Set<ID> lListTemp=new Set<Id>();
            for(Task tsk: listTsk)
            {               
                if(tsk.WhoId != null && tsk.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    //Lead l = new Lead(Id=t.WhoId); 
                    lListTemp.add(tsk.WhoId);
                }
            }
            /*Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Five9__Five9CallType__c IN ('Agent', 'Preview', 'Outbound') 
                                                                            AND 
                                                                                Who.Id in :lListTemp
                                                                            GROUP BY 
                                                                                WhoId]);*/
                                                                                
            
            Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Subject Like '%Call%' 
                                                                            AND 
                                                                                Who.Id in :lListTemp
                                                                            GROUP BY 
                                                                                WhoId]);
            
            
            for(Task tsk1:listtsk)
            {
                //On insert we need to update the status
                if(tsk1.WhoId != null && tsk1.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    Lead led = new Lead(Id=tsk1.WhoId);   
                    if(tsk1.CallDisposition!=null)
                    {
                        String newStatus = statusMap.get(tsk1.CallDisposition.toUpperCase());
                        if(newStatus != null)
                        {
                            led.Status = newStatus;
                            unqualifiedReason=unqualifiedReasons.get(tsk1.CallDisposition);
                            if(unqualifiedReason != null)
                            {
                                led.Unqualified_Reason__c = unqualifiedReason;
                            }                                             
                        }                                   
                        Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(led.id).get('CallCount')));
                        led.Five9_Call_Counter__c = count;
                                                
                        mapLead.put(led.id,led);
                    }
                }
            }  
            if(mapLead.size()>0)
            {    
                for(Id iTemp : mapLead.keyset())
                leads.add(mapLead.get(iTemp));
                update leads;
                
            }
            
        }
        catch (Exception ex) 
        {
            listTsk[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        }
    
    }
    public static void auFive9Task2Lead(List <Task>listTsk, Map<Id,Task>mapTsk )       
    {
        List<Five9Task2LeadMappings__c> mappings = Five9Task2LeadMappings__c.getAll().values();
        Map<String, String> statusMap = new Map<String, String>();
        Map<String, String> unqualifiedReasons = new Map<String, String>();
        Map<String, String> leadCallDispositionMap = new Map<String, String>();
        List<Lead> leads = new List<Lead>();
        // Set<Lead> leadSet = new Set<Lead>();
        List<Id> leadId = new List<Id>(); 
        Map<Id,Lead> mapLead =new  Map<Id,Lead>();
        String unqualifiedReason;
        try
        {
            for(Five9Task2LeadMappings__c m: mappings)
            {
                statusMap.put(m.Five9Disposition__c, m.LeadStatus__c);
                if(m.UnqualifiedReason__c != null)
                {
                    unqualifiedReasons.put(m.Five9Disposition__c, m.UnqualifiedReason__c);
                }
            }
            
            for(Task tsk: listTsk)
            {
                if(tsk.WhoId != null && tsk.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    if(mapTsk.get(tsk.Id).CallDisposition != tsk.CallDisposition)
                    {
                        leadId.add(tsk.whoID);
                        leadCallDispositionMap.put(tsk.whoID,tsk.CallDisposition);
                    }   
                }
            }            
            if(leadId.size()>0)
            {   
                List<Lead> lList=[SELECT 
                                        Id, Status,Unqualified_Reason__c 
                                    FROM 
                                        Lead 
                                    WHERE 
                                        Id in : leadId];                                                                         
                /*Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                    WhoId Id, COUNT(Id) CallCount 
                                                                                FROM 
                                                                                    Task 
                                                                                WHERE 
                                                                                    Five9__Five9CallType__c 
                                                                                IN 
                                                                                    ('Agent', 'Preview', 'Outbound') 
                                                                                AND 
                                                                                    Who.Id in :LeadID 
                                                                                GROUP BY 
                                                                                    WhoId]);*/
                                                                                    
                Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Subject Like '%Call%' 
                                                                            AND 
                                                                                Who.Id in :LeadID
                                                                            GROUP BY 
                                                                                WhoId]);                            
                   
                for(Lead lTemp: lList)
                {
                    lTemp.Status=statusMap.get(leadCallDispositionMap.get(lTemp.id));
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
            Database.update(leads,false);
        }
        catch (Exception ex) 
        {
            listTsk[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        }   
    }
    
    public static void adFive9Task2Lead(List <Task>listTsk )       
    {
        List<Five9Task2LeadMappings__c> mappings = Five9Task2LeadMappings__c.getAll().values();
        Map<String, String> statusMap = new Map<String, String>();
        Map<String, String> unqualifiedReasons = new Map<String, String>();
        Map<String, String> leadCallDispositionMap = new Map<String, String>();
        List<Lead> leads = new List<Lead>();
        // Set<Lead> leadSet = new Set<Lead>();
        List<Id> leadId = new List<Id>(); 
        Map<Id,Lead> mapLead =new  Map<Id,Lead>();
        String unqualifiedReason;
        try
        {
            for(Five9Task2LeadMappings__c m: mappings)
            {
                statusMap.put(m.Five9Disposition__c, m.LeadStatus__c);
                if(m.UnqualifiedReason__c != null)
                {
                    unqualifiedReasons.put(m.Five9Disposition__c, m.UnqualifiedReason__c);
                }
            }           
            leads = new List<Lead>();
            for (Task tsk : listTsk) 
            {
                if(tsk.WhoId != null && tsk.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    leadID.add(tsk.WhoId);
                }
            }
                
            if(leadId.size()>0)
            {   
                List<Lead> lList=[SELECT 
                                        Id, status,Unqualified_Reason__c 
                                    FROM 
                                        Lead 
                                    WHERE 
                                        Id 
                                    IN : leadId];
                /*Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                    WhoId Id, COUNT(Id) CallCount 
                                                                                FROM 
                                                                                    Task 
                                                                                WHERE 
                                                                                    Five9__Five9CallType__c 
                                                                                IN 
                                                                                    ('Agent', 'Preview', 'Outbound') 
                                                                                AND 
                                                                                    Who.Id 
                                                                                IN :LeadID 
                                                                                    GROUP BY 
                                                                                WhoId]);*/
                                                                                
                Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Subject Like '%Call%' 
                                                                            AND 
                                                                                Who.Id in :LeadID
                                                                            GROUP BY 
                                                                                WhoId]);                                                                
                                                  
                for(Lead lTemp: lList)
                {
                    if(numTasks!=null)
                    {
                        if(numTasks.get(lTemp.id)!=null)
                        {
                            Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(lTemp.id).get('CallCount')));
                            lTemp.Five9_Call_Counter__c = count;
                            leads.add(lTemp);
                        }
                    }
                }
            }                
            if(leads.size()>0) 
            {
                Database.update(leads,false);
            }
        }    
        catch (Exception ex) 
        {
            listTsk[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        } 
    }
    public static void aunFive9Task2Lead(List <Task>listTsk )       
    {
        List<Five9Task2LeadMappings__c> mappings = Five9Task2LeadMappings__c.getAll().values();
        Map<String, String> statusMap = new Map<String, String>();
        Map<String, String> unqualifiedReasons = new Map<String, String>();
        Map<String, String> leadCallDispositionMap = new Map<String, String>();
        List<Lead> leads = new List<Lead>();
        // Set<Lead> leadSet = new Set<Lead>();
        List<Id> leadId = new List<Id>(); 
        Map<Id,Lead> mapLead =new  Map<Id,Lead>();
        String unqualifiedReason;
        try
        {
            for(Five9Task2LeadMappings__c m: mappings)
            {
                statusMap.put(m.Five9Disposition__c, m.LeadStatus__c);
                if(m.UnqualifiedReason__c != null)
                {
                    unqualifiedReasons.put(m.Five9Disposition__c, m.UnqualifiedReason__c);
                }
            }
            
            Set<ID> lListTemp=new Set<Id>();
            for(Task tsk: listTsk)
            {               
                if(tsk.WhoId != null && tsk.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    //Lead l = new Lead(Id=t.WhoId); 
                    lListTemp.add(tsk.WhoId);
                }
            }
            /*Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Five9__Five9CallType__c IN ('Agent', 'Preview', 'Outbound') 
                                                                            AND 
                                                                                Who.Id in :lListTemp 
                                                                            GROUP BY 
                                                                                WhoId]);*/
                                                                                
            Map<Id,AggregateResult> numTasks= new Map<id,AggregateResult>([SELECT 
                                                                                WhoId Id, COUNT(Id) CallCount 
                                                                            FROM 
                                                                                Task 
                                                                            WHERE 
                                                                                Subject Like '%Call%' 
                                                                            AND 
                                                                                Who.Id in :lListTemp
                                                                            GROUP BY 
                                                                                WhoId]);
                                                                                
            for(Task tsk1:listtsk)
            {
                //On insert we need to update the status
                if(tsk1.WhoId != null && tsk1.WhoId.getSobjectType() == Schema.Lead.sObjectType) 
                {
                    Lead led = new Lead(Id=tsk1.WhoId);                                    
                    String newStatus = statusMap.get(tsk1.CallDisposition);
                    if(newStatus != null)
                    {
                        led.Status = newStatus;
                        unqualifiedReason=unqualifiedReasons.get(tsk1.CallDisposition);
                        if(unqualifiedReason != null)
                        {
                            led.Unqualified_Reason__c = unqualifiedReason;
                        }                                             
                    }                                   
                    Integer count=numTasks.size()==0 ? 0 : Integer.valueOf(String.valueOf(numTasks.get(led.id).get('CallCount')));
                    led.Five9_Call_Counter__c = count;
                    mapLead.put(led.id,led);
                }
            }  
            if(mapLead.size()>0)
            {    
                for(Id iTemp : mapLead.keyset())
                    leads.add(mapLead.get(iTemp));
                    Database.update (leads,false);
            }
            
        }
        catch (Exception ex) 
        {
            listTsk[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        }
    
    }
    
    public static void aiFive9Opportunity2Task(List <Task> listT )       
    {
        helperFive9Opportunity2Task(listT,'INSERT');
    }
    
    public static void auFive9Opportunity2Task(List <Task> listT )       
    {
        helperFive9Opportunity2Task(listT,'');
    }
    
    private static void helperFive9Opportunity2Task(List <Task> listTask, String action )
    {
        List<Five9Task2OppMappings__c> mappings = Five9Task2OppMappings__c.getAll().values();
        Map<String, String> statusMap = new Map<String, String>();
        List<Opportunity> oppts= new List<Opportunity>();
        List<Id> oppId = new List<Id>();  
        List<Database.SaveResult> listDbs;
        Map<Id,Opportunity> mapOpportunity =new  Map<Id,Opportunity>();
        RecordType rtId=[select 
        
                                id
                         from
                                recordtype
                         where
                                sobjecttype='Opportunity' 
                         and
                                developername='GreenTree' Limit 1];                           
        try
        {
            for(Five9Task2OppMappings__c m: mappings)
            {
                statusMap.put(m.Five9Disposition__c.toUpperCase(), m.Opportunity_Stage__c);
            }
        
            Set<id> oppIDList =new Set <id>();
            for(Task t: listTask)
            {
                 if(t.whatid != null && t.whatid.getSobjectType() == Schema.Opportunity.sObjectType) 
                 {
                    oppIDList.add(t.whatID);    
                 }
             }
            
            
            Map<id,Opportunity> oppMap=new Map <id,Opportunity>([select
                                                                        id, recordtypeID, Five9_Call_Counter__c 
                                                                    from
                                                                        Opportunity
                                                                    where
                                                                        id in : oppIDList ]);
            /*                
             List<Opportunity> oppList=[select
                                                id, recordtypeID
                                            from
                                                Opportunity
                                            where
                                                id in : oppIDList ];
        
            Map<id,id> oppRTMap=new Map<id,id>();
            
            for(Opportunity oTemp : oppList)
            {
            if(oTemp.recordtypeId==rtId.id)
                oppRTMap.put(oTemp.id,oTemp.recordtypeID);
            }
            
            */       
        
            Set<ID> oListTemp=new Set<Id>();
            for(Task t: listTask )
            {
                if(t.whatid != null && t.whatid.getSobjectType() == Schema.Opportunity.sObjectType)// && oppMap.get(t.whatID).recordtypeID==rtId.id) 
                {
                    Opportunity o = new Opportunity(Id=t.whatid);
                    if(action=='INSERT')
                    {
                        if((t.Five9__Five9CallType__c=='Agent')||(t.Five9__Five9CallType__c=='Preview')||(t.Five9__Five9CallType__c=='Outbound'))
                        {
                            System.debug('XXXXXXX'+oppMap.get(t.whatId).Five9_Call_Counter__c);
                            o.Five9_Call_Counter__c=oppMap.get(t.whatId).Five9_Call_Counter__c!=null? oppMap.get(t.whatId).Five9_Call_Counter__c+1: 1; 
                        }
                    }
                    
                    if(oppMap.get(t.whatID).recordtypeID==rtId.id) 
                    {
                        String newStatus = statusMap.get(t.CallDisposition.toUpperCase());                                   
                        System.debug('newStatus ' +newStatus );
                        System.debug('t.CallDisposition ' +t.CallDisposition);
                        
                        if(newStatus != null)
                        {
                            o.StageName= newStatus;
                        }
                    }
                    mapOpportunity.put(o.id,o);
                }
            }  
            
            if(mapOpportunity.size()>0)
            {    
                 for(Id iTemp : mapOpportunity.keyset())
                     oppts.add(mapOpportunity.get(iTemp));
                 
                 listDbs=Database.update(oppts,false);
            }
        
        }
        catch (Exception ex) 
        {
            if(listDbs.size()>0)
            {
                for(DataBase.SaveResult dsr : listDbs)
                {
                    if(!dsr.isSuccess())
                    {
                        mapOpportunity.get(dsr.getID()).addError('An exception has occurred - '+ex.getMessage()+' at '+ ex.getLineNumber());
                    }
                }
            }
            else
            {
                listTask[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }
    } 
    
}