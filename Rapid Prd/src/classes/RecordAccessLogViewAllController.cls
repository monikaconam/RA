public class RecordAccessLogViewAllController
{
    List<DataWrapper> dwList{get;set;}
    Id recId;
    String query;
    integer pageSize;
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Viewed_By__c, Viewed_By_Id__c, IP_Address__c, Object_API_Name__c, Object__c, createddate   FROM Record_Access_Log__c where id__c=:recId Order By createddate DESC]));
                con.setPageSize(pageSize);
            }
            return con;
        }
        set;
    }
    public RecordAccessLogViewAllController(ApexPages.StandardController sc)
    {
        recId =ApexPages.CurrentPage().getParameters().get('id');
        pageSize=ApexPages.CurrentPage().getParameters().get('pSize')!=null? 30: 5 ;
        
    }
    
    public List<DataWrapper> getAccessHistory() {
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

     public void last() {
         con.last();
     }
     public void previous() {
         con.previous();
     }

     public void next() {
         con.next();
     }
     
     public class DataWrapper
     {
         public String name{get;set;}
         public String timestamp{get;set;}
         public String id{get;set;}
         
     }

}