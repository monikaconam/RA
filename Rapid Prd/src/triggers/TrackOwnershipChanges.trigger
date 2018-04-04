trigger TrackOwnershipChanges on Lead (before insert,before update) {
    
   Map<Id,User> ownerMaps = new Map<Id,user>();
   List<id> uid=new list<id>();
   
   /*for(lead L : Trigger.new)
   {
          uid.aDD(L.ownerid);
   
   }*/
    
    if(Trigger.isInsert)
    {
          for(lead L : Trigger.new)
          {
                  uid.aDD(L.ownerid);
           
          }
   
          ownerMaps= new Map<Id,user>([select id,name from user where id in : uid]);
        
          for(Lead l : Trigger.new)
          {
                    l.Original_Owner__c = ownerMaps.get(l.ownerid).name;
          }
    }
        
        if(Trigger.isUpdate)
        {
             for(lead L : Trigger.old)
   {
          uid.aDD(L.ownerid);
   
   }
   
   ownerMaps= new Map<Id,user>([select id,name from user where id in : uid]);
   system.debug('xxxxxxxxxxxxxx'+ownerMaps);
            
            for(Lead l : Trigger.New)
            {
                System.debug('l.OwnerId ' +l.OwnerId);
                System.debug('Trigger.Oldmap.get(l.Id).OwnerId  ' +Trigger.Oldmap.get(l.Id).OwnerId);
               if(l.OwnerId != Trigger.Oldmap.get(l.Id).OwnerId)
               
                {
                   
                   
                   if(l.Previous_Owner_1__c == Null)
                      {
                          l.Previous_Owner_1__c = l.Original_Owner__c;
                      }
               else if(l.Previous_Owner_2__c == Null)      
                      {
                          l.Previous_Owner_2__c = l.Previous_Owner_1__c;
                          l.Previous_Owner_1__c = ownerMaps.get(Trigger.Oldmap.get(l.Id).OwnerId).name;
                      }    
               else if(l.Previous_Owner_3__c == Null)      
                      {
                          l.Previous_Owner_3__c = l.Previous_Owner_2__c;
                          l.Previous_Owner_2__c = l.Previous_Owner_1__c;
                          l.Previous_Owner_1__c = ownerMaps.get(Trigger.Oldmap.get(l.Id).OwnerId).name;
                      }    
                else 
                      {
                          l.Previous_Owner_3__c = l.Previous_Owner_2__c;
                          l.Previous_Owner_2__c = l.Previous_Owner_1__c;
                          system.debug('ccccccc' + Trigger.Oldmap.get(l.Id).OwnerId);
                        //  system.debug('dddd' + Trigger.Oldmap.get(l.Id).OwnerId);
                          l.Previous_Owner_1__c = ownerMaps.get(Trigger.Oldmap.get(l.Id).OwnerId).name;
                      }
               }       
             }         
            }          
                      
                      
}