trigger Five9Opportunity2Task on Task (after insert, after update) {

    /*
    
    @Name            : Five9Opportunity2Lead 
    @Author          : DS-CONAM
    @Date            : July 07, 2015
    @Description     : Opportunity stages needs to be updated by the call dispositions
    @revision GreenTree Opportunity stages needs to be updated by the call dispositions
    */
    List<Five9Task2OppMappings__c> mappings = Five9Task2OppMappings__c.getAll().values();
    Map<String, String> statusMap = new Map<String, String>();
    List<Opportunity> oppts= new List<Opportunity>();
    List<Id> oppId = new List<Id>();  
    
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
            statusMap.put(m.Five9Disposition__c, m.Opportunity_Stage__c);
        }

        Set<id> oppIDList =new Set <id>();
        for(Task t: Trigger.new)
        {
             if(t.whatid != null && t.whatid.getSobjectType() == Schema.Opportunity.sObjectType) 
             {
                oppIDList.add(t.whatID);    
             }
         }
        
        Map<id,Opportunity> oppMap=new Map <id,Opportunity>([select
                                                                    id, recordtypeID
                                                                from
                                                                    Opportunity
                                                                where
                                                                    id in : oppIDList ]);
                        
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

        Set<ID> oListTemp=new Set<Id>();
        for(Task t: Trigger.new)
        {
         if(t.whatid != null && t.whatid.getSobjectType() == Schema.Opportunity.sObjectType && oppMap.get(t.whatID).recordtypeID==rtId.id) 
         {
            Opportunity o = new Opportunity(Id=t.whatid);
                            
            String newStatus = statusMap.get(t.CallDisposition);
                            
            System.debug('newStatus ' +newStatus );
            System.debug('t.CallDisposition ' +t.CallDisposition);
                            
            if(newStatus != null)
            {
                 o.StageName= newStatus;
            }
            mapOpportunity.put(o.id,o);
         }
        }  
        
        if(mapOpportunity.size()>0)
        {    
         for(Id iTemp : mapOpportunity.keyset())
             oppts.add(mapOpportunity.get(iTemp));
         update oppts;
        }

    }
    catch(Exception e)
    {
        System.debug('An exception has been generated '+ e.getMessage()+ ' ' +e.getLineNumber());   
    }
   
}