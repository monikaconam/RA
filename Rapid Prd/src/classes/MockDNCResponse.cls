public class MockDNCResponse
{
    public static String getDNCProjectInfo()
    {
        String response='<?xml version="1.0" encoding="ISO-8859-1"?> <DncCompliance> <DncScrub> <Accounts count="1">';
        response+='<Account acctId="RPDD" name="RapidAdvance"> <Projects count="2"> <Project projId="RPDD" >';
        response+='name="Master Project" status="1" parentAcctId="RPDD" parentAcctName="RapidAdvance"> <ProjectSettings> ';
        response+='</ProjectSettings> <Campaigns count="2"> <Campaign campaignId="25999" campaignName="Default Campaign"'; 
        response+='campaignStatus="1"></Campaign> <Campaign campaignId="26008" campaignName="All Leads" campaignStatus="1">';
        response+='</Campaign> </Campaigns> </Project> <Project projId="TSTP45" name="TEST Project" status="1" parentAcctId="RPDD"'; 
        response+='parentAcctName="RapidAdvance"> <ProjectSettings> </ProjectSettings> <Campaigns count="1">'; 
        response+='<Campaign campaignId="26009" campaignName="Default Campaign" campaignStatus="1"></Campaign> ';
        response+='</Campaigns> </Project> </Projects> </Account> </Accounts> </DncScrub> </DncCompliance>';
        
        return response;
    }
    
    public static String getStartScrub()
    {
        String response='1800555111,C,,,,,,,,35,,,,';
        return response;
    
    }
}