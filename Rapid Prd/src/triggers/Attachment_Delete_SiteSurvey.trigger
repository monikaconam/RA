trigger Attachment_Delete_SiteSurvey on Attachment (after delete) 
{
    set<String> attchParentIds = new set<String>();
    Map<Id,Set<String>> surveyAttachMap = new Map<Id, Set<String>>();
    
    Set<String> attacList;
    
    for(Attachment att:Trigger.Old) {
        if(surveyAttachMap.containsKey(att.ParentId)) {
            attacList = surveyAttachMap.get(att.ParentId);  
        } else {
            attacList = new Set<String>();
        }
        attacList.add(att.Id);
        surveyAttachMap.put(att.ParentId, attacList);
    }
    
    List<Site_Survey__c> surveyList = [SELECT id,Viewing_Status__c FROM Site_Survey__c WHERE Id IN : surveyAttachMap.keySet()];
    System.debug('>>surveyList' + surveyList);
    List<Site_Survey__c> surveytoUpdate = new List<Site_Survey__c>();
    
    for(Site_Survey__c st :surveyList)
    {
        if(st.Viewing_Status__c != null) { 
            Set<String> viewedSet = new Set<String>();
            viewedSet.addAll(st.Viewing_Status__c.split(','));
            String viewIds = st.Viewing_Status__c;
            Set<String> deleteAttachIds = surveyAttachMap.get(st.Id);
      
            for(String attid :deleteAttachIds){
                
                if(viewIds.contains(','+ attid) || viewIds.contains(attid + ',') || 
                    ( (!viewIds.contains(',')) && (ID)viewIds == (ID)attid)){
                    viewedSet.remove(attid);        
                }   
            }
            
            if(!viewedSet.isEmpty()){
                List<String> updateViewIds = new List<String>();
                updateViewIds.addAll(viewedSet);
                st.Viewing_Status__c = String.join(updateViewIds,',');
                surveytoUpdate.add(st);
            }
            
        }
    }
    
    if(!surveytoUpdate.isEmpty()) {
        try {
            update surveytoUpdate;
        } catch(Exception e) {
            Trigger.new[0].addError(e.getMessage());
        }
    }
    
    
}