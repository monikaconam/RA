/*
@Name            : UpdateGTParentOpportunity
@Author          : DSConam
@Date            : July 27, 2015
@Description     : Parent Opportunity field value Changes once GreenTree opportunity value changes
@Revision History   : 
*/                      
         
trigger UpdateGTParentOpportunity on Opportunity (after insert, after update) 
{
    if(Trigger.isInsert)
    {
        List<Opportunity> oppUpdateList = new list<Opportunity>();
        List<RecordType> gID=[select
                                    id
                              From
                                    RecordType
                              Where
                                    sObjectType='Opportunity'
                              And
                                    DeveloperName='GreenTree'];
        
        for(Opportunity greenOppExt : trigger.new)
        {
            try
            {
                oppUpdateList.add(new Opportunity(id = greenOppExt.Rapid_Opportunity__c));
            }
            catch(Exception e)
            {
                greenOppExt.addError('There was some problem '+e.getMessage()+'-'+e.getLineNumber());
            }    
        }
        
        if(!oppUpdateList.isEmpty())
        {
            database.update(oppUpdateList, false);
        } 
    }
    
    if(trigger.isUpdate && trigger.isAfter)
    {
        List<Opportunity> oppUpdateList = new list<Opportunity>();
        List<RecordType> gID=[select
                                    id
                              From
                                    RecordType
                              Where
                                    sObjectType='Opportunity'
                              And
                                    DeveloperName='GreenTree'];
        
        for(Opportunity greenOppExt : trigger.new)
        {
            if((greenOppExt.Rapid_Opportunity__c!= null) && (greenOppExt.RecordTypeID==gID.get(0).id))
            {
            }
        
        }
        
        
        if(!oppUpdateList.isEmpty())
        {
            database.update(oppUpdateList, false);
        } 
    }
}