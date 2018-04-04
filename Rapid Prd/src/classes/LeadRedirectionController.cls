public Class LeadRedirectionController
{
    public LeadRedirectionController(ApexPages.StandardController controller) 
    {
    }
    
    public PageReference loadPageByProfile()
    {
        Set<String> accessToVF=new Set<String>();
        String id = Apexpages.currentPage().getParameters().get('id');
        accessToVF.add('BD - Extended');
        accessToVF.add('BD Profile');
        PageReference p=null;
        User userProfileInfo=[Select
                                                profile.name
                                        from
                                                user
                                        where 
                                                id =: UserInfo.getUserId() Limit 1];
 
        if(id==null)
        {
             if(accessToVF.contains(userProfileInfo.profile.name))
             {
                 p=new PageReference('/apex/LeadPartnerCategoryEdit');
             }
             else
             {
                 p=new PageReference('/00Q/e?nooverride=1');
             }
            p.setRedirect(true);
        }
        else
        {
            if(accessToVF.contains(userProfileInfo.profile.name))
             {
                 p=new PageReference('/apex/LeadPartnerCategoryEdit?id='+id);
             }
             else
             {
                 p=new PageReference('/'+id+'/e?nooverride=1');
             }
             p.setRedirect(true);
        }
        return p;
    }
    
    public PageReference loadCloneByProfile()
    {
        Set<String> accessToVF=new Set<String>();
        String id = Apexpages.currentPage().getParameters().get('id');
        accessToVF.add('BD - Extended');
        accessToVF.add('BD Profile');
        PageReference p=null;
        User userProfileInfo=[Select
                                                profile.name
                                        from
                                                user
                                        where 
                                                id =: UserInfo.getUserId() Limit 1];
 
        if(id!=null)
        {
             if(accessToVF.contains(userProfileInfo.profile.name))
             {
                 p=new PageReference('/apex/LeadClone?parentId='+id);
             }
             else
             {
                 p=new PageReference('/'+id+'/e?nooverride=1&clone=1&retURL=%2F'+id);
             }
            p.setRedirect(true);
        }
        
        return p;
    }
}