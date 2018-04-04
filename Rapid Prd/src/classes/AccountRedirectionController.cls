public Class AccountRedirectionController
{
    public AccountRedirectionController(ApexPages.StandardController controller) 
    {
    }
    public PageReference loadPageByProfile()
    {
        Set<String> accessToVF=new Set<String>();
        String id = Apexpages.currentPage().getParameters().get('id');
        String RecordTypeId = Apexpages.currentpage().getparameters().get('RecordType');
        accessToVF.add('BD - Extended');
        PageReference p=null;
        User userProfileInfo=[Select
                                                profile.name
                                        from
                                                user
                                        where 
                                                id =: UserInfo.getUserId() Limit 1];
                                                
       System.debug(' NNNNNNNNNNNNNN '+ id);
       System.debug(' NNNNNNNNNNNNNN '+accessToVF.contains(userProfileInfo.profile.name)); 
        if(id==null)
        {
             if(accessToVF.contains(userProfileInfo.profile.name))
             {
                 p=new PageReference('/apex/AccountPartnerCategoryEdit');
             }
             else
             {
                 p=new PageReference('/001/e?nooverride=1&RecordType='+RecordTypeId);
             }
            p.setRedirect(true);
        }
        else
        {
            if(accessToVF.contains(userProfileInfo.profile.name))
             {
                 p=new PageReference('/apex/AccountPartnerCategoryEdit?id='+id);
             }
             else
             {
                 p=new PageReference('/'+id+'/e?nooverride=1&RecordType='+RecordTypeId);
             }
             p.setRedirect(true);
        }
        return p;
    }
}