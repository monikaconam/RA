public with sharing class PopulateLeadOppNumHandler 
{
    public static void PopulateLeadOppNumInsert (List<Task> tasklist)
    {
        try{
            Set<Id> whoIdSet = new Set<Id>();
            Set<Id> whatIdSet = new Set<Id>();
            
            for(Task tObject : tasklist) {
                if(tObject.WhoId != null && String.valueOf(tObject.WhoId).subString(0, 3) == '00Q' &&  tObject.LD_NumId__c == null  ){
                    whoIdSeT.add(tObject.WhoId);
                }
                if(tObject.WhatId != null && String.valueOf(tObject.WhatId).subString(0, 3) == '006' &&  tObject.OP_NumId__c == null ){
                    whatIdSet.add(tObject.WhatId);
                }
            }
            
            If(whoIdSet != null || whatIdSet!= null){
            
                Map<Id,Lead> leadMap = new Map<Id,Lead>([SELECT Id,LD_NumId__c FROM Lead WHERE Id IN : whoIdSet]);
                Map<Id,Opportunity> opportunityMap = new Map<Id,Opportunity>([SELECT Id,OP_NumId__c FROM Opportunity WHERE Id IN : whatIdSet]);
                
                for(Task tObject : tasklist){
                    if(leadMap.containsKey(tObject.WhoId)){
                        tObject.LD_NumId__c =  leadMap.get(tObject.WhoId).LD_NumId__c; 
                    }    
                }
                
                for(Task tObject : tasklist){
                    if(opportunityMap.containsKey(tObject.WhatId)){
                        tObject.OP_NumId__c =  opportunityMap.get(tObject.WhatId).OP_NumId__c ;   
                    }    
                }
            }
        }
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
    
    public static void PopulateLeadOppNumUpdate (List<Task> tasklist,Map<Id,Task> oldMap)
    {
        try{
            Set<Id> whoIdSet = new Set<Id>();
            Set<Id> whatIdSet = new Set<Id>();
            
            for(Task tObject : tasklist) {
                if(tObject.WhoId != null && String.valueOf(tObject.WhoId).subString(0, 3) == '00Q' && (tObject.WhoId != oldMap.get(tObject.Id).WhoId || tObject.LD_NumId__c == null)){
                    whoIdSeT.add(tObject.WhoId);
                }
                if(tObject.WhatId != null && String.valueOf(tObject.WhatId).subString(0, 3) == '006' && (tObject.WhatId != oldMap.get(tObject.Id).WhatId || tObject.OP_NumId__c == null)){
                    whatIdSet.add(tObject.WhatId);
                }
            }
            
            If(whoIdSet != null || whatIdSet!= null){
            
                Map<Id,Lead> leadMap = new Map<Id,Lead>([SELECT Id,LD_NumId__c FROM Lead WHERE Id IN : whoIdSet]);
                Map<Id,Opportunity> opportunityMap = new Map<Id,Opportunity>([SELECT Id,OP_NumId__c FROM Opportunity WHERE Id IN : whatIdSet]);
                
                for(Task tObject : tasklist){
                    if(leadMap.containsKey(tObject.WhoId)){
                        tObject.LD_NumId__c =  leadMap.get(tObject.WhoId).LD_NumId__c; 
                    }    
                }
                
                for(Task tObject : tasklist){
                    if(opportunityMap.containsKey(tObject.WhatId)){
                        tObject.OP_NumId__c =  opportunityMap.get(tObject.WhatId).OP_NumId__c ;   
                    }    
                }
            }
        }
        Catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());   
        }
    }
}