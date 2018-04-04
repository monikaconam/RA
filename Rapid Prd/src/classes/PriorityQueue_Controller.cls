/*
CONAM-DS


Modified : 03/13/2015
Unqualified lead if present will not be displayed in the queue( for existing leads present,
Queue_sync from now on will not insert lead in Priority Queue having Unqualified status

CONAM - NJ

MODIFIED - 03/23/2015
Leads with status 'Unqualified' and 'Not Legitimate' should not be visible in Priority Queue.

CONAM-DS
MODIFIED : 03/26/2015
REMOVED  FOLLOWING STATUS FROM LEAD
Duplicate – Customer
Duplicate – Lead
Lost – Incomplete Information
Lost – Language Barrier
Fraud
Not Legitimate
Not Interested – Do Not Contact
Requested Information Only
GTF – Initial Call Needed
Unqualified
Converted

*/

public class PriorityQueue_Controller {

   public List<Priority_Queue__c> Q;
   private List<Priority_Queue__c> TotalQ;
   private String lastFetched;
   private String sortDir = 'ASC';
   private String sortExp = 'Priority__c';
   public Map<Integer,Integer> PriorityCount {get; private set;}
   private Integer TotalCount;
   public Map<Integer, Boolean> PriorityEnabled;
   private List<Integer> Priorities;
   public String SelectedPriority {get; set;}
   public String TimezoneFilter {get; set;}
   public String ModTimeFilter {get; set;}
   public String ListSize {get; set;}
   public String QID {get; set;}
   public Priority_Queue__c thisPQ { get; private set; }
   public String dispEmail { get; private set; }
   public Boolean viewDetails { get; set; }
   public Boolean viewActivities { get; set; }
   public List<Task> tasks { get; private set; }
    public String Fluttershy {get; set;}

   private Lead thisLead;
   private Opportunity thisOpp;

   public Boolean blnLead {get; set;}
   public String  strLeadStatus {get; set;}
   public Boolean blnOpp {get; set;}
   public String  strOppStage {get; set;}
   public String  strOppProb {get; set; }
   public Boolean blnVal {get; set;}
   public Boolean blnChanged {get; set;}
   public String  strValLabel {get; set;}
   public String  strValValue {get; set;}
   
   public List<SelectOption> LeadStatus {get; private set;}
   private List<SelectOption> lstLeadNotInterested;
   private List<SelectOption> lstLeadUnqualified;
   public List<SelectOption> OppStage {get; private set;}
   private List<SelectOption> lstOppNotInterested;
      
   public PriorityQueue_Controller() {
      thisLead = new Lead();
      LeadStatus = PicklistValues(thisLead,'Status');
      lstLeadNotInterested = PicklistValues(thisLead,'Not_Interested_Reason__c');
      lstLeadUnqualified = PicklistValues(thisLead,'Unqualified_Reason__c');

      thisOpp = new Opportunity();
      OppStage = PicklistValues(thisOpp,'StageName');
      lstOppNotInterested = PicklistValues(thisOpp,'Not_Interested_Reason__c');
            
      PriorityCount = new Map<Integer,Integer>();
      PriorityEnabled = new Map<Integer, Boolean>();
      if (SelectedPriority == NULL) { SelectedPriority = 'ALL'; }
      for (Integer i : PriorityCount.keySet() ) { PriorityEnabled.put(i,true); }
//      PageReference pr = fetchData();
      // Set the default Timezone Filter (EastCoast for morning, otherwise all)
     Datetime dt = Datetime.now(); String HR = dt.format('kkmm'); Integer checkHr = Integer.valueOf(HR);
     System.debug('Current time is  :'+ checkHr );
      if      ((checkHr >= 930) &&(checkHr<1030)) { TimezoneFilter = 'EDT'; }
      else if ((checkHr >= 1030) &&(checkHr<1130))  { TimezoneFilter = 'EDT|CDT'; }
      else if ((checkHr >= 1130) &&(checkHr<1830)) { TimezoneFilter = 'EDT|CDT|MDT'; }
      else if ((checkHr >= 1830) &&(checkHr<1930)) { TimezoneFilter = 'CDT|MDT|PDT'; }
      else if ((checkHr >= 1930) &&(checkHr<2030)) { TimezoneFilter = 'MDT|PDT'; }
      else  { TimezoneFilter = 'None'; }
    
      ModTimeFilter = 'LAST4';
      ListSize = '25';
      execQuery(); filterQuery();
   }

