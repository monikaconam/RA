/*
@Name            : AccountPhoneValidation 
@Author          : MKConam
@Date            : July 28, 2015
@Description     : 
@Revision History: 
*/

trigger AccountPhoneValidation on Account (before insert,before update) 
{   
    for(Account Acc : trigger.new)
    {   
        if(((Trigger.isUpdate)&&(acc.Phone!=Trigger.oldMap.get(acc.id).Phone)) || (Trigger.isInsert))
        {
            if(Acc.Phone != null && Acc.Phone != '')       
            {          
                String splitExt= Acc.phone;
                splitExt = splitExt.touppercase();                            
                String sTemp='';
                        
                if(splitExt.indexOf('EXTENSION')>0)
                    sTemp='EXTENSION';
                    
                else if(splitExt.indexOf('EXT')>0)
                    sTemp='EXT';
            
                List<String> splitted = new List<String>();
                String s1='';
                    if(sTemp!='' && sTemp!=null)
                    {
                        splitted = splitExt.split(sTemp);
                        s1=splitted.get(0);
                    }
                    else
                    {
                        s1=splitExt;
                    }   
                
                String s2='';
                     
                if(splitted.size()>1)                                             
                    s2 = splitted[1];
            
            
                Acc.Phone = s1.replaceAll(' ', '');                            
                Acc.Phone = s1.replaceAll('[^0-9]','');                           
                if(Acc.Phone.length()>10)
                    Acc.Phone =Acc.Phone.substring(0,10);   

                if (Acc.Phone_Ext__c == null || Acc.Phone_Ext__c == '') {
                    if ((s2 != '') && (s2 != null)) {
                        Acc.Phone_Ext__c = s2.replaceAll(' ', '');
                        Acc.Phone_Ext__c = s2.replaceAll('[^0-9]', '');
                    }
                }  
                     
            }  
            
            if(Acc.Phone == null && Acc.Phone_Ext__c != null && Acc.Phone_Ext__c != '')              
            {
                 Trigger.New[0].phone_Ext__c.addError('Phone Number is Empty ');
            }
        }
    }           
        
}