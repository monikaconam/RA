@istest
public class TestCheckRecursive {

    static testMethod void unitTest()
    {
        Test.startTest();
        CheckRecursive.runOnce();
        CheckRecursive.runOnce();
        Test.stopTest();
    }
}