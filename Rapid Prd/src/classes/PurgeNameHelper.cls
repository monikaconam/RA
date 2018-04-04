public class PurgeNameHelper
{

    public static void cleanAccountName(List<Account> accList)
    {
        List<Purge_characters_in_Name__c> pcinList=[Select
                                                                name, character__c, replace_with__c
                                                        from 
                                                                 Purge_characters_in_Name__c Limit 100];
        for(Account accTemp : accList)
        {
            String str=accTemp.Legal_Name__c!=null ? String.escapeSingleQuotes(accTemp.Legal_Name__c).toLowerCase() : '';
            String bstr=accTemp.dba__c!=null ? String.escapeSingleQuotes(accTemp.dba__c).toLowerCase() : '';
            String accName=accTemp.name.toLowerCase();
        
        for(Purge_characters_in_Name__c pTemp : pcinList)
        {
            String lvalue=pTemp.character__c.toLowerCase();
            String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();                    
            
            if(str.indexOf(lvalue)!=-1)
            {  
                String regexPattern;
                if(lvalue.length()==1)
                {
                    regexPattern='\\'+lvalue;
                    str=str.replaceAll(regexPattern,rValue);
                }
                else
                { //if the string is the last string
                    if(str.endsWith(lvalue))
                        regexPattern='\\ '+lvalue;
                    else
                        regexPattern='\\ '+lvalue+' ';
                    str=str.replaceAll(regexPattern, ' '+rvalue+' ');
                }
            }
            
            if( bstr.indexOf(lvalue)!=-1)
            {    
                String regexPattern;
                if(lvalue.length()==1)
                {
                    regexPattern='\\'+lvalue;
                    bstr=bstr.replaceAll(regexPattern,rValue);
                }
                else
                { 
                    if(bstr.endsWith(lvalue))
                        regexPattern='\\ '+lvalue;
                    else
                        regexPattern='\\ '+lvalue+' ';
                    bstr=bstr.replaceAll(regexPattern, ' '+rvalue+' ');
                }
            }

            if( accName.indexOf(lvalue)!=-1)
            {    
                String regexPattern;
                if(lvalue.length()==1)
                {
                    regexPattern='\\'+lvalue;
                    accName=accName.replaceAll(regexPattern,rValue);
                }
                else
                { 
                    if(accName.endsWith(lvalue))
                        regexPattern='\\ '+lvalue;
                    else
                        regexPattern='\\ '+lvalue+' ';
                    
                    accName=accName.replaceAll(regexPattern, ' '+rvalue+' ');
                }
            }
        }
        
        str=str.replaceAll('space', '');
        str=str.replaceAll(' ', '');
        str=str.replaceall('_','');
        str=str.replaceall('[^\\w\\s]','');
        for(Purge_characters_in_Name__c pTemp : pcinList)
        {
            String lvalue=pTemp.character__c.toLowerCase();
            String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
            if(lvalue.length()>1)
            {
                if(str.endsWith(lvalue))
                {
                    str=str.replace(lvalue, rvalue);
                }
            }
        }
        accTemp.Purged_Legal_Name__c=str.toLowerCase();
        
        bstr=bstr.replaceAll('space', '');
        bstr=bstr.replaceAll(' ', '');
        bstr=bstr.replaceall('_','');
        bstr=bstr.replaceall('[^\\w\\s]','');
        for(Purge_characters_in_Name__c pTemp : pcinList)
            {
                String lvalue=pTemp.character__c.toLowerCase();
                String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
                if(lvalue.length()>1)
                {
                    if(bstr.endsWith(lvalue))
                    {
                        bstr=bstr.replace(lvalue, rvalue);
                    }
                }
            }
        accTemp.Purged_DBA_Name__c=bstr.toLowerCase();  
        System.debug('accName.Purged_DBA_Name__c' +bstr.toLowerCase());
        accName=accName.replaceAll('space', '');
        accName=accName.replaceAll(' ', '');
        accName=accName.replaceall('_','');
        accName=accName.replaceall('[^\\w\\s]','');
        for(Purge_characters_in_Name__c pTemp : pcinList)
        {
            String lvalue=pTemp.character__c.toLowerCase();
            String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
            if(lvalue.length()>1)
            {
                if(accName.endsWith(lvalue))
                {
                    accName=accName.replace(lvalue, rvalue);
                }
            }
        }
        accTemp.Purged_Account_Name__c=accName.toLowerCase();
        System.debug('accName.toLowerCase()' +accName.toLowerCase());
        
        }

    }
    
    public static void cleanLeadCName(List<Lead> leadList)
    {
        List<Purge_characters_in_Name__c> pcinList=[Select
                                                            name, character__c, replace_with__c
                                                    from 
                                                            Purge_characters_in_Name__c Limit 100];
        for(Lead lTemp : leadList)
        {
            String str=lTemp.company!=null ? String.escapeSingleQuotes(lTemp.company).toLowerCase() : '';
            String bstr=lTemp.Legal_Business_Name__c!=null ? String.escapeSingleQuotes(lTemp.Legal_Business_Name__c).toLowerCase() : '';
        
            for(Purge_characters_in_Name__c pTemp : pcinList)
            {
                String lvalue=pTemp.character__c.toLowerCase();
                String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();                    

                if(str.indexOf(lvalue)!=-1)
                {    
                    String regexPattern;
                    if(lvalue.length()==1)
                    {
                        regexPattern='\\'+lvalue;
                        str=str.replaceAll(regexPattern,rValue);
                    }
                    else
                    { 
                        if(str.endsWith(lvalue))
                            regexPattern='\\ '+lvalue;
                        else
                            regexPattern='\\ '+lvalue+' ';
                        str=str.replaceAll(regexPattern, ' '+rvalue+' ');
                    }
                
                }
                if(bstr.indexOf(lvalue)!=-1)
                {    
                    String regexPattern;
                    if(lvalue.length()==1)
                    {
                        regexPattern='\\'+lvalue;
                        bstr=bstr.replaceAll(regexPattern,rValue);
                    }
                    else
                    { 
                        if(bstr.endsWith(lvalue))
                            regexPattern='\\ '+lvalue;
                        else
                            regexPattern='\\ '+lvalue+' ';
                            
                        bstr=bstr.replaceAll(regexPattern, ' '+rvalue+' ');
                    }
                }
            }
            str=str.replaceAll('space', '');
            str=str.replaceAll(' ', '');
            str=str.replaceall('_','');
            str=str.replaceall('[^\\w\\s]','');
            for(Purge_characters_in_Name__c pTemp : pcinList)
            {
                String lvalue=pTemp.character__c.toLowerCase();
                String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
                if(lvalue.length()>1)
                {
                    if(str.endsWith(lvalue))
                    {
                        str=str.replace(lvalue, rvalue);
                    }
                }
            } 
            lTemp.Purged_Company_Name__c=str.toLowerCase();
            
            bstr=bstr.replaceAll('space', '');
            bstr=bstr.replaceAll(' ', '');
            bstr=bstr.replaceall('_','');
            bstr=bstr.replaceall('[^\\w\\s]','');
            for(Purge_characters_in_Name__c pTemp : pcinList)
            {
                String lvalue=pTemp.character__c.toLowerCase();
                String rValue=pTemp.replace_with__c==null ? '':  pTemp.replace_with__c.toLowerCase();       
                if(lvalue.length()>1)
                {
                    if(bstr.endsWith(lvalue))
                    {
                        bstr=bstr.replace(lvalue, rvalue);
                    }
                }
            } 
            lTemp.Purged_Legal_Business_Name__c=bstr.toLowerCase();    
                    
        }
    }  

}