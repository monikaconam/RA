/*
@Name            : AccountTriggerHandler
@Author          : MKConam
@Date            : July 28, 2015
@Description     : 
@Revision History: 
*/

public with sharing class AccountTriggerHandler
{
    public static void aUPartnerAccountCALC(List<Account> listAcc)
    {   
       helperMethod(listAcc);
    }
     
    public static void aIPartnerAccountCALC(List<Account> listAcc)
    {
       helperMethod(listAcc);
    }
     
    private static void helperMethod(List<Account> listAcc)
    {
        List<RecordType> rID=[select 
                                    Id
                                FROM 
                                    RecordType 
                                WHERE
                                    sObjectType='Account' 
                                AND
                                    DeveloperName='Partners' LIMIT 1]; 
        for(Account aTemp : listAcc)
        {   
            String accountId = String.valueOf(aTemp.Id);
            if (accountId != null && aTemp.RecordTypeId == rID.get(0).Id) 
            {
                try
                {
                    if(!System.isFuture() && !System.isBatch())    //added line on 8/3/2018
                        CALC.partnerAccountRequest(accountId);
                }
                catch(Exception ex)
                {
                    aTemp.addError('An Exception has Occured ...'+ '' + ex.getMessage() + '' + ex.getLineNumber());
                }
            }
        }
    }   
}