/**
*********************************************************************************************************************
* Module Name   :   ApplicantCredit_Ctrl 
* Description   :   This class is a controller for ApplicantCreditPage and is used to displays the Applicant and Credit information 
                    for an opportunity alongwith the 2 principal contact of the opportunity if present.
* Organization  :   ConAm Technologies Pvt. Ltd.

* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      08/06/2015     MKConAm                      Modify
*   
*******************************************************************************************************************
**/
/*
@Name               : ApplicantCredit_Ctrl 
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field confirmed information_from_qc__c Commented/Removed By MK Conam 2 Dec 2015
*/
public class ApplicantCredit_Ctrl {

    public Opportunity oppRecord {get;set;}
    public Contact conRecord {get;set;}
    public Contact pricipal1Record {get;set;}
    public Contact pricipal2Record {get;set;}
    public Decimal applicant1FICO { get;private set;}
    public Decimal applicant1PrevFICO { get;private set;}
    public String creditBureauSummary { get;private set;}
   // public String equityInHome {get;private set;}

    public ApplicantCredit_Ctrl()
    {
        String oppId = ApexPages.currentPage().getParameters().get('Id');
        conRecord = new Contact();

        if (oppId != null && oppId.trim() != '') {
            List <Opportunity> oppList = [SELECT
                                                Id, AccountId, Manual_Applicant_1_FICO_Score__c,
                                                Mortgage_Delinquent__c, Tax_Liens_Open__c, Judgements_Open__c, Previous_FICO__c,
                                                Individual_Bankruptcies__c, Does_the_Merchant__c, 
                                                CRR__c, Contact__c, Applicant_2_FICO__c, Previous_Opportunity__r.Applicant_2_FICO__c, 
                                                Contact__r.Name, ContactID__c, Manual_Applicant_2_FICO_Score__c
                                            FROM
                                                Opportunity
                                            WHERE
                                                Id = : oppId LIMIT 1];

            if (!oppList.isEmpty())
            {
                oppRecord = oppList.get(0);
                Map <ID, String> contactRoleMap = new Map <ID, String> ();
                Set <String> roleSet = new Set <String> ();

                List <OpportunityContactRole> oppRoleList = [SELECT
                                                                    ContactId, Role
                                                                FROM
                                                                    OpportunityContactRole
                                                                WHERE
                                                                    OpportunityId = : oppRecord.Id
                                                                AND
                                                                    Contact.IsDeleted = false
                                                                AND
                                                                    (Role = 'Principal 1'
                                                                or 
                                                                    Role = 'Principal 2')];


                for (OpportunityContactRole oppRole: oppRoleList) 
                {
                    if ((!roleSet.contains(oppRole.Role)) && (!contactRoleMap.containsKey(oppRole.ContactId))) {
                        contactRoleMap.put(oppRole.ContactId, oppRole.Role);
                        roleSet.add(oppRole.Role);
                    }
                }

                if (!contactRoleMap.IsEmpty())
                {
                    List <Contact> contactList = [SELECT
                                                            c.Id, c.Name, c.ContactID__c, c.AccountId,
                                                            c.Principal_Home_Phone__c,
                                                            c.Principal_2_Mobile__c, c.OwnershipPercentage__c,
                                                            c.MobilePhone, c.MailingStreet,
                                                            c.MailingState, c.MailingPostalCode,
                                                            c.MailingCity, c.Fax, c.Email, c.Date_of_Birth__c
                                                    FROM
                                                            Contact c
                                                    WHERE
                                                            Id
                                                    IN      : contactRoleMap.keySet()];
                    if (!contactList.isEmpty())
                    {
                        for (Contact cTemp: contactList) 
                        {
                            if (contactRoleMap.get(cTemp.Id) == 'Principal 1') 
                            {
                                pricipal1Record = cTemp;
                            } 
                            else if (contactRoleMap.get(cTemp.Id) == 'Principal 2')
                            {
                                pricipal2Record = cTemp;
                            }
                        }
                    }
                }

                applicant1FICO = FormulaFieldUtility.ccApplicant1FICO;
                applicant1PrevFICO = FormulaFieldUtility.applicant1PrevFICO;
                creditBureauSummary = FormulaFieldUtility.creditBureauSummary;
               // equityInHome = FormulaFieldUtility.equityInHome;
            }
        } 
        else
         {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity Id Does not Exist!'));
        }
    }



    public PageReference doSave() {
        try {
            /* if(conRecord != null && conRecord.AccountId == null) {
                    conRecord.AccountId = oppRecord.AccountId;  
                }
                System.debug('>>>>' + conRecord.Principal_2_First_Name__c);
                upsert conRecord;  
                
                if(conRecord.Id != null && oppRecord.Contact__c == null) {
                    oppRecord.Contact__c = conRecord.Id;   
                }*/

            upsert oppRecord;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.confirm, 'Applicant & Credit Information Saved Successfully!'));
            } 
            catch (Exception e) 
            {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
            }
        return null;
    }

}