@isTest
private class TestMainClass3_Ctrl {

    @testSetup static void setup()
    {
        Account acc = new Account();
        acc.name = 'Test Account1';
        acc.BusinessType__c = 'testBusiness';
        insert acc;

        Campaign cm = new Campaign();
        cm.name = 'Test';
        cm.type = 'Internet';
        insert cm;

        Opportunity opp = new Opportunity();
        opp.name = 'testOpportunity';
        opp.leadSource = 'web';
        opp.stageName = 'Prospecting';
        opp.closeDate = System.today() + 20;
        opp.campaignId = cm.Id;
        opp.Current_Processor__c = 'Abanco INTERNATIONAL';
        opp.closeDate = System.today() + 50;
        opp.accountId = acc.id;
        insert opp;

    
    }

    static testMethod void mainClass3_UnitTest() {
        Test.startTest();
        // DS-CONAM Calc.apexTesting();
        /* DS-CONAM
        Account acc = TestUtils.createAccount();
        Campaign cm = TestUtils.createCampaign();
        Opportunity opp = TestUtils.createOpportunity(acc, cm);
        
       */
        
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;


        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
        /*Profile p = [SELECT 
                            Id 
                    FROM 
                            Profile 
                    WHERE 
                            Name = 'System Administrator'];
        */
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u) {
            List < PermissionSet > pSet = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - Pre-Qual'];
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
           /* 
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - Processing'];
            PermissionSetAssignment psa1 = new PermissionSetAssignment();
            psa1.PermissionSetId = pset1[0].id;
            psa1.AssigneeId = u.ID;
            insert psa1;
            
            MainClass3 mc5 = new MainClass3();
            MainClass3 mc6 = new MainClass3(std);
            
            List < PermissionSet > pSet2 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'c'];
            PermissionSetAssignment psa2 = new PermissionSetAssignment();
            psa2.PermissionSetId = pset2[0].id;
            psa2.AssigneeId = u.ID;
            insert psa2;
            MainClass3 mc7 = new MainClass3();
            MainClass3 mc8 = new MainClass3(std);
            List < PermissionSet > pSet3 = [Select
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - UW'];
                                                    
            PermissionSetAssignment psa3 = new PermissionSetAssignment();
            psa3.PermissionSetId = pset3[0].id;
            psa3.AssigneeId = u.ID;
            insert psa3;
            
            MainClass3 mc9 = new MainClass3();
            MainClass3 mc10 = new MainClass3(std);
           */ 
           
            
        }
        Test.stopTest();
    }
    
    
    static testMethod void mainClass3_UnitTest2() {
        Test.startTest();
        
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - Processing'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
    
    static testMethod void mainClass3_UnitTest3() {
        Test.startTest();
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - QC'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
    static testMethod void mainClass3_UnitTest4() {
        Test.startTest();
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - UW'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
    
    /*static testMethod void mainClass3_UnitTest5() {
        Test.startTest();
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Promac - UW'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
    */
    static testMethod void mainClass3_UnitTest6() {
        Test.startTest();
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Operations - QC ExUser'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
    
    static testMethod void mainClass3_UnitTest7() {
        Test.startTest();
        Opp_RD_Permission_Set__c opSet=new Opp_RD_Permission_Set__c();
        opSet.Name='Test';
        opSet.Pre_Qual__c=true;
        opSet.Processing_CS__c=true;
        opSet.QC__c=true;
        opSet.Tab_Order__c=1;
        opSet.Vf_Page_Name__c='Test';
        insert opSet;
        
        Opp_RD_Permission_Set__c opSet2=new Opp_RD_Permission_Set__c();
        opSet2.Name='Test2';
        opSet2.Pre_Qual__c=true;
        opSet2.Processing_CS__c=true;
        opSet2.QC__c=true;
        opSet2.Tab_Order__c=2;
        opSet2.Vf_Page_Name__c='Test2';
        insert opSet2;
        Opportunity opp=[select
                                id
                        from
                                Opportunity
                        where 
                                name='testOpportunity' Limit 1];
        

        ApexPages.currentPage().getParameters().put('Id', opp.Id);
        ApexPages.currentPage().getParameters().put('oppId', opp.Id);
        MainClass3 mc = new MainClass3();
        ApexPages.StandardController std = new ApexPages.StandardController(opp);
        MainClass3 mc3 = new MainClass3(std);
      
        User u = [Select 
                        id, name 
                from 
                        user 
                Where 
                        IsActive = true AND Profile.NAME = 'System Administrator' LIMIT 1];

        System.runAs(u)
        {
            List < PermissionSet > pSet1 = [Select 
                                                    Id, Label 
                                            FROM 
                                                    PermissionSet 
                                            Where 
                                                    Label = : 'Additional Opportunity Field Access'];
                                                    
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = pset1[0].id;
            psa.AssigneeId = u.ID;
            insert psa;
            
            MainClass3 mc1 = new MainClass3();
            MainClass3 mc4 = new MainClass3(std);
            
        }
        Test.stopTest();
    }
}