trigger CalcualtePercentPaidOffTrigger on Opportunity (before insert, before update) {
     
     for(Opportunity opp: Trigger.new){
         Opportunity oldOpp;
         if(Trigger.isUpdate) {
            oldOpp =  Trigger.oldMap.get(opp.Id);   
         }
         if(opp.Total_Repay_Amount__c != null && opp.Purchase_Amount__c != null && opp.Purchase_Amount__c > 0) {
            opp.Percent_Paid_Off__c = (opp.Total_Repay_Amount__c/ opp.Purchase_Amount__c);
         }
         
      
     }
     
}