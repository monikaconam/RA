/**
*********************************************************************************************************************

* Module Name   :  MasterLeadTrigger 
* Description   :  
* Organization  : ConAm Technologies Pvt. Ltd.
*  
* Revision History:-
* Version  Date           Author          Description of Action
* 1.0      07/14/2015     MKConAm         Initial Version
*   
*******************************************************************************************************************
**/

trigger MasterLeadTrigger on Lead (after insert, after update, before insert, before update) 
{  
  if(trigger.isBefore)
      {
        
        if(trigger.isInsert)
        { 
            PurgeNameHelper.cleanLeadCName(Trigger.new);    
            LeadTriggerHandler.biPopulateBusinessEmailForCALC(trigger.new);             
            LeadTriggerHandler.biBeforeGlobal(trigger.new);           
            LeadTriggerHandler.biLeadOwnerFromCampaignForCalcLeads(trigger.new);
            LeadTriggerHandler.biSendLeadRequestToDNC(trigger.new);
            LeadTriggerHandler.biPopulateLeadSourceIfReferral(trigger.new);
            //LeadTriggerHandlerPart2.partnerAutoIncrementInsert(trigger.new);
         } 
        
        if(trigger.isUpdate)
        {   
            LeadTriggerHandler.buPurgeLeadName(Trigger.oldMap, Trigger.newMap);       
            LeadTriggerHandler.buBeforeGlobal(trigger.new, trigger.oldMap);
            LeadTriggerHandler.buRetainStatusOnConversion(trigger.new);
            LeadTriggerHandler.buSendLeadRequestToDNC(trigger.oldMap, trigger.newMap);
            
            if(CheckLeadRRRecursive.runOnce())
                LeadTriggerHandlerPart2.partnerAutoIncrementUpdate(Trigger.new,Trigger.oldMap);
        }
      }    
    if(trigger.isAfter)
    {
    
        if(trigger.isInsert)
        {       
            LeadTriggerHandler.aiLeadSharing(trigger.new);
            LeadTriggerHandler.aiLeadS2STrigger(trigger.new);
            LeadTriggerHandler.aicreateCampaignMemberForRockConn(trigger.new,trigger.oldMap);    
                   
        } 
        if(trigger.isUpdate)
        {
            
            LeadTriggerHandler.auAfterLeadCreatePrincipal2(trigger.new, trigger.oldMap);
            LeadTriggerHandler.autrgUpdateOpportunity(trigger.oldmap, trigger.newMap);
            LeadTriggerHandler.auLeadSharing(trigger.new, trigger.oldMap);
            LeadTriggerHandler.auAfterLead_RecordAssignment(trigger.new, trigger.oldMap);
            LeadTriggerHandler.auUpdatePrimaryCampaignSource(trigger.newMap, trigger.oldMap);
            LeadTriggerHandler.aucreateCampaignMemberForRockConn(trigger.new,trigger.oldMap);         
            LeadTriggerHandlerPart2.auPopulateAccountLeadCreatedDate(trigger.newMap,trigger.oldMap); 
            //PopulateCampaignStageTriggerHandler.callApprovalProcessOnLead (trigger.new,trigger.oldMap);           
        }
    }
}