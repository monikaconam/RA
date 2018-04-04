public with sharing class Oppr_DocumentTriggerHandler
{
    public static void aiUpdateTriggerForOppDocuments(List<Oppr_Document__c>listOpr)
    {
        aiuUpdateTriggerForOppDocuments(listOpr);
    }
    public static void auUpdateTriggerForOppDocuments(List<Oppr_Document__c>listOpr)
    {
        aiuUpdateTriggerForOppDocuments(listOpr);
    }
    
    
    public static void aiuUpdateTriggerForOppDocuments(List<Oppr_Document__c>listOpr)
    {
        List<Opportunity> oppList  = new List<Opportunity>();
        List<String> oppIds = new List<String>();
        List<String> oppIdsToUpdate = new List<String>();  
        List<Oppr_Document__c> oppDocs = new List<Oppr_Document__c>();
              
        for(Oppr_Document__c oppDoc: listOpr)
        {
          oppIds.add(oppDoc.Opportunity__c);      
        }
        
        if(!oppIds.isEmpty())
        {
        // Get List  Opp Docs for the Opportunities and opportunity status. Get only docs that are requested and not required (new additional docs)
        oppDocs = [SELECT 
                            Id, status__c, opportunity__c, opportunity__r.Status__c 
                        FROM 
                            Oppr_Document__c 
                        WHERE 
                           status__c 
                        IN 
                           ('Requested','Rejected')  
                        AND 
                           opportunity__c 
                        IN : oppIds]; 
            
        }
        if(!oppDocs.isEmpty())
        { 
            //Loop thru all opportunity docs. if new doc requested for an opp  with status = 'Reviewing Documents' add to update list
            // update opp doc status to reject
           for(Oppr_Document__c ods: oppDocs)
            {
                  if(ods.Opportunity__r.Status__c == 'Reviewing Documents')
                  {
                      oppIdsToUpdate.add(ods.opportunity__c);  
                  }
            }          
       } 
         
       //if there are opportunities with status = 'Reviewing Documents' to update get them update status
       if(!oppIdsToUpdate.isEmpty())
       {
        oppList = [SELECT 
                        Id, status__c 
                    FROM 
                        Opportunity 
                    WHERE 
                        Id IN : oppIdsToUpdate];   
        if(!oppList.isEmpty())
        {
            for(Opportunity ol: oppList)
            {
                ol.Status__c = 'Documents Requested';
            }
        } 
        try
        {
            Database.update (oppList,false);
        }
        catch (Exception ex) 
        {
            oppList[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
        }
    }
 
        //Rule 7 Changing from "Reviewing Documents" to "Contract Available"
        OppOppDocUpdateStatus.updateFromOppDocument(listOpr);  
        
        //Rule 5b
        CheckForOppDocumentsAttach.updateFromOppDocument(listOpr);
    }    
}