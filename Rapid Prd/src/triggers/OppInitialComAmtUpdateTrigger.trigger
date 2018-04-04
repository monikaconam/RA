trigger OppInitialComAmtUpdateTrigger on Opportunity (after update) 
{
    /*
    if(Trigger.isUpdate)
    {
        Set<Id> oppId = new Set<Id>();
        Map<Id,Opportunity> oldMapOpp = new Map<Id,Opportunity>();
        List<Opportunity> newOppList = new List<Opportunity>();
    
        for(Opportunity opp :Trigger.new){
            if(((Trigger.oldMap.get(opp.id).GTF_Initial_Commission__c!=opp.GTF_Initial_Commission__c) && (opp.GTF_Initial_Commission__c!=null)) || ((Trigger.oldMap.get(opp.id).Renewal_Funded_Amount__c!=opp.Renewal_Funded_Amount__c) && (opp.Renewal_Funded_Amount__c!=null )))
                    oppId.add(opp.Id);
                    
        }
        
        if(oppId.size()>0)
        {
            List<Green_Tree_Oppy_Extension__c> newGTList = [Select
                                                                    id, Amount__c , Amount_Sold__c, Opportunity__c
                                                               from 
                                                                   Green_Tree_Oppy_Extension__c
                                                               where 
                                                                   Opportunity__c IN : oppId LIMIT 1]; 
                                                               
            List<Opportunity> oppList = [Select 
                                            Id, Renewal_Funded_Amount__c , Initial_Commission_Amount_New__c ,GTF_Initial_Commission__c
                                         from 
                                             Opportunity 
                                         where 
                                             Id In : oppId];       
                                         
            for(Opportunity oldOpp : Trigger.old){     
                oldMapOpp.put(oldOpp.Id, oldOpp);
            } 
            
            if(newGTList.size()>0)
            {
                for(Opportunity newOpp : oppList)
                {
                    Double amt=(newGTList.get(0).Amount__c==null)?0: newGTList.get(0).Amount__c;
                    Double amtSold=(newGTList.get(0).Amount_Sold__c==null)?0: newGTList.get(0).Amount_Sold__c;
                    Double percentage=(newOpp.GTF_Initial_Commission__c==null || newOpp.GTF_Initial_Commission__c==0)?
                                        0: newOpp.GTF_Initial_Commission__c;
                    Double refundAmt=(newOpp.Renewal_Funded_Amount__c==null || newOpp.Renewal_Funded_Amount__c==0) ?
                                       0: newOpp.Renewal_Funded_Amount__c;
                    
                    System.debug('amt'  +amt); 
                    System.debug('amtSold'  +amtSold);                
                    if(  ((Trigger.oldMap.get(newOpp.id).GTF_Initial_Commission__c!=newOpp.GTF_Initial_Commission__c) && (newOpp.GTF_Initial_Commission__c!=null)) || ((Trigger.oldMap.get(newOpp.id).Renewal_Funded_Amount__c!=newOpp.Renewal_Funded_Amount__c) && (newOpp.Renewal_Funded_Amount__c!=null )))
                    {
                        if(newOpp.GTF_Commission_Basis__c == 'Advance' )
                        {
                            newOpp.Initial_Commission_Amount_New__c = amt * (percentage/100) ;
                            System.debug('newOpp.Initial_Commission_Amount_New__c Advance'+newOpp.Initial_Commission_Amount_New__c);
                        }
                        
                        else if(newOpp.GTF_Commission_Basis__c == 'Payback' )
                        {
                                newOpp.Initial_Commission_Amount_New__c = amtSold * (percentage/100) ;
                            System.debug('newOpp.Initial_Commission_Amount_New__c Payback'+newOpp.Initial_Commission_Amount_New__c);
                        }
                        
                        else if(newOpp.GTF_Commission_Basis__c == 'Renewal' )
                        {
                                newOpp.Initial_Commission_Amount_New__c =  refundAmt * (percentage/100) ;
                            System.debug('newOpp.Initial_Commission_Amount_New__c Renewal'+newOpp.Initial_Commission_Amount_New__c);
                        }
                        else{
                            newOpp.Initial_Commission_Amount_New__c=(amtSold - amt) * (percentage/100);
                           System.debug('newOpp.Initial_Commission_Amount_New__c other'+newOpp.Initial_Commission_Amount_New__c);
                        }
                        
                        newOppList.add(newOpp);
                        System.debug('newOppList'+newOppList);
                    }         
                }
                if( newOppList.Size() > 0){
                System.debug('newOppList.Size()'+newOppList.Size());
                    Database.Update(newOppList,false);
                }
            }    
        }       
    }*/
}