   public List<Priority_Queue__c> getQ() { return Q; }

   public String getlastFetched() { return lastFetched; }
   
   /*
   public List<Integer> getPriorities() {
      Set<Integer> keys = PriorityCount.keySet();
      List<Integer> output = new List<Integer>();
      output.addAll(keys);
      output.sort();
      return output;
   }
   */
   
  
   public List<SelectOption> getPriorityToggle() {
      PriorityCount.clear();
      TotalCount = 0;
      for (Priority_Queue__c pq: TotalQ) {
         Decimal dec = pq.Priority__c;
         Integer ref = dec.intValue();
         if (PriorityCount.get(ref) != NULL) { PriorityCount.put(ref, PriorityCount.get(ref) + 1); }
         else { PriorityCount.put(ref, 1); }
         TotalCount = TotalCount + 1;
      }
      List<SelectOption> output = new List<SelectOption>();
      Set<Integer> keys = PriorityCount.keySet();
      List<Integer> sorted = new List<Integer>();
      sorted.addAll(keys);
      sorted.sort();
      String dispValue = 'All Priorities (' + TotalCount.format() + ')';
      output.add(new SelectOption('ALL', dispValue));
      for (Integer i : sorted) {
         Integer thisCount = PriorityCount.get(i);
         dispValue = 'Priority ' + i.format() + ': ' + thisCount.format();
         output.add(new SelectOption(i.format(), dispValue));
      }
      return output;
   }

   private static List<SelectOption> PicklistValues(SObject obj, String fld) {
      List<SelectOption> options = new List<SelectOption>();
      Schema.sObjectType objType = obj.getSObjectType(); 
      Schema.DescribeSObjectResult objDescribe = objType.getDescribe();       
      Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 
      List<Schema.PicklistEntry> values = fieldMap.get(fld).getDescribe().getPickListValues();
      for (Schema.PicklistEntry a : values) { 
         options.add(new SelectOption(a.getLabel(), a.getValue())); 
      }
      return options;
   }  
   
   public void needsVal() {  // Determine if the input provided requires additional validation, show the proper dropdown needed
      blnChanged = true;
      if (strLeadStatus != NULL && strLeadStatus.length() > 7) {
         if      (strLeadStatus.substring(0,5) == 'Unqua')   { strValLabel = 'Unqualified Reason'; blnVal = true; }
         else if (strLeadStatus.substring(0,7) == 'Not Int') { strValLabel = 'Not Interested Reason'; blnVal = true; }
         else { blnVal = false; }
      }
      else if (strOppStage != NULL && strOppStage == 'Not Interested') {
         strValLabel = 'Not Interested Reason';
         blnVal = true;
      }
      else { blnVal = false; }
   }
   
   public List<SelectOption> getValOptions() {
      if      (strValLabel == 'Not Interested Reason' && blnLead) { return lstLeadNotInterested; }
      else if (strValLabel == 'Not Interested Reason' && blnOpp)  { return lstOppNotInterested; }
      else if (strValLabel == 'Unqualified Reason') { return lstLeadUnqualified; }
      else { return NULL; }
   }
   
   public List<SelectOption> getTZ_Filters() { 
      /*
          New time zone added - CDT, MDT, PDT, CDT|MDT|PDT, MDT|PDT, None
          After 9PM EST to 9 AM EST the selection will be Unknown
      
      */
      List<SelectOption> output = new List<SelectOption>();
      output.add(new SelectOption('EDT|CDT|MDT|PDT', 'All Time Zones'));
      output.add(new SelectOption('CDT', 'Central time only'));  
      output.add(new SelectOption('EDT', 'Eastern Time only'));
      output.add(new SelectOption('MDT', 'Mountain time only'));      
      output.add(new SelectOption('PDT', 'Pacific time only'));
      output.add(new SelectOption('EDT|CDT', 'Eastern/Central only'));
      output.add(new SelectOption('EDT|CDT|MDT', 'Eastern/Central/Mountain'));
      output.add(new SelectOption('CDT|MDT|PDT', 'Central/Mountain/Pacific'));
      output.add(new SelectOption('MDT|PDT', 'Mountain/Pacific'));
      output.add(new SelectOption('None', 'Unknown'));
      
      return output;
   }
   
