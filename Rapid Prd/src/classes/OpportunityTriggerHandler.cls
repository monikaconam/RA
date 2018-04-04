/*
@Name            : OpportunityTriggerHANDler 
@Author          : DS Conam
@Date            : July 10 , 2015
@Description     : Trigger hANDler for all the opportunity Triggers
*/

public class OpportunityTriggerHandler
{
     public static void biGenerateRenewalNumber(List<Opportunity> newList)
    {
        GenerateRenewalNumberHelper.onInsert(newList);
    }
    public static void buGenerateRenewalNumber(Map<id,Opportunity> oldMap, Map<id,Opportunity> newMap)
    {
        GenerateRenewalNumberHelper.OnUpdate(oldMap,newMap);
    }
    public static void auOppInitialComAmtUpdateTrigger (Map<id,Opportunity> oldMap, Map<id,Opportunity> newMap)
    {
        Set<Id> oppId = new Set<Id>();
        
        List<Opportunity> newOppList = new List<Opportunity>();
        
        for(Id iTemp :newMap.keyset())
        {
            Opportunity oldOpp=oldMap.get(iTemp);
            Opportunity opp=newMap.get(iTemp);
            if( (oldOpp.Renewal_Funded_Amount__c!=opp.Renewal_Funded_Amount__c) && (opp.Renewal_Funded_Amount__c!=null ))
                    oppId.add(iTemp );
        }  
    }

