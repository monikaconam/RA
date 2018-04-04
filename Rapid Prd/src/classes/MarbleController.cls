public Class MarbleController
{

    public String var{get;set;}
    public MarbleController(ApexPages.StandardController sc)
    {

    }
    
    public PageReference isNewAllowed()
    {
        Map<String, String> pageParams = ApexPages.CurrentPage().getParameters();
        system.debug(pageParams);
        PageReference p=null;
        system.debug(p);
        var='failure';
        Id sysProfileId=[Select
                                id
                        from
                                Profile
                        Where
                                name='System Administrator' Limit 1].id;
        Id currentUserProfileId=UserInfo.getProfileId();
        system.debug(sysProfileId+'>>>> '+currentUserProfileId);
        String prefix=Marble__c.sobjecttype.getDescribe().getKeyPrefix();
        if(sysProfileId==currentUserProfileId)
        {
            String url='/'+prefix+'/e?nooverride=1';
            if(pageParams.containsKey('retURL'))
            {
                String recId=pageParams.get('retURL').split('/')[1];
                system.debug(recId);
                if(recId!=null)
                {
                    List<Opportunity> opp=[Select id, name,account.name,accountId from Opportunity where id=: recId Limit 1];
                    List<Marble__c> mTemp=[Select id from Marble__c where Opportunity_Reference__c=:recId Limit 1];
                    if(mTemp.size()>0)
                    {
                        var='marble found';
                    }
                    else
                    {
                        if(opp!=null && opp.size()>0)
                        {
                            url=url+'&CF00N390000047jtQ='+opp.get(0).name+'&CF00N390000047jtQ_lkid='+opp.get(0).id;//&retURL=%2F'+opp.id;
                            if(opp.get(0).accountId!=null)
                                url=url+'&CF00N1g000000asCc='+opp.get(0).account.name+'&CF00N1g000000asCc_lkid='+opp.get(0).account.name;
                            
                            url=url+'&retURL=%2F'+opp.get(0).id;
                        }
                        var='success';
                        p=new PageReference(url).setRedirect(true);
                    }
                }
                    
            }
            //var='success';
            //p=new PageReference(url).setRedirect(true);
        }
        else
        {
            //p=new PageReference('/'+prefix+'?fcf=00B39000008AKSv').setRedirect(true);
        }
        system.debug(var);
         return p;
    }
}