public with sharing class CheckPermission {

    String oppId;
    List<PermissionSet> permissionList;
    List<PermissionSetAssignment> permissionAssignList;
 

    public CheckPermission(ApexPages.StandardController controller)
    {
        oppId = Apexpages.Currentpage().getParameters().get('id');
        List<String> permisionSets = new List<String>{
                'Operations_Management_All',
                'Operations_Pre_Qual',
                'Operations_Processing',
                'Operations_QC',
                'Operations_UW',
                'Promac_UW2',
                'Operations_QC_ExUser'
                };
                
        String userId = UserInfo.getUserId();
        List<String> permissionIDList = new List<String>();
        List<String> permissionIDAssignList = new List<String>();
        permissionList = [Select 
                                Label,Name,Id from PermissionSet 
                          where 
                                Name 
                          IN 
                                : permisionSets];
        System.debug('...permissionList...'+permissionList);                         
        permissionAssignList = [SELECT 
                                        Id,permissionSetid 
                                FROM 
                                        PermissionSetAssignment
                                WHERE 
                                        AssigneeId =: userId];
        System.debug('...permissionAssignList...'+permissionAssignList);                                                
    }

    public Pagereference doAction()
    {
        PageReference pageRef = null;       
        if(permissionAssignList.size() >0 && permissionList.size() > 0)         
        {       
            for(PermissionSet perList : permissionList) 
            {
                for(PermissionSetAssignment perAssign : permissionAssignList)
                {
                    if(perList.Id == perAssign.permissionSetid)
                    {
                        System.debug('in true...');                     
                        pageRef = new PageReference('/apex/MainPageResizable?Id='+oppId);    
                        pageRef.setRedirect(true);                      
                        return pageRef;
                    }                       
                }
            }
            String retURL = ApexPages.CurrentPage().getParameters().get('retURL');
            if(retURL == null)
            {
                retURL = oppId;
            }
            pageRef = new PageReference('/'+oppId+'/e?nooverride=1&retURL=%2F'+retURL);        
            pageRef.setRedirect(true);          
        }
        return pageRef;
    }
}