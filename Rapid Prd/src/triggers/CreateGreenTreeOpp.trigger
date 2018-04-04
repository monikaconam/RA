/*

Deactivated as per Ticket 16730

@Name            : CreateGreenTreeOpp 
@Author          : MKConam
@Date            : June 29, 2015
@Description     : To create a GreenTree opportunity whenever a Opportunity has one of the following stages
                    Pending Management Review 
                    Auto Decline-To Processing
                    Declined 
                    Unqualified 

and lead source is not equal to
                    Partner
                    Partner-Web 
                    Telemarketing - Partner
                    
@Author          : DSConam
@Date            : Nov 24, 2015
@Description     : Renewal and Add On opportunity should not be creating GT opportunity

@Revision History   : 
*/

trigger CreateGreenTreeOpp on Opportunity(after update) {

    if(checkRecursive.runOnce())
    {
            set <id> oppId = new set <id> ();
            List <Opportunity> gTreeOpp = new List <Opportunity> ();
            List <recordtype> rId = [select 
                                            id 
                                     from 
                                            recordtype 
                                     where 
                                            sobjecttype = 'opportunity' 
                                     and 
                                            Developername = 'GreenTree' limit 1];
            List <Campaign> campId=[select 
                                            id 
                                    from 
                                            campaign
                                    where 
                                            name='Green Tree Funding' Limit 1];
                                            
            List <Green_Tree_Oppy_Extension__c> gtcList = new List <Green_Tree_Oppy_Extension__c> ();
            List <DistributorGreenTree__c> defaultOwnerId=[select 
                                                                    name 
                                                           from 
                                                                    DistributorGreenTree__c 
                                                           order by createddate Limit 1 ];
            for (Opportunity oTemp: Trigger.new) {

                      if((((Trigger.oldMap.get(oTemp.id).StageName != 'Pending Management Review') && (oTemp.StageName == 'Pending Management Review')) || 
                           ((Trigger.oldMap.get(oTemp.id).StageName != 'Auto Decline-To Processing') && (oTemp.StageName == 'Auto Decline-To Processing'))||
                           ((Trigger.oldMap.get(oTemp.id).StageName != 'Unqualified') && (oTemp.StageName == 'Unqualified'))||
                           ((Trigger.oldMap.get(oTemp.id).StageName != 'Declined') && (oTemp.StageName == 'Declined')))&&(oTemp.RecordTypeId!=rId.get(0).id)&&
                           (oTemp.Renewal__c!=true)&&(oTemp.Addon_Oppy__c!=true))
                    {         
                    if ((oTemp.LeadSource != 'Partner') && (oTemp.LeadSource != 'Partner-Web') && (oTemp.LeadSource != 'Telemarketing - Partner'))  
                            oppId.add(oTemp.id);
                    }
        
            }
            
            if (oppId.size()> 0) {
                for (Id iTemp: oppID) {
                     //create a new opportunity with record type Green Tree
                    Opportunity oppTemp = new Opportunity();
                    oppTemp.Name = Trigger.newMap.get(iTemp).name+'- GTF';
                    
                    
                    oppTemp.StageName = 'Initial Call Needed';
                    oppTemp.recordTypeId = rID.get(0).id;
                    oppTemp.Contact__c = Trigger.newMap.get(iTemp).Contact__c;
                    oppTemp.accountID = Trigger.newMap.get(iTemp).accountId;
                    oppTemp.Rapid_Opportunity__c=iTemp;
                    oppTemp.campaignId=campId.size()>0? campId.get(0).id:null;
                    oppTemp.OwnerId=defaultOwnerId.get(0).name;
                    oppTemp.LeadSource=Trigger.newMap.get(iTemp).leadSource;
                    oppTemp.closeDate = system.today();
                    oppTemp.Gross_Monthly_Sales__c=Trigger.newMap.get(iTemp).Gross_Monthly_Sales__c;
                    gTreeOpp.add(oppTemp);
                }
        
                if (gTreeOpp.size()> 0) {
                    SavePoint sp=Database.setSavePoint();
                    boolean once=true;
                    try{
                            //opportunity inserted
                            insert gTreeOpp;

                            // related Green Tree object created
                            for (Opportunity oTemp: gTreeOpp) {
                                Green_Tree_Oppy_Extension__c gtc = new Green_Tree_Oppy_Extension__c();
                                gtc.opportunity__c = oTemp.id;
                                gtc.Green_Tree_Converted_Date__c=System.now();
                                    gtcList.add(gtc);
                            }
                            
                            insert gtcList;
                            
                                                     
                            //send email for Rapid opportunity that are now a Green Tree opportunity
                            Set<Id> opIdSet=new Set<Id>();
                            
                            if (oppId.size()> 0) 
                              {
                                 for(Id ixTemp : oppID)
                                     opIdSet.add(ixTemp );
                              } 
                            
                            
                            List<String> gtcId=new List<String>();
                            
                            for(Green_Tree_Oppy_Extension__c cTemp : gtcList)
                            {    
                                gtcId.add(cTemp.id);
                            }
                            
                          List<String> opId=new List<String>();  
                          if (oppId.size()> 0) 
                          {
                             for(Id ixTemp : oppID)
                                 opId.add(ixTemp );
                          } 
                              if(once)
                              {
                                  UpdateOppWithGTInfo.updateOpportunity(opId); 
                                  once=false;
                              }
                        }
                    catch(Exception e)
                    {
                        System.debug('An Exception has occurred - '+e.getMessage()+' - '+e.getLineNumber());
                        Database.rollback(sp);
                    }
                }
            }
                     
    }        
}