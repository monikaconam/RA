/**
@Name            : TestMasterCampaignTrigger
@Author          : MK Conam
@Date            : Aug 31 2015
@Description     : Test Class for AttachmentTriggerHandler
**/

@isTest

public class TestMasterCampaignTrigger
{
    static testMethod voId unitTestBeforeOwnerChange()
    {
        test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        User u=[SELECT 
                    Id 
                FROM 
                    User 
                WHERE 
                    profile.name ='System Administrator' 
                AND 
                    isActive=true LIMIT 1];
        
        Profile p = [SELECT 
                            Id 
                        FROM 
                            Profile 
                        WHERE 
                            Name='Standard User'];
        User u1 = new User(Alias = 'stdusr', Email='standarduser@test.com', 
                              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                              LocaleSidKey='en_US', ProfileId = p.Id, 
                              TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@test.com'
                          );
        Campaign cam = new Campaign(Name='abctest',Type='Internet',Additional_Owner__c =u1.id,
                                    BD_Send_Addtl_Owner__c='test@testmail.com'
                                    ); 
        insert cam; 
        
        List<Campaign> queryonobject = [SELECT 
                                            Id, OwnerId,Owner.Name 
                                        FROM 
                                            Campaign 
                                        WHERE 
                                            Id =:cam.Id ];
        update cam;
         
       // System.assertEquals(u.id, cam.Additional_Owner__c );
      //  System.assertEquals(u.email, cam.BD_Send_Addtl_Owner__c);
        test.stopTest();
        
    }
    
    static testMethod voId unitTestBeforeOwnerChange1()
    {
        test.startTest();
        // DS-CONAM CALC.apexTesting();
        
        User u=[SELECT 
                        Id 
                    FROM 
                        User 
                    WHERE 
                        profile.name ='System Administrator' 
                    AND 
                        isActive=true LIMIT 1];       
    
                  
        Campaign cam = new Campaign(Name='abctest',Type='Internet',OwnerId = u.id,
                                    BD_Send_Addtl_Owner__c='test@testmail.com'
                                    ); 
        insert cam; 
        
        List<Campaign> queryonobject = [SELECT 
                                            Id, OwnerId,Owner.Name 
                                        FROM 
                                            Campaign 
                                        WHERE 
                                            Id =:cam.Id ]; 
        update cam ;
        //System.assertEquals(u.email, cam.BD_Send_Addtl_Owner__c);

        
        Test.stoptest();
        
    }
    
    static testMethod voId unitTestCampaignCALC()
    {
        // DS-CONAM CALC.ApexTesting();
        Test.startTest();
        Campaign  cmObj = new Campaign();
        cmObj.Name = 'Test';
        cmObj.Type='Internet';
        insert cmObj; 
        Test.stopTest();       
    }
    static testMethod voId unitTestCampaignCALC1()
    {
        // DS-CONAM CALC.apexTesting();
        Test.startTest();
        Campaign cam = new Campaign(Name='abctest',Type='Internet',
                                    OwnerId = UserInfo.getUserId()
                                    ); 
        insert cam; 

        List<Campaign> queryonobject = [SELECT 
                                                Id, Owner.ID, Owner.IsActive, Owner.Name 
                                            FROM 
                                                Campaign 
                                            WHERE 
                                                id =:cam.id ];   
        update cam;  
        Test.stopTest();
    }
}