    public static void biUpdateProcessDates(List <Opportunity> paramOppList)
    {
        List<Opportunity> opps = paramOppList;
        List<id> campaignids = new List<id>();
         Map<id, campaign> campaignmap;
        for (Opportunity o:opps)
        {
            if (o.campaignid != null)
            {
                campaignids.add(o.campaignId);
            }
        }        
        
        if(campaignids.size()>0)
        {
           campaignmap = new Map<id, campaign>([SELECT 
                                                      id, split_fund_set_up__c, Suppress_Site_Inspection__c 
                                              FROM 
                                                      campaign 
                                              WHERE 
                                                      id in :campaignids]);
        }          
            for (Opportunity o:opps)
            {
                Boolean SuppressSiteInspection = false;
                if (o.CampaignId != null)
                {
                    Campaign c = campaignmap.get(o.campaignid);
                   
                    if (c!= null)
                    {
                        if (o.Split_Fund_Set_Up__c == null)
                        {
                            
                            o.Split_Fund_Set_Up__c  = c.Split_Fund_Set_up__c;
                        }
                        SuppressSiteInspection = c.Suppress_Site_Inspection__c;
                    }
                }
            
                o.Welcome_Kit_Sent_Due_Date__c = o.Funded_by_WC__c != null ? Utils.AddWeekdays(o.Funded_by_WC__c,1) : null;
    
                if (o.Calculate_Due_Dates__c != null && o.stagename != 'Closed Won')
                {
    
                    Datetime basedate;
                    Datetime decisiondate;
                    if (o.re_decision_date__c == null) 
                    {            
                        //basedate = o.Processing_Re_Set__C;
                        decisiondate = o.decision_date__c;
                    }
                    else if (o.re_decision_date__c != null) 
                    {
                        //basedate = o.Processing_Re_Set__C;
                        decisiondate = o.re_decision_date__c;
                    }
                    else if (o.re_decision_date__c == null) 
                    {
                        basedate = o.Calculate_Due_Dates__c;
                        decisiondate = o.decision_date__c;
                    }
                    else 
                    {
                        basedate = o.re_decision_date__c;
                        decisiondate = o.re_decision_date__c;
                    }       
                    
                    Double manageroverride = 0;
                    
                    
                    String resultingprocess = '';
      
                    if(o.Underwriting_Approval__c == 'Auto Declined' ||
                      o.Underwriting_Approval__c == 'Declined by Credit Committee' || o.Underwriting_Approval__c == 'Declined - Pending Management Review' ||
                      o.Underwriting_Approval__c == 'Unqualified - Will Not Reconsider' || o.Underwriting_Approval__c == 'Unqualified - Will Reconsider in the Future' || 
                      o.Underwriting_Approval__c == 'Unqualified - Comp. Pay Off too High - Reconsider Later' ) 
                    {
                        resultingprocess = 'DECLINED';
              
                    }
                    else if (o.Underwriting_Approval__c == 'Rescinded by merchant' || o.Underwriting_Approval__c == 'Rescinded by RapidAdvance' || 
                            o.Underwriting_Approval__c == 'Rescinded by Processing' || o.Underwriting_Approval__c == 'Rescinded by Underwriting') 
                    {
                        resultingprocess = 'RESCINDED';
                    }
                    else if (o.Renewal__c) 
                    {
                        resultingprocess = 'RENEWAL';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'GPS - Rocky Mountain') 
                    {
                        resultingprocess = 'RMB';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'Rapid Advance Chooses' && o.international_sale_hidden_text__c == 'Canada') 
                    {
                        resultingprocess = 'NMA Canada';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'Rapid Advance Chooses') 
                    {
                        resultingprocess = 'NMA';
                    }
                    else if (o.Current_Processor__c == o.Processor_Name__c) 
                    { 
                        resultingprocess = 'EPR With';
                    }
                    else 
                    {
                        resultingprocess = 'EPR Without';
                    }
         
                    //First, go ahead AND clear all the dates....
                    o.Account_Database_Entry_Due_Date__c   = null;
                    o.Begin_Activity_Monitoring_Due_Date__c   = null;
                     
                    o.Decline_Letter_Sent_Due_Date__c = null;
                    o.Funded_by_WC_Due_Date__c = null;
                    o.Site_Survey_Available_Due_Date__c = null;
                    // // o.Site_Survey_Ordered_Due_Date__c   = null; 
                    
                    if (resultingprocess == 'RESCINDED') 
                    {
                         
                        o.Resulting_Process__c = 'RESCINDED';
                   } 
                   else if (resultingprocess == 'DECLINED') {
                        if (decisiondate != null) {               
                            
                                o.Decline_Letter_Sent_Due_Date__c = Utils.AddWeekdays(decisiondate, 0);
                        }
                        o.Resulting_Process__c = 'DECLINED';
                   } 
                   else if(resultingprocess == 'RENEWAL') 
                   {                     
                        if (decisiondate != null && o.amount >= 100000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                        {   
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                        }
                        else if (decisiondate != null && o.amount >= 20000 && o.international_sale_hidden_text__c == 'Canada' && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                        {

                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                        }  
                        else   
                        {
                            o.Site_Survey_Available_Due_Date__c = null;  
                        } 
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, 1);  
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        } 
                        o.Resulting_Process__c = 'RENEWAL';
                   }
                   else if (resultingprocess == 'RMB') { //RMB
                           if (decisiondate != null) { 
                            o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3);//DJC 
                            if (o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved')
                            {
                                    o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);    //DJC
                                    o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); 
                            }                   
                            if (o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                            {
                                o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, 3); 
                            }
                            else
                            {
                                o.Site_Survey_Available_Due_Date__c = null;  
                            }
                    }
                    o.Resulting_Process__c = 'RMB';                
                   }
                   else if (resultingprocess == 'NMA') { //NMA
                        if (decisiondate != null) {    
                            if (o.amount >= 50000 &&  ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                            { 
                                // o.Site_Survey_Ordered_Due_Date__c = utils.ConvertDateTimeToDate(decisiondate); 
                                o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, 3); 
                            }
                            else
                            {
                                 
                                o.Site_Survey_Available_Due_Date__c = null;  
                            }                    
                            o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2); //DJC
                            o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 4); //DJC
                        }                
                        
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //DJC
                        }                
                        o.Resulting_Process__c = 'NMA';
                   }
                   else if (resultingprocess == 'NMA Canada') { 
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 20); 
                        }              
                        o.Resulting_Process__c = 'NMA Canada';                
                   }
                   else if (resultingprocess == 'EPR With') { 
                     
                        if (decisiondate != null && o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false) 
                        {
                              
                            // o.Site_Survey_Ordered_Due_Date__c = Utils.AddWeekdays(decisiondate, manageroverride + 0); 
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3); 
                        }
                        else
                        { 
                             
                             
                            o.Site_Survey_Available_Due_Date__c = null;  
                        }
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                             
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //djc
                                o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2); //djc
                        }               
                        o.Resulting_Process__c = 'EPR With';
                   }
                   else if (resultingprocess == 'EPR Without') { 
                        if (decisiondate != null) {
                             o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 4); //djc
                        }
                        if (decisiondate != null && o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)  
                        {
                            // o.Site_Survey_Ordered_Due_Date__c = Utils.AddWeekdays(decisiondate, manageroverride + 0); 
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3); 
                        }
                        else
                        {
                             
                            o.Site_Survey_Available_Due_Date__c = null;  
                        }
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);//djc   
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //djc
                        }                                 
                        o.Resulting_Process__c = 'EPR Without';
                    }              
                }
            }
    }
    
    public static void buUpdateProcessDates(Map<id,Opportunity>newMap, Map<id,Opportunity> oldMap)
    {
        List<Opportunity> opps = new List<Opportunity>();
        Map<id, campaign> campaignmap;
        for(ID iTemp : newMap.keyset())
        {
            opps.add(newMap.get(iTemp));
        }
        List<id> campaignids = new List<id>();
        if(opps.size()>0)
        {
            for (Opportunity o:opps)
            {
                if (o.campaignid != null)
                {
                    campaignids.add(o.campaignId);
                }
            }        
        }
        
        if(campaignids.size()>0)
        {
            campaignmap = new Map<id, campaign>([SELECT 
                                                          id, split_fund_set_up__c, Suppress_Site_Inspection__c 
                                                  FROM 
                                                          campaign 
                                                  WHERE 
                                                          id in :campaignids]);
        }
        
        if(opps.size()>0)
        {          
            for (Opportunity o:opps)
            {
                Boolean SuppressSiteInspection = false;
                if (o.CampaignId != null)
                {
                    Campaign c = campaignmap.get(o.campaignid);
                   
                    if (c != null)
                    {
                        if (o.Split_Fund_Set_Up__c == null)
                        {                           
                            o.Split_Fund_Set_Up__c  = c.Split_Fund_Set_up__c;
                        }
                        SuppressSiteInspection = c.Suppress_Site_Inspection__c;
                    }
                }
            
                o.Welcome_Kit_Sent_Due_Date__c = o.Funded_by_WC__c != null ? Utils.AddWeekdays(o.Funded_by_WC__c,1) : null;
    
                if (o.Calculate_Due_Dates__c != null && o.stagename != 'Closed Won')
                {
    
                    Datetime basedate;
                    Datetime decisiondate;
                    if ( o.re_decision_date__c == null)
                    {            
                        //basedate = o.Processing_Re_Set__C;
                        decisiondate = o.decision_date__c;
                    }
                    else if (o.re_decision_date__c != null)
                    {
                        //basedate = o.Processing_Re_Set__C;
                        decisiondate = o.re_decision_date__c;
                    }
                    else if (o.re_decision_date__c == null)
                    {
                        basedate = o.Calculate_Due_Dates__c;
                        decisiondate = o.decision_date__c;
                    }
                    else 
                    {
                        basedate = o.re_decision_date__c;
                        decisiondate = o.re_decision_date__c;
                    }       
                    
                    Double manageroverride = 0;                   
                    String resultingprocess = '';
      
                    if(o.Underwriting_Approval__c == 'Declined' ||  o.Underwriting_Approval__c == 'Auto Declined' ||
                      o.Underwriting_Approval__c == 'Declined by Credit Committee' || o.Underwriting_Approval__c == 'Declined - Pending Management Review' ||
                      o.Underwriting_Approval__c == 'Unqualified - Will Not Reconsider' || o.Underwriting_Approval__c == 'Unqualified - Will Reconsider in the Future' || 
                      o.Underwriting_Approval__c == 'Unqualified - Comp. Pay Off too High - Reconsider Later' ) 
                    {
                        resultingprocess = 'DECLINED';
                    }
                    else if (o.Underwriting_Approval__c == 'Rescinded by merchant' || o.Underwriting_Approval__c == 'Rescinded by RapidAdvance' || 
                            o.Underwriting_Approval__c == 'Rescinded by Processing' || o.Underwriting_Approval__c == 'Rescinded by Underwriting') 
                    {
                        resultingprocess = 'RESCINDED';
                    }
                    else if (o.Renewal__c) 
                    {
                        resultingprocess = 'RENEWAL';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'GPS - Rocky Mountain') 
                    {
                        resultingprocess = 'RMB';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'Rapid Advance Chooses' && o.international_sale_hidden_text__c == 'Canada') 
                    {
                        resultingprocess = 'NMA Canada';
                    }
                    else if (o.Split_Fund_Set_Up__c  == 'Rapid Advance Chooses') 
                    {
                        resultingprocess = 'NMA';
                    }
                    else if (o.Current_Processor__c == o.Processor_Name__c) 
                    { 
                        resultingprocess = 'EPR With';
                    }
                    else 
                    {
                        resultingprocess = 'EPR Without';
                    }
         
                    //First, go ahead AND clear all the dates....
                    o.Account_Database_Entry_Due_Date__c   = null;
                    o.Begin_Activity_Monitoring_Due_Date__c   = null;
                    o.Decline_Letter_Sent_Due_Date__c = null;
                    o.Funded_by_WC_Due_Date__c = null;
                    o.Site_Survey_Available_Due_Date__c = null;
                    
          if (resultingprocess == 'RESCINDED') 
          {
            o.Resulting_Process__c = 'RESCINDED';
          } 
                   else if (resultingprocess == 'DECLINED') 
                   {
                        o.Resulting_Process__c = 'DECLINED';
                   } 
                   else if(resultingprocess == 'RENEWAL') 
                   {                     
                        if (decisiondate != null && o.amount >= 100000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                        {   
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                        }
                        else if (decisiondate != null && o.amount >= 20000 && o.international_sale_hidden_text__c == 'Canada' && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                        {
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                        }  
                        else   
                        {
                            o.Site_Survey_Available_Due_Date__c = null;  
                        } 
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, 1);  
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                        } 
                        o.Resulting_Process__c = 'RENEWAL';
                   }
                   else if (resultingprocess == 'RMB') { //RMB
                           if (decisiondate != null) { 
                            o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3);//DJC 
                            if (o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved')
                            {
                                    o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);    //DJC
                                    o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); 
                            }                   
                            if (o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                            {    
                                o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, 3); 
                            }
                            else
                            {    
                                o.Site_Survey_Available_Due_Date__c = null;  
                            }
                    }
                    o.Resulting_Process__c = 'RMB';                
                   }
                   else if (resultingprocess == 'NMA') { //NMA
                        if (decisiondate != null) {    
                            if (o.amount >= 50000 &&  ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)
                            {    
                                o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, 3); 
                            }
                            else
                            {    
                                o.Site_Survey_Available_Due_Date__c = null;  
                            }                    
                            o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2); //DJC
                            o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 4); //DJC
                        }                
                
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //DJC
                        }                
                        o.Resulting_Process__c = 'NMA';
                   }
                   else if (resultingprocess == 'NMA Canada') { 
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 20); 
                        }              
                        o.Resulting_Process__c = 'NMA Canada';                
                   }
                   else if (resultingprocess == 'EPR With') { 
                    
                        if (decisiondate != null && o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false) 
                        {
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3); 
                        }
                        else
                        {
                            o.Site_Survey_Available_Due_Date__c = null;  
                        }
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {                            
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //djc
                                o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2); //djc
                        }               
                        o.Resulting_Process__c = 'EPR With';
                   }
                   else if (resultingprocess == 'EPR Without') { 
                        if (decisiondate != null) {
                             o.Begin_Activity_Monitoring_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 4); //djc
                        }
                        if (decisiondate != null && o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                            || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                            || o.Underwriting_Approval__c  == 'Approved' 
                                            || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                            SuppressSiteInspection == false)  
                        {
                            o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3); 
                        }
                        else
                        {
                            o.Site_Survey_Available_Due_Date__c = null;  
                        }
                        if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount AND split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                        || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                        || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                        || o.Underwriting_Approval__c  == 'Approved' 
                                        || o.Underwriting_Approval__c  == 'Auto Approved')) 
                        {
                                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);//djc   
                                o.Funded_by_WC_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 10); //djc
                        }                                 
                        o.Resulting_Process__c = 'EPR Without';
                    }              
                }
            }
        }
    }
   
    public static void biUpdateOppStatusRule5bReviewingDocs(List <Opportunity> paramOppList)
    {
        CheckForOppDocumentsAttach.updateFROMOpp(paramOppList);  
    }
    public static void buUpdateOppStatusRule5bReviewingDocs(List <Opportunity> paramOppList)
    {
        CheckForOppDocumentsAttach.updateFROMOpp(paramOppList);  
    }
    public static void biUnderwritingOpprtunity(List <Opportunity> paramOppList) 
    {
        List <Messaging.SingleEmailMessage> mailingList = new List <Messaging.SingleEmailMessage> ();
        
        for (Opportunity opp: paramOppList) 
        {
            if (( opp.Underwriter_Assigned__c == 'AUTO DECISION') || 
                (opp.Underwriter_Assigned__c != null)) 
            {
                opp.UW_Assigned_Date_Stamp__c = Datetime.now();
            }

            /*** Eligible for Rapid Funding Number WFR ***/
            if (opp.UWEligible_for_Rapid_Funding__c == 'Yes') 
            {
                List <User> userListRoles = new List <User> ();
                userListRoles = [SELECT 
                                        Id, Email
                                    FROM 
                                        User
                                    WHERE
                                        UserRoleId 
                                    IN
                                        (SELECT Id FROM UserRole WHERE Name = 'Processors')
                                    AND 
                                        IsActive = true];
                
                List<UnderWriting_Opportunity_Email_Alert__c> userMList=UnderWriting_Opportunity_Email_Alert__c.getAll().values();
                List<String> emailAlertTo =new List<String>();
                
                for(UnderWriting_Opportunity_Email_Alert__c uoeaTemp : userMList)
                    emailAlertTo.add(uoeaTemp.name);
                    
                List <User> userListsingle=    [SELECT
                                                    Id, Email
                                                FROM
                                                    User
                                                WHERE
                                                    IsActive = true 
                                                AND 
                                                    Name IN :emailAlertTo LIMIT 1];

                if (userListsingle != null && !userListsingle.isEmpty()) 
                {
                    userListRoles.add(userListsingle.get(0));
                }

                List <String> toaddress = new List <String> ();
                
                for (User user: userListRoles) 
                {
                    if (user.Email != null && !user.Email.trim().equals('')) 
                        toaddress.add(user.Email);
                }

                if (userListRoles != null && !userListRoles.isEmpty()) 
                {
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toaddress);
                    mail.setBccSender(false);
                    mail.setSubject(opp.Name + ' is Eligible for Rapid Funding');
                    mail.setPlainTextBody(opp.Name + ' is Eligible for Rapid Funding' + '\nOppId: ' + opp.Opportunity_Number__c);
                    mailingList.add(mail);
                }
            }

            List<UnderWriting_Opportunity_Users__c> userCList=UnderWriting_Opportunity_Users__c.getAll().values();
            Map<String,String> userMap=new Map<String,String>();
            for(UnderWriting_Opportunity_Users__c uTemp : userCList )
            {
                userMap.put(uTemp.name,uTemp.username__c);
            }
            
            if((userMap.get(opp.Processing_Representative__c)!=NULL)  && opp.All_Approved_With_Conditions_Met__c)
            {
                List <User> userList;
                userList = [SELECT 
                                Id, Email 
                            FROM 
                                User
                            WHERE
                                IsActive = true 
                            AND 
                                userName = :userMap.get(opp.Processing_Representative__c)];
                                
                if (userList != null && !userList.isEmpty()) 
                {
                    String emailSubject = opp.Name + ' - ' + ' (New Opportunity) All approval conditions have been satisfied.';
                    String emailBody = '';
                    List <String> toaddress = new List <String> ();
                    if (userList.get(0) != null && userList.get(0).Email != null && !userList.get(0).Email.trim().equals('')) 
                    {
                        toaddress.add(userList.get(0).Email);
                    }

                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toaddress);
                    mail.setsubject(emailSubject);
                    mail.setBccSender(false);
                    mail.setPlainTextBody(emailBody);
                    mailingList.add(mail);
                }
            }   
        }
        
        sendEmail(mailingList);
    }

    public static void buUnderwritingOpprtunity(Map<id,Opportunity> newMap, Map<id,Opportunity> oldMap)
    {
        Opportunity oldOpp;
        Opportunity newOpp;
        List <Messaging.SingleEmailMessage> mailingList = new List <Messaging.SingleEmailMessage> ();
        List<User> userListRoles = [SELECT 
                                            Id, Email
                                    FROM 
                                            User
                                    WHERE
                                            UserRoleId 
                                    IN
                                            (SELECT Id FROM UserRole WHERE Name = 'Processors') 
                                    AND
                                            IsActive = true];
                                            
        List <User> userListsingle=    [SELECT
                                                Id, Email
                                        FROM
                                                User
                                        WHERE
                                                IsActive = true 
                                        AND
                                                Name = 'Mark Cerminaro' LIMIT 1];

        for(Id oppID : newMap.keyset())
        {
            newOpp=newMap.get(oppId);
            oldOpp=oldMap.get(oppId);
            
            if(((newOpp.Underwriter_Assigned__c == 'AUTO DECISION'))
            || ((oldOpp.Underwriter_Assigned__c == null) && (newOpp.Underwriter_Assigned__c != null)))
            {
                newOpp.UW_Assigned_Date_Stamp__c = Datetime.now();    
            }
            
            if(newOpp.UWEligible_for_Rapid_Funding__c =='Yes' &&  oldOpp.UWEligible_for_Rapid_Funding__c != 'Yes')
            {
                List<String>toaddress = new List<String>();
                if(userListsingle != null && !userListsingle.isEmpty())
                {                
                    userListRoles.add(userListsingle.get(0));
                }
                for(User user: userListRoles)
                {
                    if(user.Email != null && !user.Email.trim().equals(''))
                    {   
                        toaddress.add(user.Email);                                           
                    }
                }
                
                if(userListRoles != null && !userListRoles.isEmpty())
                {
                  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                  mail.setToAddresses(toaddress); 
                  mail.setBccSender(false);                          
                  mail.setSubject(newOpp.Name+' is Eligible for Rapid Funding');                          
                  mail.setPlainTextBody(newOpp.Name+' is Eligible for Rapid Funding' + '\nOppId: ' +newOpp.Opportunity_Number__c);
                  mailingList.add(mail);
                }
            }
            
            List<UnderWriting_Opportunity_Users__c> userCList=UnderWriting_Opportunity_Users__c.getAll().values();
            Map<String,String> userMap=new Map<String,String>();
            for(UnderWriting_Opportunity_Users__c uTemp : userCList )
            {
                userMap.put(uTemp.name,uTemp.username__c);
            }
            
            if(((newOpp.Processing_Representative__c!=oldOpp.Processing_Representative__c) && (newOpp.Processing_Representative__c!=null) && 
                userMap.get(newOpp.Processing_Representative__c)!=null) && (oldOpp.All_Approved_With_Conditions_Met__c!=true) && (newOpp.All_Approved_With_Conditions_Met__c==true))
            {
                List<User> userList;    
                if(userMap.get(newOpp.Processing_Representative__c)!=NULL)
                {
                    userList = [SELECT 
                                    Id, Email 
                                FROM 
                                    User
                                WHERE
                                    IsActive = true 
                                AND
                                    userName = :userMap.get(newOpp.Processing_Representative__c)];
                }         

                if(userList != null && !userList.isEmpty())
                {
                    String emailSubject = newOpp.Name + ' - ' + newOpp.Opportunity_Number__c + ' All approval conditions have been satisfied.';
                    String emailBody = '';
                    List<String>toaddress = new List<String>();             
                    if(userList.get(0) != null && userList.get(0).Email != null && !userList.get(0).Email.trim().equals(''))
                    {                                   
                          toaddress.add(userList.get(0).Email);                   
                    }
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toaddress);
                    mail.setsubject(emailSubject);
                    mail.setBccSender(false);
                    mail.setPlainTextBody(emailBody);
                    mailingList.add(mail);             
                }
            }
        }
        sendEmail(mailingList);
    }
    

    public static void buRiskAlert(Map<id,Opportunity> newMap,Map<id,Opportunity> oldMap)
    {   
        // Looks up the relevant email fields if the Processing Error Date has changed,
        // then flags it to send out a Notification via workflow
        // code coverage 100%
        //checked 
    }

    public static void aiContactRolesOppr(Map<id,Opportunity> newMap)
    {
        Boolean checkRenewal = false;
        String parentOppId;
        List<OpportunityContactRole> oppRoleInsertList =  new List<OpportunityContactRole>();
        OpportunityContactRole oppContactRoleObj;
        String currentID;   
            
        for(Id oppID : newMap.keySet()) 
        {
            if(newMap.get(oppID).If_Renewal_Preceding_Opportunity__c != null)
              {
                currentID = oppID;   
                checkRenewal = true;
                parentOppId = newMap.get(oppID).If_Renewal_Preceding_Opportunity__c; 
               
              }
        }
        if(checkRenewal)        
        {
            List<OpportunityContactRole> oppRoleList =[SELECT 
                                                            Id, Role, OpportunityId, IsPrimary, ContactId 
                                                       FROM
                                                            OpportunityContactRole 
                                                       WHERE
                                                            OpportunityId =:parentOppId 
                                                       AND
                                                            Contact.IsDeleted=false];
            if(oppRoleList !=null && oppRoleList.size() > 0)
            {
                for(OpportunityContactRole oppRole : oppRoleList)
                {
                    oppContactRoleObj = new OpportunityContactRole(); 
                    oppContactRoleObj.OpportunityId = currentID; 
                    oppContactRoleObj.ContactId = oppRole.ContactId;
                    oppContactRoleObj.Role = oppRole.Role;
                            
                    if(oppRole.IsPrimary == true)
                    {
                        oppContactRoleObj.IsPrimary = true;      
                    }
                        oppRoleInsertList.add(oppContactRoleObj);  
                }
                if(oppRoleInsertList.size() > 0)
                {
                    try
                    {
                        Database.insert(oppRoleInsertList,false);              
                    }                        
                    catch(Exception ex)
                    {
                        oppRoleInsertList[0].addError('exception in insert role....'+'' + ex.getMessage()+ '' + ex.getLineNumber());
                    }
                }
            }
        }  
    }
    
    public static void aiOpportunityCampaignChosen(Map<id,Opportunity> newMap)
    {   
        List<Id> campaignIds = new List<Id>();
     
        for(Id iTemp : newMap.keySet())
        {
            if (newMap.get(iTemp).CampaignId != null)  
                campaignIds.add(newMap.get(iTemp).CampaignId);      
        }
        
        Map<Id, Campaign> campaigns = new Map<Id, Campaign>([SELECT 
                                                                Id, Name, Sales_Team_Member_1__c,Sales_Team_Member_2__c,
                                                                    Sales_Team_Member_3__c,Sales_Team_Member_4__c,
                                                                    Sales_Team_Member_5__c,Sales_Team_Member_6__c 
                                                             FROM 
                                                                    Campaign 
                                                             WHERE
                                                                    Id IN :campaignIds]);
        List<OpportunityTeamMember> newList = new List<OpportunityTeamMember>();        
        for(Id iTemp : newMap.keySet())
        {
            if (newMap.get(iTemp).CampaignId != null)
            {
                Opportunity opp = newMap.get(iTemp);
                Campaign campaignRecord = campaigns.get(opp.campaignId);
                if (campaignRecord != null) 
                {
                    if (campaignRecord.Sales_Team_Member_1__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_1__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    
                    if (campaignRecord.Sales_Team_Member_2__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_2__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_3__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_3__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_4__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_4__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_5__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_5__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_6__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_6__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                }
            } 
        }  
        if (newList.size() > 0) 
        {
            try
            {
                Database.insert(newList,false);
            }
            catch(Exception e)
            {
                newList[0].addError('An exception has occured - '+e.getMessage() +' '+ e.getLineNumber() );
            }  
        }
    }
    
    public static void auOpportunityCampaignChosen(Map<Id,Opportunity> newMap, Map<Id,Opportunity> oldMap)
    {
        List<Id> campaignIds = new List<Id>();     
        for(Id iTemp : newMap.keySet())
        {
            if ((newMap.get(iTemp).CampaignId != null) && (newMap.get(iTemp).CampaignId != oldMap.get(iTemp).CampaignId))  
                campaignIds.add(newMap.get(iTemp).CampaignId);      
        }
        
        Map<Id, Campaign> campaigns = new Map<Id, Campaign>([SELECT
                                                                    Id, name, Sales_Team_Member_1__c,Sales_Team_Member_2__c,
                                                                    Sales_Team_Member_3__c,Sales_Team_Member_4__c,
                                                                    Sales_Team_Member_5__c,Sales_Team_Member_6__c 
                                                             FROM
                                                                    Campaign 
                                                             WHERE 
                                                                    id in :campaignIds]);
        List<OpportunityTeamMember> newList = new List<OpportunityTeamMember>();
        
        for(Id iTemp : newMap.keySet())
        {
            if ((newMap.get(iTemp).CampaignId != null) && (newMap.get(iTemp).CampaignId != oldMap.get(iTemp).CampaignId))  
            {
                Opportunity opp = newMap.get(iTemp);
                Campaign campaignRecord = campaigns.get(opp.campaignId);
                if (campaignRecord != null) 
                {
                    if (campaignRecord.Sales_Team_Member_1__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_1__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    
                    if (campaignRecord.Sales_Team_Member_2__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_2__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_3__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_3__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_4__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_4__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_5__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_5__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                    if (campaignRecord.Sales_Team_Member_6__c != null ) 
                    {
                        OpportunityTeamMember newOtm = new OpportunityTeamMember();
                        newOtm.OpportunityId = opp.id;
                        newOtm.UserId = campaignRecord.Sales_Team_Member_6__c;
                        newOtm.TeamMemberRole = 'Partner Sales Representative';
                        newList.add(newOtm);
                    }  
                }
            } 
        }  
        if (newList.size() > 0) 
        {
            try
            {
                Database.insert(newList,false);
            }
            catch(Exception e)
            {
                newList[0].addError('An exception has occured - '+e.getMessage() +' '+ e.getLineNumber() );
            }  
        }
    }
    
    public static void aiUpdateOpportunityForBiz2Credit(List<Opportunity> newList)
    {
        List<String> oppIds = new List<String>();
        for(Opportunity opps : newList)
        {
            if(opps.status__c == 'Reviewing Documents')
            {
                oppIds.add(opps.id);      
            }
        }
           //Rule 7 Changing FROM "Reviewing Documents" to "Contract Available"
          //If the Contract Document is available AND attached to the Opportunity Documents, the status of the Application/Opportunity 
          //should changed to be "Contract Available"
           OppOppDocUpdateStatus.updateFROMOpp(oppIds);
    }   
    
    public static void auUpdateOpportunityForBiz2Credit(List<Opportunity> newList)
    {
        List<String> oppIds = new List<String>();
        for(Opportunity opps : newList)
        {
            if(opps.Status__c == 'Reviewing Documents')
            {
                oppIds.add(opps.Id);      
            }
        }
           //Rule 7 Changing FROM "Reviewing Documents" to "Contract Available"
          //If the Contract Document is available AND attached to the Opportunity Documents, the status of the Application/Opportunity 
          //should changed to be "Contract Available"
           OppOppDocUpdateStatus.updateFROMOpp(oppIds);
    }
    
    public static void aiUpdateGTParentOpportunity(Map<id,Opportunity> newMap)
    {
        List<Opportunity> oppUpdateList = new list<Opportunity>();
        List<RecordType> gID=[SELECT
                                    Id
                              FROM
                                    RecordType
                              WHERE
                                    sObjectType='Opportunity'
                              AND
                                    DeveloperName='GreenTree'];
        
        for(Id itemp : newMap.keyset())
        {
            try
            {
                oppUpdateList.add(new Opportunity(id = newMap.get(iTemp).Rapid_Opportunity__c, GTF_Qualified__c = newMap.get(iTemp).GTF_Qualified__c
                                                   ));
            }
            catch(Exception e)
            {
                newMap.get(iTemp).addError('There was some problem '+e.getMessage()+'-'+e.getLineNumber());
            }    
        }
        
        if(!oppUpdateList.isEmpty())
        {
            try
            {
                database.update(oppUpdateList, false);
            }
            catch(Exception ex)
            {
                oppUpdateList[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        } 
    }
    
    public static void auUpdateGTParentOpportunity(Map<id,Opportunity> newMap, Map<id,Opportunity> oldMap)
    {
        List<Opportunity> oppUpdateList = new list<Opportunity>();
        List<RecordType> gID=[SELECT
                                    Id
                              FROM
                                    RecordType
                              WHERE
                                    sObjectType='Opportunity'
                              AND
                                    DeveloperName='GreenTree'];
        
        for(Id iTemp : newMap.keyset())
        {
            if((newMap.get(iTemp).Rapid_Opportunity__c!= null) && (newMap.get(iTemp).RecordTypeID==gID.get(0).id))
            {
                if((newMap.get(iTemp).GTF_Qualified__c != oldMap.get(iTemp).GTF_Qualified__c )
                
                )
            
                try
                {    
                    oppUpdateList.add(new Opportunity(id = newMap.get(iTemp).Rapid_Opportunity__c, GTF_Qualified__c = newMap.get(iTemp).GTF_Qualified__c
                                        ));
                }
                catch(Exception e)
                {
                    newMap.get(iTemp).addError('There was some problem '+e.getMessage()+'-'+e.getLineNumber());
                } 
            }
        }
        
        if(!oppUpdateList.isEmpty())
        {
            try
            {
                database.update(oppUpdateList, false);
            }
            catch(Exception ex)
            {
                oppUpdateList[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        } 
    }
    
    public static void aiOpportunityStageChangeCALC(Map<id,Opportunity> newMap)
    {
        for(Id iTemp : newMap.keyset())
        {
         if (newMap.get(iTemp).StageName !='Deleted') 
             CALC.OpportunityRequest(String.valueOf(iTemp));
        }
    }
    
    public static void buOpportunityStageChangeCALC(Map<id,Opportunity> newMap, Map<id,Opportunity> oldMap)
    {
        for(Id iTemp : newMap.keyset())
        {
            Opportunity oldOpp = oldMap.get(iTemp);
            Opportunity newOpp = newMap.get(iTemp);
            if (((newOpp.StageName !='Deleted') && (oldOpp.StageName !='Deleted')) && (((newOpp.StageName != oldOpp.StageName) || 
                    (newOpp.Advance_ID__c != oldOpp.Advance_ID__c) || (newOpp.ownerID != oldOpp.ownerid)) && (newOpp.lastModifiedById!='00570000001x0Bx' && newOpp.lastModifiedById!='00570000001y6XB')))
            {   
                if(System.IsBatch() == false && System.isFuture() == false){
                    CALC.OpportunityRequest(String.valueOf(newOpp.Id));
                }
            }
        }
    } 

    public static void sendEmail(List <Messaging.SingleEmailMessage> mailList)
    {
        try
        {
            Messaging.sendEmail(mailList);
        }
        catch(Exception e)
        {
            System.debug('An exception has occured - '+e.getMessage() +' '+ e.getLineNumber() );
        }
    
    }
    /** **/

    @future(Callout=true)
    public static void updateOpportunity(List<String> oppId)
    {
        Map<id, opportunity> oppMap=new Map<id, opportunity>([SELECT
                                                                    id, recordtypeid 
                                                                FROM 
                                                                    Opportunity 
                                                               WHERE
                                                                    id in : oppId]);
        id recTypeId=[SELECT 
                            Id 
                        FROM 
                            RecordType 
                        WHERE 
                            sObjectType='Opportunity'
                        AND 
                            Developername='Locked_Opportunity'].id;
                            
        List<opportunity> upOpp=new List<opportunity>();
        
        if(oppMap.size()>0)
        {
            for(Id oppKey : oppMap.keyset())
            {
                Opportunity opp=oppMap.get(oppKey);
                Opp.recordtypeid= recTypeId;  
                upOpp.add(Opp);
             }
             
            if(upOpp.size()>0)
            {
                try
                {
                    Database.update (upOpp,false);
                }
                catch(Exception e)
                {
                    upOpp[0].addError('An exception  '+ e.getMessage()+' - '+e.getLineNumber());
                }
            }
        }       
    }  
    
    /* HANDler Class For UpdateOppAccConTri */
    public static void auUpdateOppAccConTri(Map<Id,Opportunity> newOMap ,Map<Id,Opportunity> oldOMap)
    {
        List<Account> accUpdateList = new List<Account>();
        List<Account> accUpdateListNew = new List<Account>();
        List<Contact> conUpdateList = new List<Contact>(); 
        List<Contact> conUpdateListNew= new List<Contact>(); 
        Set<id> accIdSet=new Set<id>();
        Set<id> conIdSet=new Set<id>();
        Set<Opportunity> oppSet=new Set<Opportunity >();
        
        for(Id opp : newOMap.KeySet())
        {
            Opportunity newOpp = newOMap.get(opp);
            if(newOpp.accountId!=null)
            {
                accIdSet.add(newOpp.accountId);
                oppSet.add(newOpp);
            }
        }
        Map<id,Account> accMap=new Map<id,Account>([SELECT ownerid, id,(SELECT id, ownerId FROM contacts) FROM account WHERE id in : accIdSet]);
        Map<id,Account> oppMapAcc=new Map<id,Account>();
        for(Opportunity oTemp : oppSet)
        {
            if(oTemp.accountid!=null)
                oppMapAcc.put(oTemp.id,accMap.get(oTemp.accountId));
        }
        for(Id opp : oldOMap.KeySet())
        {   
            Opportunity oldOpp = oldOMap.get(opp);
            if(oldOpp.Most_Recent_Opp__c==1)
            {
                if(oldOpp.AccountId != null) 
                {            
                    if((oldOpp.ownerId !=oppMapAcc.get(oldOpp.id).ownerID) && (oldOpp.ownerId != oldOMap.get(oldOpp.id).OwnerId))
                    {
                        Id accTempId=oldOpp.AccountId;
                        accUpdateList.add(new Account(id=accTempId,ownerID=oldOpp.ownerID));
                    }
                    for(contact cTemp : accMap.get(oldOpp.accountID).contacts)
                    {
                        cTemp.ownerID=oldOpp.OwnerId;
                        conUpdateList.add(cTemp);
                    }
                }             
            }       
        }
        // if bulk insert then we need to remove the duplicate account ids
        Map<id,account> removeAccDup=new Map<id,account>();
        Map<id,contact> removeConDup=new Map<id,contact>();
        if(!accUpdateList.isEmpty())
        {
            for(Account accTemp : accUpdateList)
            {
                removeAccDup.put(accTemp.id,accTemp);
            }
        }
        if(!conUpdateList.isEmpty())
        {
            for(Contact conTemp : conUpdateList)
            {
                removeConDup.put(conTemp.id,conTemp );
            }
        }
        for(id iTemp : removeAccDup.keyset())
            accUpdateListNew.add(removeAccDup.get(itemp));
            
        for(id iTemp : removeConDup.keyset())
            conUpdateListNew.add(removeConDup.get(itemp));

        if(!accUpdateListNew.isEmpty())
        {
            try
            {
                database.update(accUpdateListNew, false);
            }
            catch(Exception ex)
            {
                accUpdateListNew[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }
        if(!conUpdateListNew.isEmpty())
        {
            try
            {
                database.update(conUpdateListNew, false);
            }
            catch(Exception ex)
            {
                conUpdateListNew[0].addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
            }
        }
    }
    
    public static void buNumberOfReferrals(Map<id,Opportunity> newMap, Map<id,Opportunity> oldMap)
    {
    
        Set<Id> oppIds=new Set<id>();
        Set<Id> leadIds=new Set<id>();
        Map<id,String> leadRefferMap=new Map<id,String>();
        Map<id,String> accRefferMap=new Map<id,String>();
        Map<id,Id> leadOppMap=new Map<id,Id>();
        for(Id oppId : newMap.keyset())
        {
            if(CheckRecursiveNumberOfReferrals.runOnce())
            {
                if((newMap.get(oppId).StageName=='Closed Won') && (oldMap.get(oppid).stageName!='Closed Won'))
                {
                    oppIds.add(oppid);
                }
            }
        }
        
        if(oppIds.size()>0)
        {
            for(Lead LTemp :[Select id, Referral_Merchant_ID__c,isConverted, ConvertedOpportunityId from lead where convertedOpportunityId in :oppIds])
            {
                if((LTemp.Referral_Merchant_ID__c!=null) && (LTemp.Referral_Merchant_ID__c!=''))
                {
                    leadOppMap.put(lTemp.convertedOpportunityId , LTemp.id);
                    
                    if(LTemp.Referral_Merchant_ID__c.startsWith('00Q'))
                        leadRefferMap.put(LTemp.id, LTemp.Referral_Merchant_ID__c);
                    
                    if(LTemp.Referral_Merchant_ID__c.startsWith('001'))
                        accRefferMap.put(LTemp.id, LTemp.Referral_Merchant_ID__c);
                }
            }
            if(accRefferMap.size()>0)
            {
                List<Account> accList=new List<Account>();
                for(Account accTemp : [Select id, number_of_funded_referrals__c from account where id in : accRefferMap.values()])
                {
                    Decimal counter=accTemp.number_of_funded_referrals__c !=null ?  accTemp.number_of_funded_referrals__c : 0;
                    counter++;
                    accTemp.number_of_funded_referrals__c=counter;
                    accList.add(accTemp);
                }
                
                if(accList.size()>0)
                    update accList;
            }
            
            if(leadRefferMap.size()>0)
            {
                List<Lead> leadList=new List<Lead>();
                Set<Id> convOppId=new Set<Id>();
                List<Account> accOList=new List<Account>();
                for(Lead lTemp : [Select id, number_of_funded_referrals__c,isConverted,ConvertedOpportunityId from lead where id in : leadRefferMap.values()])
                {
                    if(lTemp.isConverted==false)
                    {
                        Decimal counter=lTemp.number_of_funded_referrals__c !=null ?  lTemp.number_of_funded_referrals__c : 0;
                        counter++;
                        lTemp.number_of_funded_referrals__c=counter;
                        leadList.add(lTemp);
                    }
                    else
                    {
                        convOppId.add(lTemp.ConvertedOpportunityId );
                    }
                }
                
                if(convOppId.size()>0)
                {
                    List<Opportunity> oppTempList=[Select accountId, account.number_of_funded_referrals__c from Opportunity where id in : convOppId];
                    for(Opportunity oppTemp : oppTempList)
                    {
                        Decimal counter=oppTemp.account.number_of_funded_referrals__c !=null ?  oppTemp.account.number_of_funded_referrals__c : 0;
                        counter++;
                        Account accUpdate=new Account(id=oppTemp.accountId,number_of_funded_referrals__c =counter );
                        accOList.add(accUpdate);
                    }
                }
                
                if(leadList.size()>0)
                    update leadList;
                
                if(accOList.size()>0)
                    update accOList;
            }
        }
    }
    
    public static void assignCountersForRoundRobinOnUpdate(List <Opportunity> oppList, Map<id,Opportunity> oldMap)
    {
        try
        {
            Set<Id> campaignId= new Set<Id>();
            for(opportunity opp:oppList)
            {
                if(opp.campaignId != null)
                {
                  System.debug((opp.campaignId!= oldMap.get(opp.id).campaignId));
                  System.debug(opp.OPEN_Tiger_Team_Counter__c);
                  System.debug(opp.Tiger_Team_1_Counter__c);
                  System.debug(opp.Tiger_Team_2_Counter__c);
                  System.debug(opp.Tiger_Team_3_Counter__c);
                  System.debug(opp.Tiger_Team_4_Counter__c);
                  System.debug(((opp.OPEN_Tiger_Team_Counter__c!=null) || (opp.Tiger_Team_1_Counter__c!=null) ||(opp.Tiger_Team_2_Counter__c!=null) || (opp.Tiger_Team_3_Counter__c!=null) ||(opp.Tiger_Team_4_Counter__c!=null)));
                  System.debug(opp.Five9_Lead_List_ID__c);
                  System.debug(opp.Five9_Opp_List_ID__c);
                  System.debug(opp.DMSDocsFirstRoundComplete__c);
                  system.debug(opp.Preferred_Phone_Number__c);
                System.debug(opp.Tiger_Team_2_Counter__c!=oldMap.get(opp.id).Tiger_Team_2_Counter__c);
                
                    if((opp.campaignId!= oldMap.get(opp.id).campaignId) ||(((opp.OPEN_Tiger_Team_Counter__c!=null) ||  
                    (opp.Tiger_Team_1_Counter__c!=null) ||(opp.Tiger_Team_2_Counter__c!=null) || (opp.Tiger_Team_3_Counter__c!=null) ||
                    (opp.Tiger_Team_4_Counter__c!=null)) && (opp.Five9_Lead_List_ID__c==null) && (opp.Five9_Opp_List_ID__c==null) &&(opp.DMSDocsFirstRoundComplete__c!=null) && ( opp.Preferred_Phone_Number__c!=null)))
                        campaignId.add(opp.campaignId); 
                }
            }
            
            if(campaignId.size()>0)
            {
                assignCounterHelper(campaignId, oppList);
            }
        }
        catch(Exception e)
        {
            System.debug('An exception has occured - '+e.getMessage() +' '+ e.getLineNumber() );
        }
    }
    
    public static void assignCountersForRoundRobinOnInsert(List <Opportunity> oppList)
    {
        try
        {
            Set<Id> campaignId= new Set<Id>();
            for(opportunity opp:oppList)
            {
                if(opp.campaignId != null)
                    campaignId.add(opp.campaignId);
            }
            
            if(campaignId.size()>0)
            {
                assignCounterHelper(campaignId, oppList);
            }
            
        }
        catch(Exception e)
        {
            System.debug('An exception has occured - '+e.getMessage() +' '+ e.getLineNumber() );
        }
    }
    
    private static void assignCounterHelper(Set<Id> campaignId, List<Opportunity> oppList)
    {
        Map<Integer, String> userMapOpen=new Map<Integer, String>{1=>'Darius Polk',2=>'Brendan McBride', 3=>'Jason Perkins',
                                                                    4=>'Charles Wagner',5=>'Nick Scallion', 6=>'Jesse Belt',
                                                                    7=>'Peter Havenstein',8=>'Alexander Perla', 9=>'Cayce Prunesti',
                                                                    10=>'Joseph LaFalcia',11=>'Holly Sowa'};
        Map<Integer, String> userMapT1=new Map<Integer, String>{1=>'Darius Polk',2=>'Brendan McBride', 3=>'Jason Perkins'};
        Map<Integer, String> userMapT2=new Map<Integer, String>{1=>'Charles Wagner',2=>'Nick Scallion',3=>'Jesse Belt',4=>'Peter Havenstein'};
        Map<Integer, String> userMapT3=new Map<Integer, String>{1=>'Alexander Perla',2=>'Cayce Prunesti', 3=>'Joseph LaFalcia',4=>'Holly Sowa'};
        Map<Integer, String> userMapT4=new Map<Integer, String>();
        Map<String,Id> userOORMap=new Map<String,Id>();
        
        for(Tiger_Teams__c tTemp :[Select id, user__c, user__r.name from Tiger_Teams__c where user__r.isactive=true])
        {
            userOORMap.put(tTemp.user__r.name.toLowerCase(),tTemp.user__c);
        }
        
        List<OPEN_Dialer_Team_Counter_For_Opportunity__c> panList = new  List<OPEN_Dialer_Team_Counter_For_Opportunity__c>();
        panList = OPEN_Dialer_Team_Counter_For_Opportunity__c.getall().values();
                
        List<Tiger_Team_1_Counter_for_Opportunity__c> team1counter = new List<Tiger_Team_1_Counter_for_Opportunity__c>();
        team1counter = Tiger_Team_1_Counter_for_Opportunity__c.getall().values();
        
        List<Tiger_Team_2_Counter_For_Opportunity__c> team2counter = new List<Tiger_Team_2_Counter_For_Opportunity__c>();
        team2counter = Tiger_Team_2_Counter_For_Opportunity__c.getall().values();
        
        List<Tiger_Team_3_Counter_for_Opportunity__c> team3counter = new List<Tiger_Team_3_Counter_for_Opportunity__c>();
        team3counter = Tiger_Team_3_Counter_for_Opportunity__c.getall().values();
        
        List<Tiger_Team_4_Counter_For_Opportunity__c> team4counter = new List<Tiger_Team_4_Counter_For_Opportunity__c>();
        team4counter = Tiger_Team_4_Counter_For_Opportunity__c.getall().values();
        
        Map<Id, campaign> campaignMap= new Map<Id, campaign>([select Id ,partner_campaign_team__c from campaign where Id= :campaignId and Funding_Channel__c='Distribution']);
               
        for(opportunity opp: oppList)
        {
        if(opp.id!=null)
          System.debug('>>>>>> opp.id >>>>'+opp.id);
            if(campaignMap.containskey(opp.campaignId))
            {
            	System.debug('======inside');
				System.debug('>>>>>>>>>>>>>>>>>>>Pre');
	            System.debug(opp.Tiger_Team_1_Route_ID__c);
	            System.debug(opp.Tiger_Team_2_Route_ID__c);
	            System.debug(opp.Tiger_Team_3_Route_ID__c);
	            System.debug(opp.Tiger_Team_4_Route_ID__c);
	            System.debug(opp.Tiger_Team_OPEN_Route_ID__c);
                if(campaignMap.get(opp.campaignId).partner_campaign_team__c==null)
                {                   
                    Integer currentRecCount=Integer.valueOf(panList[0].Partner_Number__c);
                    Integer currentteamMemberCounter=0;
                    Boolean canBeAllocated=false;
                    
                    while((canBeAllocated==false) && currentteamMemberCounter<userMapOpen.size())
                    {
                        System.debug('while counter '+panList[0].Partner_Number__c);
                        Integer modReminder=Math.mod(Integer.valueOf(panList[0].Partner_Number__c),userMapOpen.size())+1;
                        String userName=userMapOpen.get(modReminder);
                        
                        System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter+'>>> userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                        if(userOORMap.containsKey(userName.toLowerCase()))
                        {
                            panList[0].Partner_Number__c=panList[0].Partner_Number__c+1;
                        }
                        else
                        {
                            opp.OPEN_Tiger_Team_Counter__c= panList[0].Partner_Number__c;
                            if(opp.OPEN_Tiger_Team_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.DMSDocsFirstRoundComplete__c!=null && opp.Five9_Opp_List_ID__c==null)
                            {
                                opp.Tiger_Team_OPEN_Route_ID__c=Math.mod(Integer.valueOf(panList[0].Partner_Number__c),userMapOpen.size())+1;
                                panList[0].Partner_Number__c = panList[0].Partner_Number__c + 1;
                            }
                            canBeAllocated=true;
                        }
                        currentteamMemberCounter++;
                    }
                    
                    if(canBeAllocated==false)
                    {
                        System.debug('no member active reseting to inital counter===>'+currentRecCount);
                        opp.OPEN_Tiger_Team_Counter__c=currentRecCount;
                        system.debug(Math.mod(Integer.valueOf(currentRecCount),userMapOpen.size())+1);
                        if(opp.OPEN_Tiger_Team_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                        {
                            opp.Tiger_Team_OPEN_Route_ID__c=Math.mod(Integer.valueOf(panList[0].Partner_Number__c),userMapOpen.size())+1;
                            panList[0].Partner_Number__c = panList[0].Partner_Number__c + 1;
                        }
                    }
                    System.debug('new counter team1counter[0].Partner_Number__c===>'+panList[0].Partner_Number__c+'>>>>> dev opp.Tiger_Team_1_Counter__c ===>'+opp.OPEN_Tiger_Team_Counter__c);
                }
                else if(campaignMap.get(opp.campaignId).partner_campaign_team__c=='T1')
                {
                    System.debug('initial counter '+team1counter[0].Partner_Number__c);
                    Integer currentRecCount=Integer.valueOf(team1counter[0].Partner_Number__c);
                    Integer currentteamMemberCounter=0;
                    Boolean canBeAllocated=false;
                    while((canBeAllocated==false) && currentteamMemberCounter<userMapT1.size())
                    {
                        System.debug('while counter '+team1counter[0].Partner_Number__c);
                        Integer modReminder=Math.mod(Integer.valueOf(team1counter[0].Partner_Number__c),userMapT1.size())+1;                       
                        String userName=userMapT1.get(modReminder);
                        
                        System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter+'>>> userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                        
                        if(userOORMap.containsKey(userName.toLowerCase()))
                        {
                            team1counter[0].Partner_Number__c=team1counter[0].Partner_Number__c+1;
                        }
                        else
                        {
                            opp.Tiger_Team_1_Counter__c = team1counter[0].Partner_Number__c;
                            
                            if(opp.Tiger_Team_1_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                            {
                                opp.Tiger_Team_1_Route_ID__c=Math.mod(Integer.valueOf(team1counter[0].Partner_Number__c),userMapT1.size())+1;
                                team1counter[0].Partner_Number__c = team1counter[0].Partner_Number__c + 1;
                            }
                            
                            System.debug(' dev opp.Tiger_Team_1_Counter__c ===>'+opp.Tiger_Team_1_Counter__c);
                            canBeAllocated=true;
                        }
                        currentteamMemberCounter++;
                    }
                    
                    if(canBeAllocated==false)
                    {
                        System.debug('no member active reseting to inital counter===>'+currentRecCount);
                        opp.Tiger_Team_1_Counter__c =currentRecCount;
                        system.debug(Math.mod(Integer.valueOf(currentRecCount),userMapOpen.size())+1);
                        if(opp.Tiger_Team_1_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                        {
                            opp.Tiger_Team_1_Route_ID__c=Math.mod(Integer.valueOf(currentRecCount),userMapT1.size())+1;
                            team1counter[0].Partner_Number__c = team1counter[0].Partner_Number__c + 1;
                        }
                    }
                    System.debug('new counter team1counter[0].Partner_Number__c===>'+team1counter[0].Partner_Number__c+'>>>>>>> dev opp.Tiger_Team_1_Counter__c ===>'+opp.Tiger_Team_1_Counter__c);
                }
                else if(campaignMap.get(opp.campaignId).partner_campaign_team__c=='T2')
                {
                    System.debug('initial counter '+team2counter[0].Partner_Number__c);
                    Integer currentRecCount=Integer.valueOf(team2counter[0].Partner_Number__c);
                    Integer currentteamMemberCounter=0;
                    Boolean canBeAllocated=false;
                    while((canBeAllocated==false) && currentteamMemberCounter<userMapT2.size())
                    {
                        System.debug('while counter '+team2counter[0].Partner_Number__c);
                        Integer modReminder=Math.mod(Integer.valueOf(team2counter[0].Partner_Number__c),userMapT2.size())+1;
                        String userName=userMapT2.get(modReminder);
                        
                        System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter+'>>> userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                        if(userOORMap.containsKey(userName.toLowerCase()))
                        {
                            team2counter[0].Partner_Number__c=team2counter[0].Partner_Number__c+1;
                        }
                        else
                        {
                            opp.Tiger_Team_2_Counter__c = team2counter[0].Partner_Number__c;
                            if(opp.Tiger_Team_2_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                            {
                                opp.Tiger_Team_2_Route_ID__c=Math.mod(Integer.valueOf(team2counter[0].Partner_Number__c),userMapT2.size())+1;
                                team2counter[0].Partner_Number__c = team2counter[0].Partner_Number__c + 1;
                            }
                            canBeAllocated=true;
                        }
                        currentteamMemberCounter++;
                    }
                    
                    if(canBeAllocated==false)
                    {
                        System.debug('no member active reseting to inital counter===>'+currentRecCount);
                        opp.Tiger_Team_2_Counter__c =currentRecCount;
                        if(opp.Tiger_Team_2_Counter__c!=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                        {
                            opp.Tiger_Team_2_Route_ID__c=Math.mod(Integer.valueOf(currentRecCount),userMapT2.size())+1;
                            team2counter[0].Partner_Number__c = team2counter[0].Partner_Number__c + 1;
                        }
                    }
                    System.debug('new counter team2counter[0].Partner_Number__c===>'+team2counter[0].Partner_Number__c+'>>>>>>> dev opp.Tiger_Team_2_Counter__c ===>'+opp.Tiger_Team_2_Counter__c);
                }
                else if(campaignMap.get(opp.campaignId).partner_campaign_team__c=='T3')
                {                   
                    System.debug('initial counter '+team3counter[0].Partner_Number__c);
                    Integer currentRecCount=Integer.valueOf(team3counter[0].Partner_Number__c);
                    Integer currentteamMemberCounter=0;
                    Boolean canBeAllocated=false;
                    while((canBeAllocated==false) && currentteamMemberCounter<userMapT3.size())
                    {
                        System.debug('while counter '+team3counter[0].Partner_Number__c);
                        Integer modReminder=Math.mod(Integer.valueOf(team3counter[0].Partner_Number__c),userMapT3.size())+1;
                        String userName=userMapT3.get(modReminder);
                        
                        System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter+'>>> userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                                                
                        if(userOORMap.containsKey(userName.toLowerCase()))
                        {
                            team3counter[0].Partner_Number__c=team3counter[0].Partner_Number__c+1;
                        }
                        else
                        {
                            opp.Tiger_Team_3_Counter__c = team3counter[0].Partner_Number__c;
                            if(opp.Tiger_Team_3_Counter__c !=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                            {
                                opp.Tiger_Team_3_Route_ID__c=Math.mod(Integer.valueOf(team3counter[0].Partner_Number__c),userMapT3.size())+1;
                                team3counter[0].Partner_Number__c = team3counter[0].Partner_Number__c + 1;
                            }
                            canBeAllocated=true;
                        }
                        currentteamMemberCounter++;
                    }
                    
                    if(canBeAllocated==false)
                    {
                        System.debug('no member active reseting to inital counter===>'+currentRecCount);
                        opp.Tiger_Team_3_Counter__c =currentRecCount;
                        if(opp.Tiger_Team_3_Counter__c !=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null  && opp.Five9_Opp_List_ID__c==null)
                        {
                            opp.Tiger_Team_3_Route_ID__c=Math.mod(currentRecCount,userMapT3.size())+1;
                            team3counter[0].Partner_Number__c = team3counter[0].Partner_Number__c + 1;
                        }
                    }
                    System.debug('new counter team3counter[0].Partner_Number__c===>'+team3counter[0].Partner_Number__c+'>>>>> dev opp.Tiger_Team_3_Counter__c ===>'+opp.Tiger_Team_3_Counter__c);
                }
                else if(campaignMap.get(opp.campaignId).partner_campaign_team__c=='T4')
                {
                    System.debug('initial counter '+team4counter[0].Partner_Number__c);
                    Integer currentRecCount=Integer.valueOf(team4counter[0].Partner_Number__c);
                    Integer currentteamMemberCounter=0;
                    Boolean canBeAllocated=false;
                    while((canBeAllocated==false) && currentteamMemberCounter<userMapT4.size())
                    {
                        System.debug('while counter '+team4counter[0].Partner_Number__c);
                        Integer modReminder=Math.mod(Integer.valueOf(team4counter[0].Partner_Number__c),userMapT4.size())+1;
                        String userName=userMapT4.get(modReminder);
                        System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter+'>>> userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                        
                        if(userOORMap.containsKey(userName.toLowerCase()))
                        {
                            team4counter[0].Partner_Number__c=team4counter[0].Partner_Number__c+1;
                        }
                        else
                        {
                            opp.Tiger_Team_4_Counter__c = team4counter[0].Partner_Number__c;
                            
                            if(opp.Tiger_Team_4_Counter__c !=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null &&  opp.Five9_Opp_List_ID__c==null)
                            {
                                opp.Tiger_Team_4_Route_ID__c=Math.mod(Integer.valueOf(team4counter[0].Partner_Number__c),userMapT4.size())+1;
                                team4counter[0].Partner_Number__c = team4counter[0].Partner_Number__c + 1;
                            }
                            System.debug(' dev opp.Tiger_Team_4_Counter__c ===>'+opp.Tiger_Team_4_Counter__c);
                            canBeAllocated=true;
                        }
                        currentteamMemberCounter++;
                    }
                    
                    if(canBeAllocated==false)
                    {
                        System.debug('no member active reseting to inital counter===>'+currentRecCount);
                        opp.Tiger_Team_4_Counter__c =currentRecCount;
                        if(opp.Tiger_Team_4_Counter__c !=null && opp.Five9_Lead_List_ID__c==null && opp.Preferred_Phone_Number__c!=null && opp.Five9_Opp_List_ID__c==null)
                        {
                            opp.Tiger_Team_4_Route_ID__c=Math.mod(Integer.valueOf(currentRecCount),userMapT4.size())+1;
                            team4counter[0].Partner_Number__c = team4counter[0].Partner_Number__c + 1;
                        }
                    }
                    System.debug('new counter team4counter[0].Partner_Number__c===>'+team4counter[0].Partner_Number__c+'>>>>> dev opp.Tiger_Team_4_Counter__c ===>'+opp.Tiger_Team_4_Counter__c);
                } 
            }
          System.debug('>>>>>>>>>>>>>>>>>>>>>>Last');
          System.debug(opp.Tiger_Team_1_Route_ID__c);
          System.debug(opp.Tiger_Team_2_Route_ID__c);
          System.debug(opp.Tiger_Team_3_Route_ID__c);
          System.debug(opp.Tiger_Team_4_Route_ID__c);
          System.debug(opp.Tiger_Team_OPEN_Route_ID__c);
        }

        if(!panList.isEmpty())
            update panList;
            
        if(!team1counter.isEmpty())
            update team1counter;
            
        if(!team2counter.isEmpty())
            update team2counter;
            
        if(!team3counter.isEmpty())
            update team3counter;
            
        if(!team4counter.isEmpty())
            update team4counter; 
    }
}