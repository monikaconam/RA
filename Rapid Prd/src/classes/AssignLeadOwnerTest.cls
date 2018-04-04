@isTest(SeeAllData=true)
private class AssignLeadOwnerTest {
static testMethod void AssignLeadOwnerTestMethod() {
User u = [select id, Name from User where Name=:Label.Lead_Owner_Default];
Campaign ca1 = [select id from Campaign where Funding_Channel__c = :'Distribution' limit 1];


Lead l = new Lead(lastName='Lee',company='TRN Consulting', OwnerId=u.Id);
insert l;
CampaignMember m1 = new CampaignMember();
m1.LeadId = l.Id;
m1.CampaignId = ca1.Id;
insert ( m1 ); }
}