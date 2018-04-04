trigger PurgeLeadName on Lead (before Insert, before update) {

    if(Trigger.isInsert)
    {
        PurgeNameHelper.cleanLeadCName(Trigger.new);
    }
    else
    {
        List<Lead> newList=new List<Lead>();
        for(Lead lTemp : Trigger.new)
        {
           /* if(((lTemp .name!=Trigger.oldMap.get(lTemp.id).name) || (lTemp.Purged_Company_Name__c=='' || 
                lTemp.Purged_Company_Name__c==null)) || ((lTemp.Legal_Business_name__c!=Trigger.oldMap.get(lTemp.id).Legal_Business_name__c) ||
                 (lTemp.Purged_Legal_Business_name__c=='' ||  lTemp.Purged_Legal_Business_name__c==null)))
                 */
            if((lTemp.name!=Trigger.oldMap.get(lTemp.id).name) || ((lTemp.Legal_Business_name__c!=Trigger.oldMap.get(lTemp.id).Legal_Business_name__c)
              || (lTemp.Purged_Legal_Business_name__c=='' ||  lTemp.Purged_Legal_Business_name__c==null)) || ((lTemp.Company!=Trigger.oldMap.get(lTemp.id).Company) ||
               (lTemp.Purged_Company_Name__c=='' || lTemp.Purged_Company_Name__c==null)))
            {
                newList.add(lTemp);
            }
        }
        PurgeNameHelper.cleanLeadCName(newList);
    }

}