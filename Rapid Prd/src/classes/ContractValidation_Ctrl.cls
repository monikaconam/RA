public with sharing class ContractValidation_Ctrl {

	public Opportunity oppRecord {get;set;}
	/*
	commentted out DS-Conam 08-03-2015 as not being used
	public List <OpportunityContactRole> oppRoleList {get;set;}
	*/
	public ContractValidation_Ctrl() 
	{
		String oppId = ApexPages.currentPage().getParameters().get('Id');

		if (oppId != null && oppId.trim() != '') 
		{
			List <Opportunity> oppList = [SELECT 
													Id, Account.BillingCountry, Account.BillingState, Account.Legal_Name__c, 
													Type_of_Entity__c, Amount, Percent_Payback__c, Product__c, Pay_Back_Amount__c, ContactID__c, 
													AccountId
											FROM 
													Opportunity 
											WHERE 
													Id = : oppId LIMIT 1];
													
													
			/*
            oppRoleList =[SELECT Id, Role, OpportunityId, IsPrimary, ContactId FROM OpportunityContactRole WHERE 
                                                            OpportunityId =:oppId and Contact.IsDeleted=false];
  			*/  
			if (!oppList.isEmpty())
			{
				oppRecord = oppList.get(0);
			}
		} 
		else
		{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity Id Does not Exist!'));
		}
	}

	public PageReference doSave() 
	{
		try
		{
			upsert oppRecord;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm, 'Contract Validation Information Saved Successfully!'));
		} 
		catch (Exception e)
		{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
		}
		return null;
	}
}