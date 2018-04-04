trigger updatePhone on Priority_Queue__c (before insert , before update) {

   Set<id> leadID=new Set<id>();
   Set<id> oppID=new Set<id>();
   Map<id,lead> leadMap;
   Map<id,opportunity> oppMap;
   
    for(Priority_Queue__c pq : Trigger.new)
    {
        System.debug('XXXXXXXXX '+ pq);
        if(pq.Lead__C!=null)
        {
            leadID.add(pq.lead__C);
            System.debug('XXXXXXXXX '+ pq.Lead__r.phone);
           /* if(pq.Lead__r.phone!=null)
                pq.Phone_cti_modified__c=pq.Lead__r.phone;*/
        }
            
        if(pq.Opportunity__C!=null)
        {
            oppID.add(pq.Opportunity__C);
        }
    }
    if(leadID.size()>0)
    {
        leadMap=new Map<id,lead>([select id,phone from lead where id in : leadID]);
         System.debug(leadMap);

    }
        
    if(oppID.size()>0)
    {
        oppMap=new Map<id,opportunity>([select id,account.phone from opportunity where id in : oppID]);
         System.debug(oppMap);

    }
    
       
    for(Priority_Queue__c pq : Trigger.new)
    {          
        if(pq.Opportunity__C!=null)
        {
            if(oppMap.get(pq.Opportunity__C).account.phone!=null)
            pq.Phone_cti_modified__c=oppMap.get(pq.Opportunity__C).account.phone;
        }
        
        if(pq.lead__C!=null)
        {
            if(leadMap.get(pq.lead__C).phone!=null)
            pq.Phone_cti_modified__c=leadMap.get(pq.lead__c).phone;
        }
    }

}