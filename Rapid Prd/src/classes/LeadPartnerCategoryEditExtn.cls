public with sharing class LeadPartnerCategoryEditExtn 
{

    ApexPages.StandardController leadController;
    public String retUrl;
    public SelectOption[] leftOptions { get;set;}
    public SelectOption[] rightOptions { get;set;}
    public String accountid { get;set;}
    public Lead leadObj { get;set;}
    public CampaignMember tempMember { get;set;}
    public String id;
    public SelectOption[] selectedLCats { get;set;}
    public SelectOption[] allLCats { get;set;}
    public String message { get;set;}
    public String PrimaryMessage { get;set;}
    public String outputMessage
    {
        get 
        {
            IF(outputMessage.length()> 500)
            outputMessage = outputMessage.subString(0, 500) + '...';
            return outputMessage;
        }
        set;
    }
    
    public Boolean show { get;set;}
    public Boolean showLink { get;set;}
    public Lead led { get;set;}

    public LeadPartnerCategoryEditExtn(ApexPages.StandardController controller) 
    {
        id = Apexpages.currentPage().getParameters().get('id'); // Lead Id
        String returnTo=Apexpages.currentPage().getParameters().get('retUrl');
        leadController = controller;
        TestLeadPageController2();
        rightOptions=new List<SelectOption>();
        leftOptions=new List<SelectOption>();
        
         String str1='';
         /*
         for(PartnerCategoryLead__c cTemp :[SELECT Name, id FROM PartnerCategoryLead__c])
         {
             leftOptions.add(new Selectoption(cTemp.name, cTemp.name));
             if(str1=='')
                 str1=str1+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             else
                 str1=str1+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             
         }
         */
         retURL=returnTo!=null? returnTo :'/00Q/o';
         leftOptionsHidden=str1;
         System.debug('str1' +leftOptionsHidden);
         if(id!=null)
         {
             retURL='/'+id;
             str1='';
             for(Partner_Category__c cTemp :[select name from Partner_Category__c where Partner_Lead__c = : id])
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

    /**
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
    **/
    
    // Backing for hidden text field containing the options from the left list
    public String leftOptionsHidden 
    {
        get;
        set 
        {
            system.debug('left 1' +value + ' '+leftOptions);
            
            leftOptionsHidden = value;
           // setOptions(leftOptions, value);
        }
    }

    // Backing for hidden text field containing the options from the right list
    public String rightOptionsHidden 
    {
        get;
        set 
        {
            system.debug('right 1' +value + ' '+rightOptionsHidden );
            rightOptionsHidden = value;
            //setOptions(rightOptions, value);
        }
    }
    
    public PageReference onCancel()
    {
        return new PageReference(retURL).setRedirect(true);
    }

    public void TestLeadPageController2() 
    {
    
        system.debug('right' +' '+rightOptionsHidden );
        system.debug('left ' +' '+leftOptions);

        leadObj  = new Lead();
        tempMember = new CampaignMember();

        Boolean fTime = false;
       // id = Apexpages.currentPage().getParameters().get('id'); // Lead Id

        if (id != null)
        {
            leadObj  = [SELECT Id, Partner_Channel__c FROM Lead where id = : id];
            selectedLCats = new List <SelectOption> ();
            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryLead__c]);
            List <String> CategoryByLead = generateList([select name from Partner_Category__c where Partner_Lead__c = : id]);

            //create set to remove selected element
            Set <String> setLCats = new Set <String> ();
            setLCats.addAll(LCategories);
            
            Set <String> setCatByLead = new Set <String> ();
            
            setCatByLead.addAll(CategoryByLead);
            
            setLCats.removeAll(setCatByLead);
            
            allLCats = new List <SelectOption> ();
            
            for (String c: setLCats) 
            {
                allLCats.add(new SelectOption(c, c));
            }
            
            for (String c: setCatByLead) 
            {
                selectedLCats.add(new SelectOption(c, c));
            }
            
            System.debug(id);
            List <Partner_Category__c> tempList = [select 
                                                            id, name 
                                                    from 
                                                            Partner_Category__c 
                                                    where 
                                                            Partner_Lead__c = : id order by sort_Order__c ASC];
            outputMessage ='';
            System.debug(tempList );
                        
            for (Partner_Category__c scTemp: tempList) 
            {
            /*    if (fTime == false) {
                    outputMessage = scTemp.name;
                    fTime = true;
                    PrimaryMessage = scTemp.name;
                } else {
                    outputMessage += ';' + scTemp.name;
            
            
                }*/
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

            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryLead__c]);
            allLCats = new List <SelectOption> ();
            Set <String> setLCats = new Set <String> ();
            setLCats.addAll(LCategories);

            
            for (String c: setLCats) 
            {
                allLCats.add(new SelectOption(c, c));
            }
        }
        
        if(allLCats!=null)
            allLCats.sort();
        if(selectedLCats!=null)
            selectedLCats.sort();
        
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
            else if (sTemp.getSObjectType() == PartnerCategoryLead__c.sObjectType) 
            {

                sTemp = (PartnerCategoryLead__c) sTemp;
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
            if((rightOptionsHidden!=null) && (rightOptionsHidden.length()>0))
            {
            
                leadController.save();
                accountid = leadController.getId();
                sp = Database.setSavePoint();
                if(accountid !=null)
                {
                    if(tempMember.campaignId!=null)
                    {
                        List<CampaignMember> mList=[select leadid from campaignmember where leadid=:accountid  Limit 1];
                        if(mList.size()==0)
                        {
                            CampaignMember cml = new CampaignMember();
                            cml.campaignid = tempMember.campaignId;
                            cml.leadid = accountid ;
                            insert cml ;
                        }
                    }
                }        
            
                
                List <SelectOption> options = new List <SelectOption> ();
                String message = '';
                String[] parts = rightOptionsHidden.split('&');
        
        
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
                    newRecord.Partner_Lead__c = accountid;
                    newRecord.Name = so.getLabel();
                    newRecord.Sort_Order__c = sortOrderL;
                    message += so.getLabel();    
                    newRecordsList.add(newRecord);
                }
                
                System.debug('message ' + message);
                System.debug('newRecordsList.size ' + newRecordsList.size());
                
                if (newRecordsList.size()>= 0) 
                {
                    // get existing records and delete them and insert new record
                    List <Partner_Category__c> delRecordsList = new List <Partner_Category__c> ();
                    delRecordsList = [select 
                                                id 
                                        from 
                                                Partner_Category__c 
                                        where 
                                                Partner_Lead__c = : accountid];
                    
                    List <Lead> leadTemp = [Select 
                                                    Category__c 
                                            from 
                                                    Lead 
                                            where 
                                                    id = : accountid];
        
                    if (delRecordsList.size()> 0) 
                        delete delRecordsList;
                    
                    if (newRecordsList.size()> 0) 
                    {
                        leadTemp[0].Category__c = message;
                        update leadTemp;
                        insert newRecordsList;
    
                    } 
                    else if (newRecordsList.size() == 0) 
                    {
                        leadTemp[0].Category__c = '';
                        update leadTemp;
                    }
                    p=new PageReference('/'+leadTemp.get(0).id);
                }
            }
            else
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Fatal,'Please select a value from partner category.'));
                p=null;
            }
        }
        catch(Exception e)
        {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Fatal,e.getMessage());
            ApexPages.addMessage(msg);
            p=null;
            Database.Rollback(sp);            
        }
        return p;
    }
}