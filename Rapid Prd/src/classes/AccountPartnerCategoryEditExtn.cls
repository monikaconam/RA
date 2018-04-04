public with sharing class AccountPartnerCategoryEditExtn {

    ApexPages.StandardController AccountController;
    public SelectOption[] leftOptions { get;set;}
    public SelectOption[] rightOptions { get;set;}
    public String accountid { get;set;}
    public Account AccountObj { get;set;}
    public CampaignMember tempMember { get;set;}
    public String id;
    public SelectOption[] selectedLCats { get;set;}
    public SelectOption[] allLCats { get;set;}
    public String outputMessage {
        get {
            IF(outputMessage.length()> 100)
            outputMessage = outputMessage.subString(0, 100) + '...';
            return outputMessage;
        }
        set;
    }
    public Boolean show { get;set;}
    public Boolean showLink { get;set;}
    public String defaultRecordType{get;set;}
    public String retUrl;


    public AccountPartnerCategoryEditExtn(ApexPages.StandardController controller) 
    {
        id = Apexpages.currentPage().getParameters().get('id'); // Account Id
        String returnTo=Apexpages.currentPage().getParameters().get('retUrl');
        AccountController = controller;
        loadValues();
        rightOptions=new List<SelectOption>();
        
        
        if (id == null)
        {
            retUrl='/001/o';
            Schema.DescribeSObjectResult describeOpp = Schema.SObjectType.Account;    
            system.debug(describeOpp);
            List<Schema.RecordTypeInfo> rtInfos = describeOpp.getRecordTypeInfos();
            for(Schema.RecordTypeInfo rtInfo : rtInfos) {
                if(rtInfo.isDefaultRecordTypeMapping()) {           
                    defaultRecordType=Schema.SObjectType.Account.getRecordTypeInfosById().get(rtInfo.getRecordTypeId()).getName();
                }
            }
        }
        String str1='';
        /*
        String str1='';
        for(PartnerCategoryAccount__c cTemp :[SELECT Name, id FROM PartnerCategoryAccount__c])
        {
            leftOptions.add(new Selectoption(cTemp.name, 'y'));
            if(str1=='')
                str1=str1+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
            else
                str1=str1+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
        }
         
        leftOptionsHidden=str1;
        
        System.debug('str1' +leftOptionsHidden);
        */
        retURL=returnTo!=null? returnTo :'/001/o';
        if(id!=null)
        {
            retUrl='/'+id;
            str1='';
            for(Partner_Category__c cTemp :[select name from Partner_Category__c where Partner_Account__c = : id])
            {
                rightOptions.add(new Selectoption(cTemp.name, cTemp.name));
                if(str1=='')
                    str1=str1+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
                else
                    str1=str1+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
            } 
            rightOptionsHidden=str1;
            System.debug('str1' +rightOptionsHidden);
        } 
       
    }
    
    public PageReference onCancel()
    {
        return new PageReference(retUrl).setRedirect(true);
    }
    /*
    private void setOptions(SelectOption[] options, String value)
    {
        options.clear();
        String[] parts = value.split('&');

        for (Integer i = 0; i <parts.size() / 2; i++)
        {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
            EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
        }
    }
    */
    // Backing for hidden text field containing the options from the left list
    public String leftOptionsHidden {
        get;
        set {
            system.debug('left 1' +value + ' '+leftOptions);
            
            leftOptionsHidden = value;
            //setOptions(leftOptions, value);
        }
    }

    // Backing for hidden text field containing the options from the right list
    public String rightOptionsHidden {
        get;
        set {
            system.debug('right 1' +value + ' '+rightOptionsHidden );
            rightOptionsHidden = value;
           // setOptions(rightOptions, value);
        }
    }

    public void loadValues() 
    {
        accountObj  = new Account();
        tempMember = new CampaignMember();

        Boolean fTime = false;

        if (id != null)
        {
            AccountObj  = [SELECT Id, Partner_Channel__c FROM Account where id =:id];
            selectedLCats = new List <SelectOption> ();
            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryAccount__c order by name]);
            List <String> CategoryByLead = generateList([select name from Partner_Category__c where Partner_Account__c =:id order by sort_order__c]);

            //create set to remove selected element
            Set <String> setLCats = new Set <String> ();
            setLCats.addAll(LCategories);
            
            Set <String> setCatByLead = new Set <String> ();
            
            setCatByLead.addAll(CategoryByLead);
            
            setLCats.removeAll(setCatByLead);
            
            allLCats = new List <SelectOption> ();
            
            for (String c: setLCats) {
                allLCats.add(new SelectOption(c, c));
            }
            
            for (String c: setCatByLead) {
                selectedLCats.add(new SelectOption(c, c));
            }
            List <Partner_Category__c> tempList = [select 
                                                            id, name 
                                                    from 
                                                            Partner_Category__c 
                                                    where 
                                                            Partner_Account__c = : id order by sort_Order__c ASC];
            outputMessage ='';
            for (Partner_Category__c scTemp: tempList) {
                    outputMessage += ';' + scTemp.name;
            }
            if (outputMessage == '')
            {
                show = False;
                showLink = true;
                outputMessage = 'Select Category';
            } 
            else 
            {
                show = true;
                showLink = False;
            }
        }
         else 
         {

            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryAccount__c order by name]);
            allLCats = new List <SelectOption> ();
            Set <String> setLCats = new Set <String> ();
            setLCats.addAll(LCategories);

            
            for (String c: setLCats) {
                allLCats.add(new SelectOption(c, c));
            }
        }

        leftOptions = allLCats;
        System.debug('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX '+allLCats);
        System.debug('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX '+selectedLCats);
        rightOptions = selectedLCats;

    }

    private List <String> generateList(List <sobject> sobj) 
    {
        System.debug(sobj);
        List <String> retStr = new List <String> ();
        for (sobject sTemp: sobj) 
        {
            if (sTemp.getSObjectType() == Partner_Category__c.sObjectType) 
            {
                sTemp = (Partner_Category__c) sTemp;
            } 
            else if (sTemp.getSObjectType() == PartnerCategoryAccount__c.sObjectType) 
            {
                sTemp = (PartnerCategoryAccount__c) sTemp;
            }

            retStr.add(String.valueOf(sTemp.get('Name')));
        }
        return retStr;
    }  

    public PageReference onSave() 
    {
        PageReference p=null;
        SavePoint sp;
        try
        {
            if(rightOptionsHidden.length()>0 && rightOptionsHidden!=null)
            {
                AccountController.save();
                accountid = AccountController.getId();
                
                System.debug('account Id '+ accountid );
                List <SelectOption> options = new List <SelectOption> ();
                String message = '';
                String[] parts = rightOptionsHidden.split('&');
                
                System.debug('DDDDDDDDD '+ parts );
                for (Integer i = 0; i <parts.size() / 2; i++) 
                {
                    options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
                    EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
                }
    
                List <Partner_Category__c> newRecordsList = new List <Partner_Category__c> ();
        
                Boolean first = true;
                String Primary;
                integer sortOrderL = 0;
                for (SelectOption so: options) 
                {
                    sortOrderL++;
                    Partner_Category__c newRecord = new Partner_Category__c();
                    newRecord.Partner_Account__c = accountid;
                    newRecord.Name = so.getLabel();
                    newRecord.Sort_Order__c = sortOrderL;
                    message =message + so.getLabel();
                    newRecordsList.add(newRecord);
        
                }
                System.debug('message ' + message);
                System.debug('newRecordsList.size ' + newRecordsList.size());
                
                if (newRecordsList.size()>= 0)
                {
                    // get existing records and delete them and insert new record
                    List <Partner_Category__c> delRecordsList = new List <Partner_Category__c> ();
                    delRecordsList = [select id from Partner_Category__c where Partner_Account__c = : accountid];
                    List <Account> leadTemp = [select Category__c from Account where id = : accountid];
                    sp=Database.setSavePoint();
        
                        if (delRecordsList.size()> 0) 
                            delete delRecordsList;
                        if (newRecordsList.size()> 0) {
                            leadTemp[0].Category__c = message;
                            update leadTemp;
                            insert newRecordsList;
        
                        } else if (newRecordsList.size() == 0) {
                            leadTemp[0].Category__c = '';
                            update leadTemp;
        
                        }
        
                        p=new PageReference('/'+leadTemp.get(0).id) ;
           
                }
            }
            else
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL ,'Please select a partner category'));
                p=null;
            }
        
        }
        catch(Exception e)
        {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL ,e.getMessage()+'@'+e.getLineNumber()));
                p=null;
                Database.Rollback(sp);
                
        }
        return p;

    }

}