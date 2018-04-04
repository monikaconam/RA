public class MainClass3 {

    public OppObject_Detail objOppDetail {get;set;}
    public Opportunity opp {get;set;}
    public Merchant__c mer {get;set;}
    public Sales_Check_List__c salesCheckList {get;set;}
    public list <OpportunityDetailTabs> objOpportunityDetail {get;set;}


    public MainClass3() 
    {
        InitializeClass();
    }

    public MainClass3(ApexPages.StandardController controller) 
    {
        InitializeClass();
    }

    public void InitializeClass() 
    {
        ID OppId = ApexPages.CurrentPage().getParameters().get('Id');
        objOppDetail = new OppObject_Detail('Opportunity Details', OppId);
        objOpportunityDetail = new list <OpportunityDetailTabs> ();

        List <PermissionSetAssignment> userPSA = [Select
                                                            Id, PermissionSetId, AssigneeId, SystemModstamp
                                                    From
                                                            PermissionSetAssignment
                                                    Where
                                                            AssigneeId = : UserInfo.getUserId()
                                                    AND
                                                            PermissionSet.profileId = NULL];
        if (userPSA.size()> 0)
        {
            List <PermissionSet> pSet = [Select
                                                Id, Label
                                        FROM
                                                PermissionSet
                                        Where
                                                Id = : userPSA[0].PermissionSetId];
                                    
            for (Opp_RD_Permission_Set__c orps: Opp_RD_Permission_Set__c.getAll().values())
            {
                if (IsPermissionsMatch(pSET[0].Label, orps))
                {
                    objOpportunityDetail.add(new OpportunityDetailTabs(orps.Vf_Page_Name__c, orps.Name, orps.tab_order__c));
                }
            }
            objOpportunityDetail.sort();

        }
        else 
        {
            objOpportunityDetail.add(new OpportunityDetailTabs('ErrorPage', 'Error Message', 0));
        }
    }

    private boolean IsPermissionsMatch(String permissionLabel, Opp_RD_Permission_Set__c orps) {
        boolean matched = false;
        System.debug(permissionLabel + ' pmkil ' + orps.QC_Exuser__c);
        if ((permissionLabel == 'Operations - Management (All)' && orps.Management__c == true) || 
            (permissionLabel == 'Operations - Pre-Qual' && orps.Pre_Qual__c == true) || 
            (permissionLabel == 'Operations - Processing' && orps.Processing_CS__c == true) || 
            (permissionLabel == 'Operations - QC' && orps.QC__c == true) || 
            (permissionLabel == 'Operations - UW' && orps.Underwriting__c == true) || 
            (permissionLabel == 'Promac - UW' && orps.Promac_UW__c == true) || 
            (permissionLabel == 'Operations - QC ExUser' && orps.QC_Exuser__c == true))
                matched = true;

        return matched;
    }

    public class OpportunityDetailTabs implements Comparable {
        public String oppId {get;set;}
        public String tabName {get;set;}
        public String vfPageName {get;set;}
        public Decimal tabOrder {get;set;}
        
        public OpportunityDetailTabs(String vfPageName, String tabName, Decimal tabOrder) {
            this.vfPageName = vfPageName;
            this.tabName = tabName;
            this.oppId = apexpages.currentpage().getparameters().get('Id');
            this.tabOrder = tabOrder;
        }

        public Integer compareTo(Object compareTo) {
            Integer result = 0;
            OpportunityDetailTabs oppTab = (OpportunityDetailTabs) compareTo;
            
            result=(this.tabOrder == oppTab.tabOrder) ? 0 : (this.tabOrder > oppTab.tabOrder) ? 1 : -1;
            return result; 

        }
    }
}