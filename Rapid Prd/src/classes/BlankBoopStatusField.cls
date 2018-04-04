public class BlankBoopStatusField
{
    public static void BoopStatusField(List<BOOP__c> lstBoop)
    {
        set<Id> marbleId = new set<Id>();
        for(BOOP__c boopTemp : lstBoop)
        {
            marbleId.add(boopTemp.Marble__c);
        }
        
        List<Marble__c> lstMarble = new List<Marble__c>();
        for(Marble__c marbleTemp : [Select Id,(Select Marble__c from Quotes__r) from Marble__c where Id IN : marbleId])
        {
            if(marbleTemp.Quotes__r.size() <= 0)
            {
                marbleTemp.BOOP_Status__c = Null;
            }
            
            lstMarble.add(marbleTemp);
        }
        
        if(lstMarble.size() > 0)
        update lstMarble;
    }
}