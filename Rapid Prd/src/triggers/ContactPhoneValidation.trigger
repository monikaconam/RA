/*
@Name            : ContactPhoneValidation 
@Author          : MKConam
@Date            : July 28, 2015
@Description     : 
@Revision History: August 26 2015

@Author          : DS-Conam
@Date            : Nov 17, 2015
@Revision History: Patch for too many SOQL queries

@Author          : DS-Conam
@Date            : Jan 1, 2016

*/

trigger ContactPhoneValidation on Contact (before insert,before update) 
{     
     for(Contact conTemp : trigger.new)
     {  
        Boolean shouldExecute=false;
        if(Trigger.isInsert)
            shouldExecute=(conTemp.Phone != null && conTemp.Phone != '' && conTemp.phone!=null)? true: false;
        if(Trigger.isUpdate)
            shouldExecute=(Trigger.oldMap.get(conTemp.id).phone!=conTemp.phone && conTemp.Phone != '' && conTemp.phone!=null)? true: false;
        System.debug('>>>>>>>>>>>>shouldExecute '+shouldExecute);
        
        if(shouldExecute)        
        {          

                String splitExt= conTemp.phone;
                splitExt = splitExt.toUppercase();                            
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
                        
                        string s2='';
                         if(splitted.size()>1 )
                            {      
                                s2 = splitted[1];
                                if (s2.length()>10)
                                {
                                    s2 = s2.substring(0,10);
                                }
                            }


                conTemp.Phone = s1.replaceAll(' ', '');                            
                conTemp.Phone = s1.replaceAll('[^0-9]','');
                if(conTemp.Phone.length()>10)
                    conTemp.Phone=conTemp.Phone.substring(0,10);                  
         
                      if (conTemp.Phone_Ext__c == null || conTemp.Phone_Ext__c == '') {
                        if ((s2 != '') && (s2 != null)) {
                          
                            String tempph=s2.replaceAll(' ', '');
                            tempph=tempph.replaceAll('[^0-9]', '');
                            
                            if(tempph.length() >10)
                            {
                                tempph= tempph.substring(0,10);
                               
                            }

                            conTemp.Phone_Ext__c =tempph;      

                            /*if(tempph.length() <=10)
                            {

                                conTemp.Phone_Ext__c = tempph;
                            }
                            else 
                            {   
                                if (tempph.startsWith('1'))
                                {
                                    sTVal = tempph.substring(1,tempph.length());  
                                }
                                else 
                                {
                                    sTVal = tempph;  
                                }               
                                
                                String sTResult=sTVal.length()>10 ? sTVal.subString(10,sTVal.length()) : sTVal;
                                conTemp.Phone_Ext__c = sTResult;
                            }
                            */
                            
        
                        }
                    }         
                     
                     
                     
            }  
            
            if(conTemp.Phone == null && conTemp.Phone_Ext__c != null && conTemp.Phone_Ext__c != '')              
            {
            
                 conTemp.phone_Ext__c.addError('Phone Number is Empty ');
                 
            }
              
    
        if (conTemp.Principal_Home_Phone__c!= null && conTemp.Principal_Home_Phone__c!= '')
        {
            string splitExt = conTemp.Principal_Home_Phone__c;
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
            
            conTemp.Principal_Home_Phone__c = s1.replaceAll(' ', '');
            conTemp.Principal_Home_Phone__c = s1.replaceAll('[^0-9]', '');
            if(conTemp.Principal_Home_Phone__c.length()>10)
                    conTemp.Principal_Home_Phone__c =conTemp.Principal_Home_Phone__c.substring(0,10);    

            if (conTemp.H_Phone_Ext__c == null || conTemp.H_Phone_Ext__c == '') 
            {
                if ((s2 != '') && (s2 != null)) 
                {    
                    if (s2.length()>10)
                    {
                        s2 = s2.substring(0,10);
                    }  
                    String sTempO= s2.replaceAll(' ', '');
                    sTempO= sTempO.replaceAll('[^0-9]', '');   
                    conTemp.H_Phone_Ext__c =sTempO;           
                }
                
            }         
        
        }
        
        if (conTemp.Principal_Home_Phone__c == null && conTemp.H_Phone_Ext__c != null && conTemp.H_Phone_Ext__c != '') {
        
        conTemp.H_Phone_Ext__c.addError('Principal Home Phone Number is Empty ');
        
        }
            
    }
}