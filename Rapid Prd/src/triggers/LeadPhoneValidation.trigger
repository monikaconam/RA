trigger LeadPhoneValidation on Lead(before insert, before update) 
{
    String phoneList='';
    for (Lead lTemp: trigger.new) 
    {
        if(((Trigger.isUpdate)&&(lTemp.Phone!=Trigger.oldMap.get(lTemp.id).Phone)) || (Trigger.isInsert))
        {
            if (lTemp.Phone != null && lTemp.Phone != '') 
            {
                string splitExt = lTemp.phone;
                
                splitExt = splitExt.touppercase();
                String sTemp = '';
                SYSTEM.debug('splitExt' +splitExt);
                if (splitExt.indexOf('EXTENSION') > 0) 
                    sTemp = 'EXTENSION';
                else if (splitExt.indexOf('EXT') > 0)  
                    sTemp = 'EXT';
                List < String > splitted = new List < String > ();
                String s1 = '';
    
                if (sTemp != '' && sTemp != null) 
                {
                    splitted = splitExt.split(sTemp);
                    s1 = splitted.get(0);
                } 
                else 
                {
                    s1 = splitExt;
                }
    
                string s2 = '';
                if(splitted.size()>1 )
                {      
                    s2 = splitted[1];
                    if (s2.length()>10)
                    {
                        s2 = s2.substring(0,10);
                    }
                }
    
                lTemp.Phone = s1.replaceAll(' ', '');
                lTemp.Phone = s1.replaceAll('[^0-9]', '');
                if(lTemp.Phone.length()>10)
                {
                    lTemp.Phone =lTemp.Phone.substring(0,10); 
                    // add phone to String so that it can be checked with DNC
                    
                }
                phoneList=phoneList+lTemp.Phone+',';
                if (lTemp.Phone_Ext__c == null || lTemp.Phone_Ext__c == '') 
                {
                    if ((s2 != '') && (s2 != null)) 
                    {
    
                        lTemp.Phone_Ext__c = s2.replaceAll(' ', '');
                        lTemp.Phone_Ext__c = s2.replaceAll('[^0-9]', '');
    
                    }
                }   
    
            }
    
            if (lTemp.Phone == null && lTemp.Phone_Ext__c != null && lTemp.Phone_Ext__c != '') 
            {
                Trigger.New[0].phone_Ext__c.addError('Phone Number is Empty ');
            }        
            
             if (lTemp.Principal_Home_Phone_Number__c != null && lTemp.Principal_Home_Phone_Number__c != '') 
             {
    
                string splitExt = lTemp.Principal_Home_Phone_Number__c;
                splitExt = splitExt.touppercase();
                String sTemp = '';
    
                if (splitExt.indexOf('EXTENSION') > 0) 
                    sTemp = 'EXTENSION';
                else if (splitExt.indexOf('EXT') > 0) 
                    sTemp = 'EXT';
                List < String > splitted = new List < String > ();
                String s1 = '';
                if (sTemp != '' && sTemp != null) 
                {
                    splitted = splitExt.split(sTemp);
                    s1 = splitted.get(0);
                } 
                else 
                {
                    s1 = splitExt;
                }
    
                string s2 = '';
                if(splitted.size()>1 )
                {      
                    s2 = splitted[1];
                    if (s2.length()>10)
                    {
                        s2 = s2.substring(0,10);
                    }
                }
    
                    lTemp.Principal_Home_Phone_Number__c = s1.replaceAll(' ', '');
                    lTemp.Principal_Home_Phone_Number__c = s1.replaceAll('[^0-9]', '');
                    if(lTemp.Principal_Home_Phone_Number__c.length()>10)
                    lTemp.Principal_Home_Phone_Number__c =lTemp.Principal_Home_Phone_Number__c.substring(0,10);
               
               if (lTemp.P1_Phone_Ext__c == null || lTemp.P1_Phone_Ext__c == '') 
               {
                    if ((s2 != '') && (s2 != null)) 
                    {    
                        if (s2.length()>10)
                        {
                            s2 = s2.substring(0,10);
                        }
                        lTemp.P1_Phone_Ext__c = s2.replaceAll(' ', '');
                        lTemp.P1_Phone_Ext__c = s2.replaceAll('[^0-9]', '');
                    }
                }            
    
            }
    
            if (lTemp.Principal_Home_Phone_Number__c == null && lTemp.P1_Phone_Ext__c != null && lTemp.P1_Phone_Ext__c != '') 
            {
                Trigger.New[0].P1_Phone_Ext__c.addError('Principal 1 Phone Number is Empty ');
            }
        }
    }
   
}