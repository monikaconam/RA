trigger SendLeadRequestToDNC on Lead (before insert, before update) 
{
    String phoneList='';
    DNCLeadHandler dTemp =new DNCLeadHandler ();
    if(Trigger.isInsert)
    {
        dTemp.eventType='Insert';
        for(Lead lTemp : Trigger.new)
        {
            if((lTemp.phone!=null)&&(lTemp.phone!=''))
            {
                phoneList=phoneList+lTemp.phone+',';
            }
        }
    }
    else
    {
        dTemp.eventType='Update';
        for(Lead lTemp : Trigger.new)
        {
            if(Trigger.oldMap.get(lTemp.id).phone!=lTemp.phone)
            {
                if((((lTemp.phone!=null)&&(lTemp.phone!='')) || (lTemp.phone!=Trigger.oldMap.get(lTemp.id).phone)) || 
                ((lTemp.state!=Trigger.oldMap.get(lTemp.id).state) && (lTemp.state!=null) && (lTemp.state!='')))
                {
                    phoneList=phoneList+lTemp.phone+',';
                }
                /*else
                {
                   lTemp.Scrubbed_With_DNC__c=false;
                   lTemp.Number_can_be_called__c =false;
                }*/
                
            }
        }
    }
    
    if(phoneList.length()>0)
    {
        phoneList=phoneList.subString(0,phoneList.length()-1);
       
        dTemp.phoneList=phoneList;
        System.enqueueJob(dtemp);
        
    }
    
    

}