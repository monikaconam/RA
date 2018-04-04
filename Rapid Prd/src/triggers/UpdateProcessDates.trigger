trigger UpdateProcessDates on Opportunity (before insert, before update) {
      
      List<Opportunity> opps = trigger.new;
      List<id> campaignids = new List<id>();
      for (Opportunity o:opps){
        if (o.campaignid != null) {
            campaignids.add(o.campaignId);
        }
      }        
      Map<id, campaign> campaignmap = new Map<id, campaign>([select id, split_fund_set_up__c, Suppress_Site_Inspection__c from campaign where id in :campaignids]);

      /*for (integer i = 0; i < Trigger.New.Size(); i++) {
         if ((Trigger.IsInsert && Trigger.New[i].Processing_Re_Set__c != null) || (Trigger.IsUpdate && Trigger.New[i].Processing_Re_Set__C != Trigger.Old[i].Processing_Re_Set__C)) {
                Trigger.New[i].Account_Database_Entry__c = null;
                Trigger.New[i].Begin_Activity_Monitoring__c = null;
                Trigger.New[i].Canceled_Site_Survey__c = null;
                Trigger.New[i].Decline_Letter_Sent__c = null;
                Trigger.New[i].Funded_by_WC__c = null; 
                Trigger.New[i].Site_Survey_Available__c = null; 
                Trigger.New[i].Site_Survey_Ordered__c = null;
                Trigger.New[i].Welcome_Kit_Sent__c = null;
         }  
      }*/
          
      for (Opportunity o:opps){
        
        boolean SuppressSiteInspection = false;
        if (o.CampaignId != null)
        {
            Campaign c = campaignmap.get(o.campaignid); //[select id, split_fund_set_up__c from campaign where id = :o.campaignid];
            System.debug(c);
           
            if (c != null)
            {
                System.debug('XXXXXXXXXXXXXXX');
                if (o.Split_Fund_Set_Up__c == null)
                {
                    System.debug('X2');
                    o.Split_Fund_Set_Up__c  = c.Split_Fund_Set_up__c;
                }
                SuppressSiteInspection = c.Suppress_Site_Inspection__c;
            }
        }
         System.debug('X3');
        if (o.Funded_by_WC__c != null)
        {
             System.debug('X4');
                o.Welcome_Kit_Sent_Due_Date__c  = Utils.AddWeekdays(o.Funded_by_WC__c,1);
        }
        else
        {
             System.debug('X5');
                o.Welcome_Kit_Sent_Due_Date__c  = null; 
        }      
         System.debug('X6');
         if (o.Calculate_Due_Dates__c != null && o.stagename != 'Closed Won')
         {
              System.debug('X7');
             //Account a = [select id, Split_Fund_Set_Up__c from account where id = :o.accountid limit 1];  
            datetime basedate;
            datetime decisiondate;
            if (o.re_decision_date__c == null) {
            System.debug('w1');
            
                //basedate = o.Processing_Re_Set__C;
                decisiondate = o.decision_date__c;
            }
            else if (o.re_decision_date__c != null) {
            System.debug('w2');
                //basedate = o.Processing_Re_Set__C;
                decisiondate = o.re_decision_date__c;
            }
            else if (o.re_decision_date__c == null) {
            System.debug('w3');
                basedate = o.Calculate_Due_Dates__c;
                decisiondate = o.decision_date__c;
            }
            else {
            System.debug('w4');
                basedate = o.re_decision_date__c;
                decisiondate = o.re_decision_date__c;
            }       
            
             System.debug('X8');  
              System.debug('basedate  '+basedate );
               System.debug('decisiondate '+decisiondate );
            double manageroverride = 0;
            
            string resultingprocess = '';
     
          if (
          o.Underwriting_Approval__c == 'Declined' || 
          o.Underwriting_Approval__c == 'Auto Declined' ||
          o.Underwriting_Approval__c == 'Declined by Credit Committee' ||
          o.Underwriting_Approval__c == 'Declined - Pending Management Review' ||
          o.Underwriting_Approval__c == 'Unqualified - Will Not Reconsider' || 
          o.Underwriting_Approval__c == 'Unqualified - Will Reconsider in the Future' || 
          o.Underwriting_Approval__c == 'Unqualified - Comp. Pay Off too High - Reconsider Later' 
          ) 
      {
        resultingprocess = 'DECLINED';
        System.debug('X11');  
      }
            else if (
                    o.Underwriting_Approval__c == 'Rescinded by merchant' ||
                    o.Underwriting_Approval__c == 'Rescinded by RapidAdvance' || 
                    o.Underwriting_Approval__c == 'Rescinded by Processing' || 
                    o.Underwriting_Approval__c == 'Rescinded by Underwriting' 
                    ) 
            {
                resultingprocess = 'RESCINDED';
            }
            else if (o.Renewal__c) 
            {
                System.debug('X12');  
                resultingprocess = 'RENEWAL';
            }
            else if (o.Split_Fund_Set_Up__c  == 'GPS - Rocky Mountain') 
            {
                System.debug('X13');  
                resultingprocess = 'RMB';
            }
            else if (o.Split_Fund_Set_Up__c  == 'Rapid Advance Chooses') 
            {
                System.debug('X115');  
                resultingprocess = 'NMA';
            }
            else if (o.Current_Processor__c == o.Processor_Name__c) 
            { 
                System.debug('X116');  
                resultingprocess = 'EPR With';
            }
            else 
            {
                System.debug('X17');  
                resultingprocess = 'EPR Without';
            }
            System.debug('X18');  
            //First, go ahead and clear all the dates....
            o.Account_Database_Entry_Due_Date__c   = null;
            //o.Canceled_Site_Survey_Due_Date__c = null; 
           
            //o.Confirmed_Needs_Follow_Up_Due_Date__c    = null;
            o.Decline_Letter_Sent_Due_Date__c = null;
            o.Site_Survey_Available_Due_Date__c = null;
            // // o.Site_Survey_Ordered_Due_Date__c   = null; 
            
            if (resultingprocess == 'RESCINDED') {
            System.debug('X19');  
                /*if (decisiondate != null) {
                            
                    if (o.Renewal__c && o.Amount >= 50000 && o.Site_Survey_Available__c == null)
                    {
                            o.Canceled_Site_Survey_Due_Date__c = utils.ConvertDateTimeToDate(decisiondate);  
                    }               
                    else if (o.Renewal__c && o.Amount >= 20000 && o.Site_Survey_Available__c == null && )
                    {
                              o.Canceled_Site_Survey_Due_Date__c = utils.AddWeekdays1730(decisiondate, 0);  
                     }                     
                    else if (!o.renewal__c && o.Amount > 10000 && o.Site_Survey_Available__c == null)
                    {  
                        o.Canceled_Site_Survey_Due_Date__c = utils.ConvertDateTimeToDate(decisiondate);  
                    }
                    else
                    {
                        o.Canceled_Site_Survey_Due_Date__c = null;  
                    }
                }    */       
                o.Resulting_Process__c = 'RESCINDED';
           } 
           else if (resultingprocess == 'DECLINED') {
           System.debug('X20');  
                /*if (decisiondate != null) {               
                    if (o.Renewal__c && o.Amount >= 50000 && o.Site_Survey_Available__c == null)
                    {
                            o.Canceled_Site_Survey_Due_Date__c = utils.AddWeekdays1730(decisiondate, 0);  
                    }               
                    else if (o.Renewal__c && o.Amount >= 20000 && o.Site_Survey_Available__c == null && 
                    {
                              o.Canceled_Site_Survey_Due_Date__c = utils.AddWeekdays1730(decisiondate, 0); 
                    } 
                    else if (!o.renewal__c && o.Amount > 10000 && o.Site_Survey_Available__c == null)
                    {  
                        o.Canceled_Site_Survey_Due_Date__c = utils.AddWeekdays1730(decisiondate, 0); 
                    }
                    else
                    {
                        o.Canceled_Site_Survey_Due_Date__c = null;  
                    }
                        o.Decline_Letter_Sent_Due_Date__c = Utils.AddWeekdays(decisiondate, 0);
                }*/
                o.Resulting_Process__c = 'DECLINED';
           } 
           else if (resultingprocess == 'RENEWAL') {                     
     System.debug('X21');  
                if (decisiondate != null && o.amount >= 100000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                    || o.Underwriting_Approval__c  == 'Approved' 
                                    || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                    SuppressSiteInspection == false)
                {   
                    // o.Site_Survey_Ordered_Due_Date__c = Utils.AddWeekdays(decisiondate, manageroverride + 0); 
                    o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                }
                else if (decisiondate != null && o.amount >= 20000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                    || o.Underwriting_Approval__c  == 'Approved' 
                                    || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                    SuppressSiteInspection == false)
                {
                    // o.Site_Survey_Ordered_Due_Date__c = Utils.AddWeekdays(decisiondate, manageroverride + 0); 
                    o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1); 
                }  
                else   
                {
                    // o.Site_Survey_Ordered_Due_Date__c = null;  
                    o.Site_Survey_Available_Due_Date__c = null;  
                } 
                o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 2); 
                if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                || o.Underwriting_Approval__c  == 'Approved' 
                                || o.Underwriting_Approval__c  == 'Auto Approved')) 
                {
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, 1);  
                } 
                o.Resulting_Process__c = 'RENEWAL';
           }
           else if (resultingprocess == 'RMB') { //RMB
                   if (decisiondate != null) { 
                    if (o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                    || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                    || o.Underwriting_Approval__c  == 'Approved' 
                                    || o.Underwriting_Approval__c  == 'Auto Approved')
                    {
                            o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);    //DJC
                    }                   
                    if (o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
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
                        // o.Site_Survey_Ordered_Due_Date__c = null;  
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
                        // o.Site_Survey_Ordered_Due_Date__c = null;  
                        o.Site_Survey_Available_Due_Date__c = null;  
                    }                    
                    o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2); //DJC
                }                
                //o.Confirmed_Needs_Follow_Up_Due_Date__c = utils.AddWeekdays(basedate, manageroverride + 6); 
                

                if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                || o.Underwriting_Approval__c  == 'Approved' 
                                || o.Underwriting_Approval__c  == 'Auto Approved')) 
                {
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                }                
                o.Resulting_Process__c = 'NMA';
           }
           else if (resultingprocess == 'NMA Canada') { 
                if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                || o.Underwriting_Approval__c  == 'Approved' 
                                || o.Underwriting_Approval__c  == 'Auto Approved')) 
                {
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                }              
                o.Resulting_Process__c = 'NMA Canada';                
           }
           else if (resultingprocess == 'EPR With') { 
           System.debug('X31');  
                if (decisiondate != null && o.amount >= 50000 && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                    || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                    || o.Underwriting_Approval__c  == 'Approved' 
                                    || o.Underwriting_Approval__c  == 'Auto Approved') && 
                                    SuppressSiteInspection == false) 
                {
                    System.debug('X32');  
                    // o.Site_Survey_Ordered_Due_Date__c = Utils.AddWeekdays(decisiondate, manageroverride + 0); 
                    o.Site_Survey_Available_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 3); 
                }
                else
                { 
                    System.debug('X33');  
                    // o.Site_Survey_Ordered_Due_Date__c = null;  
                    o.Site_Survey_Available_Due_Date__c = null;  
                }
                if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                || o.Underwriting_Approval__c  == 'Approved' 
                                || o.Underwriting_Approval__c  == 'Auto Approved')) 
                {
                    System.debug('X34');  
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 1);    
                }               
                o.Resulting_Process__c = 'EPR With';
          }
           else if (resultingprocess == 'EPR Without') { 

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
                    // o.Site_Survey_Ordered_Due_Date__c = null;  
                    o.Site_Survey_Available_Due_Date__c = null;  
                }
                if (decisiondate != null && ( o.Underwriting_Approval__c  == 'Approved by Credit Committee' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in advance amount and split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee but change in split' 
                                || o.Underwriting_Approval__c  == 'Approved by Credit Committee with conditions' 
                                || o.Underwriting_Approval__c  == 'Approved - Pending Management Review' 
                                || o.Underwriting_Approval__c  == 'Approved' 
                                || o.Underwriting_Approval__c  == 'Auto Approved')) 
                {
                        o.Account_Database_Entry_Due_Date__c = utils.AddWeekdays(decisiondate, manageroverride + 2);//djc   
                }                                 
                o.Resulting_Process__c = 'EPR Without';
          }              
      }
    }      
}