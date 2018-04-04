@isTest

public class TestLeadConvertButtonOverride
{
    @testSetup static void setup()
    {
        Test.startTest();
        /*Id acRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        Account acc = new Account();
        acc.Name = 'partner Lead';
        acc.businessType__c = 'testBusiness';
        acc.recordTypeId=acRecordTypeId;
        insert acc;
        
        Account acc2 = new Account();
        acc2.Name = 'gtLead acc';
        acc2.businessType__c = 'testBusiness';
        acc2.recordTypeId=acRecordTypeId;
        insert acc2;*/
        
        Lead newLead= new Lead();
        newLead.Company ='Test Lead';
        newLead.Email='Test@test.com';
        newLead.FirstName='test';
        newLead.LastName='lastname';
        newLead.state='CT';
        insert newLead;
        
        Lead newLeadPartner= new Lead();
        newLeadPartner.Company ='Test2 Lead';
        newLeadPartner.Email='Test@test.com';
        newLeadPartner.FirstName='Matt';
        newLeadPartner.LastName='Thom';
        newLeadPartner.state='CT';
        insert newLeadPartner;
        
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        insert camp;
        
        Campaign campGT = new Campaign();
        campGT.Name = 'BD Partners';
        campGT.type = 'Partners';
        insert campGT;
        
        CampaignMember newMember = new CampaignMember (campaignid=camp.id, leadid=newLeadPartner.id,status='sent');
        insert newMember;
        
        Id objRecordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        
        Lead partnerLead= new Lead();
        partnerLead.recordTypeId=objRecordTypeId;
        partnerLead.Company ='partner Lead';
        partnerLead.Email='Test@test.com';
        partnerLead.FirstName='test';
        partnerLead.LastName='lastname97';
        partnerLead.state='CT';
        insert partnerLead;
        
        Lead partnerLead2= new Lead();
        partnerLead2.recordTypeId=objRecordTypeId;
        partnerLead2.Company ='partner2Lead';
        partnerLead2.Email='Test@test.com';
        partnerLead2.FirstName='test';
        partnerLead2.LastName='lastname44';
        partnerLead2.state='CT';
        insert partnerLead2;
        
        Partner_category__c pc=new Partner_category__c();
        pc.Partner_Lead__c=partnerLead.id;
        pc.name='Test Value';
        insert pc; 
        /*
        Lead gtLead= new Lead();
        gtLead.recordTypeId=objRecordTypeId;
        gtLead.Company ='gtLead acc';
        gtLead.Email='Test@test.com';
        gtLead.FirstName='test';
        gtLead.LastName='Virtual';
        gtLead.state='CT';
        insert gtLead; 
        
        Lead gtLead2= new Lead();
        gtLead2.recordTypeId=objRecordTypeId;
        gtLead2.Company ='gt Lead acc';
        gtLead2.Email='Test@test.com';
        gtLead2.FirstName='test';
        gtLead2.LastName='john';
        gtLead2.state='CT';
        insert gtLead2;     
        
        Lead gtLead3= new Lead();
        gtLead3.Company ='gt Lead3 acc';
        gtLead3.Email='Test@test.com';
        gtLead3.FirstName='test';
        gtLead3.LastName='Walter';
        gtLead3.state='CT';
        insert gtLead3;
        
        Partner_category__c pc2=new Partner_category__c();
        pc2.Partner_Lead__c=gtLead.id;
        pc2.name='Test Value';
        insert pc2; 
        
        GreenTreeTeamProfile__c gttp=new GreenTreeTeamProfile__c();
        gttp.name='Sales - Brokerage';
        insert gttp;
        */
        Test.stopTest();
    }   

    public static testmethod  void TestConvertPartners()
    {
        Test.startTest();
        Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='partner Lead' Limit 1];
        
        PageReference pg = Page.PartnerLeadConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.autoPartnerConvert(); 
        
