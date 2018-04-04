trigger PartnerAccountCALC on Account (after insert, after update) 
{  
  for(Account a: Trigger.new)
  {   
      String accountId = String.valueOf(a.Id);
    if (accountId != null && a.RecordTypeId == '0125000000099OTAAY') 
    {
      CALC.PartnerAccountRequest(accountId);
    }
  }   
}