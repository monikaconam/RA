/**
*********************************************************************************************************************
* Module Name   :  AttachmentTriggerHandler
* Description   :  Handler Class for Attachment triggers
* Organization  :  ConAm Technologies Pvt. Ltd.
*  
* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      08/24/2015     MKConAm                      Initial Version
*******************************************************************************************************************
**/
public with sharing class AttachmentTriggerHandler
{
    public static void adAttachment_Delete_SiteSurvey(List<Attachment>ListAtt)
    {
        Set<String> attchParentIds = new Set<String>();
        Map<Id,Set<String>> surveyAttachMap = new Map<Id, Set<String>>();        
        Set<String> attacList;            
        for(Attachment att:ListAtt)
        {
            if(surveyAttachMap.containsKey(att.ParentId))
            {
                attacList = surveyAttachMap.get(att.ParentId);  
            } 
            else
            {
                attacList = new Set<String>();
            }
            attacList.add(att.Id);
            surveyAttachMap.put(att.ParentId, attacList);
        }    
        List<Site_Survey__c> surveyList = [SELECT 
                                                Id,Viewing_Status__c 
                                            FROM 
                                                Site_Survey__c 
                                            WHERE 
                                                Id IN : surveyAttachMap.keySet()];
        List<Site_Survey__c> surveyToUpdate = new List<Site_Survey__c>();    
        for(Site_Survey__c st :surveyList)
        {
            if(st.Viewing_Status__c != null) 
            { 
                Set<String> viewedSet = new Set<String>();
                viewedSet.addAll(st.Viewing_Status__c.split(','));
                String viewIds = st.Viewing_Status__c;
                Set<String> deleteAttachIds = surveyAttachMap.get(st.Id);
                
                for(String attid :deleteAttachIds)
                {                    
                    if(viewIds.contains(','+ attid) || viewIds.contains(attid + ',') || 
                        ( (!viewIds.contains(',')) && (ID)viewIds == (ID)attid))
                    {
                        viewedSet.remove(attId);        
                    }   
                }                
                if(!viewedSet.isEmpty())
                {
                    List<String> updateViewIds = new List<String>();
                    updateViewIds.addAll(viewedSet);
                    st.Viewing_Status__c = String.join(updateViewIds,',');
                    surveyToUpdate.add(st);
                }                
            }
        }        
        if(!surveyToUpdate.isEmpty())
        {
            try
            {
                Database.update(surveyToUpdate,false);
            } 
            catch (Exception ex) 
            {
                listAtt[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }
    }
}