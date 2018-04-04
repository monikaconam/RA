/*
@Name               : OppGreenTreeViewController
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  

*/
public class OppGreenTreeViewController {

    public Opportunity opp {get;set;}
    public String iTemp {get;set;}
    public Green_Tree_Oppy_Extension__c gtNew {get;set;}
    public Boolean isEdit {get;set;}
    public Boolean show {get;set;}
   
    public List <Green_Tree_Oppy_Extension__c> gtOppExtnList;

    public OppGreenTreeViewController(ApexPages.StandardController controller) {
        try {
            isEdit = false;
            show = false;
            //Parent Rapid Opportunity
            this.iTemp = controller.getId();
            this.opp = [SELECT
                                recordtypeId, recordtype.name, Point_of_contact__c, Method_of_Contact__c,
                                CALC_Link__c, notes_Link__c, ownerId, owner.name, Current_ROI__c, New_Split__c, Percent_Paid_Off__c,
                                AE_Commission__c, StageName,  Not_Interested_Reason__c,  Rapid_Opportunity__c,
                                Previous_Sales_Rep__c,  Description, Account.name, Accountid,If_Renewal_Preceding_Rapid_Opportunity__c,
                                contact__c, name, Business_Category__c, Opportunity_Number__c, If_Renewal_Preceding_Opportunity__c,
                                Amount, Advance_ID__c, RENEWAL_DATE__c, Probability, Pay_Back_Amount__c, Percent_Payback__c,
                                Product__c, Renewal__c, Estimated_Days_to_Repay__c,
                                Signed_Contract_Received__c, Estimated_Daily_Repay__c, CloseDate, LeadSource, CampaignId, Campaign.name,
                                Purpose_of_Funds__c,SIC_CODE__c, Gross_monthly_sales__c, 
                                Date_Split_Changed__c, Renewal_Eligibility__c, Remaining_Balance__c, Pay_Off_ROI__c, Advance_Payoff_Date__c
                        FROM
                                Opportunity
                        WHERE
                                Id = : this.iTemp];

            this.gtNew = [SELECT
                                Advance_Payoff_Date__c, Average_CC_Sales__c, Average_Gross_Sales__c, Calculate_Due_Dates__c, Daily_Payment_Amount__c,
                                Estimated_Balance__c, Estimated_Days_to_Repay__c, Green_Tree_Converted_Date__c, GTF_Approved_Date__c,GTF_Contract_Stips_Date__c,
                                GTF_Declined_Date__c, GTF_Defaulted_Date__c, GTF_Follow_Up_Date__c, GTF_Funded_Date__c, GTF_Not_Intrested_Date__c,
                                GTF_Submitted_Date__c, Id, Name, No_of_Payments__c, Opportunity__c, ProductTerm__c, Product__c, Amount_Sold__c, Amount__c
                        FROM
                                Green_Tree_Oppy_Extension__c
                        WHERE
                                Opportunity__c = : opp.id];
            show = true;
        } catch (Exception e) {
            show = false;
            String s;
            if (e.getMessage().startsWith('List has no rows') == true) s = 'The related GreenTree record was not found.';
            else s = e.getMessage();

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, s));
        }

    }

    public Pagereference edit() {
        isEdit = true;
        return null;
    }

    public PageReference onSave() {
        PageReference p;

        try {
            upsert gtNew;
            List <Opportunity> newOppList = new List < Opportunity > ();
           

            gtOppExtnList = [Select
            Id, Amount__c, Amount_Sold__c, Opportunity__c
            from
            Green_Tree_Oppy_Extension__c
            where
            Opportunity__c = : opp.id LIMIT 1];

          

            p = new PageReference('/apex/GreenTreeInfoDisplay?id=' + gtNew.Opportunity__c);
            p.setRedirect(true);
        } catch (Exception e) {
            p = null;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'An Exception has occured -' + e.getMessage() + '-' + e.getLineNumber()));
        }

        isEdit = false;
        return p;
    }

    public PageReference onCancel() {
        //isEdit = false;
        return new PageReference('/apex/GreenTreeInfoDisplay?id=' + gtNew.opportunity__C).setRedirect(true);

    }
}