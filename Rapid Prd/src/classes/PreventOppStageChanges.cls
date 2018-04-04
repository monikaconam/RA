public class PreventOppStageChanges
{
    public static void onBeforeUpdate(Map<id,Opportunity> newOMap,Map<id,Opportunity> oldOMap)
    {
        Profile sysProfileId=[Select id from profile where name='System Administrator' Limit 1];
        for(Id idItr : newOMap.keyset())
        {
            if((newOMap.get(idItr).StageName!=oldOMap.get(idItr).StageName) && 
                (UserInfo.getProfileId()!=sysProfileId.id))
                newOMap.get(idItr).addError('Unable to change stage manually. Please contact the System Administrator.');
        }
    }
    
}