/*
@Name               : LeadTriggerHandler
@Author             : MK-Conam
@Date               : 08 June 2015
@Description        : Handler Class for Lead triggers

@Author             : MK-Conam
@Date               : 26 Nov 2015
@Revision History   : referral_ae_owner_id__c,referral_ae_owner_name__c,Referral_Merchant_Name__c ,Referral_Merchant_ID__c 
                      fields have been removed/Commented

@Author             : DS-Conam
@Date               : 26 Nov 2015
@Revision History   : Referral_Merchant_Name__c ,Referral_Merchant_ID__c added back as CR-                                   
*/

public with sharing class LeadTriggerHandler
{
    public static void buPurgeLeadName(Map<id,lead> oldMap, Map<id,lead> newMap)
    {
        List<Lead> newList=new List<Lead>();
        for(Id iTemp : newMap.keyset())
        {
            Lead lnew=newMap.get(iTemp);
            Lead lold=oldMap.get(iTemp);
              if((lnew.name!=lold.name) || ((lnew.Legal_Business_name__c!=lold.Legal_Business_name__c)||
                (lnew.Purged_Legal_Business_name__c=='' ||  lnew.Purged_Legal_Business_name__c==null)) || 
                ((lnew.Company!=lold.Company) ||(lnew.Purged_Company_Name__c=='' || lnew.Purged_Company_Name__c==null)))
            {
                newList.add(lnew);
            }
        }
        
        if(newList.size()>0)
            PurgeNameHelper.cleanLeadCName(newList);
    }
    
    public static void biPopulateLeadSourceIfReferral(List<Lead> newList)
    {
        List<Lead> oppList=newList;
        for(Lead lTemp : oppList)
        {
            if((lTemp.Referral_Merchant_ID__c!=null) && (lTemp.leadSource==null))
                lTemp.leadsource='Referral';
        }
    }
    
    public static void biBeforeGlobal(List<Lead> listLed )       
    {
        Set<Id> toCheck = new Set<Id>();    // Merchant IDs to check
        Set<Id> toCheckLead = new Set<Id>(); 
        Map<Id, Id> lastAE = new Map<Id,Id>();      // Most recent AE/owner (Referral ID, AE ID)
        Map<Id, Id> checked = new Map<Id,Id>();     // Cached AE values that were checked (may have Manager ID)
        Set<Id> active = new Set<Id>();         // Cached AE values that are active
        Boolean toProcess = false;       // Boolean flag to add this Merchant AE for processing or not
        
        Id thisId;          
        Id ae_Id;   
        Map<Id, String> ownerNames = new Map<Id,String>();
        Map<Id, String> merchantNames = new Map<Id,String>();
        List<Task> newTasks = new List<Task>();            

        for (Lead lTemp : listLed)
        {
            if (lTemp.Status == 'Duplicate')
            { 
                continue; 
            }                              

            if (lTemp.Referral_Merchant_ID__c != NULL) 
            { 
                toProcess = true; 
            }        
                      
            if (toProcess) 
            {
                if(lTemp.Referral_Merchant_ID__c.startsWith('001'))
                    toCheck.add(lTemp.Referral_Merchant_ID__c);
                    
                if(lTemp.Referral_Merchant_ID__c.startsWith('00Q'))
                    toCheckLead.add(lTemp.Referral_Merchant_ID__c);
            }  
            if (lTemp.RC_Status__c != NULL) 
            {       
            // Is Rock Connections, Set the local status                
                RC_Status__c rcs = new RC_Status__c();
                rcs = RC_Status__c.getInstance(lTemp.RC_Status__c);
                if (rcs != NULL) 
                { 
                    lTemp.Status = rcs.Local_Status__c; 
                }         
            }
        }
        // end for Lead loop

        Map<id,Integer> oppCountMap=new Map<id,Integer>();  
        Map<id,Opportunity> oppMap=new Map<id,Opportunity>();
        Map<id,User> usrMap;
        if(toCheck.size()>0 && toCheck !=Null)
        {   
            Set<Id> ownersID=new Set<id>();
            List<Account> accList=[Select 
                                            id,name ,(Select 
                                                            id,ownerID 
                                                        From 
                                                            Opportunities) 
                                    From 
                                            Account 
                                    Where 
                                            id in : toCheck];
            for(Account aTemp : accList)
            {
                Integer counter=0;
                for(Opportunity oTemp : aTemp.Opportunities)
                {
                    if(oTemp !=null)
                    {
                        counter++;
                        ownersID.add(oTemp.ownerID);
                    }
                }
                oppCountMap.put(aTemp.id,counter);
            }
                                          
            List<Opportunity> oppL=[SELECT 
                                            Id,Account.Name,OwnerId 
                                    FROM 
                                            Opportunity 
                                    WHERE 
                                            AccountId 
                                    IN  
                                            :toCheck
                                    ORDER BY 
                                            CreatedDate 
                                    DESC LIMIT 1];
                                    
            for(Opportunity opTemp : oppL)
            {
                oppMap.put(opTemp.accountID,opTemp);
            }
             
            usrMap=new Map<id,User>([SELECT 
                                            Id,Name,IsActive 
                                    FROM 
                                            User 
                                    WHERE 
                                            Id in : ownersID]);
        }
        
        Map<id,Lead> leadMap=new Map<id,Lead>();
        if(toCheckLead.size()>0 && toCheckLead !=Null)
        {   
            List<Lead> leadList=[Select
                                        id, company
                                from
                                        Lead
                                where
                                    id in :toCheckLead];

            for(Lead lTemp : leadList)
            {
                merchantNames.put(lTemp.id, lTemp.company);
                leadMap.put(lTemp.id,lTemp);
            }
        }
        
        if(oppMap.size()>0)
        {                                
            for (Id MerchantId : toCheck) 
            {
               
                Integer oppCount=oppCountMap.get(MerchantId);
               
                if (oppCount == 0)  continue;   
    
                if (checked.get(oppMap.get(MerchantId).OwnerId) == NULL) 
                {                                
                    if (usrMap.size() == 0)   
                        continue; 
                    
                    // skip if not found (should be rare in production)                    
                    thisId = usrMap.get(oppMap.get(MerchantId).OwnerId).Id;                
                    if (usrMap.get(oppMap.get(MerchantId).OwnerId).IsActive == true)
                    { 
                        active.add(thisId); 
                    }
                        lastAE.put(MerchantId,thisId);
                        checked.put(oppMap.get(MerchantId).OwnerId,thisId);
                        merchantNames.put(MerchantId,oppMap.get(MerchantId).Account.Name);
                        OwnerNames.put(usrMap.get(oppMap.get(MerchantId).OwnerId).Id,usrMap.get(oppMap.get(MerchantId).OwnerId).Name);
                }
            }
        }   
        
        for (Lead lTemp : listLed)
        {               
            if (lTemp.Referral_Merchant_ID__c != NULL)
            { 
                ae_Id= lastAE.get(lTemp.Referral_Merchant_ID__c); 
            }
            if((ae_Id!= NULL)|| (leadMap.size()>0))
            {
                lTemp.Referral_Merchant_Name__c = merchantNames.get(lTemp.Referral_Merchant_ID__c);                 
                        
                if (active.contains(ae_Id)) 
                { 
                    lTemp.OwnerId = ae_Id;
                }
            }
        }
    }
    
    public static void biSendLeadRequestToDNC(List<Lead> newList)
    {
        try
        {
            String phoneList='';
            DNCLeadHandler dTemp =new DNCLeadHandler ();
            dTemp.eventType='Insert';
            for(Lead lTemp : newList)
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
            newList.get(0).addError('An exception has occurred '+e.getMessage()+' at '+ e.getLineNumber());
        }
    }
    
    public static void buSendLeadRequestToDNC(Map<id,Lead>oldMap, Map<id,Lead>newMap)
    {
        String exceptionid='';
        try
        {
            String phoneList='';
            DNCLeadHandler dTemp =new DNCLeadHandler ();
            dTemp.eventType='Update';
            for(Id iTemp : newMap.keyset())
            {
                if(oldMap.get(iTemp).phone!=newMap.get(iTemp).phone)
                {   
                    exceptionid=iTemp;
                    Lead lTemp=newMap.get(iTemp);
                    if((((lTemp.phone!=null)&&(lTemp.phone!='')) || (lTemp.phone!=oldMap.get(iTemp).phone)) || 
                    ((lTemp.state!=oldMap.get(iTemp).state) && (lTemp.state!=null) && (lTemp.state!='')))
                    {
                        phoneList=phoneList+lTemp.phone+',';
                    }
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
            newMap.get(exceptionid).addError('An exception has occurred '+e.getMessage()+' at '+ e.getLineNumber());
        }
    }
    
     public static void buBeforeGlobal(List <Lead>listLed ,Map <Id,Lead>mapLed ) 
    {
        Set<Id> toCheck = new Set<Id>();    // Merchant IDs to check
        Map<Id, Id> lastAE = new Map<Id,Id>();      // Most recent AE/owner (Referral ID, AE ID)
        Map<Id, Id> checked = new Map<Id,Id>();     // Cached AE values that were checked (may have Manager ID)
        Set<Id> active = new Set<Id>();         // Cached AE values that are active
        Boolean toProcess = false;       // Boolean flag to add this Merchant AE for processing or not
        
        Id thisId;          
        Id ae_Id;   
        Map<Id, String> ownerNames = new Map<Id,String>();
        Map<Id, String> merchantNames = new Map<Id,String>();
        Map<id,User> usrMap;  
        List<Task> newTasks = new List<Task>();            
    
        for (Lead lTemp : listLed)
        {
            if (lTemp.Status == 'Duplicate')
            { 
                continue; 
            }                              
     
            if (lTemp.Referral_Merchant_ID__c != NULL) 
            {   
                // Check for update to save time        
                lead lQuery  = mapLed.get(lTemp.Id);
                if (lQuery.Referral_Merchant_ID__c != lTemp.Referral_Merchant_ID__c) 
                {
                    toProcess = true;
                }
            }
    
            if (toProcess) 
            {
                toCheck.add(lTemp.Referral_Merchant_ID__c);
            }  
            if (lTemp.RC_Status__c != NULL) 
            {       
            
            // Is Rock Connections, Set the local status                
                RC_Status__c rcs = new RC_Status__c();
                rcs = RC_Status__c.getInstance(lTemp.RC_Status__c);
                if (rcs != NULL) 
                { 
                    lTemp.Status = rcs.Local_Status__c; 
                }         
            }
        }
            // end for Lead loop

        Map<id,Integer> oppCountMap=new Map<id,Integer>();  
        Map<id,Opportunity> oppMap=new Map<id,Opportunity>();
        if(toCheck.size()>0 && toCheck !=Null)
        {       
           Set<Id> ownersID=new Set<id>();
            List<Account> accList=[Select 
                                            id,name ,(Select 
                                                            id,ownerID 
                                                        From 
                                                            Opportunities) 
                                    From 
                                            Account 
                                    Where id in : toCheck];
            
            for(Account aTemp : accList)
            {
                Integer counter=0;
                for(Opportunity oTemp : aTemp.Opportunities)
                {
                    if(oTemp !=null)
                    {
                        counter++;
                        ownersID.add(oTemp.ownerID);
                    }
                }
                oppCountMap.put(aTemp.id,counter);
            }
                       
            List<Opportunity> oppL=[SELECT 
                                            Id,Account.Name,OwnerId 
                                    FROM 
                                            Opportunity 
                                    WHERE 
                                            AccountId 
                                    IN  
                                            :toCheck
                                    ORDER BY 
                                            CreatedDate 
                                    DESC LIMIT 1];
                                    
            for(Opportunity opTemp : oppL)
            {
                oppMap.put(opTemp.accountID,opTemp);
            }
                           
            usrMap=new Map<id,User>([SELECT 
                                            Id,Name,IsActive 
                                    FROM 
                                            User 
                                    WHERE 
                                            Id in : ownersID]);
        }    
                                
        for (Id MerchantId : toCheck) 
        {
            Integer oppCount=oppCountMap.get(MerchantId);
           
            if (oppCount == 0)   continue; 
            if (checked.get(oppMap.get(MerchantId).OwnerId) == NULL) 
            {  
                // not cached, must check if active or not    
                if (usrMap.size() == 0)   continue; 
                
                // skip if not found (should be rare in production)                    
                thisId = usrMap.get(oppMap.get(MerchantId).OwnerId).Id;                
                if (usrMap.get(oppMap.get(MerchantId).OwnerId).IsActive == true)
                { 
                    active.add(thisId); 
                }
                    lastAE.put(MerchantId,thisId);
                    checked.put(oppMap.get(MerchantId).OwnerId,thisId);
                    merchantNames.put(MerchantId,oppMap.get(MerchantId).Account.Name);
                    OwnerNames.put(usrMap.get(oppMap.get(MerchantId).OwnerId).Id,usrMap.get(oppMap.get(MerchantId).OwnerId).Name);
            }
        }    
            for (Lead lTemp : listLed)
            {               
                if (lTemp.Referral_Merchant_ID__c != NULL)
                { 
                    ae_Id= lastAE.get(lTemp.Referral_Merchant_ID__c); 
                }
                if (ae_Id!= NULL) 
                {
                    lTemp.Referral_Merchant_Name__c = merchantNames.get(lTemp.Referral_Merchant_ID__c);                 
                    if (active.contains(ae_Id)) 
                    { 
                        lTemp.OwnerId = ae_Id;
                    }
                }
            }
    }   
    
    /** AfterLeadCreatePrincipal2 Trigger Details **/         
    public static void auAfterLeadCreatePrincipal2(list <Lead>listLed1 , Map <Id,Lead>mapLed1 ) 
    {
        List<Contact> contactList = new List<Contact>();
        List<OpportunityContactRole> updOppRoleList = new List<OpportunityContactRole>();       
        List<Contact> contactPrimeList = new List<Contact>();  
        List<String>  contactIDs = new List<String>();          
        Map<id, String> contactEmailMap = new Map<id, String>();
        List<Contact> contactUpdList = new List<Contact>();
          
        for(Lead lTemp: listLed1)
        {
            if(mapLed1.containsKey(lTemp.id))
            {
                Lead oldLead = mapLed1.get(lTemp.id);      
                if(!oldLead.Status.equals('Converted') && lTemp.status.equals('Converted'))
                {
                    if(lTemp.Principal_2_Last_Name__c <> null && lTemp.Principal_2_Last_Name__c <> '')
                    {
                        if(lTemp.convertedAccountId <> null)
                        {
                            Contact cTemp = new Contact();             
                            cTemp.LastName = lTemp.Principal_2_Last_Name__c;
                            cTemp.FirstName = lTemp.Principal_2_First_Name__c;
                            cTemp.Principal_1_Street_Address__c = lTemp.Principal_2_Street_Address__c;
                            cTemp.Principal_1_City__c = lTemp.Principal_2_City__c;
                            cTemp.Principal_1_State__c = lTemp.Principal_2_State__c;
                            cTemp.Principal_1_Zip__c = lTemp.Principal_2_Zip__c;
                            cTemp.Phone = lTemp.Principal_2_Phone__c;
                            cTemp.MobilePhone = lTemp.Principal_2_Mobile__c;
                            cTemp.Email = lTemp.Principal_2_Email__c;
                            cTemp.Date_of_Birth__c = lTemp.Principal_2_Date_of_Birth__c;
                            cTemp.Birthdate = lTemp.Principal_2_Date_of_Birth__c;
                            cTemp.SS__c = lTemp.Principal_2_Social_Security__c;
                            cTemp.OwnershipPercentage__c = lTemp.Principal_2_Percent_Ownership__c;
                            cTemp.Principal_Home_Phone__c = lTemp.Principal_2_Phone__c;          
                            cTemp.AccountId = lTemp.convertedAccountId;
                            cTemp.Created_By_Conversion__c = lTemp.ConvertedOpportunityId;                
                            Boolean insertContact = true;   //commented for testing by QA
                          //  insertContact = checkForContactDup(cTemp);   //commented for testing by QA
                               
                            if(insertContact)
                                contactList.add(cTemp);
                            contactIDs.add(lTemp.convertedContactId);  
                            contactEmailMap.put(lTemp.convertedContactId, lTemp.Principal_1_Email__c);
                        }
                    }
                }
            }
        }
          
        if(!contactIDs.IsEmpty())
        {
            updOppRoleList = [SELECT 
                                    id, IsPrimary 
                                FROM 
                                    OpportunityContactRole 
                                WHERE 
                                    ContactId 
                                IN
                                    :contactIDs];      
            contactPrimeList = [SELECT 
                                    id, email 
                                FROM 
                                    Contact 
                                WHERE 
                                    Id 
                                IN
                                    :contactIDs];
        }

        if(!updOppRoleList.IsEmpty())
        {
            for(OpportunityContactRole oCon: updOppRoleList)
            {
                oCon.IsPrimary = true;
            }
                try
                {
                    Database.update(updOppRoleList,false);
                }
                catch (Exception ex) 
                {   
                    listLed1[0].addError('Caught Exception' + ex.getMessage() +'' + ex.getLineNumber()); 
                }
        }      
        if(!contactPrimeList.IsEmpty())
        {        
            for(Contact cTemp1: contactPrimeList)
            {          
            if(contactEmailMap.containsKey(cTemp1.id))
                {
                    String pEmail = contactEmailMap.get(cTemp1.id);
                    cTemp1.Email = pEmail;
                    contactUpdList.add(cTemp1);
                }
  
            }

            if(!contactUpdList.IsEmpty())
            {
                try
                {
                    Database.update(contactUpdList,false);
                }
                catch (Exception ex) 
                {   
                    listLed1[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                }
            }

        }
        if(!contactList.isEmpty())
        {
            try
            {
                Database.insert (contactList,false);
            }
            catch (System.Exception ex) 
            {   
                 listLed1[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }
    }
     
  
    /** LeadOwnerFromCampaignForCalcLeads Trigger Details **/         
    public static void biLeadOwnerFromCampaignForCalcLeads(list <Lead>listLed2 )
    {
        List<CalcLeadCreator__c> lCreator=[SELECT 
                                                Name 
                                            FROM 
                                                CalcLeadCreator__C 
                                            LIMIT 1];
        Set<String> campId=new Set<String>();
        
        for(Lead lTemp : listLed2)
        {
            if((lTemp.Campaign_Name_Upload__c!=null)&&(lTemp.Campaign_Name_Upload__c!=''))
                campId.add(lTemp.Campaign_Name_Upload__c);
        } 
        Map<id,Campaign> mapCampaign=new Map<id,Campaign>([SELECT
                                                                Id, Default_Lead_Owner__c
                                                            FROM 
                                                                Campaign 
                                                            WHERE 
                                                                Id 
                                                            IN 
                                                                :campId]);          
        for(Lead lTemp :listLed2)
        {
            if(mapCampaign.size()>0)
            {
                if(lTemp.LeadSource=='Partner-Web')
                {
                    //get the userid from custom setting which will be creating records from CALC
                    Id lCreatorTemp=lCreator.size()>0 ? lCreator.get(0).name : null;
                    
                    // the owner and the creator should be same                
                    if(lTemp.ownerID==lCreatorTemp)
                    {
                        if(mapCampaign.get(lTemp.Campaign_Name_Upload__c)!=null)
                        {    
                            try
                            {
                                lTemp.ownerID=mapCampaign.get(lTemp.Campaign_Name_Upload__c).Default_Lead_Owner__c;
                            }
                            catch (System.Exception ex) 
                            {   
                                listLed2[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                            }
                        }
                    
                    }        
                }   
    
            }

        }
        
    }  

    /** trgUpdateOpportunity Trigger Details **/         
    public static void autrgUpdateOpportunity(Map <id,Lead> oldMap, Map <id,Lead> newMap)
    {   
        if(CheckRecursiveTrgUpdateOpportunity.runOnce())
        {  
            Map<ID, ID> oppContactMap = new Map<ID, ID>();   
            List<ID> opportunityID = new List<ID>();
            List<Opportunity> oppsToUpdate = new List<Opportunity>(); 
            
            for(ID iTemp : newMap.keyset())
            {
                Lead lnew=newMap.get(iTemp);
                Lead lold=oldMap.get(iTemp);
                 if((lold.IsConverted == false)&&(lnew.IsConverted==true))
                {
                    oppContactMap .put(lnew.ConvertedOpportunityId,lnew.ConvertedContactId);
                    opportunityID.add(lnew.ConvertedOpportunityId);
                }
            }
            
            for(opportunity opp : [select id, contact__c from opportunity where id in :opportunityID])
            {
                opp.contact__c= oppContactMap.get(opp.id);
                oppsToUpdate.add(opp);   
            }

            if(oppsToUpdate.size()>0)
            {
                try
                {
                    Database.update(oppsToUpdate,false);
                }
                catch(Exception e)
                {
                    System.debug('An exception has occurred at -'+e.getLineNumber()+'-'+e.getMessage());
                }
            }
        }
    }    

    /** LeadSharing Trigger Details **/
    
    public static void aiLeadSharing(list <Lead>listLed4)
    {
        List <User> uRConnect = new List<User>([SELECT Id, Name FROM User WHERE IsActive = True AND Name ='Rock Connections' LIMIT 1]);
        Set<Id> toSend = new Set<Id>();
        String Reassign_OwnerId;
        // Lookup the owner of Rock Connections Leads
        User_Default__c ud = User_Default__c.getInstance('Rock Connections');
                
        if (ud != NULL) 
        { 
            Reassign_OwnerId = ud.UserID__c; 
        }
        else            
        { 
            Reassign_OwnerId = uRConnect.get(0).Id; 
        }
        
        for(Lead lTemp4: listLed4)
        {
            Boolean sendToPartner = false;    
                  
            if ((lTemp4.LeadSource == 'Lead Generation' || lTemp4.LeadSource == 'Web-To-Lead' ||
                lTemp4.LeadSource == 'Calc Lander Web to Lead' || lTemp4.LeadSource == 'Partner') &&
                lTemp4.OwnerId == Reassign_OwnerId) 
            { 
                sendToPartner = true; 
            }
                     
            if (sendToPartner) 
            {
                toSend.add(lTemp4.Id); 
            }
        }
        
        if (toSend.size() > 0) 
        {
            toSend = LeadUtils.toConnect(toSend);
            List<PartnerNetworkRecordConnection> connections = new List<PartnerNetworkRecordConnection>();              
            if (toSend.size() > 0) 
            {
                for (Id iTemp4 : toSend) 
                {
                    PartnerNetworkRecordConnection newConnection = new PartnerNetworkRecordConnection(   
                        // Production  
                        ConnectionId = '04P700000000HMfEAM',             
                        LocalRecordId = iTemp4,
                        SendClosedTasks = false,
                        SendOpenTasks = false,
                        SendEmails = false
                    );
                    connections.add(newConnection);
                }
                /* COMMNETED BY DS-CONAM
                if (! LeadUtils.isTesting()) 
                */
                if(!Test.isRunningTest())
                { 
                    try
                    {
                        Database.insert (connections,false); 
                    }
                    catch (System.Exception ex) 
                    {   
                       listLed4[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                    } 
                }  
            
            }  
        } 
    }
    
    public static void auLeadSharing(list <Lead>listLed4,Map <Id,Lead>mapLed4)
    {
        List <User> uRConnect = new List<User>([SELECT Id, Name FROM User WHERE IsActive = True AND Name ='Rock Connections' LIMIT 1]);
        Set<Id> toSend = new Set<Id>();
        String Reassign_OwnerId;
        // Lookup the owner of Rock Connections Leads
        User_Default__c ud = User_Default__c.getInstance('Rock Connections');
                
        if (ud != NULL) 
        { 
            Reassign_OwnerId = ud.UserID__c; 
        }
        else            
        { 
            Reassign_OwnerId = uRConnect.get(0).Id; 
        }
        
        
        for(Lead lTemp4: listLed4)
        {
            Boolean sendToPartner = false;       
            if (lTemp4.OwnerId == Reassign_OwnerId) 
            {             
                // Check against Marketing
                Lead oldLead = mapLed4.get(lTemp4.Id);
                /* DS-CONAM
                if ( (lTemp4.LeadSource == 'Lead Generation' || lTemp4.LeadSource == 'Web-To-Lead' ||
                    lTemp4.LeadSource == 'Calc Lander Web to Lead') && oldLead.Id != lTemp4.OwnerId) */
                if(lTemp4.LeadSource == 'Lead Generation' || lTemp4.LeadSource == 'Web-To-Lead' || lTemp4.LeadSource == 'Calc Lander Web to Lead')
                {
                  sendToPartner = true; 
                }  

                if (sendToPartner) 
                {
                   toSend.add(lTemp4.Id); 
                }
            }
        }
        if (toSend.size() > 0) 
        {
                       
            toSend = LeadUtils.toConnect(toSend);
            List<PartnerNetworkRecordConnection> connections = new List<PartnerNetworkRecordConnection>();              
            if (toSend.size() > 0) 
            {
                for (Id iTemp4 : toSend) 
                {
                    PartnerNetworkRecordConnection newConnection =
                    new PartnerNetworkRecordConnection
                    (   
                        // Production  
                        ConnectionId = '04P700000000HMfEAM',             
                        LocalRecordId = iTemp4,
                        SendClosedTasks = false,
                        SendOpenTasks = false,
                        SendEmails = false
                    );
                    connections.add(newConnection);
                }
                /* COMMNETED BY DS-CONAM
                if (! LeadUtils.isTesting()) 
                */
                if(!Test.isRunningTest())
                { 
                    try
                    {
                       Database.insert(connections,false); 
                    }
                    catch (System.Exception ex) 
                    {   
                      listLed4[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                    } 
                }  
            
            }  
        }
    }
    
      
    /** AfterLead_RecordAssignment Trigger Details **/            
    public static void auAfterLead_RecordAssignment(list <Lead>listLed5, Map <Id,Lead>mapLed5)
    {
        List<String> ids = new List<String>();
        List<String> oldOwners = new List<String>();
        List<String> newOwners = new List<String>();   
        for(Lead lTemp5: listLed5) 
        {
            Lead oldLead = mapLed5.get(lTemp5.Id);            
            if (lTemp5.OwnerId != oldLead.OwnerId) 
            {   
                // Lead assignment change, create a note/object            
                ids.add(lTemp5.Id);
                oldOwners.add(oldLead.OwnerId);
                newOwners.add(lTemp5.OwnerId);
            }                            
        }                               
   
        if (ids.size() > 0) 
        { 
            try
            {
                Record(Ids, oldOwners, newOwners); 
            }
            catch(Exception ex)
            {
               listLed5[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }            
        }
        
    }  
    
    /**  RetainStatusOnConversion  Trigger Details **/   
    public static void buRetainStatusOnConversion(list<Lead>listLed6)
    {
        List<Lead> leads = new List<Lead>();        
        for(Lead lTemp6 :listLed6)
        {
            if((lTemp6.isConverted==true)&&(lTemp6.status != 'Converted'))
            {
                lTemp6.status='Converted';
            }
        } 
    }
    
    
    /**  createCampaignMemberForRockConn  Trigger Details **/     
    public static void aiCreateCampaignMemberForRockConn(List<Lead>listLed7,Map<id,Lead>mapLed7)
    {
         createCampaignHelper(listLed7,mapLed7);
    }
    public static void aucreateCampaignMemberForRockConn(List<Lead>listLed7,Map<id,Lead>mapLed7)
    {
        createCampaignHelper(listLed7,mapLed7);
    }
    private static void createCampaignHelper(List<Lead>listLed7,Map<id,Lead>mapLed7)
    {
       List<PartnerNetworkConnection> pncList=[SELECT 
                                                    Id,ConnectionName 
                                                FROM 
                                                    PartnerNetworkConnection 
                                                WHERE 
                                                    ConnectionName='Rock Connections' 
                                                AND 
                                                    ConnectionStatus='Accepted'];
        Set <id> lId = new Set <id> ();
        Map <id, id> leadCampMap = new Map <id, id> ();
        Map <String, String> leadCampCst = new Map <String, String> ();
        List <CampaignMember> newMember = new List <CampaignMember> ();

        for (Lead lTemp:listLed7) 
        {    
            if(!test.isRunningTest())
            {
                if(lTemp.ConnectionReceivedId==pncList[0].id) 
                lId.add(lTemp.id);       
            }
            else
            {
                lId.add(lTemp.id);
            }
        }
    
        if (lId.size()> 0) 
        {
            List <Lead> lList = [SELECT
                                        id, RC_Lead_Type__c 
                                    FROM 
                                        Lead 
                                    WHERE 
                                        Id 
                                    IN 
                                        :lId 
                                    AND
                                        (RC_Lead_Type__c != ''
                                    OR 
                                        RC_Lead_Type__c != null)];
            // get values from custom settings
            if (lList.size()> 0) 
            {
                Set <String> lListName = new Set <String> ();
                for (Lead lTemp: lList)
                {
                    lListName.add(lTemp.RC_Lead_Type__c);
                }

                List <CampaignByLeadType__c> lCst = [SELECT 
                                                            Name,CampaignID__c 
                                                        FROM 
                                                            CampaignByLeadType__c];
                //generate set for comparison
                Set <String> lCstName = new Set <String> ();
                Set <String> lCstID = new Set <String> ();                
                if (lCst.size()> 0) 
                {
                    for (CampaignByLeadType__c ctemp: lCst) 
                    {
                        lCstName.add(ctemp.Name);
                        lCstID.add(ctemp.CampaignID__c);
                        leadCampCst.put(ctemp.Name, ctemp.CampaignID__c);
                    }

                    for (Lead lTemp: lList) 
                    {
                        if (lCstName.contains(lTemp.RC_Lead_Type__c)) 
                        {
                            leadCampMap.put(lTemp.id, leadCampCst.get(lTemp.RC_Lead_Type__c));
                        }
                        else
                        {
                            leadCampMap.put(lTemp.id, leadCampCst.get('DEFAULTCAMPAIGN'));                    
                        }                  
                    }   
                    
                    List<CampaignMember> existingMemberList=[SELECT 
                                                                    Id,Leadid,CampaignId 
                                                                FROM 
                                                                    Campaignmember 
                                                                WHERE 
                                                                    CampaignId 
                                                                IN 
                                                                    :lCstID  
                                                                AND
                                                                    LeadId 
                                                                IN
                                                                    :lId];
                                                                    
                    Map<String,Integer>existingMemberMap=new Map<String,Integer>();                    
                    for(CampaignMember cTemp: existingMemberList)
                    {
                        String temp=cTemp.leadid+''+cTemp.campaignid;                    
                        existingMemberMap.put(temp,1);
                    }
                    if (leadCampMap.size()> 0) 
                    {
                        for (String sTemp: leadCampMap.keyset()) 
                        {
                            //create the member only if it is not the member in cmpaign
                            if(!existingMemberMap.containskey(sTemp+''+leadCampMap.get(sTemp)))
                            {
                                    CampaignMember cMemberTemp = new CampaignMember();
                                    cMemberTemp.CampaignId = leadCampMap.get(sTemp);
                                    cMemberTemp.LeadId = sTemp;
                                    cMemberTemp.Status= 'Sent';
                                    newMember.add(cMemberTemp);
                            }
                        }
                    }
                    if (newMember.size()> 0) 
                    {
                        try
                        {
                            Database.upsert (newMember,false);    
                        }   
                        catch (system.Exception ex) 
                        {   
                            newMember[0].addError(' LoggingLevel.Error: Lead share trigger failed -' + '' + ex.getMessage() + '' +ex.getLineNumber());  
                        } 
                    }
                }
            }
        }
    }
    
    
    /**  LeadS2STrigger  Trigger Details **/     
    public static void aiLeadS2STrigger(list<Lead>listLed8)
    {
        try 
        {             
            Id connectionId = ConnectionHelper.getConnectionId('Rock Connections');    
            // for Leads coming from Rapid Advance org - need to push the LeadId       
            Set<Id> newLeadIds = new Set<Id>();         
            
            for (Lead newLead : listLed8) 
            { 
                 if ((newLead.ConnectionReceivedId != null && newLead.ConnectionReceivedId == connectionId)  ||test.isRunningTest())
                     newLeadIds.add(newLead.Id); 
            } 
        
                if (newLeadIds.size() > 0) 
                {            
                    //ExternalSharingHelper.touchCases(newLeadIds); 
                    touchCases(newLeadIds); 
                } 
        } 
        catch (system.Exception ex) 
        {   
            // System.debug(LoggingLevel.Error, 'Lead share trigger failed -' + ex.getMessage()); 
            listLed8[0].addError(' LoggingLevel.Error: Lead share trigger failed -' + '' + ex.getMessage() + '' +ex.getLineNumber()); 
        } 
    }
    
    public static void auUpdatePrimaryCampaignSource(Map <id, Lead> newMap, Map <id, Lead> oldMap) 
    {
        Set<Id> oppId;
        List<Opportunity> opps = new List<Opportunity>();
        Set<Id> Ids = new Set<Id>();
        Map<Id,Id> mapCamp = new Map<Id,Id>();
        List<Opportunity> upOpp=new List<Opportunity>();

        for (id iTemp: newMap.keyset()) 
        {
            Ids.add(iTemp);
        }

        /*Querying the Campaign Member records which are leads and where the Campaigns, to which they were assigned,
          have been responded to.*/
      
        List<CampaignMember> camp = [SELECT
                                            Id,CampaignId,FirstRespondedDate,First_Responded_Date__c 
                                        FROM
                                            CampaignMember 
                                        WHERE
                                            LeadId =:Ids 
                                        AND 
                                            HasResponded = True 
                                        ORDER BY 
                                            First_Responded_Date__c ASC ];

        if(camp.size()>0)
        {
            /* Assigning the first CampaignId from the List above, to the a Map with Corresponding Converted OpportunityId
            of this Lead.*/
    
            for (id iTemp: newMap.keyset())
            {
                if ((newMap.get(iTemp).IsConverted == true) && (newMap.get(iTemp).ConvertedOpportunityId != null)) 
                {
                    mapCamp.put(newMap.get(iTemp).ConvertedOpportunityId, camp.get(0).CampaignId);
                }
            }
      
            //Updating the Opportunity with CampaignId, which would set the Primary Campaign Source on Opportunity.
       
             opps = [SELECT
                            CampaignId
                        FROM
                            Opportunity
                        WHERE
                            Id
                        IN: mapCamp.keySet()];

            for (Opportunity o: opps) 
            {
                o.CampaignId = mapCamp.get(o.Id);
                upOpp.add(o);
            }

            if (upOpp.size()> 0) 
            {
                try 
                {
                    Database.update (upOpp,false);
                } 
                catch (Exception e) 
                {
                    upOpp[0].addError('An exception has occurred ' + '' +e.getMessage()+ '' +e.getLineNumber() );
                }
            }
        }   
    }
   
    public static void record(String[] Ids, String[] OldOwners, String[] NewOwners) 
    {
          List<Ownership_Change__c> toInsert = new List<Ownership_Change__c>();
          Integer counter = 0;
          for (String id : Ids) 
          {
             Ownership_Change__c oc = new Ownership_Change__c 
             (
                Old_OwnerId__c = OldOwners[counter],
                New_OwnerId__c = NewOwners[counter]
             );
            /*  DS-CONAM
              if (id.substring(0, 3) == '006') 
             {   
             // Carry out additional instructions for Opps
             }
             else 
             { 
                 oc.LeadId__c = id;
             }   // Populate Lead Id
            */
              if (id.substring(0, 3) != '006') 
              {   
                  oc.LeadId__c = id;
              } 
              
             toInsert.add(oc);
             counter++;
          }  // end for
          
        if (toInsert.size() > 0) 
        {
             try 
             { 
                Database.insert(toInsert,false); 
             }
             catch (DMLException e) 
             {  
                toInsert[0].addError('An Exception has Occured ...'+ '' + e.getMessage() + '' + e.getLineNumber());
             }
        }
    }     // end Record method

    public static void biPopulateBusinessEmailForCALC(List<Lead> newList) 
    {

        User uTemp=[Select 
                            id 
                    from 
                            user 
                    where 
                            username like 'webapps@rapidadvance.com%' 
                    ORDER BY 
                            CREATEDDATE desc 
                    Limit 1];

        for(Lead lTemp : newList)
        {
            System.debug('>>>>>>>>>>>>'+lTemp.ownerID+'>>>>>>>>'+uTemp.id);
            if((lTemp.email==null)&&(lTemp.ownerID==uTemp.id))
            {
                lTemp.email=lTemp.Principal_1_Email__c;
            }
        }
    }
     
    @future 
    public static void touchCases(Set<Id> leadids) 
    { 
        List<Lead> leadList = [SELECT 
                                        Id 
                                    FROM 
                                        Lead 
                                    WHERE 
                                        id in :leadids 
                                    AND 
                                        isConverted=false]; 
        try
        {
            Database.update(leadList,false); 
        }
        catch(Exception ex)
        {
            leadList[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        }
    } 
}