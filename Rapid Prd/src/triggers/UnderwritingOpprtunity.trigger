trigger UnderwritingOpprtunity on Opportunity (before insert, before update) {
 
     List<Messaging.SingleEmailMessage> mailingList = new List<Messaging.SingleEmailMessage>();
    
    
    
    
    for(Opportunity opp: Trigger.new){
    
     Opportunity oldOpp;
        if(Trigger.isUpdate) {
            oldOpp =  Trigger.oldMap.get(opp.Id);   
        }

 /** _________UNDERWRITING WFRS ________________**/
        
        /* UW Assignment DTS WFR -start */
        if(Trigger.isInsert 
             && (( opp.Underwriter_Assigned__c == 'AUTO DECISION')
             || (opp.Underwriter_Assigned__c != null))){
            opp.UW_Assigned_Date_Stamp__c = Datetime.now();      
        }
        
        if(Trigger.isUpdate
            && ((
                 (opp.Underwriter_Assigned__c == 'AUTO DECISION'))
            || (Trigger.oldMap.get(opp.Id).Underwriter_Assigned__c == null && opp.Underwriter_Assigned__c != null))){
           
            opp.UW_Assigned_Date_Stamp__c = Datetime.now();    
        }
        /* UW Assignment DTS WFR -end */
        
                
        /*** Eligible for Rapid Funding Number WFR ***/
        if(opp.UWEligible_for_Rapid_Funding__c =='Yes' && (Trigger.isInsert || (Trigger.isUpdate && oldOpp.UWEligible_for_Rapid_Funding__c != 'Yes'))){
            List<User> userListRoles = new List<User>(); 
            userListRoles = [SELECT Id,Email FROM User WHERE UserRoleId IN (Select Id from UserRole where Name='Processors') and IsActive = true];       
            List<User> userListsingle = [SELECT Id,Email FROM User WHERE IsActive = true and Username = 'mcerminaro@rapidadvance.com' Limit 1];
            if(userListsingle != null && !userListsingle.isEmpty())
            {                
                userListRoles.add(userListsingle.get(0));
            }
            String[] toaddress = new String[]{};
            for(User user: userListRoles){
                if(user.Email != null && !user.Email.trim().equals('')){   
                if(opp.Id == '0067000000VHvZw')
                {                    
                    toaddress.add('dshapiro@rainmaker-llc.com');  
                    toaddress.add('adubedi@rainmaker-llc.com');  
                    toaddress.add('achauhan@rainmaker-llc.com');
                }
                else
                {
                    toaddress.add(user.Email);  
                }  
                                                
                                                          
                }
            }           

            System.debug('userListRoles...'+userListRoles.size());
            if(userListRoles != null && !userListRoles.isEmpty()){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              //  mail.setToAddresses(toaddress); 
                  mail.setToAddresses(toaddress); 
                //mail.setReplyTo('services@rapidadvance.com');
                //mail.setSenderDisplayName('Rapid Financial Services');
                mail.setBccSender(false);                          
                mail.setSubject(opp.Name+' is Eligible for Rapid Funding');                          
                mail.setPlainTextBody(opp.Name+' is Eligible for Rapid Funding' + '\nOppId: ' +opp.Opportunity_Number__c);
                mailingList.add(mail);
            }
        }
        
        /*** Alexandra Approval With Conditions WFR AND Umaru All Approved Conditions WFR ***/
        if((opp.Processing_Representative__c=='Alexandra' || opp.Processing_Representative__c=='Umaru') && opp.All_Approved_With_Conditions_Met__c && 
            (Trigger.isInsert || (Trigger.isUpdate && !((oldOpp.Processing_Representative__c == 'Alexandra' || oldOpp.Processing_Representative__c == 'Umaru') && oldOpp.All_Approved_With_Conditions_Met__c)))){
            List<User> userList;    
            if(opp.Processing_Representative__c=='Alexandra'){
                userList = [SELECT Id,Email FROM User WHERE IsActive = true and userName = 'apompee@rapidadvance.com' ];
            }
            else if(opp.Processing_Representative__c=='Umaru'){
                 userList = [SELECT Id,Email FROM User WHERE IsActive = true and userName = 'umansarnay@rapidadvance.com' ];
            }            

            if(userList != null && !userList.isEmpty()){
                String emailSubject = opp.Name + ' - ' + opp.Opportunity_Number__c + ' All approval conditions have been satisfied.';
                String emailBody = '';
                String[] toaddress = new String[]{};                
                if(userList.get(0) != null && userList.get(0).Email != null && !userList.get(0).Email.trim().equals('')){                                   
                
                 if(opp.Id == '0067000000VHvZw')
                {                    
                    toaddress.add('dshapiro@rainmaker-llc.com');  
                    toaddress.add('adubedi@rainmaker-llc.com');  
                    toaddress.add('achauhan@rainmaker-llc.com');
                }
                else
                {
                      toaddress.add(userList.get(0).Email);  
                }  
                }
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(toaddress);
                mail.setsubject(emailSubject);
                mail.setBccSender(false);
                mail.setPlainTextBody(emailBody);
                mailingList.add(mail);             
            }
        }
        
}


 try {
            if(!mailingList.isEmpty()) {
                Messaging.sendEmail(mailingList);
            }
        } catch(Exception e) {
            System.debug('Error ::' + e.getMessage());
        }

}