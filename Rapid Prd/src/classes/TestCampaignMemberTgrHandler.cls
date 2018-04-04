@isTest
public class TestCampaignMemberTgrHandler{
   
   public static testMethod void  populatLeadInfoTest()
   {
       Campaign cTest=new Campaign(name='Test Campagin',type='Internet',Payment_Type__c='Pay-Per-Lead'
           ,Partner_Campaign_Team__c='testData');
       insert cTest;
       
       Lead lTest=new Lead(Status='Calling - No Contact Made',LeadSource='Radio',Company='test company',Phone='415789415',Lastname='lastname'
                          );
       insert lTest;
       
       CampaignMember newMember = new CampaignMember (campaignid=cTest.id, leadid=lTest.id);
       insert newMember;
   }
}