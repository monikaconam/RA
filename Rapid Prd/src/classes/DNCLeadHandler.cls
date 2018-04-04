public with sharing class DNCLeadHandler implements Queueable, Database.AllowsCallouts{
    public static String outxmlstring{get;set;}
    
    private static String loginID;
    private static String serviceUrl;
    private static String dncProjectName;
    private static String dncCampaignName;
    private static String dncAccID;
    private static Boolean predictiveDialer;
    private static List<CreateProjectResponseObj> px;
    private static Map<String,boolean> phoneMap;
    private static Map<String,String> phoneResponseCode;
    private static Map<String,String> phoneParseMap;
    Set<String> wirelessExceptionState;
    
    public String phoneList{get;set;}
    public String eventType{get;set;}
    String status;
     public void execute(QueueableContext qc)
     {
         phoneParseMap=new Map<String,String>();
        loginID='0199F3AC223D86F5CAEC3810BFD1A927A4AD5E551DA0';
        serviceUrl='http://www.dncscrub.com';
        dncProjectName='Master';
        dncAccID='RPDD';
        dncCampaignName='Default Campaign';
        Set<String> allowedCodes=new Set<String>{'C','O','E','R','W','G','H'}; 
        Set<String> notAllowedCodes=new Set<String>{'D','P','S','M','I','B','L','F','V','X'};
        wirelessExceptionState=new Set<String>{'WY', 'NJ', 'TX', 'LA', 'AZ'};
        predictiveDialer=false;
        px=new list<CreateProjectResponseObj>();
        phoneMap=new Map<String,boolean>();
        phoneResponseCode=new Map<String,String>();
         //true= is a predictive dialer
        /*,
            P = Project DNC or DNF database match (No further checks are performed. The choice to scrub against DNC vs. DNF 
                (Do Not Fax) needs to be made previously at the Campaign level.) 
            D = Do not call database match; Reason field provides additional details. 
            S = diSconnected – number matched a disconnected numbers database (future service)
            I = Invalid (area code not active or reserved/special use phone number pattern (i.e. 555-5555))
            M = Malformed (number is not 10 digits, etc.) – this actually never shows up in scrub results from the DNC Compliance Network™
                Enterprise Edition – instead an error response will be returned 
            B = Blocked (number is in an area code not covered by the National Subscription on this project or is in a configured no-call area code or no exemption was available in a pre-recorded call campaign)
            L = Wireless number in a US state that does not allow telemarketing to wireless numbers even if manually dialed
            
        */      
        
        List<CreateProjectResponseObj> result=getDNCProjectInfo(serviceUrl, loginID,dncProjectName,dncAccID);
        List<String> preParsePhoneList=phoneList.split(',');
        String modifiedList='';
        List<String> phList= new List<String>();
        Set<String> phInvalidList=new Set<String>();
        for(String sTemp : preParsePhoneList)
        {
            System.debug('>>>>>>>>>>>>>sTemp ' +sTemp);
            String phTemp=parsePhone(sTemp);
            System.debug('>>>>>>>>>>>>>phTemp ' +phTemp);
            phoneParseMap.put(phTemp,sTemp);
            if(phTemp!=null)
            {
                phList.add(phTemp);
                modifiedList=modifiedList+phTemp+',';
            }
            else
            {
                phInvalidList.add(sTemp);
            }            
        }
        system.debug('>>>>>>>>>>>>>>'+modifiedList);
        if(modifiedList.length()>0)
        {
            modifiedList=modifiedList.subString(0,modifiedList.length()-1);    
            System.debug(' phList '+phList);
            System.debug(' phoneParseMap'+phoneParseMap);
            phList.sort();
            
            String scrubResponse=startScrub(serviceUrl,loginID,modifiedList,dncAccID);
            System.debug('scrubResponse ' +scrubResponse);
            
            if((scrubResponse!=null) &&  (!scrubResponse.contains('is not a valid number')))
            {
                List<integer> phPos=new List<integer>();
                List<String> scrubResponseList=new List<String>();
                for(String sTemp : phList)
                {
                    System.debug(' sTemp  '+sTemp );
                    phPos.add(scrubResponse.indexOf(sTemp));
                }
                System.debug('scrubResponse ' +scrubResponse);
                System.debug('phPos ' +phPos);
                // break the string
                phPos.sort();
                for(Integer iTemp=0 ;iTemp <phPos.size(); iTemp++)
                {
                    Integer base=phPos.get(iTemp);
                    Integer endLimit=iTemp+1 >=phPos.size() ? scrubResponse.length() : phPos.get(iTemp+1);
                    System.debug('Neew   '+scrubResponse.subString(base,endLimit));
                    scrubResponseList.add(scrubResponse.subString(base,endLimit));
                }
    
                for(String sTemp : scrubResponseList)
                {
                    List<String> tempList=sTemp.split(',');
                    System.debug(tempList.size());
                    if(tempList.size()>1){
                        System.debug(tempList.get(1));
                        String temp =tempList.get(1)!=null && tempList.get(1)!='' ? tempList.get(1).trim() : null;
                        status=temp;
                        System.debug('Number calling status -'+temp );
                        if(!notAllowedCodes.contains(temp))
                        {
                            if(allowedCodes.contains(temp))
                            {
                                phoneMap.put(tempList.get(0),True);
                                phoneResponseCode.put(tempList.get(0),temp);
                            }
                        }
                        else
                        {
                             phoneMap.put(tempList.get(0),False);
                             phoneResponseCode.put(tempList.get(0),temp);
                        }
                    }                
                }
    
                if(phoneMap.size()>0)
                {
                    List<String> tempList=new List<String>();
                   
                    for(String sTemp : phoneMap.keyset())
                        tempList.add(phoneParseMap.get(sTemp));
                    List<Lead> updateLeads=new List<Lead>();
                    List<Lead> modLeads=[Select
                                                    id, phone,Number_can_be_called__c ,Scrubbed_With_DNC__c,LeadSource
                                            from 
                                                    Lead
                                            where
                                                    phone In : tempList 
                                            and 
                                                    isConverted=false order by createddate desc];
                    if(modLeads.size()==0)
                    {
                         modLeads=[Select
                                                    id, phone,Number_can_be_called__c ,Scrubbed_With_DNC__c,LeadSource
                                            from 
                                                    Lead
                                            where
                                                    phone In : phoneParseMap.keyset()
                                            and 
                                                    isConverted=false order by createddate desc];
                    }
                    
                    system.debug(tempList.size());
                    system.debug(tempList);
                    system.debug(phoneParseMap.values());
                    System.debug(' modLeads ' +modLeads.size());
                    
                    if(modLeads.size()>0)
                    {
                        for(Lead lTemp : modLeads)
                        {
                            if(eventType.containsIgnoreCase('Batch'))
                            {
                                lTemp.DNC_Response__c=status;
                                lTemp.Scrubbed_With_DNC__c=true;
                                if(phoneResponseCode.get(lTemp.phone)=='W')
                                {
                                    if(lTemp.state!=null && lTemp.state!='')
                                    {
                                        if(wirelessExceptionState.contains(lTemp.state))
                                        {
                                            lTemp.Number_can_be_called__c=false;
                                        }
                                    }
                                    else
                                    {
                                        lTemp.Number_can_be_called__c=phoneMap.get(parsephone(lTemp.phone));
                                    }
                                }
                                else
                                {
                                    lTemp.Number_can_be_called__c=phoneMap.get(parsephone(lTemp.phone));
                                }
                            }
                            else if(eventType.containsIgnoreCase('Insert'))
                            {
                                lTemp.DNC_Response__c=status;
                                system.debug('XXXXXXXXXXXXXXXX '+ eventType.containsIgnoreCase('INSERT'));
                                if(lTemp.LeadSource=='Web-To-Lead')
                                {
                                    lTemp.Scrubbed_With_DNC__c=true;
                                    system.debug('XXXXXXXXXXXXXXXX '+ lTemp.LeadSource);
                                    lTemp.Number_can_be_called_Exception__c='Web-to-lead';
                                   // lTemp.Number_can_be_called__c=phoneMap.get(lTemp.phone);
                                    lTemp.Number_can_be_called__c=true;
                                }
                                else if(lTemp.LeadSource=='Customer Journey Web to Lead' || lTemp.LeadSource=='Customer Journey V2')
                                {
                                    lTemp.Scrubbed_With_DNC__c=true;
                                    lTemp.Number_can_be_called_Exception__c='Customer Journey';
                                    //lTemp.Number_can_be_called__c=phoneMap.get(lTemp.phone);
                                     lTemp.Number_can_be_called__c=true;
                                }
                                else
                                {
                                    lTemp.Scrubbed_With_DNC__c=true;
                                    lTemp.Number_can_be_called_Exception__c='';
                                    if(phoneResponseCode.get(lTemp.phone)=='W')
                                    {
                                        if(lTemp.state!=null && lTemp.state!='')
                                        {
                                            if(wirelessExceptionState.contains(lTemp.state))
                                            {
                                                lTemp.Number_can_be_called__c=false;
                                            }
                                        }
                                        else
                                        {
                                            lTemp.Number_can_be_called__c=phoneMap.get(lTemp.phone);
                                        }
                                    }
                                    else
                                    {
                                        lTemp.Number_can_be_called__c=phoneMap.get(lTemp.phone);
                                    }
                                    
                                }
                            }
                            else if(eventType.containsIgnoreCase('Update'))
                            {
                                lTemp.Scrubbed_With_DNC__c=true;
                                //lTemp.DNC_Response__c=status;
                                lTemp.Number_can_be_called_Exception__c='Number changed as per customer request';
                                lTemp.Number_can_be_called__c=phoneMap.get(lTemp.phone);
                            }
                            
                            updateLeads.add(lTemp);
                        }
                        
                        try
                        {
                            Database.update(updateLeads,false);
                        }
                        Catch(Exception e)
                        {
                            
                            System.debug('an exception has occured - '+e.getMessage());
                        }
                    }
                }
            }
            else
            {
                List<Lead> lList=new List<Lead>();
                for(Lead lTemp:[Select InValid_Number__C from lead where id!='00Q7000000nJtkcEAC' and phone in : phList and isconverted=false limit 9999])
                {
                    lTemp.InValid_Number__C=true;
                    lList.add(lTemp);
                }
                update lList;
            }
        }
        
        if(phInvalidList.size()>0)
        {
            List<Lead> lList=new List<Lead>();
            for(Lead lTemp:[Select InValid_Number__C from lead where id!='00Q7000000nJtkcEAC' and phone in : phInvalidList and isconverted=false limit 9999])
            {
                lTemp.InValid_Number__C=true;
                lList.add(lTemp);
            }
            update lList;
        }
    }
    
    private String parsePhone(String phoneNo)
    {
        String str = null;
        if (phoneNo != null && phoneNo != '') {
            str = String.escapeSingleQuotes(phoneNo).toLowerCase();
            str = str.replaceall('[^\\w\\s]', '');
            str = str.replaceAll(' ', '');
            str = str.replaceAll('[^0-9]', '');
            str = str.replace('(', '');
            str = str.replace(')', '');
            str = str.replace('-', '');
            if(str.length()>10)
            {
                if(str.startsWith('1'))
                    str=str.substring(1,11);
                else        
                    str=str.substring(0,10); 
            }
            
            else if(str.length()==10)
            {
                if(str.startsWith('1'))
                    str=null;
                else        
                    str=str.substring(0,10); 
            }
            else
            {
                str=null;
            }
        }
        return str;
    }
    
    private static List<CreateProjectResponseObj> getDNCProjectInfo(String url, String key, String pName,String accID)
    {
        String response=null;
        List<CreateProjectResponseObj> responseObj;
        /*
            loginId – Required. Must be the loginId of a valid active user with sufficient privileges for the current operation.
            project_code (required unless operating on the Master Project - unlike projId, here you can either use the prefixed version or one without a prefix (i.e. ACCTID_ABCD123 or just ABCD123), we will handle either.)
            projId – use instead of project_code (when used, project_code must then be omitted or blank) only when operating on the Master Project (whose Id is always the same as the Account code)
            project_name (required and used only when creating a new project - used to set the name that will display in the project tree)
            nat_dnc_org_id (required only when setting or updating the Organization Id on the project.)
            output (only possible current value is xml) – when used, information such as what campaigns exist in this project will be returned in xml format. In addition, if a valid nat_dnc_org_id is provided, details about the SANs, 
                                                            their expirations, covered area codes will also be included. 
            handler (current values are: deactivate_project and reactivate_project - should only be used to deactivate and reactivate, otherwise omit the handler parameter).
        
        */
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
    
    private static String startScrub(String url,String key,String phoneList,String projID)
    {
        /*
        
            loginId (required – must be the loginId of a valid active user with sufficient privileges for the current operation.)
            projId (optional – denotes the project whose settings you wish to use for scrubbing; if both projId and campaignId are omitted we use the Master Project)
            campaignId (optional – denotes the campaignId you wish to scrub-in – if you specify this you may omit projId; if omitted we assume Default Campaign of projId, or if both are omitted, the Default Campaign of your Master Project)
            phoneList (required – comma separated list of 10 digit phone numbers to be added; the phone number must be in the exact format of AAAPPPLLLL, eg 7075712071)
            version (optional – a value of 2 or higher will enable the new Version 2.0 features; a value of 3 or higher will enable the new Version 3.0 features which introduce a new result code of Y for VoIP. VoIP numbers, if VoIP scrubbing is enabled, prior to Version 3 will be returned as W)
            zip (optional – future service to return GeoScrub™ data for the US zip code or Canadian postal code in addition to the phone number – the same code is used for all numbers in phoneList)
        */

        phoneList = phoneList.replace('(', '');
        phoneList = phoneList.replace(')', '');
        phoneList = phoneList.replace('-', '');
        phoneList = phoneList.replace(' ', '');
        System.debug(' phoneList  '+phoneList );
        
        String response=null;                   
        String actionUrl=url+'/app/main/rpc/scrub';
        String queryParam='?loginId='+key+'&projId='+projID+'&phoneList='+phoneList+'&version=2';
        actionUrl+=queryParam;
        
        System.debug('queryParam '+queryParam);
        
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
        
    }
}