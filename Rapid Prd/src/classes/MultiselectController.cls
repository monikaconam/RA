Public with sharing class MultiselectController {
    
    // SelectOption lists for public consumption
    public SelectOption[] leftOptions {get;set;}
    public SelectOption[] rightOptions {get;set;}
    public String accid {get;set;}
    public String accountid {get;set;}
    public String sObjType {get;set;}
    public Boolean buttonVisible{get;set;}
    // Parse &-separated values and labels from value and 
    // put them in option
    private void setOptions(SelectOption[] options, String value) {
        if(options!=null)
        options.clear();
        String[] parts = value.split('&');
        
        for (Integer i = 0; i < parts.size() / 2; i++) {
        System.debug(parts);
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
            EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
        }
    }

    // Backing for hidden text field containing the options from the left list
    public String leftOptionsHidden {
        get;
        set {
            leftOptionsHidden = value;
            System.debug(value);
            setOptions(leftOptions, value);
        }
    }

    // Backing for hidden text field containing the options from the right list
    public String rightOptionsHidden {
        get;
        set {
            rightOptionsHidden = value;
            setOptions(rightOptions, value);
        }
    }

    public PageReference saveAccount()
    {
        System.debug('rightOptionsHidden  is ' + rightOptionsHidden);
        PageReference p=null;
        if(rightOptionsHidden!=null && rightOptionsHidden.length()>0)
        {
            List <SelectOption> options = new List <SelectOption> ();
            
            String message='';
            String[] parts = rightOptionsHidden.split('&');
            for (Integer i = 0; i <parts.size() / 2; i++) 
            {
                options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
                EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
            }
    
            List <Partner_Category__c> newRecordsList = new List <Partner_Category__c> ();
            List<Account> accountList=new List<Account>();
            Map<id, Account> accMap=new Map<id, Account>();
            Boolean first = false;
            String Primary;
            integer sortOrder = 0;
            Account acc=new Account(id=accountid);
            acc.Category_Contains_Banks__c=false;
            acc.Category_Contains_CUSO__c=false;
            acc.Category_Contains_Credit_Union__c=false;
            
            for (SelectOption so: options) 
            {
                sortOrder++;
                Partner_Category__c newRecord = new Partner_Category__c();
                newRecord.Partner_Account__c = accountid;
                newRecord.Name = so.getLabel();
                newRecord.Sort_Order__c = sortOrder;
    
                if (first == true) {
                    Primary = so.getLabel();
                    first = false;
                } else {
                    message = message + ';';
                    message += so.getLabel();
                }    
                newRecordsList.add(newRecord);
                //CA lenders license
                // account should be added only once
                if(accMap.containsKey(accountid))
                {
                    if(so.getLabel()=='Banks')
                        acc.Category_Contains_Banks__c=true;
                
                    if(so.getLabel()=='CUSO')
                        acc.Category_Contains_CUSO__c=true;
                        
                    if(so.getLabel()=='Credit Unions')
                        acc.Category_Contains_Credit_Union__c=true;
                        
                    accMap.put(accountid,acc);
                }
                else
                {
                    if(so.getLabel()=='Banks')
                        acc.Category_Contains_Banks__c=true;
                
                    if(so.getLabel()=='CUSO')
                        acc.Category_Contains_CUSO__c=true;
                        
                    if(so.getLabel()=='Credit Unions')
                        acc.Category_Contains_Credit_Union__c=true;
                    accMap.put(accountid,acc);
                }
            }
            System.debug('>>>>.accMap.size() '+accMap.size());
             System.debug('>>>>.accMap() '+accMap);
            if(accMap.size()>0)
            {
                for(Id iTemp : accMap.keyset())
                {
                    accountList.add(accMap.get(iTemp ));
                }
            }
            System.debug('message ' + message);
            System.debug('newRecordsList.size ' + newRecordsList.size());
            if (newRecordsList.size() >= 0) {
                // get existing records and delete them and insert new record
                List <Partner_Category__c> delRecordsList = new List <Partner_Category__c> ();
                delRecordsList = [select id from Partner_Category__c where Partner_Account__c = : accountid];
               
                List <Account> accTemp = [select Category__c from account where id = : accountid];
                SavePoint sp = Database.setSavePoint();
                try {
                   if (delRecordsList.size() > 0) 
                       delete delRecordsList;
                    
                    if (newRecordsList.size() > 0) {
                        accTemp[0].Category__c=message;
                        update accTemp;
                        insert newRecordsList;
                        /*
                        if(accountList.size()>0)
                            update accountList;
                        */
                    } else if (newRecordsList.size() == 0) {
                        accTemp.get(0).Category__c='';
                        accTemp.get(0).Category_Contains_Banks__c=false;
                        accTemp.get(0).Category_Contains_CUSO__c=false;
                        accTemp.get(0).Category_Contains_Credit_Union__c=false;
                        update accTemp;
                    }
    
                } catch (Exception e) {
                    System.Debug('An exception has occured ' + e.getLineNumber() + ' ' + e.getMessage());
                    Database.Rollback(sp);
                }
    
            }
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL ,'Please select a partner category'));
            p=null;
             
        }
        return p;
    }


    public PageReference saveLead() {
        List <SelectOption> options = new List <SelectOption> ();
        System.debug('rightOptionsHidden  is ' + rightOptionsHidden);
        String message='';
        //Integer sortOrder = 0;
        String[] parts = rightOptionsHidden.split('&');
        for (Integer i = 0; i < parts.size() / 2; i++) {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
            EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
        }

         List <Partner_Category__c> newRecordsList = new List <Partner_Category__c> ();
 
        Boolean first = true;
        String Primary;
        integer sortOrderL = 0;
        for (SelectOption so: options) {
            sortOrderL++;
            Partner_Category__c newRecord = new Partner_Category__c();
            newRecord.Partner_Lead__c = accountid ;
            newRecord.Name = so.getLabel();
            newRecord.Sort_Order__c = sortOrderL;

            if (first == true) {
              //  message = so.getLabel();
                Primary = so.getLabel();
                first = false;
            } else {
                message = message + ';';
                message += so.getLabel();
            }


            newRecordsList.add(newRecord);

        }
        System.debug('message ' + message);
        System.debug('newRecordsList.size ' + newRecordsList.size());
        if (newRecordsList.size() >= 0) {
            // get existing records and delete them and insert new record
            List <Partner_Category__c> delRecordsList = new List <Partner_Category__c> ();
            delRecordsList = [select id from Partner_Category__c where Partner_Lead__c = : accountid ];
            List <Lead> leadTemp = [select  Category__c from Lead where id = : accountid ];
            SavePoint sp = Database.setSavePoint();
            try {
               if (delRecordsList.size() > 0) delete delRecordsList;
                if (newRecordsList.size() > 0) {
                   // leadTemp[0].Partner_Channel__c = Primary;
                    leadTemp[0].Category__c=message;
                    update leadTemp;
                    insert newRecordsList;

                } else if (newRecordsList.size() == 0) {
                    // leadTemp[0].Partner_Channel__c = '';
                    leadTemp[0].Category__c='';
                    update leadTemp;

                }


            } catch (Exception e) {
                System.Debug('An exception has occured ' + e.getLineNumber() + ' ' + e.getMessage());
                Database.Rollback(sp);
            }

        }

        return null;
    }
    
    public PageReference saveLead(String Id) {
        List <SelectOption> options = new List <SelectOption> ();
        System.debug('rightOptionsHidden  is ' + rightOptionsHidden);
        String message='';
        //Integer sortOrder = 0;
        String[] parts = rightOptionsHidden.split('&');
        for (Integer i = 0; i < parts.size() / 2; i++) {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
            EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
        }

         List <Partner_Category__c> newRecordsList = new List <Partner_Category__c> ();
 
        Boolean first = true;
        String Primary;
        integer sortOrderL = 0;
        for (SelectOption so: options) {
            sortOrderL++;
            Partner_Category__c newRecord = new Partner_Category__c();
            newRecord.Partner_Lead__c = Id;
            newRecord.Name = so.getLabel();
            newRecord.Sort_Order__c = sortOrderL;

            if (first == true) {
              //  message = so.getLabel();
                Primary = so.getLabel();
                first = false;
            } else {
                message = message + ';';
                message += so.getLabel();
            }


            newRecordsList.add(newRecord);

        }
        System.debug('message ' + message);
        System.debug('newRecordsList.size ' + newRecordsList.size());
        if (newRecordsList.size() >= 0) {
            // get existing records and delete them and insert new record
            List <Partner_Category__c> delRecordsList = new List <Partner_Category__c> ();
            delRecordsList = [select id from Partner_Category__c where Partner_Lead__c = : accountid ];
            List <Lead> leadTemp = [select  Category__c from Lead where id = : accountid ];
            SavePoint sp = Database.setSavePoint();
            try {
               if (delRecordsList.size() > 0) delete delRecordsList;
                if (newRecordsList.size() > 0) {
                   // leadTemp[0].Partner_Channel__c = Primary;
                    leadTemp[0].Category__c=message;
                    update leadTemp;
                    insert newRecordsList;

                } else if (newRecordsList.size() == 0) {
                    // leadTemp[0].Partner_Channel__c = '';
                    leadTemp[0].Category__c='';
                    update leadTemp;

                }


            } catch (Exception e) {
                System.Debug('An exception has occured ' + e.getLineNumber() + ' ' + e.getMessage());
                Database.Rollback(sp);
            }

        }

        return null;
    }
}