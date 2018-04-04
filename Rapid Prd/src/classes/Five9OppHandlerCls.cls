/*
@Name            : Five9OppHandlerCls
@Author          : SS Conam
@Date            : July 14, 2015
@Description     : Handler Class for trigger Five9OpportunityRecordTrg which creates Five9LSP__Five9_List_Item__c record on 
                    Opportunity insertion.

@Revision History
@Author          : DS-Conam
@Date            : Nov 3, 2015
@Description     : Modified the Five9 Namespace from Five9PS to Five9LSP due to change in Five9 namespace.

@Revision History
@Author          : DS-Conam
@Date            : Mar 22, 2016
@Description     : Deactivated as per email from Brian , Workflow in place

*/

public class Five9OppHandlerCls {
/*    
    public static void checkFive9OppOnInsert (Map<Id,Opportunity> oppMap) {
        
        Set<Id> ids = oppMap.keySet();
        Map<String,String> five9Master=new Map<String,String>();
        List<Opportunity> oppList = [SELECT 
                                            Name, StageName,RecordTypeId,RecordType.name, LeadSource 
                                     FROM 
                                            Opportunity WHERE id IN: ids];
                                            
        List<Five9mapopp__c> weids = Five9mapopp__c.getall().values();
        List<String> names=new List<String>();
        Map<Id,String> rMap=new Map<Id,String>();
        Map<String,Id> five9MasterMap=new Map<String, id>();
        List <Five9LSP__Five9_List_Item__c> five9Detail = new List <Five9LSP__Five9_List_Item__c> ();
        
        for(Five9mapopp__c fTemp :weids  )
        {
            names.add(fTemp.Five9_List__c);
        }
        System.debug(' names  ' + names);
      
        for(Five9MapOpp__c fTemp : weids )
        {
            five9Master.put(fTemp.Record_Type__c,fTemp.Five9_List__c);
        }
        System.debug(' five9Master ' + five9Master);
        
        List<Five9LSP__Five9_List__c> five9MasterList=[select 
                                                            id, name 
                                                      from 
                                                            Five9LSP__Five9_List__c 
                                                      where
                                                            name in : names];

        
        
        for(Five9LSP__Five9_List__c fTemp : five9MasterList)
        {
            five9MasterMap.put(fTemp.name,fTemp.id);
        }
        System.debug(' five9MasterMap ' + five9MasterMap);
        List<RecordType> rList=[select 
                                    id, name 
                                from 
                                    RecordType 
                                where 
                                    sobjecttype='Opportunity' 
                                and 
                                    name in : five9Master.keyset()];
                                    
         System.debug(' rList ' + rList);                           
        
        for(RecordType rTemp : rList)
        {
             rMap.put(rTemp.id,rTemp.name);
        }
                                                                                                
       
        for (Opportunity oppTemp : oppList ) 
        {
            Five9LSP__Five9_List_Item__c newFive9Detail = new Five9LSP__Five9_List_Item__c();
            newFive9Detail.Five9LSP__Opportunity__c = oppTemp .id;
            newFive9Detail.Five9LSP__Five9_List__c = five9MasterMap.get(five9Master.get(rMap.get(oppTemp.RecordTypeID)));
            five9Detail.add(newFive9Detail);
        }
        try
        {
            if(five9Detail.size()>0)
                insert five9Detail;
        }
        catch(Exception e)
        {
            System.debug('An exception has occured - '+ e.getMessage()+ ' ' +e.getLineNumber());
        }
    }
    
    public static void checkFive9OppOnDelete (List<Opportunity> oppList){
        
        set<Opportunity> oppSet = new set<Opportunity>();
        for (Opportunity oppTemp : oppList) {
            oppSet.add(oppTemp);
        }
        List<Five9LSP__Five9_List_Item__c> f9Item = [SELECT 
                                                            id, Five9LSP__Five9_List__c, Five9LSP__Opportunity__c 
                                                    FROM 
                                                            Five9LSP__Five9_List_Item__c 
                                                    WHERE 
                                                            Five9LSP__Opportunity__c IN: oppSet];
            
        try
        {
            if(f9Item.size()>0)
                delete f9Item;
        }
        catch(Exception e)
        {
            System.debug('An exception has occured - '+ e.getMessage()+ ' ' +e.getLineNumber());
        }
    }
*/
}