/*
@Name               : BOOPTriggerHelper
@Author             : DS-Conam
@Date               : 5 March 2018
@Description        : Calculate submission count on Boop
@Test Class         : BOOPTriggerHandlerTest
*/
public class BOOPTriggerHelper
{
    public static void calculateSubmissionCount(List<Boop__c> newList)
    {
        List<String>apiNames =getSubmittedFieldAPINames();
        for(Boop__c bTemp : newList)
        {
            Integer submissionCounter=0;
            for(String fieldName : apiNames)
            {
                if(bTemp.get(fieldName )==true)
                {
                    submissionCounter++;
                }
            }
            bTemp.Total_Submission_Count__c=submissionCounter;
        }
    }
       
    public static List<String> getSubmittedFieldAPINames()
    {
        List<String>apiNames =  new list<String>();
        Map<String, Schema.SObjectField> fieldMap = BOOP__C.sObjectType.getDescribe().fields.getMap();
        for(string apiName : fieldMap.keySet())
        {
            if(apiName.endsWith('submitted__c') && fieldMap.get(apiName).getDescribe().getType() == Schema.DisplayType.Boolean)
            {
                apiNames.add(apiName);
            }
        }
        return apiNames;
    }
}