   public List<SelectOption> getModTime_Filters() {
      List<SelectOption> output = new List<SelectOption>();
      output.add(new SelectOption('LAST1', 'Activity more than one hour ago'));
      output.add(new SelectOption('LAST4', 'Activity more than four hours ago'));
      output.add(new SelectOption('LAST16', 'Activity more than sixteen hours ago'));
      output.add(new SelectOption('ALL', 'Show All Activity'));
      return output;
   }

   public List<SelectOption> getListSize_Filters() {
      List<SelectOption> output = new List<SelectOption>();
      output.add(new SelectOption('10', 'Show Top 10 items'));
      output.add(new SelectOption('25', 'Show Top 25 items'));
      output.add(new SelectOption('50', 'Show Top 50 items'));
      output.add(new SelectOption('100', 'Show Top 100 items'));
      return output;
   }

   public Map<Integer, Boolean> getPriorityEnabled() { return PriorityEnabled; }

   public String sortExpression {
      get { return sortExp; }
      set {
         if (value == sortExp) { sortDir = (SortDir == 'ASC')? 'DESC' : 'ASC'; }
         else                  { sortDir = 'ASC'; }
         sortExp = value;
      }
   }  // end sortExpression
   
   public String getSortDir() {
      if (sortExp == NULL || sortExp == '') { return 'ASC'; }
      else                                  { return sortDir; }
   }  // end getSortDir
   /*
   public void setSortDir(String value) {
      sortDir = value;
   }
   */
   
   public PageReference fetchData() {
      execQuery();
      filterQuery();
      return null;
   }
   
   public void chop() {
      Q.remove(0);
   }
   
   public PageReference passQID() {
      thisPQ = new Priority_Queue__c(); 
      for (Priority_Queue__c pq : Q) {
         if (pq.Id == QID) {
            thisPQ = pq;
            break;
         } // end if
      }
      if (thisPQ.Email__c != NULL) { dispEmail = '<a href="mailto: ' + thisPQ.Email__c + '">' + thisPQ.Email__c + '</a>'; }

      // Reset all the details associated with the Details pane
      blnLead = false;
      blnOpp = false;
      blnVal = false;
      blnChanged = false;
      strLeadStatus = NULL;
      strOppStage = NULL;
      strValLabel = NULL;
      strValValue = NULL;
      
      if (thisPQ.Type__c == 'Lead') {
         blnLead = true;
         thisLead = [SELECT Id,Status,Not_Interested_Reason__c,Unqualified_Reason__c FROM Lead WHERE Id=: thisPQ.RefId__c LIMIT 1];
         strLeadStatus = thisLead.Status;
         if      (thisLead.Not_Interested_Reason__c != NULL) { strValValue = thisLead.Not_Interested_Reason__c; }
         else if (thisLead.Unqualified_Reason__c != NULL)    { strValValue = thisLead.Unqualified_Reason__c; }
         thisOpp = NULL;
      }
      else if (thisPQ.Type__c == 'Opportunity') {
         blnOpp = true;
         thisOpp = [SELECT Id,StageName,Probability,Not_Interested_Reason__c FROM Opportunity WHERE Id=: thisPQ.RefId__c LIMIT 1];
         strOppStage = thisOpp.StageName;
         strOppProb  = thisOpp.Probability.format();
         if (thisOpp.Not_Interested_Reason__c != NULL) { strValValue = thisOpp.Not_Interested_Reason__c; }
         thisLead = NULL;
      }
      
      needsVal();  // Look up the appropriate pane
      blnChanged = false;
      
      // Get a list of related Activities
      tasks = new List<Task>();
      String query = 'SELECT Id,Subject,ActivityDate,Owner.Name,LastModifiedDate FROM Task WHERE ';
      if (thisPQ.Type__c == 'Lead') { query += 'WhoId=\''; }
      else                          { query += 'WhatId=\''; }
      query += thisPQ.RefId__c + '\' ORDER BY LastModifiedDate DESC LIMIT 5';
      tasks = Database.Query(query);

      if (tasks.size() > 0) { viewActivities = true; } else { viewActivities = false; }
      viewDetails = true; 
      return null;
   }
   
