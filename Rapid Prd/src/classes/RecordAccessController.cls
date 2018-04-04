public class RecordAccessController
{
    List<DataWrapper> dwList{get;set;}
    String objType {get;set;}
    String objAPIName {get;set;}
    public Id recId{get;set;}
    public Integer pageSize{get;set;}
    public String ip{get;set;}
    
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                String query='Select Id, Viewed_By__c, Viewed_By_Id__c, IP_Address__c, Object_API_Name__c, Object__c, ';
                query+='createddate FROM Record_Access_Log__c where id__c=\''+recId+'\' Order By createddate DESC';
                con = new ApexPages.StandardSetController(Database.getQueryLocator(query));
                con.setPageSize(pageSize);
            }
            return con;
        }
        set;
    }
    public RecordAccessController(ApexPages.StandardController sc)
    {
        recId =ApexPages.CurrentPage().getParameters().get('id');
        objType= recId.getSobjectType().getDescribe().getLabel();
        objAPIName=recId.getSobjectType().getDescribe().getName();
        pageSize=9;
    }
    
    public PageReference setIPAddress()
    {
        ip=Apexpages.currentPage().getParameters().get('ipAddr');
        createAccessLog();
        return null;
    }
    
    public PageReference createAccessLog()
    {
        SObject sObj=Database.Query('Select name from '+ objAPIName +' where id=\''+recId+'\'');
                            
        User curUser=[Select
                               id,name
                       from
                               User 
                       where
                               id=:UserInfo.getUserId()];
        try
        {
            Record_Access_Log__c ratObjTemp=new Record_Access_Log__c();
            ratObjTemp.name=String.valueOf(sObj.get('name'));
            ratObjTemp.Id__c=recId;
            ratObjTemp.Viewed_By__c=curUser.name;
            ratObjTemp.Object_API_Name__c=objAPIName;
            ratObjTemp.Object__c =objType;
            ratObjTemp.Viewed_By_Id__c=curUser.Id;
            ratObjTemp.IP_Address__c=ip;
            insert ratObjTemp;
        }
        catch(Exception e)
        {
            String msg='An exception has occurred - '+e.getMessage() +' at '+e.getLineNumber();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Fatal, msg));
        }
        return null;
    }
    
    public List<DataWrapper> getAccessHistory(){
        dwList=new List<DataWrapper>();        
        for (Record_Access_Log__c record : (List<Record_Access_Log__c>)con.getRecords())
        {
            DataWrapper dwTemp= new DataWrapper();
            dwTemp.name=record.Viewed_By__c;
            dwTemp.timestamp=record.createddate.format();
            dwTemp.id=record.Viewed_By_Id__c;
            dwList.add(dwTemp);
        }
        return dwList;
    }

    public Boolean hasNext {
        get {
                return con.getHasNext();
            }
        set;
    }
    public Boolean hasPrevious {
        get {
                return con.getHasPrevious();
            }
        set;
    }

    public Integer pageNumber {
        get {
                return con.getPageNumber();
            }
        set;
    }
    public Integer recordCount {
        get {
            return con.getResultSize();
        }
        set;
    }
    
    public void first() {
    con.first();
    }
    public void last() 
    {
    con.last();
    }
    public void previous() {
        con.previous();
    }
    public void next() 
    {
        con.next();
    }
    
    public class DataWrapper
    {
         public String name{get;set;}
         public String timestamp{get;set;}
         public String id{get;set;}
    }

}