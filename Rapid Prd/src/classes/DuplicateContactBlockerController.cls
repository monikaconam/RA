public class DuplicateContactBlockerController 
 {

       public String configRecordId {get; set;}  
        
      /**Commented by MKConam     **/
      /**public DuplicateContactBlockerController()
       {
       
       }
    **/
       
       public void readyPage() 
       {
          List<Duplicate_Contact_Blocker_Setup__c> dcbs = [SELECT  
                                                                id 
                                                           FROM 
                                                                Duplicate_Contact_Blocker_Setup__c];
                                                           
          if (dcbs.isEmpty()) 
          {
            Duplicate_Contact_Blocker_Setup__c newDCBS = new Duplicate_Contact_Blocker_Setup__c();           
            newDCBS.Name = 'Duplicate Criteria';
            newDCBS.Match_First_Name__c = true;
            newDCBS.Match_Last_Name__c = true;
            newDCBS.Match_Email__c = false;
            newDCBS.Match_Phone__c = false;
            newDCBS.Match_Account_Name__c = false;
            
            insert newDCBS;
            configRecordId = newDCBS.id;
            
          }
          
          else
          {
            configRecordId = dcbs[0].id;
          }
       }
   
 }