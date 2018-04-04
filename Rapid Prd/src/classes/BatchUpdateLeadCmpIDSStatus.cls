public class BatchUpdateLeadCmpIDSStatus implements Database.Batchable<Sobject>,Database.stateful
{
    String sTemp='';
    Map<Id,String> cmpActivityMap=new Map<Id,String>();
    Set<Id> cmpActivityMapCpy=new Set<Id>();
    Map<Id,DataWrapper> cmpRecord=new Map<Id,DataWrapper>();
    Set<Id> leftoutCamp=new Set<Id>();
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Activity__c,name,createddate FROM Campaign where type=\'partners\' and activity_updated__c=false order by createddate desc');
    }
    
    public void execute(Database.BatchableContext bc, List<Campaign> scope)
    {
        Set<Id> campIdForOpp=new Set<Id>();
        Set<Id> campIds=new Set<Id>();
        Map<id, List<Opportunity>> campOppMap=new Map<id, List<Opportunity>>();
        Map<id, List<CampaignMember>> campLeadMap=new Map<id, List<CampaignMember>>();
        for(Campaign objCamp : scope)
        {
            campIdForOpp.add(objCamp.id);
        }
        System.debug(campIdForOpp);
        for(Opportunity opp : [SELECT  Id,createddate,closedate,stagename,campaignId FROM Opportunity where Renewal__c = false and campaignId in : campIdForOpp order by createddate desc])
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
        
        for(CampaignMember cTemp : [select id, campaignId,leadId,createddate from CampaignMember where campaignId in : campIdForOpp and leadID!=null order by createddate desc])
        {
            if(campLeadMap.containsKey(cTemp.campaignId))
            {
                campLeadMap.get(cTemp.campaignId).add(cTemp);
            }
            else
            {
                campLeadMap.put(cTemp.campaignId, new List<CampaignMember>{cTemp});
            }
        }
        for(Campaign objCamp : scope)
        {
            leftoutCamp.add(objCamp.id);
            Boolean isfirstLead=false;
            Integer counter=0;

            if(!campOppMap.containsKey(objCamp.id) && campLeadMap.containsKey(objCamp.id))
            {
                for(CampaignMember cTemp : campLeadMap.get(objCamp.id))
                {
                    Integer intDays =  cTemp.createddate.Date().daysBetween(System.now().Date());
                    if(!isfirstLead)
                    {
                        if(intDays>=60)
                        {
                            if(intDays>=120 )
                            {
                                if(cmpActivityMap.get(objCamp.id)!='Funding' && cmpActivityMap.get(objCamp.id)!='High Signing Activity')
                                {
                                    cmpActivityMap.put(objCamp.id,'Dormant');
                                    DataWrapper dw=new DataWrapper(cTemp.leadid,cTemp.createddate.date());
                                    cmpRecord.put(objCamp.id,dw);
                                    leftoutCamp.remove(objCamp.id);
                                }
                            }
                            else
                            {
                                if(cmpActivityMap.get(objCamp.id)!='Funding' && cmpActivityMap.get(objCamp.id)!='High Signing Activity')
                                {
                                    cmpActivityMap.put(objCamp.id,'Inactive');
                                    DataWrapper dw=new DataWrapper(cTemp.leadid,cTemp.createddate.date());
                                    cmpRecord.put(objCamp.id,dw);
                                    leftoutCamp.remove(objCamp.id);
                                }
                            }
                        }
                        isfirstLead=true;
                    }
                }
            }
            else if(!campOppMap.containsKey(objCamp.id) && !campLeadMap.containsKey(objCamp.id))
            {
                Integer intDays =  objCamp.createddate.Date().daysBetween(System.now().Date());
                if(intDays>=60)
                {
                    if(intDays>=120 )
                    {
                        cmpActivityMap.put(objCamp.id,'Dormant');
                        DataWrapper dw=new DataWrapper(null,objCamp.createddate.date());
                        cmpRecord.put(objCamp.id,dw);
                        leftoutCamp.remove(objCamp.id);
                    }
                    else
                    {
                        cmpActivityMap.put(objCamp.id,'Inactive');
                        DataWrapper dw=new DataWrapper(null,objCamp.createddate.date());
                        cmpRecord.put(objCamp.id,dw);
                        leftoutCamp.remove(objCamp.id);
                    }
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
            //System.debug(sTemp);
            msg.setHtmlBody(sTemp);
            msg.setSubject('Inactive');
            msg.setToAddresses(new List<String>{'deepak@conamtechnologies.com'});
            mailList.add(msg);
        }
        
        if(sTemp2!=null && sTemp2!='')
        {
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            //System.debug(sTemp);
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