trigger deleterelatedPQOnOpp on Opportunity (before delete,after delete,before update,after update) {
/*
    List<id> oID=new List<id>();

    try
    {
        if(Trigger.isBefore)
        {
            if(Trigger.isDelete)
            {
                for(Opportunity  oTemp : Trigger.old)
                {
                    oID.add(oTemp.id);
                
                }
              
                for(Priority_Queue__C pQ : [select id from Priority_Queue__C where opportunity__C in : oID]) deleterelatedPQHelperClass.delPQListOpp.add(pQ);        
            }
            if(Trigger.isUpdate)
            {    
               // if(Trigger.oldMap.get()
                
               // List<opportunity> oppList=
            
            }
        
        }
        
        if(Trigger.isAfter)
        {
             if(Trigger.isDelete)
            {
                if(deleterelatedPQHelperClass.delPQListOpp.size()>0)  delete deleterelatedPQHelperClass.delPQListOpp;
            }
            if(Trigger.isUpdate)
            {
                List<id> iTemp=new List<id>();
                List<id> uTemp=new List<id>();
                List<user> upUserList=new List<user>();
                for(Opportunity  oppListTemp :Trigger.new)
                {
                    iTemp.add(oppListTemp.id);
                }
                
                for(id icounter : iTemp)
                {
                    if((Trigger.OldMap.get(icounter). QC User__C!=null) && (Trigger.newMap.get(icounter). QC User__C==null))
                        uTemp.add(Trigger.OldMap.get(icounter). QC User__C);
                        
                }
                
                List<user> uList=[select id, current_qc_deal__C from user where id in : uTemp];
                
                for(User uListTemp : uList)
                {
                    uListTemp.current_qc_deal__C=false;
                    upUserList.add(uListTemp);
                }
                
                if(upUserList.size()>0)
                    update upUserList;
            }
        }
       
    }
    catch(Exception e)
    { System.debug('An exception :'+ e); }
*/
}