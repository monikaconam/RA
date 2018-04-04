public with sharing class LeadCloneController{

    public PageReference onCancel() {
        PageReference  p = new PageReference ('/00Q/o');
        return p;
    }
    
    ApexPages.StandardController leadController;
    public SelectOption[] leftOptions { get;set;}
    public SelectOption[] rightOptions { get;set;}
    public CampaignMember tempMember { get;set;}
    public SelectOption[] selectedLCats { get;set;}
    public SelectOption[] allLCats { get;set;}
    public Lead parentDetails{ get;set;}
    public String rId;
    
    public LeadCloneController()
    {
        
        rId = Apexpages.currentPage().getParameters().get('parentId'); // Lead Id
        parentDetails=new Lead();
        
        
        if(rId !=null)
        {
            parentDetails=[SELECT 
                                    id,name, Company, Status,FirstName, Salutation, Leadsource, LastName,
                                    HasOptedOutOfFax, Email, Phone, HasOptedOutOfEmail, Phone_Ext__c,
                                    Campaign_Name_Upload__c, MobilePhone, Street, City, State,category__c,
                                    postalcode,Country, Partner_Channel__c,How_did_you_hear_about_us__c,
                                    Other_services_offered__c, Paper_they_concentrate_on__c, Average_dollar_amount_funded__c,
                                    NumberOfEmployees, Rating, Fax 
                           from
                                   Lead
                           where
                                   id=: rId  Limit 1];

        }
        
              
       // leadController = controller;
        generateData();
        rightOptions=new List<SelectOption>();
        leftOptions=new List<SelectOption>();
     
         String str1='';
         for(PartnerCategoryLead__c cTemp :[SELECT Name, id FROM PartnerCategoryLead__c])
         {
             leftOptions.add(new Selectoption(cTemp.name, cTemp.name));
             if(str1=='')
                 str1=str1+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             else
                 str1=str1+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             
         }
         
         leftOptionsHidden=str1;
         System.debug('str1' +leftOptionsHidden);
         if(rId!=null)
         {
             str1='';
             for(Partner_Category__c cTemp :[select name from Partner_Category__c where Partner_Lead__c = : rId])
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
         
         
         generateData();  
    }
    
    public LeadCloneController(ApexPages.StandardController controller) 
    {
        rId = Apexpages.currentPage().getParameters().get('parentId'); // Lead Id
        parentDetails=new Lead();
        
        
        if(rId !=null)
        {
            parentDetails=[SELECT 
                                    id,name, Company, Status,FirstName, Salutation, Leadsource, LastName,
                                    HasOptedOutOfFax, Email, Phone, HasOptedOutOfEmail, Phone_Ext__c,
                                    Campaign_Name_Upload__c, MobilePhone, Street, City, State,category__c,
                                    postalcode,Country, Partner_Channel__c,How_did_you_hear_about_us__c,
                                    Other_services_offered__c, Paper_they_concentrate_on__c, Average_dollar_amount_funded__c,
                                    NumberOfEmployees, Rating
                           from
                                   Lead
                           where
                                   id=: rId  Limit 1];

        }
        
              
        leadController = controller;
        generateData();
        rightOptions=new List<SelectOption>();
        leftOptions=new List<SelectOption>();
     
         String str1='';
         for(PartnerCategoryLead__c cTemp :[SELECT Name, id FROM PartnerCategoryLead__c])
         {
             leftOptions.add(new Selectoption(cTemp.name, cTemp.name));
             if(str1=='')
                 str1=str1+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             else
                 str1=str1+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8')+'&'+EncodingUtil.urlEncode(cTemp.name,'UTF-8');
             
         }
         
         leftOptionsHidden=str1;
         System.debug('str1' +leftOptionsHidden);
         if(rId!=null)
         {
             str1='';
             for(Partner_Category__c cTemp :[select name from Partner_Category__c where Partner_Lead__c = : rId])
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
    /** Commented By -MK Conam 18 Nov 2015 **/
   /**  private void setOptions(SelectOption[] options, String value)
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
    public String leftOptionsHidden {
        get;
        set {
            system.debug('left 1' +value + ' '+leftOptions);
            
            leftOptionsHidden = value;
           // setOptions(leftOptions, value);
        }
    }

    // Backing for hidden text field containing the options from the right list
    public String rightOptionsHidden {
        get;
        set {
            system.debug('right 1' +value + ' '+rightOptionsHidden );
            rightOptionsHidden = value;
            //setOptions(rightOptions, value);
        }
    }

    public void generateData() {
    
       tempMember = new CampaignMember();

        if (rId != null)
        {
           // leadObj  = [SELECT Id, Partner_Channel__c FROM Lead where id = : rId ];
            selectedLCats = new List <SelectOption> ();
            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryLead__c]);
            List <String> CategoryByLead = generateList([select name from Partner_Category__c where Partner_Lead__c = : rId ]);

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
        SavePoint sp = Database.setSavePoint();
        try
        {
            
            sp=Database.setSavePoint();
            Lead newLead=new Lead();
            
            newLead.Company=parentDetails.Company;
            newLead.Status=parentDetails.Status;
            newLead.FirstName=parentDetails.FirstName; 
            newLead.Salutation=parentDetails.Salutation; 
            newLead.Leadsource=parentDetails.LeadSource; 
            newLead.LastName=parentDetails.Lastname;               
            newLead.HasOptedOutOfFax=parentDetails.HasOptedOutOfFax; 
            newLead.Email=parentDetails.email;
            newLead.Phone=parentDetails.phone; 
            newLead.HasOptedOutOfEmail=parentDetails.HasOptedOutOfEmail; 
            newLead.Phone_Ext__c=parentDetails.Phone_Ext__c;
            newLead.MobilePhone=parentDetails.MobilePhone; 
            newLead.Street=parentDetails.Street; 
            newLead.City=parentDetails.City; 
            newLead.State=parentDetails.State;
            newLead.category__c=parentDetails.category__c;
            newLead.postalcode=parentDetails.postalcode;
            newLead.Country=parentDetails.Country; 
            newLead.Partner_Channel__c=parentDetails.Partner_Channel__c;
            newLead.How_did_you_hear_about_us__c=parentDetails.How_did_you_hear_about_us__c;
            newLead.Other_services_offered__c=parentDetails.Other_services_offered__c; 
            newLead.Paper_they_concentrate_on__c=parentDetails.Paper_they_concentrate_on__c; 
            newLead.Average_dollar_amount_funded__c=parentDetails.Average_dollar_amount_funded__c;
            newLead.NumberOfEmployees=parentDetails.NumberOfEmployees; 
            newLead.Rating=parentDetails.Rating;
            
                                    
            insert newLead;
            
            CampaignMember cml = new CampaignMember();
            cml.campaignid = tempMember.campaignId;
            cml.leadid =newLead.id;
            insert cml ;
            
            List <SelectOption> options = new List <SelectOption> ();
            
            String[] parts = rightOptionsHidden.split('&');
    
            system.debug('rightOptionsHidden' +rightOptionsHidden);
            for (Integer i = 0; i <parts.size() / 2; i++) {
                options.add(new SelectOption(EncodingUtil.urlDecode(parts[i * 2], 'UTF-8'),
                EncodingUtil.urlDecode(parts[(i * 2) + 1], 'UTF-8')));
            }
            system.debug('options is ' +options );
            List <Partner_Category__c> newRecordsList = new List <Partner_Category__c> ();
   
            String message='';
            integer sortOrderL = 0;
            for (SelectOption so: options) 
            {
                sortOrderL++;
                Partner_Category__c newRecord = new Partner_Category__c();
                
                newRecord.Partner_Lead__c = newLead.id;
                newRecord.Name = so.getLabel();
                newRecord.Sort_Order__c = sortOrderL;
                newRecordsList.add(newRecord); 
                message=message+';'+so.getLabel();
                
            }
             system.debug('newRecordsList is ' +newRecordsList);
              system.debug('rId is ' +rId);
           system.debug('message is ' +message);
           system.debug('newRecordsList is ' +newRecordsList.size());
            if (newRecordsList.size()> 0)
            {
                newLead.Category__c = message;
                update newLead;
                insert newRecordsList;
            } 
            
            p=new PageReference('/'+newLead.id) ;  

        }
        catch(Exception e)
        {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Fatal,e.getMessage()+'@'+e.getLineNumber());
            ApexPages.addMessage(msg);
            Database.Rollback(sp);
            p=null;
        }
        return p;

    }
}