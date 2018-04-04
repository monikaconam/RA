public with sharing class CategoryLeadContoller
{
    public CategoryLeadContoller(ApexPages.StandardController controller) 
    {
        Id =Apexpages.currentPage().getParameters().get('id');
        system.debug('##########ACD'+ id);
        CategoryLeadContoller1();
    }

    public SelectOption[] selectedLCats { get;set;}
    public SelectOption[] allLCats { get;set;}
    public String id;
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
    public Boolean showLink{ get;set;}
    public Lead led { get;set;}

    public void CategoryLeadContoller1() 
    {
        outputMessage = '';
        Boolean fTime = false;
        String url = ApexPages.currentPage().getUrl();
        System.debug('url ' + url);
        id = Apexpages.currentPage().getParameters().get('id'); // Lead Id

        if (id != null) 
        {
            led = [SELECT Id, Partner_Channel__c FROM Lead where id = : id];
            selectedLCats= new List <SelectOption> ();
            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryLead__c order by name]);
            List <String> CategoryByLead = generateList([select name from Partner_Category__c where Partner_Lead__c = : id order by Sort_order__c]);

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
            List <Partner_Category__c> tempList = [select id, name from Partner_Category__c where Partner_Lead__c =:id order by sort_Order__c ASC];
            for (Partner_Category__c scTemp: tempList) 
            {
                system.debug('@@@@@@@@@@@'+templist);
                if (fTime == false) 
                {
                    outputMessage = scTemp.name;
                    fTime = true;
                   
                } 
                else 
                {
                    outputMessage += ';' + scTemp.name;
                }
            }
            if (outputMessage == '') 
            {
                show = FALSE;
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
           
            List <String> LCategories = generateList([SELECT Name, id FROM PartnerCategoryLead__c order by name]);
            Set <String> setLCats = new Set <String> ();
            setLCats.addAll(LCategories);
           
            allLCats = new List <SelectOption> ();
            for (String c: setLCats) 
            {
                allLCats.add(new SelectOption(c, c));
            }
           
       } 
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
}