public with sharing class Five9ScreenPopController 
{

    public final Lead l;
    private String ANI;
    private String DNIS;
    public Boolean direct {
        get{
            if(direct == NULL){
                direct = False;
            }
            return direct;
        }
        set;
    }

    public Five9ScreenPopController() 
    {
        try{
            this.l = new Lead();
            this.ANI = ApexPages.currentPage().getParameters().get('ANI');
            this.DNIS = ApexPages.currentPage().getParameters().get('DNIS');
            Integer directParm = Integer.valueOf(ApexPages.currentPage().getParameters().get('Direct'));
            if(directParm == 1)
                this.direct = true;
            }catch(Exception e){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage());
                ApexPages.addmessage(myMsg);
            }
    }

    public PageReference saveAndRedirect()
    {
        if(!this.Direct)
        {
            try{

            this.l.LeadSource = 'Call-In';
            this.l.Company = 'Five9 Generated Lead';
            this.l.LastName = 'Five9 Generated Lead';
            if(this.ANI != NULL)
                this.l.phone = this.ANI;

            Schema.PicklistEntry[] statuses = Lead.fields.Status.getDescribe().getpicklistvalues();
            for(Schema.PicklistEntry st: statuses)//set status to inital call needed
            {
                if(st.isActive() && st.getValue() == 'Initial Call Needed')
                {
                    this.l.Status = st.getValue();
                    break;
                }
            }
            
            this.l.OwnerId = UserInfo.getUserId();

            insert this.l;
            if(this.DNIS != NULL)
            {
                System.debug('Looking up Campaign for DNIS: '+this.DNIS);
                String[] dp = this.DNIS.split('');
                dp.remove(0);
                String formattedDNIS = '('+dp[0]+dp[1]+dp[2]+') '+dp[3]+dp[4]+dp[5]+'-'+dp[6]+dp[7]+dp[8]+dp[9];
                System.debug('formatted DNIS: '+formattedDNIS);
                Campaign[] clist = [SELECT Id FROM Campaign WHERE Five9_DNIS__C IN (:this.DNIS, :formattedDNIS) LIMIT 1];
                System.debug('clist size: '+clist.size());
                if(clist.size() == 1 )
                {
                    System.debug('Campaign: '+clist[0]);
                    CampaignMember cm = new CampaignMember();
                    cm.LeadId = this.l.id;
                    cm.CampaignId = clist[0].Id;
                    insert cm;
                }

            }

            PageReference destination = new PageReference('/'+this.l.Id+'/e?retURL=/'+this.l.Id);
            return destination;
            }catch(Exception e){
                    System.debug(e.getStackTraceString());
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage());
                    ApexPages.addmessage(myMsg);                   
                    return null;
                }
        }else{
            PageReference destination = new PageReference('/00Q/e');
            return destination;
        }
    }


}