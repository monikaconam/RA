/**
*********************************************************************************************************************
* Module Name   :  CampaignTriggerHandler
* Description   :  Handler Class for Campaign Triggers
* Organization  :  ConAm Technologies Pvt. Ltd.
*  
* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      08/24/2015     MKConAm                      Initial Version
*******************************************************************************************************************
**/
public with sharing class CampaignTriggerHandler
{
    /**     **/
    public static void biBeforeOwnerChange (List<Campaign>listCmp)
    {
        bInsbeforeOwnerChange(listCmp); 
    }
    public static void buBeforeOwnerChange (List<Campaign>listCmp,map<Id,Campaign>mapCmp)
    {
        bUpdbeforeOwnerChange(listCmp,mapCmp); 
    }
    public static void binsbeforeOwnerChange (List<Campaign>listCmp)
    {
        Set<Id> OwnerIds = new Set<Id>();
        Map<Id, String> OwnerEmails = new Map<Id, String>();    
        // Make a Map of all the Owner Emails
        for (Campaign c : listCmp) 
        {
              OwnerIds.add(c.OwnerId);
              if (c.Additional_Owner__c != NULL) 
              { 
                  OwnerIds.add(c.Additional_Owner__c); 
              }
        }
        List<User> usr = [SELECT 
                                Id,Email 
                            FROM 
                                User 
                            WHERE 
                                Id IN : OwnerIds];        
        for (User u : usr) 
        {
            OwnerEmails.put(u.Id, u.Email);
        }
       
        // Cycle through
        for (Campaign cmp : listCmp)
        {
            Boolean toProcess = false;
            toProcess = true;        
        
            if (toProcess)
            {
                cmp.BD_Send_Cmpn_Owner__c = OwnerEmails.get(cmp.OwnerId);
                if (cmp.Additional_Owner__c != NULL)
                {
                    try
                    {
                        cmp.BD_Send_Addtl_Owner__c = OwnerEmails.get(cmp.Additional_Owner__c);
                    }
                    catch(Exception ex)
                    {
                        cmp.addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                    }
                }
            }  // end if to Process
        
        }    // end main FOR loop
    }
    public static void bUpdbeforeOwnerChange(List<Campaign>listCmp,Map<Id,Campaign>mapCmp)
    {
        Set<Id> OwnerIds = new Set<Id>();
        Map<Id, String> OwnerEmails = new Map<Id, String>();    
        // Make a Map of all the Owner Emails
        for (Campaign c : listCmp) 
        {
              OwnerIds.add(c.OwnerId);
              if (c.Additional_Owner__c != NULL) 
              { 
                  OwnerIds.add(c.Additional_Owner__c); 
              }
        }
        List<User> usr = [SELECT 
                                Id,Email 
                            FROM 
                                User 
                            WHERE 
                                Id IN : OwnerIds];        
        for (User u : usr) 
        {
            OwnerEmails.put(u.Id, u.Email);
        }
       
        // Cycle through
        for (Campaign cmp : listCmp)
        {
            Boolean toProcess = false;          
            Campaign oldCampaign = mapCmp.get(cmp.Id);
            if (oldCampaign.OwnerId != cmp.OwnerId || oldCampaign.Additional_Owner__c != cmp.Additional_Owner__c)
            {
                toProcess = true;
            }              
        
            if (toProcess)
            {
                cmp.BD_Send_Cmpn_Owner__c = OwnerEmails.get(cmp.OwnerId);
                if (cmp.Additional_Owner__c != NULL)
                {
                    try
                    {
                        cmp.BD_Send_Addtl_Owner__c = OwnerEmails.get(cmp.Additional_Owner__c);
                    }
                    catch(Exception ex)
                    {
                        cmp.addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                    }
                }
            }  // end if to Process
        
        }    // end main FOR loop
    }
        
    /**    **/
    public static void aiCampaignCALC  (list<Campaign>listCmp)
    {
        aiuCampaignCALC(listCmp);  
    }
    public static void auCampaignCALC  (List<Campaign>listCmp)
    {
        aiuCampaignCALC(listCmp);      
    }
    public static void aiuCampaignCALC  (List<Campaign>listCmp)
    {
        for(Campaign cmp: listCmp)
        {
            String campaignId = String.valueOf(cmp.Id);            
            // Modified to include all Campaign types - CY, 10/21/2014
            //if (campaignId != null && (c.Type != null && c.Type.equals('Partners')))                        
            if (campaignId != null && cmp.Type != null) 
            {                   
                try
                {
                    CALC.CampaignRequest(campaignId);
                }
                catch(Exception ex)
                {
                    cmp.addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                }
            }
        }
    }
}