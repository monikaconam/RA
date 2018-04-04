trigger WFRActions on Opportunity (before insert, before update) {
     List<Messaging.SingleEmailMessage> mailingList = new List<Messaging.SingleEmailMessage>();
    for(Opportunity opp: Trigger.new){

        Opportunity oldOpp;
        if(Trigger.isUpdate) {
            oldOpp =  Trigger.oldMap.get(opp.Id);   
        }
        
        /*** Declined Deal WFR ***/
        if(opp.Underwriting_Approval__c == 'Declined' || opp.Underwriting_Approval__c == 'Declined by Credit Committee' ){
            opp.StageName='Declined';
        }
        
        /*** Approved or Auto Approve WFR ***/
        if ((opp.Underwriting_Approval__c== 'Auto Approved' || opp.Underwriting_Approval__c=='Approved by Credit Committee' || opp.Underwriting_Approval__c=='Auto Approved Re-Price' || opp.Underwriting_Approval__c=='Approved Re-price' || opp.Underwriting_Approval__c=='Approved' || opp.Underwriting_Approval__c=='Approved by Credit Committee with conditions')
             && (Trigger.isInsert  || (Trigger.isUpdate && (oldOpp.Underwriting_Approval__c != 'Auto Approved' && oldOpp.Underwriting_Approval__c !='Approved by Credit Committee' && oldOpp.Underwriting_Approval__c !='Auto Approved Re-Price' && oldOpp.Underwriting_Approval__c !='Approved Re-price' || oldOpp.Underwriting_Approval__c != 'Approved' && oldOpp.Underwriting_Approval__c != 'Approved by Credit Committee with conditions')))){
        
            opp.StageName='Approved';
        }
        
        /*** Decline - Pending Mgmnt Review WFR ***/
        if(opp.Underwriting_Approval__c =='Declined - Pending Management Review' || 
            (opp.QC_Decision__c=='Decline-Pending Management Review' && opp.Underwriting_Approval__c == Null)){
            opp.StageName='Declined - Pending Mgmt Review';
        }
        
        /*** Pending Mgmnt Review WFR ***/
        if((opp.Underwriting_Approval__c =='Pending Management Review' && opp.Funded_by_WC__c == Null)
            && (Trigger.isInsert || 
            (Trigger.isUpdate && (!(oldOpp.Underwriting_Approval__c =='Pending Management Review' && oldOpp.Funded_by_WC__c == Null))))) {
            
            opp.StageName='Pending Management Review';
        }
        
        /*** Unqualified WFR ***/
        if(opp.Underwriting_Approval__c == 'Unqualified - Will Not Reconsider' 
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Underwriting_Approval__c != 'Unqualified - Will Not Reconsider'))){
            opp.StageName='Unqualified';
        }
        
        /*** Unqualified - will consider later WFR ***/
        if(opp.Underwriting_Approval__c =='Unqualified - Will Reconsider in the Future' || opp.Underwriting_Approval__c =='Unqualified - Comp.Pay Off too High - Reconsider Later'){
            opp.StageName='Unqualified - Will Reconsider Later';
        }
        
        /*** Funded - Closed Won WFR ***/
        if(opp.Funded_by_WC__c != Null  
             && (opp.Underwriting_Approval__c== 'Approved by Credit Committee with conditions' || opp.Underwriting_Approval__c=='Approved Re-price' ||  opp.Underwriting_Approval__c=='Approved - Pending Management Review' || opp.Underwriting_Approval__c== 'Approved' || opp.Underwriting_Approval__c=='Approved by Credit Committee' || opp.Underwriting_Approval__c=='Auto Approved' || opp.Underwriting_Approval__c=='Auto Approved Re-Price')
             && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Underwriting_Approval__c != 'Approved by Credit Committee with conditions' && oldOpp.Underwriting_Approval__c != 'Approved Re-price' && oldOpp.Underwriting_Approval__c != 'Approved - Pending Management Review' && oldOpp.Underwriting_Approval__c != 'Approved' && oldOpp.Underwriting_Approval__c != 'Approved by Credit Committee' && oldOpp.Underwriting_Approval__c != 'Auto Approved' && oldOpp.Underwriting_Approval__c != 'Auto Approved Re-Price'))) {
            
            opp.StageName= 'Closed Won' ;
        }
        
        /*if((Campaign.Name.containsIgnoreCase('Advantage Payment Processing') && 
        ((Trigger.oldMap.get(opp.Id).Description != opp.Description) || 
        (Trigger.oldMap.get(opp.Id).notes__c.Sales_Check_List_Notes__c != opp.notes__c.Sales_Check_List_Notes__c) || 
        (Trigger.oldMap.get(opp.Id).UW_Deal_Repriced_Need_New_FRSA__c != opp.UW_Deal_Repriced_Need_New_FRSA__c) || 
        (Trigger.oldMap.get(opp.Id).notes__c.Processing_Notes__c != opp.notes__c.Processing_Notes__c) || 
        (Trigger.oldMap.get(opp.Id).notes__c.Underwriting_Notes__c != opp.notes__c.Underwriting_Notes__c) || 
        (Trigger.oldMap.get(opp.Id).StageName != opp.StageName)) && (opportunity.Renewal__c != False) && 
        (opp.Underwriting_Approval__c !='Pending management review returned to u/w')){
        
        }*/
        
        /*** Uncheck Existing Competitor Advance WFR ***/
        if(opp.Paid_Off_Letter_Rec_d__c != Null && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Paid_Off_Letter_Rec_d__c == Null))){
            opp.Existing_Competitor_Advance2__c = 'No';
        }
        
        /*** Pre-Qual Decision Date Update WFR ***/
        if((opp.Pre_Qual_Decision__c != Null) && (!opp.Pre_Qual_Decision__c.contains('Pending')) 
            && (Trigger.isInsert || (Trigger.isUpdate && (!((oldOpp.Pre_Qual_Decision__c != Null) && (!oldOpp.Pre_Qual_Decision__c.contains('Pending'))))))) {
            
            opp.Pre_Qual_Decision_Date__c= system.Now();
        }
        
        /*** QC Calculate Due Dates Update WFR ***/
        if(opp.QC_Person__c != Null && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.QC_Person__c == Null))){
            opp.Calculate_Due_Dates__c= system.now();
        }
        
        /*** Auto Declined Deal WFR ***/
        if(opp.Underwriting_Approval__c == 'Auto Declined' && opp.QC_Decision__c=='Decline-Pending Management Review'){
            opp.StageName= 'Auto Decline-To Processing';
        }
        
        /*** Pre-Qual Pending Date Update WFR ***/
        if(opp.Pre_Qual_Decision__c == 'Pending Management Review' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Pre_Qual_Decision__c != 'Pending Management Review' ))){
            opp.Pre_Qual_Pending_Date__c=system.now();
        }
        
        /*** Pre Qual Update WFR ***/
        if(opp.StageName == 'Pre-Qual in Progress'){
            opp.RecordTypeId=objRecordType.get('Pre Qual Record Type').id;
        }
        
        /*** Regular Opportunity Update WFR ***/
        if(opp.StageName != 'Pre-Qual in Progress'){
            opp.RecordTypeId=objRecordType.get('New Opportunity').id;
        }
        
        /*** UCC Legal Name Update WFR ***/
        if(opp.UCC_Debtor_Legal_Name__c != opp.Legal_Name__c){
            opp.UCC_Debtor_Legal_Name__c = opp.Legal_Name__c;
        }
        
        /*** Update Renewal Number WFR ***/
        if(opp.StageName != 'Closed Won' && opp.Renewal__c){
            system.debug('-------------------------------');
            if(opp.AccountId != null){
                system.debug('>>>>>>>>>>>>>>>>'+objAccount.get(opp.AccountId).renewal_count__c);
                opp.Renewal_Number__c = objAccount.get(opp.AccountId).renewal_count__c;
            }
        }
        
        /*** PQ Data Entry Date WFR ***/
        if(opp.Pre_Qual_Person__c != Null && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Pre_Qual_Person__c == Null))){
            opp.PQ_Data_Entry_Date__c = System.Now();
        }
        
        /*** Confirmed Add'l Signer Number WFR ***/
        if((opp.Contact__r.OwnershipPercentage__c >=1) && (opp.Confirmed_Add_l_Signer_Mobile_Number__c== Null) && (opp.Confirmed_Add_l_Signer_Phone_Number__c== Null)
            && (Trigger.isInsert || (Trigger.isUpdate && (!((opp.Contact__r.OwnershipPercentage__c >=1) && 
            (oldOpp.Confirmed_Add_l_Signer_Mobile_Number__c== Null) && (oldOpp.Confirmed_Add_l_Signer_Phone_Number__c== Null)))) )){
            
            opp.Confirmed_Add_l_Signer_Phone_Number__c = 'Not Applicable';
            opp.Confirmed_Add_l_Signer_Mobile_Number__c='Not Applicable';
        }
        
        /*** Populate Initial underwriting approval WFR ***/
        if(opp.Underwriting_Approval__c != Null && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Underwriting_Approval__c == Null))){
            if(opp.Underwriting_Approval__c=='Approved'){
                opp.Initial_underwriting_approval__c='Approved';
            }
            else if(opp.Underwriting_Approval__c=='Approved by Credit Committee'){
                opp.Initial_underwriting_approval__c='Approved by Credit Committee';
            }
            else if(opp.Underwriting_Approval__c=='Approved Re-price'){
                opp.Initial_underwriting_approval__c='Approved Re-price';
            }
            else if(opp.Underwriting_Approval__c=='Approved by Credit Committee with conditions'){
                opp.Initial_underwriting_approval__c='Approved by Credit Committee with conditions';
            }
            else if(opp.Underwriting_Approval__c=='Approved - Pending Management Review'){
                opp.Initial_underwriting_approval__c='Approved - Pending Management Review';
            }
            else if(opp.Underwriting_Approval__c=='Auto Approved'){
                opp.Initial_underwriting_approval__c='Auto Approved';
            }
            else if(opp.Underwriting_Approval__c=='Auto Declined'){
                opp.Initial_underwriting_approval__c='Auto Declined';
            }
            else if(opp.Underwriting_Approval__c=='Declined'){
                opp.Initial_underwriting_approval__c=' Declined';
            }
            else if(opp.Underwriting_Approval__c=='Declined by Credit Committee'){
                opp.Initial_underwriting_approval__c=' Declined by Credit Committee';
            }
            else if(opp.Underwriting_Approval__c=='Declined - Pending Management Review'){
                opp.Initial_underwriting_approval__c=' Declined - Pending Management Review';
            }
            else if(opp.Underwriting_Approval__c=='Pending'){
                opp.Initial_underwriting_approval__c=' Pending';
            }
            else if(opp.Underwriting_Approval__c=='Pending management review returned to u/w'){
                opp.Initial_underwriting_approval__c=' Pending management review returned to u/w';
            }
            else if(opp.Underwriting_Approval__c=='Rescinded by merchant'){
                opp.Initial_underwriting_approval__c=' Rescinded by merchant';
            }
            else if(opp.Underwriting_Approval__c=='Rescinded by Processing'){
                opp.Initial_underwriting_approval__c=' Rescinded by Processing';
            }
            else if(opp.Underwriting_Approval__c=='Rescinded by RapidAdvance'){
                opp.Initial_underwriting_approval__c=' Rescinded by RapidAdvance';
            }
            else if(opp.Underwriting_Approval__c=='Rescinded by Underwriting'){
                opp.Initial_underwriting_approval__c=' Rescinded by Underwriting';
            }
            else if(opp.Underwriting_Approval__c=='Scheduled for credit committee'){
                opp.Initial_underwriting_approval__c=' Scheduled for credit committee';
            }
            else if(opp.Underwriting_Approval__c=='Unqualified - Comp.Pay Off too High - Reconsider Later'){
                opp.Initial_underwriting_approval__c=' Unqualified - Comp.Pay Off too High - Reconsider Later';
            }
            else if(opp.Underwriting_Approval__c=='Unqualified - Will Not Reconsider'){
                opp.Initial_underwriting_approval__c=' Unqualified - Will Not Reconsider';
            }
            else if(opp.Underwriting_Approval__c=='Unqualified - Will Reconsider in the Future'){
                opp.Initial_underwriting_approval__c=' Unqualified - Will Reconsider in the Future';
            }
            else{
                opp.Initial_underwriting_approval__c = 'error';
            }                       
        }
        
        
        /*** Update Status To QC_InProgress WFR ***/
        if (Trigger.isUpdate && (Trigger.oldMap.get(opp.Id).QC_Person__c != '') && (Trigger.oldMap.get(opp.Id).QC_Person__c != opp.QC_Person__c) ){
            opp.Status__c= 'QC in Progress';
        }
        
        /*** Update Status To Process Contract Rule 8 WFR ***/
        if((opp.Status__c == 'Contract Available')&&(opp.Signed_Contract_Received__c != Null ) 
            && (Trigger.isInsert || (Trigger.isUpdate && (!((oldOpp.Status__c == 'Contract Available')&&(oldOpp.Signed_Contract_Received__c != Null ) ))))){
            
            opp.Status__c = 'Processing';
        }
        
        /***  Update Status To File In Review Rule 3 WFR ***/
        if (Trigger.isUpdate && (Trigger.oldMap.get(opp.Id).Data_Entry_Date__c != opp.Data_Entry_Date__c) && (Trigger.oldMap.get(opp.Id).Data_Entry_Date__c == Null) && (opp.Status__c== 'QC In Progress')){
            opp.Status__c= 'File Review';
        }
        
        /*** Update Status To Qualified Offer Rule 4a ***/
        if((opp.Status__c=='File Review') &&((opp.Underwriting_Approval__c=='Approved') || (opp.Underwriting_Approval__c == 'Approved by Credit Committee') || (opp.Underwriting_Approval__c=='Approved by Credit Committee with conditions'))) {
            opp.status__c='Qualified Offer';
        }
        
        /*** Update Status To No Offer Available Rule 4b WFR ***/
        if ((opp.Status__c=='File Review') && ((opp.Underwriting_Approval__c=='Declined') || (opp.Underwriting_Approval__c=='Declined by Credit Committee') || (opp.Underwriting_Approval__c=='Unqualified - Comp.Pay Off too High - Reconsider Later')|| (opp.Underwriting_Approval__c=='Unqualified - Will Not Reconsider') || (opp.Underwriting_Approval__c=='Unqualified - Will Reconsider in the Future') || (opp.Underwriting_Approval__c=='Rescinded by merchant') || (opp.Underwriting_Approval__c=='Rescinded by Processing') || (opp.Underwriting_Approval__c=='Rescinded by RapidAdvance') || (opp.Underwriting_Approval__c=='Rescinded by Underwriting'))){
            opp.Status__c= 'No Offer Available';
        }
        
        /*** Update Status To Submitted For Funding Approval Rule 9 WFR ***/ 
        if(opp.Status__c=='Processing' && opp.Processing_Rep_Assigned__c != null && opp.Product__c !=''){
            opp.Status__c = 'Funding In Progress';
        }  
        
        /*** Update Status To Closed Rule 10 WFR ***/
        if((opp.Status__c=='Funding In Progress') &&(opp.StageName=='Closed Won')){
            opp.Status__c='Closed - Funded';
        }
        
        /*** Processor Assigned DateStamp WFR ***/
        if(Trigger.isUpdate && (Trigger.oldMap.get(opp.Id).Processing_Representative__c != opp.Processing_Representative__c) &&(opp.Processing_Representative__c != Null)){
            opp.Processing_Rep_Assigned__c = System.Now();
        }
        
        /*** Submit to SA Stamp WFR ***/
        if(opp.StageName=='Submitted Deal' && opp.Submit_to_Sales_Assistant__c !=Null && (Trigger.isInsert 
        || ( Trigger.isUpdate && (!(oldOpp.StageName=='Submitted Deal' && oldOpp.Submit_to_Sales_Assistant__c !=Null)) ))){
            opp.Submit_to_Sales_Assistant__c= System.Now();
        }
        
        
        
        
        /*if(opp.Processor_Name__c=='Power Pay'){
            Visa__c.opp.Visa/MC/Debit__c ='True';
            update Visa__c;
        } 
        
        if(opp.New_FRSA_Has_Been_Received__c !=Null){
            opp.Amount = Underwriting__r.opp.New_Advance_Price__c;
        }
        
        if(opp.New_FRSA_Has_Been_Received__c !=Null){
            opp.Percent_Payback__c= Underwriting__r.opp.New_Percent_Payback__c;
        }UW_New_Percent_Payback__c
        
        if(opp.New_FRSA_Has_Been_Received__c != Null){
            opp.Pay_Back_Amount__c = Underwriting__r.opp.New_Payback_Price__c;
        }*/
      
        /*** Stage Change to Closed Won WFR ***/
        if(opp.Funded_by_WC__c != Null && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Funded_by_WC__c == Null))){
            opp.StageName='Closed Won';
        }
        
        /*if(opp.Submit_to_Sales_Assistant__c != Null && opp.X3_Minute_Application__c &&
         opp.Legible_4_months_processing_statements__c && opp.Bank_Statements__c && opp.Voided_Check_Received__c && 
         opp.Calculator__c && opp.MRA_3_Minute_are_complete__c && !opp.Renewal__c && 
            opp.Legible_Photo_Identification_Received__c && opp.Submit_to_UW_Processing__c==Null ){
            opp.StageName='Submitted Deal';
        }*/
        
        /*** Auto Declined WFR ***/
        if(opp.Underwriting_Approval__c=='Auto Declined'){
            opp.StageName='Auto Decline-To Processing';
        }
        
        /*** Rescinded By RA ***/
        if(opp.Underwriting_Approval__c=='Rescinded by Processing' || opp.Underwriting_Approval__c=='Rescinded by Underwriting' || opp.Underwriting_Approval__c=='Rescinded by RapidAdvance' ){
            opp.StageName='Rescinded by RapidAdvance';
        }
        
        /*** Rescinded By Merchant WFR ***/
        if(opp.Underwriting_Approval__c=='Rescinded by merchant'){
            opp.StageName='Signed Contract Rescinded by Merchant';
        }
        
        /*** Apvd Pending to Approved WFR ***/ 
        if(opp.Underwriting_Approval__c=='Approved' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Underwriting_Approval__c != 'Approved'))){
            opp.StageName='Approved';
        }
        
        /*** Deal Defaulted - Renewal Eligibility Rule WFR ***/
        /*if(opp.Deal_Defaulted__c){
            opp.Renewal_Eligibility__c='Ineligible';
        }*/
        
        /*** Opportunity Level Update 1 WFR ***/
        if(opp.StageName=='NO Contact Made' || opp.StageName=='Prospecting' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'NO Contact Made' && oldOpp.StageName != 'Prospecting'))){
            opp.Opportunity_Level__c=' 1 - Actively Working Opportunity';
        }
        
        /*** Opportunity Level Update 2 WFR ***/
        if(opp.StageName=='Contact Made - Follow Up' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Contact Made - Follow Up'))){
            opp.Opportunity_Level__c=' 2 - Needs Additional Follow Up';
        }
        
        /*** Opportunity Level Update 3 WFR ***/
        if(opp.StageName=='A - Awaiting CC Statements' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'A - Awaiting CC Statements'))){
            opp.Opportunity_Level__c=' 3 - Merchant Sending CC Statements';
        }
        
        /*** Opportunity Level Update 2a WFR ***/
        if(opp.StageName=='Pre-Qual in Progress' 
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Pre-Qual in Progress'))){
            opp.Opportunity_Level__c=' 2a - Pre-Qual in Progress';
        }
        
        /*** Opportunity Level Update 4 ***/
        if(opp.StageName == 'Statements Rec\'d Follow Up'
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Statements Rec\'d Follow Up'))){
            opp.Opportunity_Level__c='4 - AE Preparing Quote';
        }
        
        /*** Opportunity Level Update 5 WFR ***/
        if(opp.StageName=='B - Quote Submitted' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'B - Quote Submitted'))){
            opp.Opportunity_Level__c=' 5 - Submitted Quote to Merchant';
        }
        
        /*** Opportunity Level Update 6 WFR ***/
        if(opp.StageName=='C - Offer Accepted - Awaiting Compl Apps' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'C - Offer Accepted - Awaiting Compl Apps'))){
            opp.Opportunity_Level__c='6 - Verbal Acceptance, Need Additional Docs';
        }
        
        /*** Opportunity Level Update 7 WFR ***/
        if(opp.StageName=='C-1 Contract Signed - More Info Needed' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'C-1 Contract Signed - More Info Needed'))){
            opp.Opportunity_Level__c='7 - Rec\'d Signed Contract, Still Need Additional Docs';
        }
        
        /*** Opportunity Level Update 10  WFR ***/
        if(opp.StageName =='Declined - Pending Mgmt Review' || opp.StageName =='Declined' || opp.StageName =='Auto Decline-To Processing' 
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Declined - Pending Mgmt Review' && oldOpp.StageName != 'Declined' 
            && oldOpp.StageName != 'Auto Decline-To Processing'))){
            
            opp.Opportunity_Level__c='10 - Deal is Declined';
        }
        
        /*** Opportunity Level Update 8 WFR ***/
        if(opp.StageName=='Submitted Deal' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Submitted Deal'))){
            opp.Opportunity_Level__c='8 - All Docs Recieved from AE, Submitted to SA for Verification';
             
        }
        
        /*** Opportunity Level Update 9 WFR ***/
        if(opp.StageName =='Auto Approve-To Processing' || opp.StageName =='Forwarded To Processing' || opp.StageName =='Approved - Pending Mgmnt Signature' ||opp.StageName =='Approved'
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Auto Approve-To Processing' 
            && oldOpp.StageName != 'Forwarded To Processing' && oldOpp.StageName != 'Approved - Pending Mgmnt Signature' && oldOpp.StageName !='Approved'))){
            
            opp.Opportunity_Level__c='9 - Deal is Approved';
        }
        
        /*** Opportunity Level Update 10a ***/
        if(opp.StageName =='Closed Lost' || opp.StageName =='Unqualified' ||opp.StageName =='Do Not Call'
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Closed Lost'
            && oldOpp.StageName != 'Unqualified' && oldOpp.StageName != 'Do Not Call'))){
            opp.Opportunity_Level__c='10a - Deal is Unqualified - No Chance of Future Business';
        }
        
        /*** Opportunity Level Update 11 ***/
        if (opp.StageName=='Language Barrier' || opp.StageName=='Not Interested' ||opp.StageName=='Rescinded by RapidAdvance' || opp.StageName=='Signed Contract Rescinded by Merchant' || opp.StageName=='Unqualified - Will Reconsider Later' ||opp.StageName=='Incomplete Contact or Company Info' 
        && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName != 'Language Barrier' 
        && oldOpp.StageName != 'Not Interested' && oldOpp.StageName != 'Rescinded by RapidAdvance' && oldOpp.StageName != 'Signed Contract Rescinded by Merchant' && oldOpp.StageName != 'Unqualified - Will Reconsider Later' && oldOpp.StageName != 'Incomplete Contact or Company Info' )) ){
        
            opp.Opportunity_Level__c='11 - Deal May be Eligible for Future Business';
             
        }
        
         /*** Submitted Deal Stage Update Update WFR ***/
        if(opp.Submit_to_Sales_Assistant__c != null && opp.X3_Minute_Application__c == true && opp.Legible_4_months_processing_statements__c == true
            &&  opp.Voided_Check_Received__c == true && opp.Calculator__c == true && opp.MRA_3_Minute_are_complete__c == true
            && opp.Renewal__c == true && opp.Legible_Photo_Identification_Received__c == true && opp.Submit_to_UW_Processing__c == null
            && (Trigger.isInsert || !(Trigger.isUpdate && (opp.Submit_to_Sales_Assistant__c != null && opp.X3_Minute_Application__c == true && opp.Legible_4_months_processing_statements__c == true
            &&  opp.Voided_Check_Received__c == true && opp.Calculator__c == true && opp.MRA_3_Minute_are_complete__c == true
            && opp.Renewal__c == true && opp.Legible_Photo_Identification_Received__c == true && opp.Submit_to_UW_Processing__c == null))))
        {
                opp.StageName = 'Submitted Deal';
        }
        
        /*** Submitted Deal (Renewal) Stage Update WFR ***/        
        if(opp.Submit_to_Sales_Assistant__c != null && opp.X3_Minute_Application__c == true 
            && opp.MRA_3_Minute_are_complete__c== true && opp.Calculator__c == true 
            && opp.Submit_to_UW_Processing__c == null && (Trigger.isInsert || (Trigger.isUpdate 
            && (oldOpp.Submit_to_Sales_Assistant__c == null || oldOpp.X3_Minute_Application__c == false
            || oldOpp.MRA_3_Minute_are_complete__c == false || oldOpp.Calculator__c == false 
            || oldOpp.Submit_to_UW_Processing__c != null)))) {
        
            opp.StageName = 'Submitted Deal';    
        }
        
        /*** Pre-Qual Initial Submission WFR ***/
        if(opp.StageName=='Pre-Qual in Progress'
            && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.StageName !='Pre-Qual in Progress'))){
            
            opp.Type='Pre-Qualification New';
            opp.Approval_Process_Entry_Time__c = system.Now();
        }
        
        /*** Pre-Qual Initial Submission Renewal WFR ***/
        if(opp.StageName=='Pre-Qual in Progress' && opp.Renewal__c && (Trigger.isInsert || (Trigger.isUpdate && (!(oldOpp.StageName=='Pre-Qual in Progress' && oldOpp.Renewal__c))))){
            opp.Type='Pre-Qualification Renewal';
             
        }

        /*if(opp.Submit_to_Sales_Assistant__c != Null && opp.X3_Minute_Application__c && 
        opp.MRA_3_Minute_are_complete__c && opp.Calculator__c && opp.Submit_to_UW_Processing__c == Null){
            opp.StageName= 'Submitted Deal';
        }*/
        
        /* UW Assignment DTS WFR -start */
        if(Trigger.isInsert 
             && (( opp.Underwriter_Assigned__c == 'AUTO DECISION')
             || (opp.Underwriter_Assigned__c != null))){
            opp.UW_Assigned_Date_Stamp__c = Datetime.now();      
        }
        
        if(Trigger.isUpdate
            && (( 
                 (opp.Underwriter_Assigned__c == 'AUTO DECISION'))
            || (Trigger.oldMap.get(opp.Id).Underwriter_Assigned__c == null && opp.Underwriter_Assigned__c != null))){
           
            opp.UW_Assigned_Date_Stamp__c = Datetime.now();    
        }
        /* UW Assignment DTS WFR -end */
        
        /* Calculate Percent Paid Off WFR -start */
        System.debug('Ajay >> ');
        if(opp.Total_Repay_Amount__c != null && opp.Purchase_Amount__c != null && opp.Purchase_Amount__c > 0) {
            System.debug('Ajay >> ');
            opp.Percent_Paid_Off__c = (opp.Total_Repay_Amount__c/ opp.Purchase_Amount__c);
        }
        /* Calculate Percent Paid Off WFR -end */  
        
        /*** for the WFR  "Initial File Review" while updating the opportunity ***/
        if(Trigger.isUpdate && (opp.Initial_File_Review_Complete__c != Trigger.oldMap.get(opp.Id).Initial_File_Review_Complete__c) && opp.Initial_File_Review_Complete__c == TRUE){
            // Commented for Production
            opp.Initial_File_Review2__c = System.NOW();            
        }
        
        /*** Eligible for Rapid Funding Number WFR ***/
        /*if(opp.Eligible_for_Rapid_Funding__c =='Yes' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.Eligible_for_Rapid_Funding__c != 'Yes'))){
            List<User> userListRoles = new List<User>(); 
            userListRoles = [SELECT Id,Email FROM User WHERE UserRoleId IN (Select Id from UserRole where Name='Processors') and IsActive = true];       
            List<User> userListsingle = [SELECT Id,Email FROM User WHERE IsActive = true and Username = 'mcerminaro@rapidadvance.com.redesign' Limit 1];
            if(userListsingle != null && !userListsingle.isEmpty())
            {                
                userListRoles.add(userListsingle.get(0));
            }
            String[] toaddress = new String[]{};
            for(User user: userListRoles){
                if(user.Email != null && !user.Email.trim().equals('')){                                    
                    toaddress.add(user.Email);                                         
                }
            }           

            System.debug('userListRoles...'+userListRoles.size());
            if(userListRoles != null && !userListRoles.isEmpty()){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(toaddress); 
                //mail.setReplyTo('services@rapidadvance.com');
                //mail.setSenderDisplayName('Rapid Financial Services');
                mail.setBccSender(false);                          
                mail.setSubject(opp.Name+' is Eligible for Rapid Funding');                          
                mail.setPlainTextBody(opp.Name+' is Eligible for Rapid Funding' + '\nOppId: ' +opp.Opportunity_Number__c);
                mailingList.add(mail);
            }
        }*/
        
        /*** Alexandra Approval With Conditions WFR AND Umaru All Approved Conditions WFR ***/
        if((opp.Processing_Representative__c=='Alexandra' || opp.Processing_Representative__c=='Umaru') && opp.All_Approved_With_Conditions_Met__c && 
            (Trigger.isInsert || (Trigger.isUpdate && !((oldOpp.Processing_Representative__c == 'Alexandra' || oldOpp.Processing_Representative__c == 'Umaru') && oldOpp.All_Approved_With_Conditions_Met__c)))){
            List<User> userList;    
            if(opp.Processing_Representative__c=='Alexandra'){
                userList = [SELECT Id,Email FROM User WHERE IsActive = true and userName = 'apompee@rapidadvance.com.redesign' ];
            }
            else if(opp.Processing_Representative__c=='Umaru'){
                 userList = [SELECT Id,Email FROM User WHERE IsActive = true and userName = 'umansarnay@rapidadvance.com.redesign' ];
            }            
            
            if(userList != null && !userList.isEmpty()){
                String emailSubject = opp.Name + ' - ' + opp.Opportunity_Number__c + ' All approval conditions have been satisfied.';
                String emailBody = '';
                String[] toaddress = new String[]{};                
                if(userList.get(0) != null && userList.get(0).Email != null && !userList.get(0).Email.trim().equals('')){                                   
                    toaddress.add(userList.get(0).Email);                    
                }
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(toaddress);
                mail.setsubject(emailSubject);
                mail.setBccSender(false);
                mail.setPlainTextBody(emailBody);
                mailingList.add(mail);
             //   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });             
            }
        }
        
        try {
            if(!mailingList.isEmpty()) {
                Messaging.sendEmail(mailingList);
            }
        } catch(Exception e) {
            System.debug('Error ::' + e.getMessage());
        }
        
        /*** Update Partner Emails WFR ***/
        list<Campaign> objCampaigns = [SELECT Update_Partner_Email_1__c, Update_Partner_Email_2__c, Update_Partner_Email_3__c,
                                        Update_Partner_Email_4__c, Update_Partner_Email_5__c, Update_Partner_Email_6__c
                                        FROM Campaign WHERE Id=: opp.CampaignId LIMIT 1];
        Campaign objCampaign;
        if(objCampaigns != null && !objCampaigns.isEmpty()){                        
            objCampaign = objCampaigns.get(0);
        }       
        if(objCampaign != null){            
            if(objCampaign.Update_Partner_Email_1__c != null){
                opp.Partner_Email_1__c = objCampaign.Update_Partner_Email_1__c;
            }
            if(objCampaign.Update_Partner_Email_2__c != null){
                opp.Partner_Email_2__c = objCampaign.Update_Partner_Email_2__c;
            }
            if(objCampaign.Update_Partner_Email_3__c != null){
                opp.Partner_Email_3__c = objCampaign.Update_Partner_Email_3__c;
            }
            if(objCampaign.Update_Partner_Email_4__c != null){
                opp.Partner_Email_4__c = objCampaign.Update_Partner_Email_4__c;
            }
            if(objCampaign.Update_Partner_Email_5__c != null){
                opp.Partner_Email_5__c = objCampaign.Update_Partner_Email_5__c;
            }
            if(objCampaign.Update_Partner_Email_6__c != null){
                opp.Partner_Email_6__c = objCampaign.Update_Partner_Email_6__c;
            }
        }    
    }
    
    private map<String,recordType> objRecordType{    
        get{            
            if(objRecordType == null){
                objRecordType = new map<String,recordType>();
                for(recordType rt:[SELECT Id,Name From RecordType Where sobjectType='Opportunity']){
                    objRecordType.put(rt.Name,rt);    
                }
            }
            return objRecordType;
        }private set;
    }
    
    private map<Id,Account> objAccount{
        get{
            if(objAccount == null){
                objAccount = new map<id,Account>([SELECT renewal_count__c FROM Account WHERE Id IN:getAccountIds()]);
            }
            return objAccount;
        }private set;
    }
    
    private set<Id> getAccountIds(){
        set<Id> accountIds = new set<Id>();
        for(Opportunity op:Trigger.new){
            accountIds.add(op.accountId);
        }
        return accountIds;
    }
}