@istest(seeAllData=True)

public class createCampaignMemberForRockConn_Test
{

    public static testmethod void runTestForS2S()
    {
        List<PartnerNetworkConnection> pncList=[select id,connectionname from PartnerNetworkConnection where connectionname='Rock Connections' and ConnectionStatus='Accepted'];
        
        Lead lTemp=new Lead();
        CALC.ApexTesting();

        
        lTemp.Status='Calling - No Contact Made';
        lTemp.LeadSource='Radio';
        lTemp.Company='test company';
        lTemp.Phone='415789415';
        lTemp.Lastname='lastname'; 
        lTemp.RC_Lead_Type__c='RAFF';               
        insert lTemp;
   
    
    
        List<PartnerNetworkRecordConnection> lstShareRecords= new List<PartnerNetworkRecordConnection>();
        
        for(PartnerNetworkConnection network : pncList) {
        
        PartnerNetworkRecordConnection newrecord = new PartnerNetworkRecordConnection();
        
        newrecord.ConnectionId = network.Id;
        newrecord.LocalRecordId = lTemp.id;
       // newrecord.RelatedRecords = 'Lead';
        newrecord.SendClosedTasks = false;
        newrecord.SendOpenTasks = false;
        newrecord.SendEmails = false;
        
        lstShareRecords.add(newrecord);
        }
        //if (test.IsRunningTest()==false)
        //insert lstshareRecords;
     }
            

}