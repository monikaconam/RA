trigger SetCAlendersFields on Partner_Category__c (after insert, after update) {
    
    if(Trigger.isInsert)
    {
        Map<id, Account> accMap=new Map<id, Account>();
        List<Account> accountList=new List<Account>();

        for(Partner_Category__c pTemp : Trigger.new)
        {
            if(pTemp.Partner_Account__c!=null)
            {
                Account acc;
                if(accMap.containskey(pTemp.Partner_Account__c))
                {
                    acc=accMap.get(pTemp.Partner_Account__c);
                }
                else
                {
                    acc=new Account(id=pTemp.Partner_Account__c);
                    acc.Category_Contains_Banks__c=false;
                    acc.Category_Contains_CUSO__c=false;
                    acc.Category_Contains_Credit_Union__c=false;
                }

                accMap.put(pTemp.Partner_Account__c,acc);
                
                if(accMap.containsKey(pTemp.Partner_Account__c))
                {
                    if(pTemp.name=='Banks')
                        acc.Category_Contains_Banks__c=true;
                
                    if(pTemp.name=='CUSO')
                            acc.Category_Contains_CUSO__c=true;
                            
                    if(pTemp.name=='Credit Unions')
                            acc.Category_Contains_Credit_Union__c=true;
                    
                    accMap.put(pTemp.Partner_Account__c,acc);
                }
            }
        }
        
        if(accMap.size()>0)
        {
            for(Id iTemp : accMap.keyset())
            {
                accountList.add(accMap.get(iTemp));
            }
        }
        
        if(accountList.size()>0)
            Database.update(accountList,false);
    }
        
    if(Trigger.isUpdate)
    {
        Map<id, Account> accMap=new Map<id, Account>();
        List<Account> accountList=new List<Account>();
        for(Partner_Category__c pTemp : Trigger.new)
        {
            if((pTemp.Partner_Account__c!=null) && (Trigger.oldMap.get(pTemp.id).Partner_Account__c!=pTemp.Partner_Account__c))
            {
                Account acc;
                if(accMap.containskey(pTemp.Partner_Account__c))
                {
                    acc=accMap.get(pTemp.Partner_Account__c);
                }
                else
                {
                    acc=new Account(id=pTemp.Partner_Account__c);
                    acc.Category_Contains_Banks__c=false;
                    acc.Category_Contains_CUSO__c=false;
                    acc.Category_Contains_Credit_Union__c=false;
                }
                
                accMap.put(pTemp.Partner_Account__c,acc);
                
                if(accMap.containsKey(pTemp.Partner_Account__c))
                {
                    if(pTemp.name=='Banks')
                        acc.Category_Contains_Banks__c=true;
                
                    if(pTemp.name=='CUSO')
                            acc.Category_Contains_CUSO__c=true;
                            
                    if(pTemp.name=='Credit Unions')
                            acc.Category_Contains_Credit_Union__c=true;
                    accMap.put(pTemp.Partner_Account__c,acc);
                }
            }
        }
        System.debug('>>>>>>>>'+accMap);
        
        if(accMap.size()>0)
        {
            for(Id iTemp : accMap.keyset())
            {
                accountList.add(accMap.get(iTemp));
            }
        }
        
        if(accountList.size()>0)
            Database.update(accountList,false);
    }
}