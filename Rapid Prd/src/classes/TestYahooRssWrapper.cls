@isTest

private class TestYahooRssWrapper
{
    static testMethod void RSSTest1() 
    {
        Test.startTest();
        YahooRssWrapper.channel chan = YahooRssWrapper.getRSSData('test');
        Date pDate = chan.items[0].getPublishedDate();
        DateTime pDateTime = chan.items[0].getPublishedDateTime();
        Test.stopTest();
    }
}