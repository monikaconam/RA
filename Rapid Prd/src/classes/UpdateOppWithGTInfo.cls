public class UpdateOppWithGTInfo
{

    @future(Callout=true)
    public static void updateOpportunity(List<String> oppId)
    {
        System.debug('oppp id is  '+oppId);
        Map<id, opportunity> oppMap=new Map<id, opportunity>([select 
                                                                id,recordtypeid from opportunity 
                                                              where
                                                                id in : oppId]);
        id recTypeId=[select id from recordtype where sobjecttype='Opportunity' and developername='Locked_Opportunity'].id;
        List<opportunity> upOpp=new List<opportunity>();
        
        if(oppMap.size()>0)
        {
            for(Id oppKey : oppMap.keyset())
            {
                Opportunity opp=oppMap.get(oppKey);
               // Opp.Green Tree_Converted_Date__c=System.now();
                system.debug('existing rec '+Opp.recordtypeid);      
                Opp.recordtypeid= recTypeId;  
                
                system.debug('new rec '+recTypeId);             
                upOpp.add(Opp);
             }
             if(upOpp.size()>0)
             {
                try
                {
                    update upOpp;
                }
                catch(Exception e)
                {
                    system.debug('An exception  '+ e.getMessage()+' - '+e.getLineNumber());
                }
            }
        }
    
    }
    
    
    public Static void sendEmail(Set<ID> oppSet)
    {
        Set<id> oppID=new Set<id>();
        List<Opportunity> oppList=[select id from opportunity where id in :oppSet]; 
        List<EmailTemplate> eId=[select id from emailtemplate where name='GTF Decline Opp Alert New' and isactive=true];
        List<user> emailUser=[select id from user where username='rapid@conamtechnologies.com.conam' and isactive=true];
        List<Messaging.SingleEmailMessage> msglist = new List<Messaging.SingleEmailMessage>();
        if((eId.size()>0)&& (emailUser.size()>0))
        {
            for(Opportunity oppTemp : oppList)
            {
                //oppID.add(oppTemp.id);
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                msg.setTemplateId(eId.get(0).id);
                msg.setToAddresses(new String[] {'rapid@conamtechnologies.com'});
                msg.setTargetObjectId(emailUser.get(0).id);
                msg.setWhatId(oppTemp.id);
                msg.setSaveAsActivity(false);
                msglist.add(msg);
                
            }
            
            if(msglist.size()>0)
            {
                Messaging.sendEmail(msglist);
            }
        }   
    }
}