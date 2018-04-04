global class WebServiceDNCDetails
{
    /*
    response has to be sent based on this actual response from DNC
    */
    webservice static String getPhoneDNCInfo(String phoneNo)
    {
        String parsedPhone=parsePhone(phoneNo);
        String jsonResponse='';
        String responseCode='';
        ResponseWrapper retResponse=new ResponseWrapper();
        Set<String> allowedCodes=new Set<String>{'C','O','E','R','W','G','H'}; 
        Set<String> notAllowedCodes=new Set<String>{'D','P','S','M','I','B','L','F','V','X'};
        Set<String> wirelessExceptionState=new Set<String>{'WY', 'NJ', 'TX', 'LA', 'AZ'};
        
        List<Lead> leadResult=[Select
                                        id, Scrubbed_With_DNC__c, LeadSource, Lead_Number__c, Number_can_be_called__c,
                                        DNC_Response__c, state
                                from
                                        Lead
                                where 
                                        phone=:parsedPhone 
                                and 
                                        Scrubbed_With_DNC__c=true 
                                order by 
                                        createddate desc ];
                                        
        
        if(leadResult.size()>0)
        {
            //retResponse.LeadId=leadResult.get(0).id;
            //retResponse.LeadNumberfromCalc=leadResult.get(0).Lead_Number__c;
            //retResponse.DNCScrubbedFlag=String.valueOf(leadResult.get(0).Scrubbed_With_DNC__c);
            //retResponse.LeadSource=leadResult.get(0).LeadSource;
            /*
                DNC notification (300) to confirm that Rapid can call people that apply on their
                website but appear on the DNC list 
            */
            /*
            if(leadResult.get(0).Number_can_be_called__c==false)
            {
                retResponse.NotificationCode='300';
                retResponse.phoneNumber=parsedPhone;
            }
            else
            {
                retResponse.NotificationCode='301';
                retResponse.phoneNumber=parsedPhone;
            }
              */
           
            if(allowedCodes.contains(leadResult.get(0).DNC_Response__c))
            {
               if(leadResult.get(0).DNC_Response__c=='W')
               {
                   if(leadResult.get(0).state!=null && leadResult.get(0).state!='')
                    {
                        if(wirelessExceptionState.contains(leadResult.get(0).state))
                        {
                            retResponse.NotificationCode='300';
                            retResponse.phoneNumber=parsedPhone;
                        }
                    }
                    else
                    {
                        retResponse.NotificationCode='301';
                        retResponse.phoneNumber=parsedPhone;
                    }
               }
               else
               {
                   retResponse.NotificationCode='301';
                   retResponse.phoneNumber=parsedPhone;
               }
            }    
            else
            {
                retResponse.NotificationCode='300';
                retResponse.phoneNumber=parsedPhone;
            }
        
            jsonResponse=JSON.serialize(retResponse);
        /*
        if(leadResult.size()>0)
        {
            retResponse.LeadId=leadResult.get(0).id;
            retResponse.LeadNumberfromCalc=leadResult.get(0).Lead_Number__c;
            retResponse.DNCScrubbedFlag=String.valueOf(leadResult.get(0).Scrubbed_With_DNC__c);
            retResponse.LeadSource=leadResult.get(0).LeadSource;
            
            jsonResponse=JSON.serialize(retResponse);
        }
        else
        {
            jsonResponse='Unable to find a matching Lead with id '+ lID;
        } 
        */       
        }
        else
        {
                retResponse.NotificationCode='301';
                retResponse.phoneNumber=parsedPhone;
        }
        return jsonResponse;
    }
    
    class ResponseWrapper
    {
        /*String LeadId;
        String LeadNumberfromCalc;
        String DNCScrubbedFlag;
        String LeadSource;*/
        String NotificationCode;
        String phoneNumber;
    }
    
    private static String parsePhone(String tPhone) {
        String str = null;
        if (tPhone != null && tPhone != '')
        {
            String splitExt = tPhone;
            splitExt = splitExt.toUppercase();
            String sTemp = '';

            if (splitExt.indexOf('EXTENSION')> 0) 
                sTemp = 'EXTENSION';
            else if (splitExt.indexOf('EXT')> 0) 
                sTemp = 'EXT';

            List <String> splitted = new List <String> ();
            String s1 = '';

            if (sTemp != '' && sTemp != null) {
                splitted = splitExt.split(sTemp);
                s1 = splitted.get(0);
            } else {
                s1 = splitExt;
            }
            str = s1.replaceAll(' ', '');
            str = str.replaceAll('[^0-9]', '');
            if (str.length()> 10) 
                str = str.subString(0, 10);

        }
        return str;
    }
}