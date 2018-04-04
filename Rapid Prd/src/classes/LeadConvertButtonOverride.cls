public class LeadConvertButtonOverride 
{    
    public List <Account> accountList{get;set;}
    public string leadId{get;set;}
    Lead lTemp;
    public String isSelected{get;set;}
    public String selectedAccId {get; set;}
    List<Lead> leadList;
    RecordType rt;
    Id newAccId;
    Boolean flag=false;
    
    public leadConvertButtonOverride(ApexPages.StandardController controller) 
    {
        Lead temp = (Lead)controller.getRecord();
        leadId =temp.id;       
    }

     
    public PageReference autoConvert()
    {
        PageReference p=null;
        try
        {
            List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
            LeadStatus convertStatus = [select MasterLabel from LeadStatus where IsConverted = true limit 1];
            
            List<Lead> leadToConvert = [Select
                                                id, company ,name, isConverted, createdDate 
                                        from 
                                                Lead
                                        Where
                                                id =: leadId
                                        ];
            List<CampaignMember>campList = [SELECT
                                                    Name,Id,LeadId,CampaignId 
                                            FROM
                                                    CampaignMember 
                                            WHERE 
                                                    LeadId In: leadToConvert 
                                            AND 
                                                    Campaign.Name='Partner Web Leads'];
            

            if (!leadToConvert[0].isConverted  )
            {
                Database.LeadConvert lc = new Database.LeadConvert();
                String oppName = leadToConvert[0].Name;               
                lc.setLeadId(leadToConvert[0].Id);
                lc.setOpportunityName(oppName);
                                   
                if(campList.size()>0)
                {
                    lc.setOpportunityName(null);
                    lc.setDoNotCreateOpportunity(true);
                }
                
                lc.setConvertedStatus(convertStatus.MasterLabel);
               
                leadConverts.add(lc);
            }

            
            if (!leadConverts.isEmpty())
            {
                List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);
                List<account> accTemp=[Select 
                                            id
                                        from
                                            Account 
                                        where
                                            id=: lcr.get(0).getAccountID()];
                if(accTemp.size()>0)
                {
                   // accTemp.get(0).Lead_created_date__c=leadToConvert.get(0).createdDate;
                   // update accTemp;
                }
                p=new PageReference('/'+lcr.get(0).getAccountID());
            }
        }
        /*catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Fatal,e.getMessage()));
            p=null;
        }*/
         catch(Exception e)
        {
            String error = e.getMessage();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,error));
            p=null;
        }
        
        return p;
    }    
    
    public PageReference gtMethod()
    {
        PageReference p=null;
        List<CampaignMember> cmLeadList=new List<CampaignMember>();
        List<Lead> lRecord=[Select 
                                    id, RecordTypeId, name, Company 
                            from
                                    Lead
                            where
                                    id=:leadID Limit 1];
       
        cmLeadList=[Select 
                            id, campaignId, campaign.type
                     from
                            CampaignMember 
                     where
                            leadId=: leadID and campaign.Name='Green Tree Funding'];
        
        if(cmLeadList.size()>0 )
        {
            List <Database.LeadConvert> leadConverts = new List <Database.LeadConvert> ();
            List <Database.LeadConvertResult> lcrList = new List <Database.LeadConvertResult> ();
            String companyName = '';
            Database.LeadConvert lc = new database.LeadConvert();
            RecordType rt = [select 
                                        id 
                            from        
                                        recordtype 
                            where 
                                        sobjecttype = 'account'
                            and 
                                        developername = 'Partners' Limit 1];
     
            if (lRecord.get(0).Company != null && lRecord.get(0).Company != '') 
                companyName = lRecord.get(0).Company;
            
            
            if (!lRecord.isEmpty())
            {
                Map <Id, List <Account>> LeadIdAccountMap = new Map <Id, List <Account>> ();
                List <Account> accountList = new List <Account> ();
                
                if (companyName != null && companyName != '') 
                {
                    for (Account acc: [select Id from account where Name = : companyName AND RecordType.Name = 'Partners'])
                    {
                        accountList.add(acc);
                    }
                }
                
                LeadIdAccountMap.put(lRecord.get(0).Id, accountList);
                
                lc.setLeadId(lRecord.get(0).Id);
                lc.setDoNotCreateOpportunity(true);
                lc.setOverwriteLeadSource(true);
                LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
                lc.setConvertedStatus(convertStatus.MasterLabel);
                
                if (accountList.size() == 0 || accountList.size()> 1) 
                {
                    account acc = new Account(Name = companyName, recordtypeid = rt.id);
                    insert acc;
                    lc.setAccountId(acc.Id);
                } 
                else 
                {
                    lc.setAccountId(accountList.get(0).Id);                   
                }
                leadConverts.add(lc);           
            }
            
            if (!leadConverts.isEmpty()) 
            {
                List <Partner_category__c> updateObjList = new List <Partner_category__c> ();
                lcrList = Database.convertLead(leadConverts, false);
                for (Partner_category__c pTemp: [Select
                                                        id, Partner_Account__c, Partner_Lead__c
                                                from
                                                        Partner_category__c
                                                where
                                                        Partner_Lead__c = : leadId Limit 1000]) {
                    pTemp.Partner_Lead__c = null;
                    pTemp.Partner_Account__c = lcrList.get(0).getAccountId();
                    updateObjList.add(pTemp);
                
                }
                
                if (updateObjList.size()> 0) 
                    update updateObjList;

                p = new PageReference('/' + lcrList.get(0).getAccountId());
                P.setRedirect(true);
            }
        }
        else
        {
            List<String> pName=new List<String>();
            List<Lead> lList =new List<Lead>();  
            Set <ID> leadConvertId = new Set <ID> ();
            List <String> userProfileIdLst = new List <String> ();
            Set <String> userProfileIdSet= new Set <String> ();
            List <Opportunity> objOpportunityLst = new List <Opportunity> ();
            Map <String , CampaignMember> mapCampaignMemberId = new Map <String , CampaignMember> ();                                            
            
            for(GreenTreeTeamProfile__c gt : GreenTreeTeamProfile__c.getall().values())
                pName.add(gt.name);       
            
            for(Profile pTemp : [Select id from Profile where profile.name in : pName])
            {
                userProfileIdLst.add(pTemp.id);
            }      
            userProfileIdSet.addall(userProfileIdLst);    
            
            Id objOpportunityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('GreenTree').getRecordTypeId();        
        
            List <CampaignMember> objCampaignMemberls = new List <CampaignMember> ([SELECT 
                                                                                            CampaignId, leadid, Campaign.name 
                                                                                    FROM 
                                                                                            CampaignMember 
                                                                                    where   
                                                                                           leadid = : (Id)leadId
                                                                                    and                                                                    
                                                                                            Campaign.name='Green Tree Funding' ]);
                                                             
            User us = [select 
                                id, name, profileId
                        from 
                                user 
                        where 
                                id = : UserInfo.getUserid() Limit 1];
                                
            String profileId= String.valueOf(us.profileId);
           
            if((userProfileIdSet.contains(profileId)) || (objCampaignMemberls .size()>0))
            {                                                                     
               if (mapCampaignMemberid.containskey(leadID)!=null) 
               {

                    Database.LeadConvert Leadconvert = new Database.LeadConvert();
                    Leadconvert.setLeadId(LeadId);
                    LeadStatus Leads= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
                    Leadconvert.setConvertedStatus(Leads.MasterLabel);
                    Leadconvert.setDoNotCreateOpportunity(false); 
                    Database.LeadConvertResult Leadconverts = Database.convertLead(Leadconvert);
                    p=new PageReference('/'+Leadconverts.getAccountId());
                    p.setRedirect(true); 
                }    
            }
        }
        return p;
             
    }
    /**  for Opportunity and Account Conditional Conversion List<Id> LeadIds**/