        Test.stopTest();
    }
    
    public static testmethod  void TestConvertMultAccPartners()
    {
        Test.startTest();
        Id acRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        Account acc = new Account();
        acc.Name = 'partner Lead';
        acc.businessType__c = 'testBusiness';
        acc.recordTypeId=acRecordTypeId;
        insert acc;
        
        Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='partner Lead' Limit 1];
        
        PageReference pg = Page.PartnerLeadConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.selectedAccId=acc.id;
        ext.selectPartnerAccount(); 
        
        
        Test.stopTest();
    }
    public static testmethod  void TestConvertNoAccPartners()
    {
        Test.startTest();
        Id acRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        Account acc = new Account();
        acc.Name = 'partner acc';
        acc.businessType__c = 'testBusiness';
        acc.recordTypeId=acRecordTypeId;
        insert acc;
        
        Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='partner Lead' Limit 1];
        
        PageReference pg = Page.PartnerLeadConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.selectPartnerAccount(); 
        
        Test.stopTest();
    }
    
    public static testmethod  void TestConvertPartners2()
    {
        Test.startTest();
        Lead lTemp2=[Select
                            id
                    from
                            Lead
                    where
                            company='partner2Lead' Limit 1];
        
        PageReference pg = Page.PartnerLeadConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp2); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.autoPartnerConvert(); 
        Test.stopTest();
    } 
   
    public static testmethod  void TestAutoConvert()
    {
        Test.startTest();
        Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='Test Lead' Limit 1];
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
        ext.autoConvert(); 
                
        Lead lTemp2= new Lead();
        lTemp2.Company ='partner2Lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='test';
        lTemp2.LastName='lastname';   
        
        PageReference pg2 = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg2); 
        ApexPages.StandardController cont2 = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext2 = new leadConvertButtonOverride(cont2); 
        ext2.autoConvert();  
           
        Test.stopTest();
    }

    public static testmethod  void TestAutoConvertPartnerCampaign()
    {
        Test.startTest();
        Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='Test Lead' Limit 1];
        
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
        ext.autoConvert(); 
        /*
        Lead lTemp2= new Lead();
        lTemp2.Company ='partner2Lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='test';
        lTemp2.LastName='lastname';  
        
        PageReference pg2 = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg2); 
        ApexPages.StandardController cont2 = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext2 = new leadConvertButtonOverride(cont2); 
        ext2.autoConvert();
        */
        Test.stopTest();
    }
    
    public static testmethod  void TestAutoConvertPartnerCampaign2()
    {
        Test.startTest();
        /*Lead lTemp=[Select
                            id
                    from
                            Lead
                    where
                            company='Test Lead' Limit 1];
        
        PageReference pg = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp); 
        leadConvertButtonOverride ext = new leadConvertButtonOverride(cont); 
        ext.autoConvert(); 
        */
        Lead lTemp2= new Lead();
        lTemp2.Company ='partner2Lead';
        lTemp2.Email='Test@test.com';
        lTemp2.FirstName='test';
        lTemp2.LastName='lastname';  
        
        PageReference pg2 = Page.LeadAutoConvert; 
        Test.setCurrentPage(pg2); 
        ApexPages.StandardController cont2 = new ApexPages.standardController(lTemp2); 
        leadConvertButtonOverride ext2 = new leadConvertButtonOverride(cont2); 
        ext2.autoConvert();
        Test.stopTest();
    } 
    
    public static testmethod  void TestConvertgt()
    {
        Test.startTest();
        Id objRecordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        Lead gtLead2= new Lead();
        gtLead2.recordTypeId=objRecordTypeId;
        gtLead2.Company ='gt Lead acc';
        gtLead2.Email='Test@test.com';
        gtLead2.FirstName='test';
        gtLead2.LastName='john';
        gtLead2.state='CT';
        insert gtLead2;
        
        PageReference pg = Page.LeadAutoConvertGT; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(gtLead2); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.gtMethod();
        Test.stopTest();
     }
     
    public static testmethod  void TestConvertgt3()
    {  
        Test.startTest();
        Id objRecordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Partners').getRecordTypeId();
        
        Lead gtLead2= new Lead();
        gtLead2.recordTypeId=objRecordTypeId;
        gtLead2.Company ='gt Lead acc';
        gtLead2.Email='Test@test.com';
        gtLead2.FirstName='test';
        gtLead2.LastName='john';
        gtLead2.state='CT';
        insert gtLead2;
        
        PageReference pg = Page.LeadAutoConvertGT; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(gtLead2); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.gtMethod();
        
        //get Sales - Brokerage user
       /* User uTemp=[Select
                            id
                    from
                            User
                    where
                            profile.name='Sales - Brokerage' and isActive=true Limit 1];
        System.runAs(uTemp)
        {
            Lead lTemp3=[Select
                                id
                        from
                                Lead
                        where
                                company='gt Lead3 acc' Limit 1];
            cont = new ApexPages.standardController(lTemp3); 
            ext = new LeadConvertButtonOverride(cont);
            ext.gtMethod();            
            
        }*/
        Test.stopTest();
     }
     
     public static testmethod  void TestConvertgt2()
    {
        Test.startTest();
       /* Lead lTemp1=[Select
                            id
                    from
                            Lead
                    where
                            company='gt Lead acc' Limit 1];
        */
        Lead lTemp1= new Lead();
        lTemp1.Company ='gt Lead acc';
        lTemp1.Email='Test@test.com';
        lTemp1.FirstName='test';
        lTemp1.LastName='john';
        lTemp1.state='CT';
        insert lTemp1;
        
        PageReference pg = Page.LeadAutoConvertGT; 
        Test.setCurrentPage(pg); 
        ApexPages.StandardController cont = new ApexPages.standardController(lTemp1); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        ext.gtMethod();
        
        Lead lTemp2=[Select
                            id
                    from
                            Lead
                    where
                            company='gt Lead acc' Limit 1];
        
        cont = new ApexPages.standardController(lTemp2); 
        ext = new LeadConvertButtonOverride(cont); 
        ext.gtMethod();
        
        //get Sales - Brokerage user
        User uTemp=[Select
                            id
                    from
                            User
                    where
                            profile.name='Sales - Brokerage' and isActive=true Limit 1];
        System.runAs(uTemp)
        {
            Lead lTemp3=[Select
                                id
                        from
                                Lead
                        where
                                company='gt Lead acc' Limit 1];
            cont = new ApexPages.standardController(lTemp3); 
            ext = new LeadConvertButtonOverride(cont);
            ext.gtMethod();            
            
        }
        Test.stopTest();
     }
     
     /*
    
    public static testmethod  void TestConvertgt2()
    {
        Test.startTest();
        
        Lead newLeadGT1= new Lead();
        newLeadGT1.Company ='Test2 Lead';
        newLeadGT1.Email='Test@test.com';
        newLeadGT1.FirstName='test';
        newLeadGT1.LastName='lastname';
        insert newLeadGT1;
        
        Campaign camp = new Campaign();
        camp.Name = 'Green Tree Funding';
        camp.type = 'Partners';
        insert camp;       
        
        CampaignMember newMember = new CampaignMember (campaignid=camp.id, leadid=newLeadGT1.id,status='sent');
        insert newMember; 
        
        Account acc = new Account();
        acc.Name = 'partner Lead';
        acc.businessType__c = 'testBusiness';
       
        insert acc;
        
        Partner_category__c pcc=new Partner_category__c();
        pcc.Partner_Lead__c = newLeadGT1.Id;
        pcc.Partner_Account__c = acc.id;
        insert pcc;
        
        PageReference pgs = Page.LeadAutoConvertGT; 
        Test.setCurrentPage(pgs); 
        ApexPages.StandardController cont = new ApexPages.standardController(newLeadGT1); 
        LeadConvertButtonOverride ext = new LeadConvertButtonOverride(cont); 
        
        ext.gtMethod();  
        
        User uTemp=[Select
                            id
                    from
                            User
                    where
                            profile.name='Sales - Brokerage' and isActive=true Limit 1];
        System.runAs(uTemp)
        {
            Lead lTemp3=[Select
                                id
                        from
                                Lead
                        where
                                company='gt Lead3 acc' Limit 1];
            cont = new ApexPages.standardController(lTemp3); 
            ext = new LeadConvertButtonOverride(cont);
            ext.gtMethod();
        }
        
        Test.stopTest();       
    }
*/
  }