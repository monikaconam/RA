/*
@Name                : TrackGTFStageChanges 
@Author              : DSConam
@Date                : July 22, 2015
@Description         : The timestamp should be captured whenever GT opportunity's stage changes
@Revision History   : 

@Author              : DSConam
@Date                : Nov 20, 2015
@Description         : Modified to populate the new field GTF Contract/Stips Date
*/
//Added to OpportunityTriggerHandler
trigger TrackGTFStageChanges on Opportunity (after Update) 
{
/*
    List<Opportunity> oppList=new List<Opportunity>();
    List<Id> oId=new List<Id>();
    List<RecordType> gID=[select
                        id
                  From
                        RecordType
                  Where
                        sObjectType='Opportunity'
                  And
                        DeveloperName='GreenTree'];
    for(Opportunity oppTemp : Trigger.new)
    {
         if(oppTemp.RecordtypeID==gId.get(0).id)
           {
                oId.add(oppTemp.id);
           }
    }
    
    List<Opportunity> oppMList=[select 
                                     id,(select 
                                            id,Green_Tree_Converted_Date__c,GTF_Approved_Date__c,GTF_Declined_Date__c,
                                            GTF_Defaulted_Date__c,GTF_Follow_Up_Date__c,GTF_Funded_Date__c,GTF_Not_Intrested_Date__c,
                                            GTF_submitted_Date__c , GTF_Contract_Stips_Date__c
                                         from
                                            Green_Tree__r)
                                from 
                                    Opportunity 
                                where 
                                    id in :oId];
    Map<id,List<Green_Tree_Oppy_Extension__c>> mapOpp=new Map<id,List<Green_Tree_Oppy_Extension__c>>();
    List<Green_Tree_Oppy_Extension__c> gList=new List<Green_Tree_Oppy_Extension__c>();
    for(Opportunity oppTemp : oppMList)
    {
         Opportunity oldOpps=Trigger.oldMap.get(oppTemp.Id);
         Opportunity newOpps=Trigger.newMap.get(oppTemp.id);    
        
        String nStage=newOpps.GTF_Status_Stage__c!=null?newOpps.GTF_Status_Stage__c.toUpperCase():'';
        String oStage=oldOpps.GTF_Status_Stage__c!=null?oldOpps.GTF_Status_Stage__c.toUpperCase():'';
        
        if((oStage!='FOLLOW UP NEEDED')&&(nStage=='FOLLOW UP NEEDED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Follow_Up_Date__c=System.Now();
                gList.add(gTemp);
            }
        }
        
        if((oStage!='SUBMITTED')&&(nStage=='SUBMITTED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_submitted_Date__c=System.Now();
                gList.add(gTemp);
            }
        }
                    
        if((oStage!='APPROVED')&&(nStage=='APPROVED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Approved_Date__c=System.Now();
                gList.add(gTemp);
            }
        }
                    
        if((oStage!='DECLINED')&&(nStage=='DECLINED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Declined_Date__c=System.Now();
                gList.add(gTemp);
            }
        }            
        if((oStage!='FUNDED')&&(nStage=='FUNDED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Funded_Date__c=System.Now();
                gList.add(gTemp);
            }
        }          
         
        if((oStage!='NOT INTERESTED')&&(nStage=='NOT INTERESTED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Not_Intrested_Date__c=System.Now();
                gList.add(gTemp);
            }
        }           
        if((oStage!='DEFAULTED')&&(nStage=='DEFAULTED'))
        {
            for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
            {
                gTemp.GTF_Defaulted_Date__c=System.Now();
                gList.add(gTemp);
            }
        }
        if((oStage!='CONTRACT/STIPS')&&(nStage=='CONTRACT/STIPS'))
            {
                for(Green_Tree_Oppy_Extension__c gTemp : oppTemp.Green_Tree__r)
                {
                    gTemp.GTF_Contract_Stips_Date__c=System.Now();
                    gList.add(gTemp);
                }
            } 
        
    }
    
    if(gList.size()>0)
        {
            try
            {
                update gList;
            }
            catch(Exception e)
            {
                System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
            }
        }
        */
}