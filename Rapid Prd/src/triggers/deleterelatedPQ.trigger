trigger deleterelatedPQ on Lead (after update,before delete,after delete) {

    List<id> lID=new List<id>();
    //List<Priority_Queue__C> delPQList=new List<Priority_Queue__C>();
    try
    {
        if(Trigger.isBefore)
        {
            
            for(Lead lTemp : Trigger.old)
            {
                lID.add(lTemp.id);
            
            }
            System.debug('lID is  '+ lID);
            for(Priority_Queue__C pQ : [select id from Priority_Queue__C where lead__C in : lID])
            {
                deleterelatedPQHelperClass.delPQList.add(pQ);
            } 
            System.debug('delPQList  :'+ deleterelatedPQHelperClass.delPQList.SIZE()); 
        
        
        }
        
        if((Trigger.isAfter) && (Trigger.isDelete))
        {
           System.debug('delPQList 2 :'+ deleterelatedPQHelperClass.delPQList.SIZE()); 
            if(deleterelatedPQHelperClass.delPQList.size()>0)
                delete deleterelatedPQHelperClass.delPQList;
        }
        
         if((Trigger.isAfter) && (Trigger.isUpdate))
        {
           List<id> leadid=new List<id>();
           List<Priority_Queue__c> pcList=new List<Priority_Queue__c>();
           for(Lead lTemp : Trigger.new)
           {
               if(lTemp.isConverted==true)
               {
                   leadid.add(lTemp.id);
               }
           
           }
           
           for(Priority_Queue__c pcTemp: [select id from Priority_Queue__C where lead__C in : leadid])
           {
           
               pcList.add(pcTemp);
           }
           
           if(pcList.size()>0)
           {
              delete pcList;
           }
        }
    }
    catch(Exception e)     { System.debug('An exception :'+ e); }

}