@isTest

private  class TestUpdateApplicationStatus
{
    static testMethod void unitTest()
    {
        Opportunity opp = Biz2CreditUtils.createOpportunity();
       String instanceUrl = Biz2CreditUtils.getInstanceURL();
           
        UpdateApplicationStatus.OppDetails oppObj = new UpdateApplicationStatus.OppDetails();
        oppObj.ExternalID = opp.External_ID__c;
        oppObj.SourceSystem = opp.Source_System__c;
        oppObj.Status = 'Processing';
        oppObj.StatusReason = 'test reason';
                 
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = 'https://'+instanceUrl+'/services/apexrest/UpdateApplicationStatus';  
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;
        // request 1
        UpdateApplicationStatus.doPost(oppObj);
        // request 2
        oppObj.ExternalID = opp.External_ID__c;
        oppObj.SourceSystem = 'TestOnSourceSystem';
        oppObj.Status = 'Processing';
        oppObj.StatusReason = 'test reason';
        UpdateApplicationStatus.doPost(oppObj);
        // request 3
        oppObj.ExternalID = opp.External_ID__c;
        oppObj.SourceSystem = opp.Source_System__c;
        oppObj.Status = 'Processing123';
        oppObj.StatusReason = 'test reason';
        UpdateApplicationStatus.doPost(oppObj);
    }
}