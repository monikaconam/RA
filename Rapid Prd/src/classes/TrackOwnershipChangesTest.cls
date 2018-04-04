@isTest
public class TrackOwnershipChangesTest {
    
   
    public static testmethod void testLeadTrigger()
    {
        List<User> userId = [select Id,Name from User where Profile.Name ='System Administrator' AND IsActive=true Limit 5];
        Lead l1 = new Lead(Company = 'New Name1',FirstName='First Name1',LastName='Last Name1');
        
        insert l1;
        l1.ownerId=userId[0].Id;
        update l1;
        system.debug(l1);
        System.debug(l1.Original_Owner__c+' 1  '+userId[0].Id);
        //System.assertEquals(l1.Original_Owner__c, userId[0].Id);
        
        l1.OwnerId = UserId[1].Id;
        update l1;
        System.debug(l1.Original_Owner__c+' 2   '+userId[0].Id);
        System.debug(l1.Previous_Owner_1__c+' '+userId[0].Id);
        
    	l1.OwnerId = UserId[2].Id;
    	update l1;
        
        System.debug(l1.Original_Owner__c+' 3  '+userId[0].Id);
        //System.assertEquals(l1.Original_Owner__c, userId[0].Id);
        
        l1.OwnerId = UserId[1].Id;
        update l1;
        System.debug(l1.Original_Owner__c+' '+userId[0].Id);
        System.debug(l1.Previous_Owner_1__c+' '+userId[0].Id);
        
    	l1.OwnerId = UserId[2].Id;
    	update l1;
        System.debug(l1.Original_Owner__c+' '+userId[0].Id);
        System.debug(l1.Previous_Owner_1__c+' '+userId[1].Id);
        System.debug(l1.Previous_Owner_2__c+' '+userId[0].Id);
    
        l1.OwnerId = UserId[3].Id;
    	update l1;
        System.debug(l1.Original_Owner__c+' '+userId[0].Id);
        System.debug(l1.Previous_Owner_1__c+' '+userId[2].Id);
        System.debug(l1.Previous_Owner_2__c+' '+userId[1].Id);	
        System.debug(l1.Previous_Owner_3__c+' '+userId[0].Id);
    }
   
}