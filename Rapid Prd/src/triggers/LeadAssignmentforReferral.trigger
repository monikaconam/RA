trigger LeadAssignmentforReferral on Lead (before insert)
{
    Set<id> Referrers = new Set<id>();
   
    for (Lead ld : Trigger.new)
    {
       if (ld.Referral_Merchant_Id__c != null)
           Referrers.add(ld.Referral_Merchant_Id__c);
    }

    if(Referrers.size() > 0)
    {
    
        Map<id, Account> ReferrerOwnerMapAc = new Map<id, Account>([SELECT OwnerId from Account WHERE Id in :Referrers]); 
        Map<id, Lead> ReferrerOwnerMapLd = new Map<id, Lead>([SELECT OwnerId from Lead WHERE Id in :Referrers]); 
        
        for (Lead ld2: Trigger.new)
        {
              if (ld2.Referral_Merchant_Id__c != null)   
              {
                 if (Referrers.contains(ld2.Referral_Merchant_Id__c))
                 {    
                      // get owner from Account Map
                      if(ReferrerOwnerMapAc.containskey(ld2.Referral_Merchant_Id__c))
                      {
                          ld2.OwnerId = ReferrerOwnerMapAc.get(ld2.Referral_Merchant_Id__c).OwnerId;
                      }
                      // get owner from Lead Map                      
                      if(ReferrerOwnerMapLd.containskey(ld2.Referral_Merchant_Id__c))
                      {
                          ld2.OwnerId = ReferrerOwnerMapLd.get(ld2.Referral_Merchant_Id__c).OwnerId;
                      }                   
                 }
              }
        }
    }
}