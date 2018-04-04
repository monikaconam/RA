/*
@Name            : WebServiceforCalc
@Author          : DS-Conam
@Date            : 14 Oct 2015
@Description     : This web service is being used by the CALC team to find matching Deals in Salesforce and display 
                   search results at there end.

@Revision History

@Author        @Date              @Description 
DS-Conam        09 Nov 2015        Lead records removed from the response
DS-Conam        16 Nov 2015        If DBA is null then return Account name as DBA
DS-Conam        24 Nov 2015        Return opportunity with a last stage change date in a campaign
DS-Conam        02 Dec 2015        Include the latest opportunity funded (where Stage is closed won) for each Campaign
SS-Conam        12 Jan 2017        Return all the campaigns the account is related to (getDeals)            
*/

global class WebServiceforCalc {
    webservice static String getCampaign(String partnerEmail) 
    {
        Set <id> accIDs = new Set <id> ();
        String jsonResponse = '';
        List <CampaignResponseWrapper> response = new List <CampaignResponseWrapper> ();

        List <Contact> conList = [Select
                                        accountId
                                from
                                        contact
                                where
                                        email = : partnerEmail Limit 50000];

        for (Contact cTemp: conList) 
        {
            if (cTemp.accountId != null) 
                accIDs.add(cTemp.accountId);
        }

        List<Campaign> campList = [Select Id, Name,ISO_Account__c From Campaign Where ISO_Account__c In : accIDs];
        
        for (Campaign campTemp: campList) 
        {
            if (campTemp.ISO_Account__c != null) 
            {
                CampaignResponseWrapper crwTemp = new CampaignResponseWrapper();
                crwTemp.id = campTemp.Id;
                crwTemp.campaignName = campTemp.Name;
                response.add(crwTemp);
            }
        }
        jsonResponse = JSON.serialize(response);
        System.debug(jsonResponse);
        return jsonResponse;
    }

    webService static String getDeals(String pLegalName, String pDba, String pFirstName, String pLastName, String pEmail, 
                                        String pPhone) 
    {
        System.debug('Service Started:'+System.now());
        Map <id, Campaign> campaignMap = new Map <id, Campaign>();
        String parseLegalName = parseString(pLegalName);
        String parseDba = parseString(pDba);
        String parsePhone = parsePhone(pPhone);
        
        String name = String.escapeSingleQuotes(pFirstName.trim() + ' ' + pLastName.trim());//.replace('\\\'','\'');
        System.debug('>>>>>>>>>>>>>>>'+name);
        System.debug('>>>>>>>>>>>>>>>'+parseString(name));
        
        String lQuery = '';
        String cQuery = '';
        String aQuery = '';
        String jsonResponse = '';

        Set <Id> lId = new Set <Id> ();
        Set <Id> campIds = new Set <Id> ();
        Set <Id> accIds = new Set <id> ();
        Set<id> oppIds=new Set<id>();
        
        List <String> aQueryStore = new List <String> ();
        List <String> cQueryStore = new List <String> ();
        List <String> lQueryStore = new List <String> ();
        
        


        if (pLegalName.trim().length() == 0 && pDba.trim().length() == 0 && pFirstName.trim().length() == 0 && 
            pLastName.trim().length() == 0 && pEmail.trim().length() == 0 && pPhone.trim().length() == 0) 
        {
            jsonResponse = 'At least one parameter must be specified.';
        } 
        else 
        {
            Map <id, id> leadCampMap = new Map <id, id> ();
            Map <id, Opportunity> accOppMap = new Map <id, Opportunity> ();
            Map <id, OpportunityHistory> oppHistoryMap = new Map <id, OpportunityHistory> ();
            
            List <JSONResponseWrapper> jrw = new List <JSONResponseWrapper> ();
            List <Account> accResult=new List <Account>();
            Map<id,List<Opportunity>> campOppMap=new Map<id,List<Opportunity>>();
            Map<id,Id> campLatestOppMap=new Map<id,Id>();
            Map<id,Id> campLatestIOppMap=new Map<id,Id>();
            List <Contact> conList=new List <Contact>();
            List <Opportunity> oppList;
            List<OpportunityHistory> oppHistory;
            List<Campaign> campDetails;
            List<Opportunity> oppResponseRecords;
            
            
            //Lead is not considered any more -11/07/2015
            lQueryStore.add('Select id, Legal_Business_Name__c,Email,Status,CreatedDate,company from Lead ');


            if (parseLegalName != null && parseLegalName != '') 
                lQueryStore.add(' Purged_Legal_Business_Name__c  Like \'' + parseLegalName + '%\' ');

            if (parseDba != null && parseDba != '') 
                lQueryStore.add(' Purged_Company_Name__c Like \'' + parseDba + '%\' ');

            if (parsePhone != null && parsePhone != '') 
                lQueryStore.add(' Phone =\'' + parsePhone + '\'');

            if (name != null && name != '' && name.trim() != '') 
                lQueryStore.add(' Name Like \'' + name + '%\' ');

            if (pEmail.trim() != null && pEmail.trim() != '') 
                lQueryStore.add(' email Like \'' + pEmail.trim() + '%\' ');

            lQuery = lQueryStore.get(0);

            if (lQueryStore.size()> 1) 
                lquery += ' where ( ' + lQueryStore.get(1);

            if (lQueryStore.size()> 2) 
            {
                for (Integer i = 2; i <lQueryStore.size(); i++) 
                {
                    lquery += ' or ' + lQueryStore.get(i);
                }
            }

            if (lQueryStore.size()> 1) 
                lquery += ' ) ';

            lquery += ' And RecordType.name!=\'Partners\' and  isConverted=false and createddate=This_Year Limit 200';

            System.debug('>>>xxxxxxx>>>>> lead query ' + lquery);

            List <Lead> lResult = Database.query(lquery);
            
            for (Lead lTemp: lResult) 
            {
                lId.add(lTemp.id);
            }

            List <CampaignMember> cmList = [Select
                                                    id, campaignID, leadid
                                            from
                                                    CampaignMember
                                            where
                                                    LeadId in : lId Limit 10000];
            
            for (CampaignMember cTemp: cmList)
            {
                leadCampMap.put(cTemp.leadID, cTemp.campaignId);
                campIds.add(cTemp.campaignId);
            }

            Map <id, Campaign> campaignMap2 = new Map <id, Campaign> ([Select
                                                                            id, name
                                                                        from
                                                                            Campaign where Id in : campIds]);

            for (Lead lTemp: lResult)
            {
                JSONResponseWrapper jrwTemp = new JSONResponseWrapper();

                jrwTemp.LegalName = lTemp.Legal_Business_Name__c;
                jrwTemp.DBAName = lTemp.company;
                jrwTemp.LeadId = lTemp.id;
                jrwTemp.LeadStatus = lTemp.status;
                jrwTemp.OpportunityId = null;
                jrwTemp.OpportunityStage = null;
                jrwTemp.cDate = String.valueOf(lTemp.CreatedDate);
                jrwTemp.CampaignId = leadCampMap.get(lTemp.id) != null ? leadCampMap.get(lTemp.id) : null;
                jrwTemp.CampaignName = leadCampMap.get(lTemp.id) != null ? campaignMap2.get(leadCampMap.get(lTemp.id)).name : null;
                jrw.add(jrwTemp);
            }


            cQueryStore.add('Select id, name,accountID from Contact ');
            
            if (parsePhone != null && parsePhone != '') 
                cQueryStore.add(' Phone =\'' + parsePhone + '\'');
            
            System.debug('***************************'+name );
            
            if (name != null && name != '' && name.trim() != '') 
                cQueryStore.add(' Name Like \'' + name + '%\' ');

            if (pEmail.trim() != null && pEmail.trim() != '') 
                cQueryStore.add(' email Like \'' + pEmail.trim() + '%\' ');


            cQuery = cQueryStore.get(0);

            if (cQueryStore.size()> 1) 
            cquery += ' where ( ' + cQueryStore.get(1);

            if (cQueryStore.size()> 2)
            {
                for (Integer i = 2; i <cQueryStore.size(); i++) 
                {
                    cquery += ' or ' + cQueryStore.get(i);
                }
            }

            if (cQueryStore.size()> 1) 
                cquery += ' ) ';

            cquery += ' Limit 1000';

            System.debug('====cQuery===== ' + cQuery);
            
            

            if(cQueryStore.size()>1)
                conList = Database.query(cquery);
            
            for (Contact conTemp: conList)
            {
                if (conTemp.accountId != null) 
                    accIds.add(conTemp.accountId);
            }

          //  aQueryStore.add('Select id, name, legal_name__c,DBA__c,CreatedDate, (Select name,CreatedDate from opportunities) from Account ');
            aQueryStore.add('Select id, name, legal_name__c,DBA__c,CreatedDate from Account where ');

            if (parseDba != null && parseDba != '') 
            {
                aQueryStore.add(' Purged_DBA_Name__c Like \'' + parseDba + '%\' ');
                aQueryStore.add(' Purged_Account_Name__c Like \'' + parseDba + '%\' ');
            }

            if (parseLegalName != null && parseLegalName != '') 
                aQueryStore.add(' Purged_Legal_Name__c  Like \'' + parselegalName + '%\' ');

            if (parsePhone != null && parsePhone != '') 
                aQueryStore.add(' Phone =\'' + parsePhone + '\'');

            aquery = aQueryStore.get(0);
            
            system.debug('========aquery '+aquery );

            if (aQueryStore.size()> 1) 
                aquery += ' ( ' + aQueryStore.get(1);

            if (aQueryStore.size()> 2) 
            {
                for (Integer i = 2; i <aQueryStore.size(); i++) 
                {
                    aquery += ' or ' + aQueryStore.get(i);
                }
            }

            if (aQueryStore.size()> 1) 
                aquery += ' ) and ';

            aquery += ' RecordType.name!=\'Partners\' Limit 500';

            System.debug('>>>>>>>>>>>>>>> ' + aquery);
            
            
            
            if(aQueryStore.size()>1)
                accResult = Database.query(aquery);
            system.debug('======================================'+accResult);
            for (Account accTemp: accResult) 
            {
                accIds.add(accTemp.id);
            }

           oppList = [select
                            id, stageName, closeDate, campaignId, accountid,CreatedDate,
                            account.name, account.legal_name__c, account.DBA__c, 
                            account.Purged_Account_Name__c, account.Purged_DBA_Name__c  
                    from
                            Opportunity
                    where
                            accountId in : accIds order by createddate Limit 2000];
           
            campIds = new Set <id> ();
            for(Opportunity oppTemp : oppList)
            {
                oppIds.add(oppTemp.id);   
                campIds.add(oppTemp.campaignId);
            }
           
            System.debug('>>>> oppIds='+oppIds);
           oppHistory=[SELECT 
                                OpportunityId,StageName,createddate 
                        FROM 
                                OpportunityHistory 
                        WHERE 
                                OpportunityId in :oppIds ORDER BY createddate];            
           
            
            for(OpportunityHistory opTemp : oppHistory)
            {
                oppHistoryMap.put(opTemp.OpportunityId , opTemp);
            }
            
            System.debug('>>> oppHistoryMap '+oppHistoryMap);
            campDetails=[Select
                                id,(Select id from Opportunities)
                        from
                                Campaign
                        where
                                id in : campIds ];
            

            //get the opportunity whose state has last changed in the campaign
            Integer i=0;
            for(Campaign cm: campDetails)
            {   
                Boolean setFirstElement=true;
                //DateTime firstelement;
                DateTime latestDate;
                Id latestOppId;
                for(Opportunity oppTemp : cm.Opportunities)
                {
                    if(oppHistoryMap.get(oppTemp.id)!=null)
                    {
                        if(oppIds.contains(oppTemp.id))
                        {
                            if(setFirstElement)
                            {
                                latestDate=oppHistoryMap.get(oppTemp.id).createddate;
                                setFirstElement=false;
                            }
                            if(oppHistoryMap.get(oppTemp.id).createddate>=latestDate)
                            {
                                latestDate=oppHistoryMap.get(oppTemp.id).createddate;
                                latestOppId=oppTemp.id;
                              
                            }
                        }
                    }
                }
                campLatestOppMap.put(cm.id,latestOppId);
                
                if(oppHistoryMap.get(latestOppId)!=null)
                {
                    if(oppHistoryMap.get(latestOppId).StageName!='Closed Won')
                    {
                        Boolean setIFirstElement=true;
                        DateTime latestIDate;
                        Id latestIOppId;
                        for(Opportunity oppTempInner : cm.Opportunities)
                        {
                            if(oppIds.contains(oppTempInner.id))
                            {
                                //System.debug('>>>>> '+oppHistoryMap.get(oppTempInner.id).createddate+'>>>>'+latestDate +'>>>'+oppTempInner.id);
                                
                                if(oppHistoryMap.get(oppTempInner.id)!=null)
                                {
                                    if(oppHistoryMap.get(oppTempInner.id).StageName=='Closed Won')
                                    {
                                        if(setIFirstElement)
                                        {
                                            latestIDate=oppHistoryMap.get(oppTempInner.id).createddate;
                                            setIFirstElement=false;
                                        }
                                        if(oppHistoryMap.get(oppTempInner.id).createddate>=latestIDate)
                                        {
                                            latestIDate=oppHistoryMap.get(oppTempInner.id).createddate;
                                            latestIOppId=oppTempInner.id;
                                        }
                                    }
                                }
                            }
                            
                        }
                        campLatestIOppMap.put(cm.id,latestIOppId);
                    }
                }
                //campLatestOppMap.put(cm.id,latestOppId);
            }
            System.debug('campLatestOppMap.values() '+campLatestOppMap.values());
            System.debug('campLatestIOppMap.values() '+campLatestOppMap.values());
            System.debug('campLatestOppMap.values() '+campLatestOppMap);
            System.debug('campLatestIOppMap.values() '+campLatestOppMap);
            //merge the results in a list use campLatestOppMap to traverse as it will always contains all oppids
            Set<Id> allOppID=new Set<Id>();
            for(ID iTemp : campLatestOppMap.keyset())
            {
                System.debug('>>>>>>>>>> id 1'+iTemp);
                allOppID.add(campLatestOppMap.get(iTemp));
                if(campLatestIOppMap.get(iTemp)!=null)
                {
                    System.debug('>>>>>>>>>> id 2'+campLatestIOppMap.get(iTemp));
                    allOppID.add(campLatestIOppMap.get(iTemp));
                }
            }
            
            System.debug('>>>>>>>>>> id '+allOppID);
           oppResponseRecords=[Select
                                        id, stageName, closeDate, campaignId, accountid,CreatedDate,
                                        account.name, account.legal_name__c, account.DBA__c, 
                                        account.Purged_Account_Name__c, account.Purged_DBA_Name__c  
                                from
                                        Opportunity
                                where
                                        id in : allOppID order by createddate Limit 2000];
            
           // System.debug('oppResponseRecords  '+oppResponseRecords);
            Map<Integer,ID> accIDMap=new Map<Integer,ID>();
            Map<Integer,Opportunity> oppMap=new Map<Integer,Opportunity>();
            Integer oTempCounter=0;
            for (Opportunity oTemp: oppResponseRecords) 
            {
                oTempCounter++;
                accIDMap.put(oTempCounter,oTemp.accountid);
                oppMap.put(oTempCounter,oTemp);
               // accOppMap.put(oTemp.accountid, oTemp);
            }
            //System.debug('accOppMap '+accOppMap);
            campaignMap = new Map <id, Campaign> ([Select
                                                            id, name
                                                    from
                                                            Campaign 
                                                    where 
                                                            Id in : campIds]);
          //  System.debug('campLatestOppMap.values() '+campLatestOppMap.values());
             for (Integer iTemp : accIDMap.keyset()) 
            {

                JSONResponseWrapper jrwTemp = new JSONResponseWrapper();
                // response should not be send if there is no opp
                if(oppMap.get(iTemp)!=null)
                {
                    jrwTemp.LegalName = oppMap.get(iTemp).account.Legal_Name__c;
                    jrwTemp.DBAName = oppMap.get(iTemp).account.DBA__c!=null?oppMap.get(iTemp).account.DBA__c:oppMap.get(iTemp).account.name;
                    jrwTemp.LeadId = null;
                    jrwTemp.LeadStatus = null;
                    jrwTemp.OpportunityId = oppMap.get(iTemp) != null ? oppMap.get(iTemp).id : null;
                    jrwTemp.OpportunityStage = oppMap.get(iTemp) != null ? oppMap.get(iTemp).StageName : null;
                    jrwTemp.cDate = oppMap.get(iTemp) != null ? String.valueOf(oppHistoryMap.get(oppMap.get(iTemp).id).createdDate) : null;
                    jrwTemp.CampaignId = oppMap.get(iTemp) != null ? oppMap.get(iTemp).campaignId : null;
    
                    String campname = null;
                    if (oppMap.get(iTemp) != null) 
                    {
                        String tempId = oppMap.get(iTemp).campaignId;
    
                        if (campaignMap.get(tempId) != null) 
                            campname = campaignMap.get(tempId).name;
                    }

                    jrwTemp.CampaignName = campname;
                    jrw.add(jrwTemp);
                }
            }
            /*
            for (Id iTemp : accOppMap.keyset()) 
            {

                JSONResponseWrapper jrwTemp = new JSONResponseWrapper();
                // response should not be send if there is no opp
                if(accOppMap.get(iTemp)!=null)
                {
                    jrwTemp.LegalName = accOppMap.get(iTemp).account.Legal_Name__c;
                    jrwTemp.DBAName = accOppMap.get(iTemp).account.DBA__c!=null?accOppMap.get(iTemp).account.DBA__c:accOppMap.get(iTemp).account.name;
                    jrwTemp.LeadId = null;
                    jrwTemp.LeadStatus = null;
                    jrwTemp.OpportunityId = accOppMap.get(iTemp) != null ? accOppMap.get(iTemp).id : null;
                    jrwTemp.OpportunityStage = accOppMap.get(iTemp) != null ? accOppMap.get(iTemp).StageName : null;
                    jrwTemp.cDate = accOppMap.get(iTemp) != null ? String.valueOf(oppHistoryMap.get(accOppMap.get(iTemp).id).createdDate) : null;
                    jrwTemp.CampaignId = accOppMap.get(iTemp) != null ? accOppMap.get(iTemp).campaignId : null;
    

                    String campname = null;
                    if (accOppMap.get(iTemp) != null) 
                    {
                        String tempId = accOppMap.get(iTemp).campaignId;
    
                        if (campaignMap.get(tempId) != null) 
                            campname = campaignMap.get(tempId).name;
                    }

                    jrwTemp.CampaignName = campname;
                    jrw.add(jrwTemp);
                }
            }
            */
            jsonResponse = Json.serialize(jrw);
        }
        
        System.debug('Service Ended:'+System.now());
        return jsonResponse;
    }

    public static String parseString(String pName) {
        String str = null;
        if (pName != null && pName != '') {
            str = String.escapeSingleQuotes(pName).toLowerCase();
            

            List <Purge_characters_in_Name__c> pcinList = [Select
                                                                name, character__c, replace_with__c
                                                            from
                                                                Purge_characters_in_Name__c Limit 100];
                for (Purge_characters_in_Name__c pTemp: pcinList) 
                {
                String lvalue = pTemp.character__c.toLowerCase();
                String rValue = pTemp.replace_with__c == null ? '' : pTemp.replace_with__c.toLowerCase();
                if (str.indexOf(lvalue) != -1) {
                    String regexPattern;
                    if (lvalue.length() == 1) {
                        regexPattern = '\\' + lvalue;
                        str = str.replaceAll(regexPattern, rValue);
                    } 
                    else
                    { 
                       /* if(str.endsWith(lvalue))
                            regexPattern='\\ '+lvalue;
                        else
                            regexPattern='\\ '+lvalue+' ';*/
                        regexPattern=str.endsWith(lvalue) ?'\\ '+lvalue :'\\ '+lvalue+' ';
                        
                        str = str.replaceAll(regexPattern, ' ' + rvalue + ' ');
                    }
                }
            }
            str = str.replaceAll('space', '');
            str = str.replaceAll(' ', '');
            str = str.replaceall('_', '');
            str=str.replaceall('[^\\w\\s]','');
            for(Purge_characters_in_Name__c pTemp : pcinList)
            {
                String lvalue=pTemp.character__c.toLowerCase();
                String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
                if(lvalue.length()>1)
                {
                    if(str.endsWith(lvalue))
                    {
                        str=str.replace(lvalue, rvalue);
                    }
                }
            }
       
          str=str.toLowerCase();  
        }
        
        return str;
    }

    private static String parsePhone(String tPhone) {
        String str = null;
        if (tPhone != null && tPhone != '') {
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
            if (str.length()> 10) str = str.subString(0, 10);

        }
        return str;
    }
    class CampaignResponseWrapper {
        String id;
        String campaignName;
    }

    class JSONResponseWrapper {
        String LegalName;
        String DBAName;
        String LeadId;
        String LeadStatus;
        String OpportunityId;
        String OpportunityStage;
        String cDate;
        String CampaignID;
        String CampaignName;
    }

}