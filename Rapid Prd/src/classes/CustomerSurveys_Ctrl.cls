public with sharing class CustomerSurveys_Ctrl {

	public Customer_Survey__c objCstSurvey {get;set;}
	String oppId;

	public CustomerSurveys_Ctrl(ApexPages.StandardController stdController)
	{
		oppId = '';
		String customersurveyId = ApexPages.CurrentPage().getParameters().get('Id');

		if (customersurveyId != null && customersurveyId.trim() != '') 
		{
			List <Customer_Survey__c> customSurveyList = (List <Customer_Survey__c> ) Database.Query(genDynamicQuery(customersurveyId));

			if (customSurveyList != null && !customSurveyList.isEmpty()) 
			{
				objCstSurvey = customSurveyList.get(0);
				oppId = objCstSurvey.opportunity__c;
			} 
			else 
			{
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid Customer Survey Id'));
				objCstSurvey = new Customer_Survey__c();
				/*objMerchant.Opportunity__c = OppId;*/
			}
		} 
		else
		{
			objCstSurvey = new Customer_Survey__c();
			String returnURL = ApexPages.CurrentPage().getParameters().get('retURL');

			if (returnURL != null && returnURL.trim() != '') 
			{
				Integer startIndex = returnURL.indexOf('oppId=');

				if (startIndex == -1) 
				{
					oppId = returnURL.subString(1, returnURL.length());
				} 
				else
				{
					Integer nextParam = returnURL.indexOf('&', startIndex);
					if (nextParam == -1) 
					{
						oppId = returnURL.subString(startIndex + 'oppId='.length());

					}
					else
					{
						oppId = returnURL.subString(startIndex + 'oppId='.length(), nextParam);
					}
				}
			}
			if (oppId != null && oppId.trim() != '' && oppId.startsWith('006') && 
				(oppId.length() == 15 || oppId.length() == 18)) 
			{
				objCstSurvey.Opportunity__c = oppId;
			}
			/*objMerchant.Opportunity__c = OppId;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));*/
		}
	}
	/*
	commentted out DS-Conam 08-04-2015
	
	public String genDynamicQuery(String customersurveyId) 
	{
		if (customersurveyId != null) {
			String fieldSets = '';
			for (SObjectField field: Customer_Survey__c.SObjectType.getDescribe().fields.getMap().values()) {
				fieldSets = fieldSets + field.getDescribe().getName() + ',';
			}

			if (fieldSets.length()> 0) 
			{
				fieldSets = fieldSets.subString(0, fieldSets.length() - 1);
				String dynamicQuery = 'SELECT ' + fieldSets + ' FROM Customer_Survey__c WHERE Id=:customersurveyId';
				return dynamicQuery;
			}
		}
		return null;
	}
	*/
	
	public String genDynamicQuery(String customersurveyId) 
	{
		String dynamicQuery =null;
		if (customersurveyId != null) {
			String fieldSets = '';
			for (SObjectField field: Customer_Survey__c.SObjectType.getDescribe().fields.getMap().values()) 
			{
				fieldSets = fieldSets + field.getDescribe().getName() + ',';
			}

			if (fieldSets.length()> 0) 
			{
				fieldSets = fieldSets.subString(0, fieldSets.length() - 1);
				dynamicQuery = 'SELECT ' + fieldSets + ' FROM Customer_Survey__c WHERE Id=:customersurveyId';
			}
		}
		return dynamicQuery;
	}

	public PageReference cancel() 
	{
		PageReference oppPage = new PageReference('/apex/customerSurveyRelatedList?Id=' + oppId + '&oppId=' + oppId);
		return oppPage;
	}

	public PageReference save() 
	{
		try 
		{
			upsert objCstSurvey;
			PageReference oppPage = new PageReference('/apex/customerSurveyRelatedList?Id=' + objCstSurvey.Opportunity__c + '&oppId=' + objCstSurvey.Opportunity__c);
			return oppPage;
			//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Saved Successfully!'));
		} catch (Exception e) 
		{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
		}
		return null;
	}

}