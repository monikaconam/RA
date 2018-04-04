/*
CONAM-DS
Modified :

Added Opportunity Dedupe

Modified : 03/13/2015
Remove unqualified lead 

CONAM - NJ
MODIFIED :

Leads with status 'Unqualified' and 'Not Legitimate' are to be deleted from Priority Queue.

CONAM-DS
MODIFIED : 03/26/2015
REMOVED  FOLLOWING STATUS FROM LEAD
Duplicate – Customer
Duplicate – Lead
Lost – Incomplete Information
Lost – Language Barrier
Fraud
Not Legitimate
Not Interested – Do Not Contact
Requested Information Only
GTF – Initial Call Needed
Unqualified
Converted

*/



public class Queue_Sync {
   // To "sync" updates from Opportunities or Leads with the relevant Queue objects
   
   public static Boolean alreadyActed = false;   // Static to indicate whether or not this has performed an upsert so far

//   public static boolean hasActed() { return alreadyActed;  }
//   public static void markActed()   { alreadyActed = true;  }
   public static void clearActed()  { alreadyActed = false; }

   
      
      
   public static Boolean syncQueue(Sobject[] input) {
      if (alreadyActed == true) { return true; }
      else                      { alreadyActed = true; }
   
      List<Priority_Queue__c> toUpsert = new List<Priority_Queue__c>();
      Set<Id> lookupLeads = new Set<Id>();
      Set<Id> lookupOpps  = new Set<Id>();
      Set<Id> IgnoreIds   = new Set<Id>();
      Map<Id, Id> convertedLeads = new Map<Id, Id>();
      for (Sobject obj : input) {
         String thisID = (String)obj.get('Id');
         if      (thisID.substring(0, 3) == '006') { lookupOpps.add(thisID);  }  // Is an Opp
         else if (thisID.substring(0, 3) == '00Q') {
           if(((String)obj.get('Status')!='Unqualified') && ((String)obj.get('Status')!='Not Legitimate') && ((String)obj.get('Status')!='Duplicate – Customer')
           && ((String)obj.get('Status')!='Duplicate – Lead') && ((String)obj.get('Status')!='Lost – Incomplete Information') && ((String)obj.get('Status')!='Lost – Language Barrier')
           && ((String)obj.get('Status')!='Fraud') && ((String)obj.get('Status')!='Not Interested – Do Not Contact') && ((String)obj.get('Status')!='Requested Information Only')
           && ((String)obj.get('Status')!='GTF – Initial Call Needed') && ((String)obj.get('Status')!='Converted')) // added as Unqualified status was being displayed in Priority Queue
                lookupLeads.add(thisID);
            String convertedId = (String)obj.get('ConvertedOpportunityId');
            if (convertedId != NULL) { convertedLeads.put(thisID, convertedId); }   // Cache conv. value
         }  // Is a Lead
      }

      // Query for existing
      for (Priority_Queue__c pq : [SELECT Id, Lead__c, Opportunity__c, Run_Workflow__c FROM Priority_Queue__c
                                   WHERE Lead__c IN: lookupLeads OR Opportunity__c IN: lookupOpps]) {
         if (convertedLeads.get(pq.Lead__c) != NULL) { pq.Opportunity__c = convertedLeads.get(pq.Lead__c); }
         pq.Priority__c = NULL;   // Reset value so workflows can re-populate
         pq.Run_Workflow__c = true;
         toUpsert.add(pq);
         if (pq.Lead__c != NULL)        { IgnoreIds.add(pq.Lead__c); }
         if (pq.Opportunity__c != NULL) { IgnoreIds.add(pq.Opportunity__c); }
      }
      
      List<id> oAid=new List<id>();
      Set<id> accid=new Set<id>();
      set<id> delUqleadPQ=new set<id>();
      // Re-iterate through input objects, add to insert queue as needed
      for (Sobject obj : input) {
         String thisID = (String)obj.get('Id');
         if (IgnoreIds.contains(thisID) ) { continue; }  // Ignore
         Priority_Queue__c new_pq = new Priority_Queue__c();
         if      (thisID.substring(0, 3) == '006') {  // Is an Opp
            new_pq.Opportunity__c = thisID;
            new_pq.Name           = (String)obj.get('Name');
            
            oAid.add(thisID);
         }  
         else if (thisID.substring(0, 3) == '00Q') {  // Is a Lead
         System.debug('Lead '+ (String)obj.get('Status'));
             if(((String)obj.get('Status')!='Unqualified') && ((String)obj.get('Status')!='Not Legitimate') && ((String)obj.get('Status')!='Duplicate – Customer')
           && ((String)obj.get('Status')!='Duplicate – Lead') && ((String)obj.get('Status')!='Lost – Incomplete Information') && ((String)obj.get('Status')!='Lost – Language Barrier')
           && ((String)obj.get('Status')!='Fraud') && ((String)obj.get('Status')!='Not Interested – Do Not Contact') && ((String)obj.get('Status')!='Requested Information Only')
           && ((String)obj.get('Status')!='GTF – Initial Call Needed') && ((String)obj.get('Status')!='Converted'))
             {
                new_pq.Lead__c = thisID;         
                new_pq.Name    = (String)obj.get('Company');
             }
             else
             {
                 // delete the record from priority q if status is Unqualified or Not Legitimate
                  delUqleadPQ.add(thisID);
             }
         } 
         new_pq.Run_Workflow__c = true;
         toUpsert.add(new_pq);
      }
      
      if (toUpsert.size() > 0) {
         try { upsert toUpsert; }
         catch (Exception e) {  }
      }
      
      List<Priority_Queue__c> pqListdel=[select id from Priority_Queue__c where lead__c in : delUqleadPQ];
      System.debug(pqListdel);
      if(pqListdel.size()>0)
          delete pqListdel;
      
      Set<id> oppSet=new Set<id>();
     sYSTEM.DEBUG('oAid '+oAid);
      if(oAid.size()>0)
      {
          List<opportunity> oppListCopy=[select id,accountid,name,Funded_by_WC__c,createddate  from opportunity where id in : oAid order by createddate desc];
          integer counter=-1;
          System.debug('oppListCopy ' +oppListCopy);
          if(oppListCopy.size()>0)
          {
              for(Opportunity oppListTemp : oppListCopy)
              {
                  counter++;
                  Boolean bValue=false;
                 for(Integer i=counter;i<oppListCopy.size();i++)
                  {
                        
                       if(oppListTemp.id!= oppListCopy[i].id)
                       {       
                                    
                          //same name differnt account
                          if(oppListTemp.name== oppListCopy[i].name)
                          {
                              if(oppListTemp.accountid!= oppListCopy[i].accountid)  { bValue=true; }
                              else
                              {
                                  if(oppListTemp.createddate>oppListCopy[i].createddate)  {  bValue=true; }
                                  
                                  ELSE if(oppListTemp.createddate==oppListCopy[i].createddate) { bValue=true; oppSet.add(oppListCopy[i].id);   }
                                  else { bValue=false; }
                              
                              }
                          }
                          else { bValue=true; } //name is different so set value to true                        
                       }
                      
                  }
              
              } 
          } 
      }
      

      Set<id> setOppID=new Set<id>();
      setOppID.addAll(OAID);
      

      setOppID.removeAll(oppSet);
      
      List<Priority_Queue__c> pqDelOld=new List<Priority_Queue__c>();
      
      if(oppSet.size()>0) 
             pqDelOld=[select id from Priority_Queue__c where opportunity__C in : oppSet];
      
      if(pqDelOld.size()>0)
          delete  pqDelOld;  
        
      set<ID> pqDelete=new set<ID>();
      set<ID> oppDelete=new set<ID>();
      
      if(setOppID.size()>0)
      {
          List<opportunity> oppList=[select id,accountid,name,Funded_by_WC__c,createddate  from opportunity where id in : setOppID];
          if(oppList.size()>0)
            {
                System.debug('oppList' +oppList);
                for(opportunity oppListTemp : oppList)
                 {
                     accid.add(oppListTemp.accountid);
                 }
                  System.debug('accid ' +accid );
                 
                 list<Priority_Queue__c> pqRecords=[select id,opportunity__r.name,opportunity__r.accountid,opportunity__r.createddate from Priority_Queue__c where opportunity__r.accountid in : accid AND opportunity__C NOT in : setOppID and isdeleted=false ];
                 {
                     System.debug('pqRecords '+pqRecords);
                     System.debug('pqRecords '+pqRecords.size());
                     for(opportunity oppTemp : oppList)
                     {
                         for(Priority_Queue__c pqTemp : pqRecords)
                         {
                             if(oppTemp.accountid==pqTemp.opportunity__r.accountid) //&& (oppTemp.id==pqTemp.opportunity__c))
                             {
                                 System.debug('same account '+ oppTemp.accountid);
                                 if(oppTemp.name==pqTemp.opportunity__r.name)
                                 {
                                      if(oppTemp.createddate>pqTemp.opportunity__r.createddate)  pqDelete.add(pqTemp.id);
                                      else oppDelete.add(oppTemp.id);

                                 }
                             
                             }
                         
                         }

                     }
                 
                 
                 }
            
            }
            
         Set<Priority_Queue__c> pdDelSet=new Set<Priority_Queue__c>();
         List<Priority_Queue__c> pdDelList=new List<Priority_Queue__c>();
         
         System.debug('same pqDelete '+ pqDelete);
         System.debug('same oppDelete '+ oppDelete);   
         if(pqDelete.size()>0)   
           pdDelList=[select id from Priority_Queue__c where id in : pqDelete];
           
         if(oppDelete.size()>0)   
           pdDelList=[select id from Priority_Queue__c where opportunity__C in : oppDelete];  
       
       
        
        
        System.debug('same pdDelList '+ pdDelList);   
        //remove duplicates
        if(pdDelList.size()>0)
        {
            pdDelSet.addAll(pdDelList);
            List<Priority_Queue__c> pqListDelete=new List<Priority_Queue__c>(); 
            pqListDelete.addAll(pdDelSet);
            delete pqListDelete;
        }
      
      }        
   
      
    
          
      return true;
   }   // end syncQueue
}