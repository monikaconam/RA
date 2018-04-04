/**
 *********************************************************************************************************************
 * Module Name   : SendAcceptedOffers Webservice
 * Description   :  This method will get Opp Offers for Biz2Credit
 * Throws        : <Any Exceptions/messages thrown by this class/triggers>
 * Calls         : <Any classes/utilities called by this class | None if it does not call>
 * Test Class    :
 *
 * Organization  : Rainmaker Associates LLC
 *
 * Revision History:-
 * Version  Date           Author           WO#         Description of Action
 * 1.0      12/19/2012     Milligan                 Initial Version
 *******************************************************************************************************************
 **/
 @RestResource(urlMapping = '/SendAcceptedOffers/*')
global with sharing class SendAcceptedOffers {

    @HttpPost
    global static ReturnSendOfferDetails doPost(OpportunityOffer ofr) {

        RestResponse res = RestContext.response;

        Oppr_Offer__c oppOffer = new Oppr_Offer__c();
        if (ofr.Source == 'B2C') {
            ofr.Source = 'Biz2Credit';
        }
        if (ofr.Source != null && ofr.Source != 'Biz2Credit') {
            res.StatusCode = 400;
            res.addHeader('Error', 'Invalid Source System - HTTP Error 400');
            return new ReturnSendOfferDetails('false', 'Invalid Source System - HTTP Error 400', 'Null');
        }

        if (ofr != null && (ofr.ExternalID <> NULL && ofr.ExternalID <> '')) {

            String id = ofr.ExternalID;
            System.debug('SendAcceptedOffers WS OffierID==>' + ofr.OfferID);
            System.debug('SendAcceptedOffers WS id==>' + id);

            Opportunity opp = new Opportunity();

            opp = [SELECT 
                        id, external_id__c, status__c 
                    FROM 
                        Opportunity 
                    WHERE 
                        Source_System__c = 'Biz2Credit'
                    AND 
                        External_ID__c = : id LIMIT 1];


            if (opp.id <> null)
            {
                try
                {
                    System.debug('XXXXXXXXxxxxxxxxxx '+ofr.OfferID);
                    oppOffer = [select 
                                        id, Status__c 
                                from 
                                        Oppr_Offer__c 
                                where 
                                        name = : ofr.OfferID LIMIT 1];
                    oppOffer.Status__c = 'Accepted';
                    opp.Amount = oppOffer.Amount__c;
                    opp.Percent_Payback__c = oppOffer.Daily_Percentage__c;
                    opp.Pay_Back_Amount__c = oppOffer.Amount_Sold__c;
                    opp.Estimated_Days_to_Repay__c = oppOffer.Duration__c;
                    opp.Product__c = oppOffer.Product__c;
                    opp.Loan_Term_Days__c = oppOffer.NumOfPayments__c;
                    upsert oppOffer;
                }
                catch (QueryException ex)
                {
                    System.debug('Exception ex...' + ex.getMessage());
                    res.StatusCode = 400;
                    res.addHeader('Error', 'Invalid Offer ID');
                    return new ReturnSendOfferDetails('false', 'Invalid Offer ID', 'Null');

                }
                // Validation Rule 5a                   
                if (opp.Status__c == 'Qualified Offer') {

                    List <Oppr_Document__c> odcList = new List <Oppr_Document__c> ();
                    odcList = [SELECT 
                                        id 
                                FROM 
                                        Oppr_Document__c 
                                WHERE 
                                        RequiredDoc__c = true 
                                AND 
                                        status__c in ('Requested', 'Rejected') 
                                And 
                                        Opportunity__c = : opp.id];
                    System.debug('SendAcceptedOffers WS odc ==>' + odcList.size());

                    if (!odcList.IsEmpty()) {
                        opp.status__c = 'Documents Requested';
                    } else {
                        opp.status__c = 'Reviewing Documents';
                    }
                }
                try
                {
                    update opp;
                }
                catch (QueryException ex)
                {
                    System.debug('Exception ex...' + ex.getMessage());
                }
            }

        }
        return new ReturnSendOfferDetails('true', 'Success', oppOffer.id);
    }


    global class ReturnSendOfferDetails {

        global Integer totalSize = 0;
        global String message;
        global String oppOfferCreatedID;

        global ReturnSendOfferDetails(String success, String message, String oppOfr) {
            this.totalSize = 1;
            this.message = message;
            this.oppOfferCreatedID = oppOfr;

        }
    }
}