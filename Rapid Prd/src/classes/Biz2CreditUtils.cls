/*
@Name               : Biz2CreditUtils
@Author             : MK CONAM
@Date               : 2 DEC 2015
@Description        :  
@Revision History   : Uses of Field Status_Reason__c Commented/Removed By MK Conam 2 Dec 2015
*/

public with sharing class Biz2CreditUtils 
{

    /*COMMNETED DS-CONAM unable to find usage
    public static Account createAccount(Application app) {

        Account acct = new Account();
        acct.name = app.MerchantID;
        acct.BillingCity = app.BusinessCity;
        acct.FederalTaxID__c = app.FederalTaxId;
        insert acct;
        return acct;
    }
    
    public static Contact createContact(Application app) {

        Contact con = new Contact();
        con.FirstName = app.FirstName;
        con.LastName = app.LastName;
        con.MailingCity = app.HomeCity;
        insert con;
        return con;
    }
    */
    public static Opportunity createOpportunity(Application app) {

        Opportunity opp = new Opportunity();
        opp.External_ID__c = app.ExternalID;
        opp.Source_System__c = 'Biz2Credit';
        opp.Status__c = 'Processing';
        // opp.Status_Reason__c = 'Passed';
        opp.Name = app.ExternalID;
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
        return opp;
    }

    public static Date dateConversion(String conDate) {
        Date d;
        try 
        {
            Integer year = integer.valueOf(conDate.substring(0, 4));
            Integer month = integer.valueOf(conDate.substring(4, 6));
            Integer day = integer.valueOf(conDate.substring(6, 8));
            System.debug('year....' + year + '....month...' + month + '..day..' + day);
            d = Date.newInstance(year, month, day);
        } 
        catch (Exception e) 
        {
            return null;
        }
        return d;
    }

    public static String getInstanceURL() {
        // code for fetch server
        String sfdcUrl;
        String sasf = URL.getSalesforceBaseUrl().getHost();
        Integer endpoint = 0;
        endpoint = sasf.indexOf('.visual.force.');

        Integer startpoint = 0;
        startpoint = sasf.indexOf('.');
        System.debug('endpoint.......' + endpoint + '...........startpoint..' + startpoint);
       /*DS-CONAM
            if (endpoint >= 0 && startpoint >= 0)
            {
                sfdcUrl = 'https://' + sasf.substring(startpoint + 1, endpoint) + '.salesforce.com';
            }
        */
        sfdcUrl=(endpoint >= 0 && startpoint >= 0) ? 'https://' + sasf.substring(startpoint + 1, endpoint) + '.salesforce.com': NULL;
        System.debug('sfdcUrl....' + sfdcUrl);
        System.debug('sasf....' + sasf);

        return sasf;
    }

    public static Campaign createCampaign()
    {
        Campaign cam = new Campaign();
        cam.Name = 'testCom';
        cam.type = 'partners';
        insert cam;
        return cam;
    }
    public static Opportunity createOpportunity() 
    {
        Opportunity opp = new Opportunity();
        opp.Name = 'testOp1';
        opp.LeadSource = 'A001';
        opp.Campaign = Biz2CreditUtils.createCampaign();
        opp.CloseDate = System.today();
        opp.StageName = 'Approved';
        opp.External_ID__c = '123456';
        opp.Status__c = 'Contract Available';
        opp.Source_System__c = 'Biz2Credit';
        opp.Current_Processor__c = 'ABC Global System';
        insert opp;
        return opp;
    }
    
    public static Opportunity createOpportunity_new()
    {
        Opportunity opp = new Opportunity();
        opp.Name = 'testOp1';
        opp.LeadSource = 'A001';
        opp.Campaign = Biz2CreditUtils.createCampaign();
        opp.CloseDate = System.today();
        opp.StageName = 'Approved';
        opp.External_ID__c = '' + System.currentTimeMillis();
        opp.Status__c = 'Contract NOT Available';
        opp.Source_System__c = 'B2C';
        opp.Current_Processor__c = 'ABC Global System';
        insert opp;
        return opp;
    }

    public static Oppr_Document__c createOppDoc(Opportunity opp)
    {
        Oppr_Document__c oppDoc = new Oppr_Document__c();
        oppDoc.Document_Name__c = 'testDoc';
        oppDoc.Additional_Notes__c = 'testDoc';
        oppDoc.Opportunity__c = opp.Id;
        insert oppDoc;
        return oppDoc;
    }
    
    public static Attachment createAttachment(Oppr_Document__c oppDoc)
    {
        Attachment attachment = new Attachment();
        attachment.Body = Blob.valueOf('This is Test.');
        attachment.Name = String.valueOf('test.txt');
        attachment.ParentId = oppDoc.Id;
        insert attachment;
        return attachment;
    }

    public static Oppr_Offer__c createOpprOffer(String oppID) {
        Oppr_Offer__c opprOffer = new Oppr_Offer__c();
        opprOffer.Amount__c = 123;
        opprOffer.Amount_Sold__c = 12;
        opprOffer.Opportunity__c = oppID;
        insert opprOffer;
        Oppr_Offer__c oppr = [select 
                                    id, Status__c, Name 
                                from 
                                    Oppr_Offer__c 
                                where 
                                    Id = : opprOffer.id LIMIT 1];
        update oppr;
        return oppr;
    }

}