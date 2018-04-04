public with sharing class SiteSurveys_Ctrl {

	public Site_Survey__c objSiteSurvey {get;set;}
	String oppId;

	public SiteSurveys_Ctrl(ApexPages.StandardController stdController)
	{
		oppId = '';
		String siteSurveyId = ApexPages.currentPage().getParameters().get('Id');
		try {
			if (siteSurveyId != null && siteSurveyId.trim() != '')
			{
				List <Site_Survey__c> siteSurveyList = (List <Site_Survey__c>) Database.Query(genDynamicQuery(siteSurveyId));

				if (siteSurveyList != null && !siteSurveyList.isEmpty())
				{
					objSiteSurvey = siteSurveyList.get(0);
					oppId = objSiteSurvey.Opportunity__c;
				} 
				else
				{
					ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid Customer Survey Id'));
					objSiteSurvey = new Site_Survey__c();
					/*objMerchant.Opportunity__c = OppId;*/
				}
			} 
			else
			{
				objSiteSurvey = new Site_Survey__c();
				String returnURL = ApexPages.currentPage().getParameters().get('retURL');

				Integer startIndex = returnURL.indexOf('oppId=');
                System.debug('startIndex' +startIndex);
				if (startIndex == -1)
				{
					oppId = returnURL.subString(1, returnURL.length());
				}
				else
				{
                    System.debug('returnURL.indexOf' +returnURL.indexOf('&'));
					Integer nextParam = returnURL.indexOf('&', startindex);
                     System.debug('nextParam' +nextParam);
					if (nextParam == -1) {
						oppId = returnURL.subString(startIndex + 'oppId='.length()).trim();

					} else {
						oppId = returnURL.subString(startIndex + 'oppId='.length(), nextparam).trim();
					}
					/*objMerchant.Opportunity__c = OppId;
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Opportunity Id Does not Exist!'));*/
				}

				if (oppId != null && oppId.trim() != '' && oppId.startsWith('006') &&
					(oppId.length() == 15 || oppId.length() == 18))
				{
					objSiteSurvey.Opportunity__c = oppId;
				}
			}
		} 
		catch (Exception e) 
		{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
		}
	}

	public String genDynamicQuery(String sitesurveyId) {
		if (sitesurveyId != null) {
			String fieldSets = '';
			for (SObjectField field: Site_Survey__c.SObjectType.getDescribe().fields.getMap().values())
			{
				fieldSets = fieldSets + field.getDescribe().getName() + ',';
			}

			if (fieldSets.length() > 0)
			{
				fieldSets = fieldSets.subString(0, fieldSets.length() - 1);
				String dynamicQuery = 'SELECT ' + fieldSets + ' FROM Site_Survey__c WHERE Id=:sitesurveyId';
				return dynamicQuery;
			}
		}
		return null;
	}

	public PageReference cancel() {
		PageReference oppPage = new PageReference('/apex/siteSurveysRelatedList?Id=' + oppId + '&oppId=' + oppId);
		return oppPage;
	}

	public PageReference save() {
		try 
		{
			upsert objSiteSurvey;
			PageReference oppPage = new PageReference('/apex/siteSurveysRelatedList?Id=' + objSiteSurvey.Opportunity__c + '&oppId=' + objSiteSurvey.Opportunity__c);
			return oppPage;
			//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm,'Saved Successfully!'));
		} catch (DMLException e) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getDMLMessage(0)));
		} catch (Exception e) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
		}
		return null;
	}

}