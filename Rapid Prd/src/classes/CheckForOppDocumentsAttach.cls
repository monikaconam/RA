/**
 *********************************************************************************************************************
 * Module Name   : CheckForOppDocumentsAttach for Biz2Credit Webservice
 * Description   :  This method will check to see if an Opportunity has all requested documents submitted for Biz2Credit
 * Throws        : <Any Exceptions/messages thrown by this class/triggers>
 * Calls         : <Any classes/utilities called by this class | None if it does not call>
 * Test Class    :
 *>
 * Organization  : Rainmaker Associates LLC
 * @RestResource(urlMapping='/rest/SubmitApplication/*')
 * Revision History:-
 * Version  Date           Author           WO#         Description of Action
 * 1.0      01/11/2012     Milligan                      Initial Version
 * Rule 5b Change of Status from "Qualified Offer" to  "Reviewing Documents"
 *   If all the documents are submitted and the status of the documents are all received "Received" the status of the
 *   Application/Opportunity should changed to be "Reviewing Documents"
 *******************************************************************************************************************
 **/
public with sharing class CheckForOppDocumentsAttach {

  //DS-CONAM  List <Oppr_Document__c> oppDocs = new List <Oppr_Document__c> ();

    public static void updateFromOppDocument(List <Oppr_Document__c> odc)
    {

        List <Opportunity> oppsToSearch = new List <Opportunity> ();
        List <String> oppIds = new List <String> ();

        for (Oppr_Document__c oppDoc: odc) 
        {
            //Get all the opportunities
            oppIds.add(oppDoc.opportunity__c);
        }

        oppsToSearch = [SELECT
                                id, status__c
                        FROM
                                Opportunity
                        WHERE
                                status__c in ('Qualified Offer', 'Documents Requested')
                        AND
                                id
                        IN
                                :oppIds];

        if (!oppsToSearch.IsEmpty()) 
            checkAttachments(oppsToSearch, false);

    }

    public static void updateFromOpp(List <Opportunity> opps)
    {
        List <Opportunity> oppsToSearch = new List <Opportunity> ();

        for (Opportunity oTemp : opps)
        {
            if (oTemp.status__c == 'Qualified Offer') 
                oppsToSearch.add(oTemp);
        }

        if (!oppsToSearch.IsEmpty()) 
            checkAttachments(oppsToSearch, true);
    }

    //modeIsBefore is true if coming from Opp trigger with (before  Insert Update)
    //modeIsBefore is false if coming from Opp Doc trigger with (after  Insert Update)
    public static void checkAttachments(List <Opportunity> oppList, Boolean modeIsBefore) 
    {
        List <Opportunity> updateListOpp = new List <Opportunity> ();
        List <Id> oppIds = new List <Id> ();

        for (Opportunity o: oppList) 
        {
            //Get Opps with right status
            if (o.status__c == 'Qualified Offer' || o.status__c == 'Documents Requested') 
                oppIds.add(o.id);
        }

        // Find all docs for all opp that have been request, sent or received
        Map <Id, Oppr_Document__c> oppDocsMap = new Map <Id, Oppr_Document__c> (
                                    [SELECT
                                            Id, status__c, opportunity__c, opportunity__r.Status__c
                                    FROM
                                            Oppr_Document__c
                                    WHERE
                                            status__c <> 'Rejected'
                                    AND
                                            opportunity__c
                                    IN
                                            : oppIds]);

        if (!oppDocsMap.IsEmpty()) 
        {

            List <Attachment> attList = new List <Attachment> ();

            attList = [ SELECT
                                id, ParentID
                        FROM
                                Attachment
                        WHERE
                                parentID
                        IN
                                : oppDocsMap.keySet()];

            Map <String, String> attachmentMap = new Map <String, String> ();

            for (Attachment att: attList) 
            {
                attachmentMap.put(att.parentId, att.parentId);
            }

            //loop thru the Opportunities again to find doc and attachment
            // update opp status if all attachments are there
            for (Opportunity opp: oppList) 
            {

                List <Id> foundDocIDs = new List <Id> ();

                //get all the docs for this opportunity put in list of ids
                //if any is not in received mode than break; olny checking opp
                // with all Opp Doc in Received Status
                for (Oppr_Document__c od: oppDocsMap.values()) 
                {
                    if (od.Status__c <> 'Received')
                    {
                        foundDocIDs.clear();
                        break;
                    }
                    if (opp.id == od.opportunity__c)
                    {
                        //found a doc for this opportunity
                        foundDocIDs.add(od.id);
                    }
                }
                // search the attachment for all  the opportunity docs
                if (!foundDocIDs.IsEmpty()) 
                {
                    Boolean allAttachmentsFound = true;

                    for (Id oId: foundDocIDs) 
                    {
                        if (!attachmentMap.containsKey(oId))
                        {
                            allAttachmentsFound = false;
                            break;
                        }

                    }

                    if (allAttachmentsFound == true)
                    {
                        //Opportunity 
                        if (modeIsBefore) 
                            opp.Status__c = 'Reviewing Documents';
                        else 
                        {
                            //Oppr Doc
                            opp.Status__c = 'Reviewing Documents';
                            updateListOpp.add(opp);
                        }
                    }
                } //if foundDocIds
            } //for opp           

            if (!updateListOpp.IsEmpty() && !ModeIsBefore)
                update updateListOpp;

        } //if
    } //check method
}