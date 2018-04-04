/*
@Name            : UpdateOppAccConTri 
@Date            : June 23, 2015
@Description     : Change the ownership of parent Account and corresponding Contacts when an opportunity is created and the criteria
                   is met. 
                    1. The Opportunity should have the flag "Most_Recent_Opp__c" as checked. 
                    2. The owner of Opportunity (after any update) should be different then the corresponding Account Owner.
@Created By      : MK-ConAm 
@revision history : Removed after insert event
                    The owner would only change when the opportunity owner changes.
*/

trigger UpdateOppAccConTri ON Opportunity(after update)
{
 
    list<Account> accUpdateList = new list<Account>();
    list<Account> accUpdateListNew = new list<Account>();
    list<Contact> conUpdateList = new list<Contact>(); 
    list<Contact> conUpdateListNew= new list<Contact>(); 
    //Id oppRecTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('GreenTree').getRecordTypeId();
    //ID campaignID=[select id from campaign where name='Green Tree Funding' limit 1].id;
    
    Set<id> accIdSet=new Set<id>();
    Set<id> conIdSet=new Set<id>();
    Set<Opportunity> oppSet=new Set<Opportunity >();
    
    for(Opportunity opp : trigger.new)
    {
        if(opp.accountId!=null)
        {
            accIdSet.add(opp.accountId);
            oppSet.add(opp);
        }
    }
    
    
    Map<id,Account> accMap=new Map<id,Account>([select ownerid, id,(select id, ownerId from contacts) from account where id in : accIdSet]);   
   
    Map<id,Account> oppMapAcc=new Map<id,Account>();
    
    for(Opportunity oTemp : oppSet)
    {
        if(oTemp.accountid!=null)
            oppMapAcc.put(oTemp.id,accMap.get(oTemp.accountId));
    
    }
    
    
    for(Opportunity opp : trigger.new)
    {           
                     
            if(Trigger.Isupdate)
            {
               
               if(opp.Most_Recent_Opp__c==1)
               {
                  if(opp.AccountId != null) 
                  {            
                   if((opp.ownerId!=oppMapAcc.get(opp.id).ownerID) && (opp.ownerId!=Trigger.oldMap.get(opp.id).OwnerId))
                    {
                        Id accTempId=opp.AccountId;
                        accUpdateList.add(new Account(id=accTempId,ownerID=opp.ownerID));
                    }
                    for(contact cTemp : accMap.get(opp.accountID).contacts)
                        {
                            cTemp.ownerID=opp.OwnerId;
                            conUpdateList.add(cTemp);
                        }
                  }
                  
                 }
               
                // if opportunity is related to account later on
               /*if((opp.Most_Recent_Opp__c==0) && (opp.AccountId!=NULL)&& (trigger.oldMap.get(opp.id).accountId==null))
                {
                    if(opp.ownerId!=oppMapAcc.get(opp.id).ownerID)
                    {
                        Account acc=new Account();
                        acc.Id=opp.AccountId;
                        acc.OwnerId = opp.OwnerId;
                        accUpdateList.add(acc);
                    }
                    for(contact cTemp : accMap.get(opp.accountID).contacts)
                        {
                            cTemp.ownerID=opp.OwnerId;
                            conUpdateList.add(cTemp);
                        }
                
                }
              */
            
            } 
             
         }

    
    System.debug('ACcc list '+accUpdateList);
     System.debug('Con list '+conUpdateList);
    
    // if bulk insert then we need to remove the duplicate account ids
    Map<id,account> removeAccDup=new Map<id,account>();
    Map<id,contact> removeConDup=new Map<id,contact>();
    if(!accUpdateList.isEmpty())
    {
        for(Account accTemp : accUpdateList)
        {
            removeAccDup.put(accTemp.id,accTemp);
        }
    }
    
    if(!conUpdateList.isEmpty())
    {
        for(Contact conTemp : conUpdateList)
        {
            removeConDup.put(conTemp.id,conTemp );
        }
    }
    
    for(id iTemp : removeAccDup.keyset())
        accUpdateListNew.add(removeAccDup.get(itemp));
    
    for(id iTemp : removeConDup.keyset())
        conUpdateListNew.add(removeConDup.get(itemp));
    
    
    
    
    if(!accUpdateListNew.isEmpty())
        database.update(accUpdateListNew, false);
    if(!conUpdateListNew.isEmpty())
        database.update(conUpdateListNew, false);
 
}