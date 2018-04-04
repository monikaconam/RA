public class BatchDNCScrubAllLead implements DataBase.Batchable<SObject>, Database.AllowsCallouts
{
    public static String outxmlstring{get;set;}
    private static String loginID;
    private static String serviceUrl;
    private static String dncProjectName;
    private static String dncCampaignName;
    private static String dncAccID;
    private static Boolean predictiveDialer;
    //private static List<CreateProjectResponseObj> px;
    private static Map<String,boolean> phoneMap;
    private static Map<String,String> phoneResponseCode;
    
    public String eventType{get;set;}
    Set<String> allowedCodes;
    Set<String> notAllowedCodes;
    Set<String> wirelessExceptionState;
    
    public DataBase.QueryLocator start(DataBase.BatchableContext bc)
    {
        loginID='0199F3AC223D86F5CAEC3810BFD1A927A4AD5E551DA0';
        serviceUrl='http://www.dncscrub.com';
        dncProjectName='Master';
        dncAccID='RPDD';
        dncCampaignName='Default Campaign';
        allowedCodes=new Set<String>{'C','O','E','R','W','G','H'}; 
        notAllowedCodes=new Set<String>{'D','P','S','M','I','B','L','F','V','X'};
        wirelessExceptionState=new Set<String>{'WY', 'NJ', 'TX', 'LA', 'AZ'};
        predictiveDialer=false;
       // px=new list<CreateProjectResponseObj>();
        phoneMap=new Map<String,boolean>();
        phoneResponseCode=new Map<String,String>();
        
        //List<CreateProjectResponseObj> result=getDNCProjectInfo(serviceUrl, loginID,dncProjectName,dncAccID);
        String limits=String.valueOf(Limit_batch__c.getValues('BatchLeadDNC').Limit__c);
        String phlimit=String.valueOf(Limit_batch__c.getValues('LengthOfPhone').Limit__c);
        String query='Select id, Scrubbed_With_DNC__c,phone, DNC_Response__c from Lead where isConverted=false and dnc_response__c=null  ';
        query+=' and Scrubbed_With_DNC__c=false and Phone!=null and Phone!=\'0\' and LengthOfPhone__c='+phlimit+' and id!=\'00Q7000000nJtkcEAC\' and InValid_Number__C=false Order by createddate desc limit '+limits;
        
        /*String query='Select id, Scrubbed_With_DNC__c,phone, DNC_Response__c from Lead where isConverted=false and dnc_response__c=null  ';
        query+=' and Scrubbed_With_DNC__c=false  and Phone!=null and phone!=\'0\' and InValid_Number__C=false AND ID=\'00Q19000002PKet\' ';
        */
        return DataBase.getQueryLocator(query);
    }
    
    public void execute(DataBase.BatchableContext bc, List<Lead> scope)
    {
    try
        {
            String phoneList='';
            DNCLeadHandler dTemp =new DNCLeadHandler ();
            dTemp.eventType='Batch';
            for(Lead lTemp : scope)
            {
                if((lTemp.phone!=null)&&(lTemp.phone!=''))
                {
                    phoneList=phoneList+lTemp.phone+',';
                }
            }
             if(phoneList.length()>0)
            {
                phoneList=phoneList.subString(0,phoneList.length()-1);
                dTemp.phoneList=phoneList;
                System.enqueueJob(dtemp);
                
            }
        }
        catch(Exception e)
        {
            System.debug('An exception has occurred '+e.getMessage()+' at '+ e.getLineNumber());
        }
        
    }
    
    public void finish(DataBase.BatchableContext bc)
    {
    }
    /*
    
    private static List<CreateProjectResponseObj> getDNCProjectInfo(String url, String key, String pName,String accID)
    {
        String response=null;
        List<CreateProjectResponseObj> responseObj;
        String actionUrl=url+'/app/main/rpc/project';
        String queryParam='?loginId='+key;
        if(pName!='Master')
            queryParam+='&project_code='+pName;
        else
            queryParam+='&projId='+accID;
        
        queryParam+='&output=XML';
        actionUrl+=queryParam;

        Http hHanlder=new Http();
        HttpRequest req=new HttpRequest();
        HttpResponse res=new HttpResponse();
        
        req.setEndPoint(actionUrl);
        req.setMethod('GET');
        
        try
        {
            res=hHanlder.send(req);
            if(res.getStatusCode()==302)
            {
                response='Invalid Login ID';
            }
            else
            {
                responseObj= parseXMl(res.getBody());
            }
              System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>> Response >>>'+ '\n '+res.getBody());
        }
        catch(Exception e)
        {
            System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>> Exception '+e.getMessage()+' '+e.getLineNumber());
        }
        
        return responseObj;
    }
    private String parsePhone(String phoneNo)
    {
        String str = null;
        if (phoneNo != null && phoneNo != '') {
            str = String.escapeSingleQuotes(phoneNo).toLowerCase();
            str = str.replaceall('[^\\w\\s]', '');
            str = str.replaceAll(' ', '');
            str = str.replaceAll('[^0-9]', '');
            if(str.length()>10)
            {
                str=str.substring(0,10); 
            }
        }
        return str;
    }

  private static String startScrub(String url,String key,String phoneList,String projID)
    {
        String response=null;                   
        String actionUrl=url+'/app/main/rpc/scrub';
        String queryParam='?loginId='+key+'&projId='+projID+'&phoneList='+phoneList+'&version=2';
        actionUrl+=queryParam;

        
        Http hHanlder=new Http();
        HttpRequest req=new HttpRequest();
        HttpResponse res=new HttpResponse();
        
        req.setEndPoint(actionUrl);
        req.setMethod('GET');
        
        try
        {
            res=hHanlder.send(req);
            if(res.getStatusCode()!=200)
            {
                //response='Invalid Login ID';
            }
            else
            {
               response= res.getBody();           
            }
           System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>> Response Scrub>>>\n '+res.getBody());
               
        }
        catch(Exception e)
        {
            System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>> Exception '+e.getMessage()+' '+e.getLineNumber());
        }
        
        return response;
    }
    
    private static List<CreateProjectResponseObj> parseXml(String xmlString)
    {
       DOM.Document xmlDOC = new DOM.Document();
       xmlDOC.load(xmlstring);
       DOM.XMLNode rootElement = xmlDOC.getRootElement();

       outxmlstring=String.valueof(xmlDOC.getRootElement().getName());
       List<CreateProjectResponseObj> pList=new List<CreateProjectResponseObj>();
       for(DOM.XMLNode xmlnodeobj:xmlDOC.getRootElement().getChildElements())
       {  
          CreateProjectResponseObj newObj=new CreateProjectResponseObj();
          newObj.campaigns=new  List<CreateCampaignResponseObj>();
          loadChilds(xmlnodeobj,pList,newObj);
          
       }   
       return pList;
    }
    
    private static void loadChilds(DOM.XMLNode xmlnode, List<CreateProjectResponseObj> pVal, CreateProjectResponseObj p)
    {
        for(Dom.XMLNode child : xmlnode.getChildElements())
        {
          if(child.getText()!= null)
          {
              if(child.getName()=='Project')
              {
               
                p=new CreateProjectResponseObj(); 
                p.campaigns=new  List<CreateCampaignResponseObj>();
                p.prjName=child.getAttribute('name',null);
                p.status=child.getAttribute('status',null);
                //pVal.add(p);
              }
              outxmlstring+='\n'+child.getName()+': '+child.getText();
              if(child.getName()=='Campaign')
              {
                 CreateCampaignResponseObj tempCobj=new CreateCampaignResponseObj();
                tempCobj.campName= child.getAttribute('campaignName',null);
                tempCobj.status= child.getAttribute('campaignStatus',null);
                p.campaigns.add(tempCobj);
                 //2pVal.add(p);
              }
              
          }
          if(p.prjName!=null && p.status!=null && p.campaigns.size()>0)
              pVal.add(p);
          loadChilds(child,pVal,p);      
        }
    }
    private class CreateProjectResponseObj
    {
        String prjName;
        List<CreateCampaignResponseObj> campaigns;
        String status;
    }
    
    private class CreateCampaignResponseObj
    {
        String campName;
        String status;
        
    }*/
}