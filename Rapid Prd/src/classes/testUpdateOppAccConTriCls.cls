@istest

private class testUpdateOppAccConTriCls
{

    public static testMethod void testUpdateOppAccConTri()
    {
        Account Acc = new Account(Name ='TestAccount',OwnerId = UserInfo.getUserId());
        
    
        Insert Acc;
        Contact Con = new Contact (FirstName='MK',LastName='Test', accountId=acc.id);
        Insert Con;
        User u=[select id from User where Profile.name='System Administrator' and isactive=true Limit 1];
        Opportunity Opp = new Opportunity();
        Opportunity Opp2 = new Opportunity();
        System.runAs(u)
        {
            Opp.Name = 'TestOpp';
            Opp.CloseDate = Date.today(); 
            Opp.StageName = 'Approved';
            Opp.accountId=Acc.Id;
            insert opp;
            
            Opp2.Name = 'TestOpp';
            Opp2.CloseDate = Date.today(); 
            Opp2.StageName = 'Approved';
            insert opp2;
        }
        
        User u2=[select id from User where Profile.name='System Administrator' and isactive=true and id!=:u.id  Limit 1 ];  
           opp.ownerId=u2.id;
           Update Opp;
           
          opp2.accountID=acc.id ;
          opp2.ownerId=u2.id;
           Update Opp2;
           
       
      }
}