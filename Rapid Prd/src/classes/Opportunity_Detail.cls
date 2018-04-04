global class Opportunity_Detail 
{
        public String opprtunityName{get;set;}
        public String opportunityNumber{get;set;}
        public String accountName{get;set;}
        public String accountOwnerName{get;set;}        
        public String ownerName{get;set;}
        public Opportunity objOpportunity {get;set;}
        public Opportunity_Detail(Opportunity  objOpportunity)
        {
            this.objOpportunity = objOpportunity;
            this.ownerName = MainClass.getAllUsers.get(objOpportunity.Account.OwnerId).Name;
        }
        
        public Opportunity_Detail(String opprtunityName,String opportunityNumber)
        {
            this.opprtunityName = opprtunityName;
            this.opportunityNumber = opportunityNumber;
        }
        
        public Opportunity_Detail(String opprtunityName,String opportunityNumber,String accountName)
        {
            this.opprtunityName = opprtunityName;
            this.opportunityNumber = opportunityNumber;
            this.accountName = accountName;
        }
        
        public Opportunity_Detail(String opprtunityName,String opportunityNumber,String accountName,String accountOwnerName)
        {
            this.opprtunityName = opprtunityName;
            this.opportunityNumber = opportunityNumber;
            this.accountName = accountName;
            this.accountOwnerName = accountOwnerName;
        }
    
    /*
    public string recordTypeName{get;set;}
    public string latestNoteValues{get;set;}
    public string lastModifiedBy{get;set;}
    public string lastModifiedDate{get;set;}
    public string profileImageUrl{get;set;}
    
    public Opportunity_Detail(){
        
    }
    public Opportunity_Detail(String recordTypeName,String latestNoteValues,String lastModifiedBy,String lastModifiedDate,String profileImageUrl){
        this.recordTypeName = recordTypeName;
        this.latestNoteValues = latestNoteValues;            
        this.lastModifiedBy = lastModifiedBy;
        this.lastModifiedDate = lastModifiedDate;
        this.profileImageUrl = profileImageUrl;
    }*/
}