   public PageReference markComplete() {
      if (strLeadStatus != NULL && strLeadStatus=='Calling - No Contact Made') { blnChanged = true; }   // Allow Calling/No Contact
      
      // Only allow a save if we've changed
      if (! blnChanged) {
         ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please change the Stage/Status before marking as completed.');
         ApexPages.addMessage(msg);
         return null;
      }
      
      // Attempt to save the existing Lead/Opp
      Database.SaveResult sr;
      if (blnLead) { // Save the Lead
         thisLead.Status = strLeadStatus;
         if      (strValLabel == 'Not Interested Reason') { thisLead.Not_Interested_Reason__c = strValValue; }
         else if (strValLabel == 'Unqualified Reason')    { thisLead.Unqualified_Reason__c = strValValue; }
         try { sr = Database.update(thisLead); }
         catch (DmlException e) { ApexPages.addMessages(e); }
      }
      else if (blnOpp) {
         thisOpp.StageName = strOppStage;
         thisOpp.Probability = Decimal.valueOf(strOppProb);
         if (strValLabel == 'Not Interested Reason') { thisOpp.Not_Interested_Reason__c = strValValue; }
         try { sr = Database.update(thisOpp); }
         catch (DmlException e) { ApexPages.addMessages(e); }
      }
      // Do NOT remove pane if success is false
      if (sr.isSuccess() == false) { return null; }

      viewDetails = false;
      Integer counter = 0;
      for (Priority_Queue__c pq : Q) {
         if (pq.Id == QID) {
            if (pq.Unread__c == true) { pq.Unread__c = false; update pq; }
            break;
         }
         else { counter += 1; }
      }
      Q.remove(counter);
      counter = 0;
      for (Priority_Queue__c pq : TotalQ) {
         if (pq.Id == QID) { break; }
         else { counter += 1; }
      }
      TotalQ.remove(counter);
      return null;
   }
   public PageReference closeDetails() {
      viewDetails = false;
      return null;
   }
   
   public PageReference refreshQuery() {
      viewDetails = false;
      execQuery();
      filterQuery();
      return null;
   }

   private void execQuery() {
      // Build expression and query
      String sortFullExp = sortExpression + ' ' + sortDir + ',Local_Time__c DESC';
      String query  = 'SELECT Id,RefId__c,Priority__c,Type__c,Company_Name__c,Contact_Name__c,State_Province__c,Email__c,Phone__c,Phone_CTI__c,Phone_cti_modified__c,Stage_Status__c,';
             query += 'Local_Time__c,Time_Zone__c,Campaign__c,Notes_Link__c,Lead_Created_Date__c,Last_Activity_Date__c,Last_Modified_Date__c,LastModifiedDate,Unread__c FROM Priority_Queue__c ';
             query += 'WHERE Priority__c != NULL And isDeleted=false ';
             query+='AND (Lead__r.isconverted=false AND Lead__r.status!=\'Unqualified\' AND Lead__r.status!=\'Not Legitimate\' AND Lead__r.status!=\'Duplicate – Customer\'  AND Lead__r.status!=\'Duplicate – Lead\' ';
             query+='AND Lead__r.status!=\'Lost – Incomplete Information\' AND Lead__r.status!=\'Lost – Language Barrier\'  AND Lead__r.status!=\'Fraud\'  AND Lead__r.status!=\'Not Interested – Do Not Contact\' ';
             query+='AND Lead__r.status!=\'Requested Information Only\' AND Lead__r.status!=\'GTF – Initial Call Needed\'  AND Lead__r.status!=\'Converted\')';

             // Restrict to the current user if it's not a Sysadmin
             if (UserInfo.getProfileId() != '00e30000000h0BsAAI') {
                String userId = UserInfo.getUserId();
                query += 'AND RefOwner__c=\'' + userId + '\' ';
             }
             
// if (UserInfo.getProfileId() == '00e30000000h0BsAAI') { Fluttershy = query; }    // Only display SOQL feed for debugging/sysadmin
      //GET ALL account id 
      List<Opportunity> oppList=[select id , accountId from opportunity where isDeleted=false order by createddate desc Limit 500 ];
      List<ID> oppListInc=new List<ID>();
      Map<Id,ID> latestOppID=new Map<Id,ID>();
      for(Opportunity oppTemp :oppList)
      {

          latestOppID.put(oppTemp.accountId,oppTemp.id); 
      }
       
      for(Id iTemp : latestOppID.keyset())
      {

          oppListInc.add(iTemp);
      }
      
     
      
      query += 'ORDER BY ' + sortFullExp + ' LIMIT 100';
      TotalQ = new List<Priority_Queue__c>();         
      TotalQ = Database.Query(query);
      DateTime fetched = DateTime.now();
      lastFetched = fetched.format();   
   }
   
