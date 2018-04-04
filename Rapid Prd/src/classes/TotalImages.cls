/*

extension for AllAttachments_viewedList.page
*/
public with sharing class TotalImages {
	public String totalImage {get;set;}
	public String TotalViewedImages {get;set;}
	Integer TotalLeftImages;

	public TotalImages(ApexPages.StandardController controller) {
		List <Attachment> att = [Select
											id
									from
											Attachment 
									where
											ParentId = : ApexPages.currentPage().getParameters().get('id')];
		List <Site_Survey__c> stSurvey = [Select
													Viewing_Status__c
											From
													Site_Survey__c
											where
													id = : ApexPages.currentPage().getParameters().get('id')];
		String viewedImg;

		if ((att.size()> 0) && (stSurvey.size()> 0))
		{
			for (Site_Survey__c stemp: stSurvey)
			{
				if (stemp.Viewing_Status__c != null && stemp.Viewing_Status__c.trim() != '')
				{
					viewedImg = stemp.Viewing_Status__c;
					List <String> ls = viewedImg.split(',');
					TotalLeftImages = (ls.size());
					TotalLeftImages = [SELECT
												Count()
										FROM
												Attachment
										WHERE
												Id IN: ls];
				} 
				else
				{
					TotalLeftImages = 0;
				}
			}
			totalImage = String.valueOf(att.size());
			system.debug('TotalLeftImages....' + TotalLeftImages);
			totalViewedImages = (String.valueof(TotalLeftImages));
		} 
		else
		{
			totalViewedImages = '0';
			totalImage = '0';
		}
	}
}