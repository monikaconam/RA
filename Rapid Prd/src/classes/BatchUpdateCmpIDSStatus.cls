/*
	Batch Size should always be 1 for this batch
*/
public class BatchUpdateCmpIDSStatus implements Database.Batchable<Sobject>,Database.stateful
{
    String sTemp='';
    Map<Id,String> cmpActivityMap=new Map<Id,String>();
    Set<Id> cmpActivityMapCpy=new Set<Id>();
    Map<Id,DataWrapper> cmpRecord=new Map<Id,DataWrapper>();
    Set<Id> leftoutCamp=new Set<Id>();
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        //return Database.getQueryLocator('SELECT Id,Activity__c,name FROM Campaign where type=\'partners\' order by createddate desc');
        return Database.getQueryLocator('SELECT Id,Activity__c,name FROM Campaign where type=\'partners\' and activity_updated__c=false order by createddate desc');
    }
    
    public void execute(Database.BatchableContext bc, List<Campaign> scope)
    {
        Set<Id> campIdForOpp=new Set<Id>();
        Set<Id> campIds=new Set<Id>();
        Map<id, List<Opportunity>> campOppMap=new Map<id, List<Opportunity>>();
        for(Campaign objCamp : scope)
        {
            campIdForOpp.add(objCamp.id);
        }
        System.debug(campIdForOpp);
        for(Opportunity opp : [SELECT Id,createddate,closedate,stagename,campaignId FROM Opportunity where Renewal__c = false and campaignId in : campIdForOpp order by createddate desc Limit 10000])
        {
            if(campOppMap.containsKey(opp.campaignId))
            {
                campOppMap.get(opp.campaignId).add(opp );
            }
            else
            {
                campOppMap.put(opp.campaignId, new List<Opportunity>{opp});
            }
        }
        for(Campaign objCamp : scope)
        {
            leftoutCamp.add(objCamp.id);
            Boolean isfirstOpportunity=false;
            Integer counter=0;
            
            if(campOppMap.containsKey(objCamp.id))
            {
                for(Opportunity opp : campOppMap.get(objCamp.id))
                {
                    Integer intDays =  opp.createddate.Date().daysBetween(System.now().Date());
                    if(!isfirstOpportunity && opp.StageName!='Closed Won')
                    {
                        if(intDays>=60)
                        {
                            //sTemp+=objCamp.id;
                            if(intDays>=120 )
                            {
                                //System.debug('Campaign '+objCamp.id+'>>>>>'+'Dormant');
                                //sTemp+=',Dormant'+'<br/>';
                                if(cmpActivityMap.get(objCamp.id)!='Funding' && cmpActivityMap.get(objCamp.id)!='High Signing Activity')
                                {
                                    cmpActivityMap.put(objCamp.id,'Dormant');
                                    DataWrapper dw=new DataWrapper(opp.id,opp.createddate.date());
                                    cmpRecord.put(objCamp.id,dw);
                                    leftoutCamp.remove(objCamp.id);
                                }
                            }
                            else
                            {
                                //System.debug('Campaign '+objCamp.id+'>>>>>'+'Inactive');
                                if(cmpActivityMap.get(objCamp.id)!='Funding' && cmpActivityMap.get(objCamp.id)!='High Signing Activity')
                                {
                                    cmpActivityMap.put(objCamp.id,'Inactive');
                                    DataWrapper dw=new DataWrapper(opp.id,opp.createddate.date());
                                    cmpRecord.put(objCamp.id,dw);
                                    leftoutCamp.remove(objCamp.id);
                                }
                            }
                        }
                        else if(intDays<60)
                        {
                            cmpActivityMap.put(objCamp.id,'Submitting');
                            DataWrapper dw=new DataWrapper(opp.id,opp.createddate.date());
                            cmpRecord.put(objCamp.id,dw);
                            leftoutCamp.remove(objCamp.id);
                        }
                        isfirstOpportunity=true;
                    }
                    
                    if(opp.Stagename=='Closed Won')
                    {
                        integer diffDays =  opp.closedate.daysBetween(System.now().Date());
                        //System.debug(opp.id+'---2 -->'+diffDays);
                        if(diffDays<=30)
                        {
                            counter++;
                        }
                    }
                }
            }
            
            if(counter>=1 && counter<5)
            {
                cmpActivityMap.put(objCamp.id,'Funding');
                cmpRecord.put(objCamp.id,null);
                leftoutCamp.remove(objCamp.id);
            }
            else if(counter>=5)
            {
                cmpActivityMap.put(objCamp.id,'High Signing Activity');
                cmpRecord.put(objCamp.id,null);
                leftoutCamp.remove(objCamp.id);
            }
        }
        if(cmpActivityMap.size()>0)
        {           
            for(CampaignMember cTemp : [select id, campaignId,leadId,createddate from CampaignMember where campaignId in : cmpActivityMap.keyset() and leadID!=null order by createddate Limit 10000])
            {
                if(cmpActivityMap.containsKey(cTemp.campaignId))
                {
                    if(cmpActivityMap.get(cTemp.campaignId)!='Funding' && cmpActivityMap.get(cTemp.campaignId)!='High Signing Activity')
                    {
                        if(cTemp.createddate.Date().daysBetween(System.now().Date())<60)
                        {
                            //System.debug(cTemp.leadId+'>>>>>>>>>>>>'+cTemp.createddate.Date()+'>>>>>>>>>>'+(cTemp.createddate.Date().daysBetween(System.now().Date())<60));
                            //System.debug(cmpActivityMap.get(cTemp.campaignId));
                            cmpActivityMap.put(cTemp.campaignId,'Submitting');
                            DataWrapper dw=new DataWrapper(cTemp.leadId,cTemp.createddate.date());
                            cmpRecord.put(cTemp.campaignId,dw);
                            leftoutCamp.remove(cTemp.campaignId);
                        }
                    }
                }
            }
        }
        
        if(cmpActivityMap.size()>0)
        {
            for(Campaign objCamp : [SELECT Id,Activity__c,name,(SELECT  Id,createddate,closedate FROM Opportunities where stagename='Closed Won' and Renewal__c = false order by closedate desc) FROM Campaign where type='partners' and id=: cmpActivityMap.keyset() order by id])
            {
                Integer counter=0;
                for(Opportunity opp : objCamp.Opportunities)
                {
                    integer intDays =  opp.closedate.daysBetween(System.now().Date());                   
                    if(intDays<=30)
                    {
                        counter++;
                    }
                }
                if(counter>1 && counter<5)
                {
                    cmpActivityMap.put(objCamp.id,'Funding');
                    //DataWrapper dw=new DataWrapper(opp.id,opp.Funded_by_WC__c.date());
                    cmpRecord.put(objCamp.id,null);
                    leftoutCamp.remove(objCamp.id);
                }
                else if(counter>=5)
                {
                    cmpActivityMap.put(objCamp.id,'High Signing Activity');
                    //DataWrapper dw=new DataWrapper(opp.id,opp.Funded_by_WC__c.date());
                    cmpRecord.put(objCamp.id,null);
                    leftoutCamp.remove(objCamp.id);
                }
            }
        }    
    }
    
    public void finish(Database.BatchableContext bc)
    {
        Map<id,Campaign> allCamp=new Map<id,Campaign> ([select id, name from campaign where id in : cmpActivityMap.keyset()]);
        String sTEmp2='';
        
        List<Messaging.SingleEmailMessage> mailList=new List<Messaging.SingleEmailMessage>();
        for(Id iTemp : cmpActivityMap.keyset())
        {
            //System.debug(iTemp +'>>>>>>'+allCamp.get(iTemp)+'>>>>>'+cmpActivityMap.get(iTemp)+'>>>>>'+cmpRecord.get(iTemp));
            sTemp+=allCamp.get(iTemp).name.replace(',','')+','+itemp+','+cmpActivityMap.get(iTemp);
            if(cmpRecord.get(iTemp)!=null)
                stemp=stemp+','+cmpRecord.get(iTemp).recordId+','+cmpRecord.get(iTemp).createdon+'<br/>';
            else
                stemp+='<br/>';
        }
        
        for(Campaign cTemp : [Select id,name,Activity__c,createddate from Campaign where id in : leftoutCamp ])
        {
            sTemp2+=cTemp.name.replace(',','')+','+cTemp.id+','+cTemp.Activity__c+','+cTemp.createddate +'<br/>';
        }

        if(sTemp!=null && sTemp!='')
        {
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            msg.setHtmlBody(sTemp);
            msg.setSubject('Inactive');
            msg.setToAddresses(new List<String>{'deepak@conamtechnologies.com'});
            mailList.add(msg);
        }
        
        if(sTemp2!=null && sTemp2!='')
        {
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            msg.setHtmlBody(sTemp2);
            msg.setSubject('left');
            msg.setToAddresses(new List<String>{'deepak@conamtechnologies.com'});
            mailList.add(msg);
        }
        Messaging.sendEmail(mailList);
    }
    public class DataWrapper
    {
        public Id recordId;
        public date createdon;
        public DataWrapper(Id recordId,date createdon)
        {
            this.recordId=recordId;
            this.createdon=createdon;
        }
    }
}