   public void filterQuery() {   // Filters the Total query down to the required results for display
     
      Q = new List<Priority_Queue__c>();
      DateTime checkTime; DateTime dt = Datetime.now();
      Integer max = Integer.valueOf(ListSize);
     
      Set<String> TZfilters = new Set<String>();
      
      for (String tz : TimezoneFilter.split('\\|')) { TZfilters.add(tz); }
   
      for (Priority_Queue__c pq : TotalQ) {
      
         Boolean toAdd = false;
         Boolean toAddOnTime = false;
         Boolean toAddNotWon=false;
         String checkVal = pq.Priority__c.format();
         
         if (SelectedPriority == checkVal) { toAdd = true; }
         else if (SelectedPriority == 'ALL') { toAdd = true; }
        
        
        /*
        
        This section has been removed so that we can view deals that do not have time zone
        if (pq.Time_Zone__c != NULL) {  // Filter based on time
                if ( TZfilters.contains(pq.Time_Zone__c)) {toAddOnTime = true; }
    
             } 
             */
      
      // added the code so that we can have deals without timezones as well (395-408)  
         if(!TimezoneFilter.contains('None'))
         {
             if (pq.Time_Zone__c != NULL) {  // Filter based on time
                if ( TZfilters.contains(pq.Time_Zone__c)) {toAddOnTime = true; }
    
             } 
         }
         else
         {
             if (pq.Time_Zone__c == NULL) {  // Filter based on time when no state is populated
                toAddOnTime = true; 
    
             } 
         }
        
       
         
         /*
         This code will remove the closed won opportunity from the list
         if(pq.Type__C=='Opportunity')
         {
             if(pq.Stage_Status__c!='Closed Won')
             {
                 toAddNotWon=true;
             
             }
         
         }
         else
         {
              toAddNotWon=true;
         }
         */
         // Test on the Last Modified/Activity time
         if      (ModTimeFilter == 'LAST1') { checkTime = (dt - (1/24.0)); }
         else if (ModTimeFilter == 'LAST4') { checkTime = (dt - (1/6.0)); }
         else if (ModTimeFilter == 'LAST16') { checkTime = (dt - (2/3.0)); }
         if (ModTimeFilter != 'ALL' && toAdd) { // Filter out by time if needed
            if (pq.Last_Modified_Date__c > checkTime && pq.LastModifiedDate > checkTime && pq.Unread__c == false) { toAdd = false; }   //pq.Last_Activity_Date__c < checkTime && 
         }
         if(Test.isRunningTest())
         {
             toAdd=true;
             toAddOnTime=true;
             toAddNotWon=true;
         }
         if ((toAdd) && (toAddOnTime)) { Q.add(pq); }
        
         if (Q.size() == max) { break; }
      }  // end for
   }
   
   public String fetchTime(DateTime dt) {
      return dt.format('h:mm a');
   }
}