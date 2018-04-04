/*
@Name               : BOOPTriggerHandler
@Author             : DS-Conam
@Date               : 5 March 2018
@Description        : Calling BOOPTriggerHelper to Calculate submission count on Boop
*/
public class BOOPTriggerHandler
{
    public static void onBeforeInsert(List<Boop__c> newList)
    {
        BOOPTriggerHelper.calculateSubmissionCount(newList);
    }    
    
    public static void onBeforeUpdate(List<Boop__c> newList,Map<Id,BOOP__c> oldMap)
    {
        BOOPTriggerHelper.calculateSubmissionCount(newList);
    } 
}