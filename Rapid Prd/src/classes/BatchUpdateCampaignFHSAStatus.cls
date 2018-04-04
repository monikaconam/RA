public class BatchUpdateCampaignFHSAStatus implements Database.Batchable<Sobject>,Database.stateful
{
    Map<Id,String> campMap=new Map<Id,String>();
    
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Activity__c,name,Funding_Partner_Date__c,(SELECT  Id,Funded_by_WC__c,closedate FROM Opportunities where StageName = \'Closed Won\' order by createddate desc) FROM Campaign where type=\'partners\' order by id');
    }
    
    public void execute(Database.BatchableContext bc, List<Campaign> scope)
    {
        Map<Id,String> campMap=new Map<Id,String>();

        for(Campaign objCamp : scope)
        {
            Integer count=0;
            for( Opportunity opp : objCamp.Opportunities)
            {
                /*if( opp.Funded_by_WC__c>= objCamp.Funding_Partner_Date__c  && opp.Funded_by_WC__c<= objCamp.Funding_Partner_Date__c.addDays(30)){
                    count++;  
                }
                */
                System.debug(opp.Funded_by_WC__c+'>>>>'+(opp.Funded_by_WC__c<= System.now())+'>>>>>'+(opp.Funded_by_WC__c>= System.now().addDays(-30))+'>>>>>'+System.now().addDays(-30));
                if( opp.closedate <= System.now()   && opp.closedate >= System.now().addDays(-30)){
                    count++;  
                }
            }
            
            if(count==0)
            {
                campMap.put(objCamp.id,'Inactive');
            }
            else if(count>0 && count<5)
            {
                campMap.put(objCamp.id,'Funding');
            }
            else if(count>=5 )
            {
                campMap.put(objCamp.id,'High Signing Activity');
            }
        }
    }
    
    public void finish(Database.BatchableContext bc)
    {
        String sTemp='';
        
        if(campMap.size()>0)
        {
            Map<id,Campaign> allCamp=new Map<id,Campaign> ([select id, name from campaign where id in : campMap.keyset()]);
            for(Id iTemp : campMap.keyset())
            {
                sTemp+=allCamp.get(iTemp).name.replace(',','')+','+itemp+','+campMap.get(iTemp)+'<br/>';
            }
        }
        if(sTemp!=null && sTemp!='')
        {
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            System.debug(sTemp);
            msg.setHtmlBody(sTemp);
            msg.setSubject('Funding/Inactive/HSA');
            msg.setToAddresses(new List<String>{'deepak@conamtechnologies.com'});
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{msg});
        }            
    }
}