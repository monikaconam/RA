@isTest
private class Five9ScreenPopController_Test 
{
	
	@isTest 
	static void test_saveAndRedirect() 
	{
		String objprefix = '00Q';
		ApexPages.currentPage().getParameters().put('Direct','1');
        Five9ScreenPopController controller = new Five9ScreenPopController();
        PageReference pr = controller.saveAndRedirect();
        String destinationURL = pr.getUrl();
        System.debug(destinationURL);
        System.assert(destinationURL.startsWith('/00Q/e'));

 		Campaign c = new Campaign(Name='Test Campaign');
 		c.Five9_DNIS__c = '8888888888';
 		insert c;
 		System.debug(c.Five9_DNIS__c);
        ApexPages.currentPage().getParameters().put('Direct','0');
        ApexPages.currentPage().getParameters().put('ANI','6666666666');
        ApexPages.currentPage().getParameters().put('DNIS','8888888888');
        controller = new Five9ScreenPopController();
        PageReference pr2 = controller.saveAndRedirect();
        destinationURL = pr2.getUrl();
        System.assert(destinationURL.startsWith('/'+controller.l.Id+'/e'));

		 ApexPages.currentPage().getParameters().put('Direct','somethign');
		 controller = new Five9ScreenPopController();


	}
	
}