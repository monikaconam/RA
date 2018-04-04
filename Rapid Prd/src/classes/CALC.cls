/*
Action            User            Date                Comments
Modified         @DS-Conam        07/06/2017        Set timeout to 120000 , Generate url based on environment (Sandbox Staging only)
*/
global class CALC 
{

    // Added 9/4/2014, CY: Allow for skipping callouts during testing
    public static Boolean isTesting = false;

    public static void ApexTesting() 
    {
        // Enables "test" mode to skip callouts
        isTesting = true;
    }

    @future (callout=true)
    public static void partnerAccountRequest(String accountId)
    {
        Organization org=[Select isSandbox from Organization Limit 1];
        String url= org.isSandbox ? 'https://calc-stage.rapidadvance.info' : 'https://calc.rapidadvance.com';
        List<String> urls = new List<String>();
        urls.add(url+'/SFCompany/' + accountId);   
        sendRequest(urls);
    }
        
    @future (callout=true)
    public static void campaignRequest(String campaignId)
    {
        Organization org=[Select isSandbox from Organization Limit 1];
        String url= org.isSandbox ? 'https://calc-stage.rapidadvance.info' : 'https://calc.rapidadvance.com';
        List<String> urls = new List<String>();
        urls.add(url+'/SFCampaign/' + campaignId);     
        sendRequest(urls);
    }

    @future (callout=true)
    public static void opportunityRequest(String oppId)
    {
        Organization org=[Select isSandbox from Organization Limit 1];
        String url= org.isSandbox ? 'https://calc-stage.rapidadvance.info' : 'https://calc.rapidadvance.com';
        List<String> urls = new List<String>();
        urls.add(url+'/SFOpportunity/' + oppId);
        sendRequest(urls);  
    }   
    
    public static void sendRequest(List<String> URls)
    {
        if(!Test.isRunningTest()||(isTesting == false))
        {
            for (String url:urls)
            {
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint(url);
                request.setTimeout(120000);
                request.setMethod('GET');
                if(!Test.isRunningTest()) 
                {
                    HttpResponse response = http.send(request);
                }
            }
        }
    }
    
}