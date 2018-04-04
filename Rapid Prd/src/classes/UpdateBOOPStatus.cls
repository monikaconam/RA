public class UpdateBOOPStatus
{
    // Insert and update of BOOP
    public static void updateStatus(List<BOOP__c> lstBoop)
    {
        try{
            set<Id> marbleId = new set<Id>(); 
            for(BOOP__c boopTemp : lstBoop)
            {
                if(boopTemp.status__c != Null && boopTemp.Marble__c != Null)
                {
                    marbleId.add(boopTemp.Marble__c);
                    system.debug('marbleId'+marbleId);
                }   
            }
            
            List<Marble__c> lstMarble = new List<Marble__c>();
            for(Marble__c marbleTemp : [Select Id,BOOP_status__c,(Select Marble__c,Status__c from Quotes__r) from Marble__c where Id IN : marbleId])
            {
                system.debug('marbleTemp '+marbleTemp);
                if(marbleTemp.Quotes__r.size() > 0)
                {
                    system.debug('Inside if');
                    for(BOOP__c boopTemp : marbleTemp.Quotes__r)
                    {
                        marbleTemp.Boop_status__c = boopTemp.Status__c;
                    }
                    
                }
                lstMarble.add(marbleTemp);
            }
            
            if(lstMarble.size() > 0)
            update lstMarble;
        }
        catch(Exception e){}
    }
    
    // Delete of BOOP
    public static void BoopStatusField(List<BOOP__c> lstBoop)
    {
        try{
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
        catch(Exception e){}
    }
    
    
    public static void populateMarbleOwnerId(List<BOOP__c> lstBoop)
    {
        try{
            Set<Id> marbleId = new Set<Id>();
            for(BOOP__c boopTemp : lstBoop)
            {
                if(boopTemp.Marble__c != Null)
                    marbleId.add(boopTemp.Marble__c);
            }
            
            
            if(marbleId.Size()> 0){
                Map<Id,Marble__c> marbleMap = new Map<Id,Marble__c>([Select Id,OwnerId FROM Marble__c WHERE ID IN : marbleId]);
                
                for(BOOP__c boopTemp  : lstBoop)
                {
                    boopTemp.OwnerId__c = marbleMap.get(boopTemp.Marble__c).OwnerId;
                }
            }
        }catch(Exception e){}  
    }
}