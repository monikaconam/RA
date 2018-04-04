public class OppObject_Detail 
{
    public List<ObjectTypeDetail> Objectsl{get;set;}
    public String superTabName {get;set;}
    
    public OppObject_Detail(String superTabName, Id oppId)
    {
        this.superTabName = superTabName;
        this.Objectsl = tabsInformation(oppId);
    }
    
    public List<ObjectTypeDetail> tabsInformation(Id oppId)
    { 
        List<ObjectTypeDetail> objTypeDetail = new List<ObjectTypeDetail>();
        
        /* Profile access dependent code to be written here */
        List<String> selectedNotesRT = new List<String>{
                                                        'Opportunity','Sales Check List',
                                                        'Visa Info','Underwriting','Merchant',
                                                        'Opportunity Bank'
                                                        };
        for(String nrt:selectedNotesRT)
        {
            /*Code required: Get all the fields of the different objects via Describe. */
            objTypeDetail.add(new ObjectTypeDetail(nrt,'4343434343',oppId));
        }
        return objTypeDetail; 
    }
    
    class ObjectTypeDetail
    { 
        public string objTabName{get;set;}
        public String objectTypeId {get;set;}
        public String oppId {get;set;}
        public Opportunity_Tab_Detail oppTabDetail{get;set;}
        public ObjectTypeDetail(String objTabName,String recordTypeId, Id oopme)
        {
            this.objTabName = objTabName;
            this.objectTypeId = objectTypeId;
            //this.oppTabDetail = new Opportunity_Tab_Detail(oopme); Uncomment this for Ext JS Feature
            this.oppId = oopme;
        }
    }
}