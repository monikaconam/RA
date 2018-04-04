public class BatchDNCScrubAllLead14asc implements DataBase.Batchable<SObject>, Database.AllowsCallouts
{   
    public DataBase.QueryLocator start(DataBase.BatchableContext bc)
    {
        String limits=String.valueOf(Limit_batch__c.getValues('BatchLeadDNC').Limit__c);
        //String phlimit=String.valueOf(Limit_batch__c.getValues('LengthOfPhone').Limit__c);
        String query='Select id, Scrubbed_With_DNC__c,phone, DNC_Response__c from Lead where isConverted=false and dnc_response__c=null  ';
        query+=' and Scrubbed_With_DNC__c=false and Phone!=null and Phone!=\'0\' and LengthOfPhone__c=14 and id!=\'00Q7000000nJtkcEAC\' ';
        query+=' and InValid_Number__C=false Order by createddate asc limit '+limits;

        return DataBase.getQueryLocator(query);
    }
    
    public void execute(DataBase.BatchableContext bc, List<Lead> scope)
    {
    try
        {
            String phoneList='';
            DNCLeadHandler dTemp =new DNCLeadHandler ();
            dTemp.eventType='Batch';
            for(Lead lTemp : scope)
            {
                if((lTemp.phone!=null)&&(lTemp.phone!=''))
                {
                    phoneList=phoneList+lTemp.phone+',';
                }
            }
             if(phoneList.length()>0)
            {
                phoneList=phoneList.subString(0,phoneList.length()-1);
                dTemp.phoneList=phoneList;
                System.enqueueJob(dtemp);
                
            }
        }
        catch(Exception e)
        {
            System.debug('An exception has occurred '+e.getMessage()+' at '+ e.getLineNumber());
        }
        
    }
    
    public void finish(DataBase.BatchableContext bc)
    {
    }
}