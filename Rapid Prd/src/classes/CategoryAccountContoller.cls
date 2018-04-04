public class CategoryAccountContoller 
{
    public categoryAccountContoller(ApexPages.StandardController controller) 
    {
        Id =Apexpages.currentPage().getParameters().get('id');
        system.debug('##########ACD'+ id);
        categoryAccountContoller1();
    }

    public SelectOption[] selectedCats { get;set;}
    public SelectOption[] allCats { get;set;}
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
    public Account acc { get;set;}

    public void categoryAccountContoller1() 
    {
        outputMessage = '';
        Boolean fTime = false;
        String url = ApexPages.currentPage().getUrl();
        System.debug('url ' + url);
        id = Apexpages.currentPage().getParameters().get('id'); // Account Id

        if (id != null) 
        {
            acc = [SELECT Id, Partner_Channel__c FROM Account where id = : id];

            selectedCats= new List <SelectOption> ();

            List <String> ACategories = generateList([SELECT Name, id FROM PartnerCategoryAccount__c order by name]);
            List <String> CategoryByAccount = generateList([select name from Partner_Category__c where Partner_Account__c = : id order by sort_order__c]);


            //create set to remove selected element
            Set <String> setCats = new Set <String> ();
            setCats.addAll(ACategories);

            Set <String> setCatByAccount = new Set <String> ();
            setCatByAccount.addAll(CategoryByAccount);

            setCats.removeAll(setCatByAccount);

            allCats = new List <SelectOption> ();
            for (String c: setCats) 
            {
                allCats.add(new SelectOption(c, c));
            }

            for (String c: setCatByAccount) 
            {
                selectedCats.add(new SelectOption(c, c));
            }

            List <Partner_Category__c> tempList = [select id, name from Partner_Category__c where Partner_Account__c =: id order by sort_Order__c ASC];
            for (Partner_Category__c scTemp: tempList) 
            {
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
            List <String> ACategories = generateList([SELECT Name, id FROM PartnerCategoryAccount__c order by name]);
            Set <String> setCats = new Set <String> ();
            setCats.addAll(ACategories);
           
            allCats = new List <SelectOption> ();
            for (String c: setCats) 
            {
                allCats.add(new SelectOption(c, c));
            }           
       } 
    }

    private List <String> generateList(List <sobject> sobj) 
    {
    
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
}