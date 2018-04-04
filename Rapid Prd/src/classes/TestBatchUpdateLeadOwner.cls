@isTest
public class TestBatchUpdateLeadOwner{

    static testMethod void updateOwnerTest() {
            
        Campaign camp = new Campaign();
        camp.Name = 'Test Campaign';
        camp.isActive = True;
        camp.Type = 'Display';
        insert camp;
        
        Campaign camp2 = new Campaign();
        camp2.Name = 'Quicken Loans Hot Transfer';
        camp2.isActive = True;
        camp2.Type = 'Display';
        insert camp2;
        
        Lead ld = new Lead();
        ld.LastName = 'Test Lead';
        ld.Status = 'Initial Call Needed';
        ld.LeadSource = 'Manually Created';
        ld.Company = 'Test Company';
        ld.Phone = '1234567890';
        insert ld;
        
        Test.setCreatedDate(ld.Id, System.today().adddays(-3));
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Brian', LastName='Klenk', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttssssstt@testorg.com');
                    
        insert u;
        
        User u2 = new User(Alias = 'standt', Email='standarduser@testorg2.com', 
                    EmailEncodingKey='UTF-8',FirstName = 'Alyssa', LastName='Palafox', LanguageLocaleKey='en_US', 
                    LocaleSidKey='en_US', ProfileId = p.Id, 
                    TimeZoneSidKey='America/Los_Angeles', UserName='standardusertttsssrrtt@testorg.com');
                    
        insert u2;
        
        CampaignMember campMem = new CampaignMember();
        campMem.CampaignId = camp.Id;
        campMem.Status = 'Sent';
        campMem.LeadId = ld.Id;
        insert campMem;
        
        Lead ld2 = new Lead();
        ld2.LastName = 'Test Lead 2';
        ld2.Status = 'Initial Call Needed';
        ld2.LeadSource = 'Manually Created';
        ld2.Company = 'Test';
        ld2.Phone = '1234567890';
        insert ld2;
        
        Test.setCreatedDate(ld2.Id, System.today().adddays(-3));
        
        CampaignMember campMem2 = new CampaignMember();
        campMem2.CampaignId = camp2.Id;
        campMem2.Status = 'Sent';
        campMem2.LeadId = ld2.Id;
        insert campMem2;
        
        Test.startTest();
       
        BatchUpdateLeadOwner batch1 = new BatchUpdateLeadOwner();
        ID batchprocessid = Database.executeBatch(batch1);
        System.schedule('test Schedule', '0 0 0 15 3 ? 2022',new BatchUpdateLeadOwner());
                
        Test.stopTest();
    }
}