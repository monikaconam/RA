public class ReviewStatusOnBOOP
{
    public static void reviewStatus(List<BOOP__c> LstBoop , Map<Id,BOOP__c> OldMapBoop)
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType boopSchema = schemaMap.get('BOOP__c');
        Map<String, Schema.SObjectField> fieldMap = boopSchema.getDescribe().fields.getMap();
        
        Boolean stopRecursion = false;
            
        for(BOOP__c boopTemp : LstBoop)
        {
            BOOP__c oldBOOP =  OldMapBoop.get(boopTemp.Id);
            if(stopRecursion == false)
            {
                for(String APIName : fieldMap.keySet())
                {
                    if(boopTemp.get(APIName) != oldBOOP.get(APIName) && APIName != 'Status__c' && APIName != 'Review_Status__c' )
                    {
                        boopTemp.Review_Status__c = true;
                        stopRecursion = true;
                    }
                }
            }
        }
    }
}