// The method should return the list of matching accounts on vf page.
    public PageReference selectPartnerAccount(){
    System.debug('>>>>>>>>>>>>>>>>>>>>>>> '+ leadID);
        PageReference p = Null;
        rt = [select 
                        id 
            from        
                        recordtype 
            where 
                        sobjecttype = 'account'
            and 
                        developername = 'Partners' Limit 1];
         
        List <Lead> leadLst = [Select 
                                        name, Id, RecordTypeId, Company, RecordType.name, createddate,
                                        How_Did_You_Hear_About_Us__c, Competitors_they_work__c, Other_services_offered__c,
                                        Paper_they_concentrate_on__c, Units_funded_per_month__c,Average_dollar_amount_funded__c,
                                        Rating, Type_of_contract_sent__c, Specify_Contract_Type_for_Other__c, Are_you_a_direct_lender__c,
                                        Have_you_ever_been_convicted_of_a_felony__c, NumberOfEmployees, partner_channel__c,
                                        Your_Experience_in_this_Industry__c, Industries_you_are_focused_on__c,Description,
                                        Your_Current_Conversion_Rate__c, No_of_Reps__c, What_is_your_submission_process__c,
                                        Your_likes_dislikes_about_other_Funders__c, Your_likes_dislikes_about_our_Industry__c,
                                        Why_RapidAdvance__c, Interested_in_Syndication__c,
                                        Your_future_growth_plans__c, When_expected_to_start_submitting__c,
                                        How_much_first_postion_funding__c, How_much_new_funding__c 
                                From 
                                        Lead 
                                Where 
                                        RecordType.name = 'Partners'
                                and 
                                        Id = : leadId];
                                                
        if (!leadLst.isEmpty()){
            leadList = leadLst.clone();
            accountList = New List<Account>();
            if (leadLst.get(0).Company != null && leadLst.get(0).Company != '')
            {   
                String str='Select Id, Name from account where name like \'%'+String.escapeSingleQuotes(leadLst.get(0).Company)+'%\' AND RecordType.Name = \'Partners\' order by name ';
                System.debug(str);
                List<Account> accList=Database.query(str);
                                   
                for (Account acc: accList){
                    accountList.add(acc);
                }
                if(accountList.size()>0){
                    Account tempAcc = new Account(Name = 'New Account', id=Null);
                    accountList.add(tempAcc);
                }
                
                if(accountList.size()==0){
                    autoPartnerConvert();
                    System.debug('======= newAccId '+newAccId );
                    System.debug('======= flag '+flag );
                    if(newAccId != null && flag == false ){
                        p = new PageReference('/' + newAccId);
                        p.setRedirect(true);
                    }
                }
            }
        }
        return p;
    }
    public PageReference autoPartnerConvert(){
        //02/08/2018 lead description should be appended to the account description RA- ticket (#52463)
        List <Database.LeadConvertResult> lcrList = new List <Database.LeadConvertResult> ();
        PageReference p = null;
        List <Database.LeadConvert> leadConverts = new List <Database.LeadConvert> ();
        Database.LeadConvert lc = new Database.LeadConvert();
        String msg;
        try{    
                List<CampaignMember> campMemList = [Select Id,LeadId,Campaign.Name From CampaignMember Where LeadId =: leadList[0].Id Order By CreatedDate DESC];
                lc.setLeadId(leadList[0].Id);
                lc.setDoNotCreateOpportunity(true);
                lc.setOverwriteLeadSource(true);
                LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
                lc.setConvertedStatus(convertStatus.MasterLabel);
                Savepoint sp = Database.setSavepoint();
                if(!String.isBlank(selectedAccId))
                {
                    lc.setAccountId(selectedAccId);
                    
                    /*List<Account> UpdateAccount = [select id,Description from Account where id =: selectedAccId];
                     for(Account acc : UpdateAccount ){
                         acc.Description += leadList.get(0).Description ;
                     }
                     if(!UpdateAccount.IsEmpty()){
                         update UpdateAccount;
                     }*/
                     
                        Account acc = [SELECT Id,Description FROM Account WHERE ID =: selectedAccId limit 1];
                        
                        String append = '';
                        if(acc.Description != null && acc.Description != ''){
                            append = acc.Description;
                        }
                        
                        if(leadList.get(0).Description != null && leadList.get(0).Description != ''){
                            append  += '\n'+leadList.get(0).Description;
                        }
                        
                        if(append.length() > 32000){
                            acc.Description = append.substring(0,32000);
                        }
                        else{
                            acc.Description = append;
                        }
                        update acc;
                }
                else
                {
                    account acc = new Account(Name = leadList.get(0).Company, recordtypeid = rt.id );
                    acc.How_Did_You_Hear_About_Us__c=leadList.get(0).How_Did_You_Hear_About_Us__c;
                    acc.Competitors_they_work__c=leadList.get(0).Competitors_they_work__c;
                    acc.Other_services_offered__c=leadList.get(0).Other_services_offered__c;
                    acc.Paper_they_concentrate_on__c=leadList.get(0).Paper_they_concentrate_on__c;
                    acc.Units_funded_per_month__c=leadList.get(0).Units_funded_per_month__c;
                    acc.Average_dollar_amount_funded__c=leadList.get(0).Average_dollar_amount_funded__c;
                    acc.How_much_first_postion_funding__c=leadList.get(0).How_much_first_postion_funding__c;
                    acc.How_much_new_funding__c=leadList.get(0).How_much_new_funding__c;
                    acc.Rating=leadList.get(0).Rating;
                    acc.Type_of_contract_sent__c=leadList.get(0).Type_of_contract_sent__c;
                    acc.Specify_Contract_Type_for_Other__c=leadList.get(0).Specify_Contract_Type_for_Other__c;
                    acc.Are_you_a_direct_lender__c=leadList.get(0).Are_you_a_direct_lender__c;
                    acc.Have_you_ever_been_convicted_of_a_felony__c=leadList.get(0).Have_you_ever_been_convicted_of_a_felony__c;
                    acc.NumberOfEmployees=leadList.get(0).NumberOfEmployees; 
                    acc.Partner_channel__c=leadList.get(0).Partner_channel__C;                
                    acc.Your_Experience_in_this_Industry__c=leadList.get(0).Your_Experience_in_this_Industry__c;
                    acc.Industries_you_are_focused_on__c=leadList.get(0).Industries_you_are_focused_on__c;
                    acc.Your_Current_Conversion_Rate__c=leadList.get(0).Your_Current_Conversion_Rate__c;
                    acc.No_of_Reps__c=leadList.get(0).No_of_Reps__c;
                    acc.What_is_your_submission_process__c=leadList.get(0).What_is_your_submission_process__c;
                    acc.Your_likes_dislikes_about_other_Funders__c=leadList.get(0).Your_likes_dislikes_about_other_Funders__c;
                    acc.Your_likes_dislikes_about_our_Industry__c=leadList.get(0).Your_likes_dislikes_about_our_Industry__c;
                    acc.Why_RapidAdvance__c=leadList.get(0).Why_RapidAdvance__c;
                    acc.Interested_in_Syndication__c=leadList.get(0).Interested_in_Syndication__c;
                    acc.Description = leadList.get(0).Description;
                    acc.Your_future_growth_plans__c=leadList.get(0).Your_future_growth_plans__c;
                    acc.When_expected_to_start_submitting__c=leadList.get(0).When_expected_to_start_submitting__c;
                    if(campMemList.size()>0){
                        acc.Campaign_Partner_Prospects__c = campMemList.get(0).Campaign.Name;
                    }
                    insert acc;
                    newAccId = acc.Id;
                    lc.setAccountId(acc.Id);
                    
                }

            leadConverts.add(lc);
            if (!leadConverts.isEmpty()){
                lcrList = Database.convertLead(leadConverts, false);
                
                if(lcrList.get(0).isSuccess())
                {
                    List <Partner_category__c> updateObjList = new List <Partner_category__c> ();
                    
                    for (Partner_category__c pTemp: [Select
                                                            id, Partner_Account__c, Partner_Lead__c
                                                    from
                                                            Partner_category__c
                                                    where
                                                            Partner_Lead__c = : leadId Limit 1000]) {
                        pTemp.Partner_Lead__c = null;
                        pTemp.Partner_Account__c = lcrList.get(0).getAccountId();
                        updateObjList.add(pTemp);
                    
                    }
                    system.debug('======updateObjList'+updateObjList.size());
                    
                    if (updateObjList.size()> 0) 
                        update updateObjList;
                        
                    system.debug('======updateObjListgetAccountid'+lcrList.get(0).getAccountId());     

                    p = new PageReference('/' + lcrList.get(0).getAccountId());
                    p.setRedirect(true);
                }
                else
                {
                    msg='Conversion Error :';
                    List<Database.Error> errList=lcrList.get(0).getErrors();
                    for(Database.Error d: errList)
                    {
                        msg = msg +' '+ d.message+ '\n';
                        //String error = e.getMessage();
                        system.debug('======msg'+msg);
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,msg));
                        
                        Database.rollback( sp );
                        flag = true;
                    }
                     p=null;
                }
            }
            else{
                p = new PageReference('/' + leadId);
                p.setRedirect(true);
            }
        }
        /*catch (Exception e){
            ApexPages.Message myMsg = ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Fatal, e.getMessage()));
            ApexPages.addMessage(myMsg);﻿
            p = null;
        }*/
        catch(Exception e)
        {
            String error = e.getMessage();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,error));
            p=null;
        }
        return p;
    }
    
class LeadConversionException extends Exception {}
}