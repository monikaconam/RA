/**
 *********************************************************************************************************************
 * Module Name   : SendDocuments Webservice
 * Description   : This method will create an attachment.
 * Throws        : HTTP 400
 * Calls         : NONE
 * Test Class    :  SendDocuments_UnitTest   Test Method
 *
 * Organization  : Rainmaker Associates LLC
 *
 * Revision History:-
 * Version  Date           Author           WO#         Description of Action
 * 1.0      01/02/2012     MU               Initial Version
 *******************************************************************************************************************
 **/

global with sharing class SendDocuments 
{
	private static String STATUS_RECIEVED = 'Received';

	webservice static ReturnDocumentWrapper sendDocuments(String externalID, String sourceSystem, String documentedID, 
															String documentName, Blob documentblob, String MiME_Type)
	{
		//   List<DocumentWrapper> docuemntList = new List<DocumentWrapper>();
		RestResponse res = RestContext.response;
		if ((externalID != null && externalID != '') && (null != sourceSystem && '' != sourceSystem)) 
		{
			if (externalID.length() > 30 || sourceSystem.length() > 10) {
				//res.StatusCode  = 400;
				//res.addHeader('Error','Application Error: External ID and sourceSystem should be valid format!');
				return new ReturnDocumentWrapper(externalID, sourceSystem, 'false', 'External ID and sourceSystem should be valid format!', 'null');
			}
		}

		System.debug('externalID..' + externalID);
		System.debug('sourceSystem..' + sourceSystem);
		System.debug('documentedID..' + documentedID);
		System.debug('documentName..' + documentName);


		if (externalID != null && externalID != '')
		{
			List <Opportunity> oppList;
			if (null != sourceSystem && '' != sourceSystem)
			{
				oppList = [SELECT 
									External_ID__c, (SELECT 
															Id, Document_Name__c, Status__c 
														FROM 
															Opprtunity_Documents__r 
														WHERE 
															Name = : documentedID 
														and 
															IsDeleted = false LIMIT 1) 
							From 
									Opportunity 
							WHERE 
									External_ID__c = : externalID
							AND 
									Source_System__c = : sourceSystem LIMIT 1];
			} 
			else
			{
				oppList = [SELECT 
									External_ID__c, (SELECT 
															Id, Document_Name__c, Status__c 
														FROM 
															Opprtunity_Documents__r 
														WHERE 
															Name = : documentedID 
														and 
															IsDeleted = false LIMIT 1) 
							From 
									Opportunity 
							WHERE 
									External_ID__c = : externalID LIMIT 1];
			}
			System.debug('oppList......' + oppList);
			System.debug('oppList.get(0).Opprtunity_Documents__r.......' + oppList.get(0).Opprtunity_Documents__r);
			if (!oppList.isEmpty() && (!oppList.get(0).Opprtunity_Documents__r.isEmpty()))
			{
				// check for null of document name
				String oppDocId = returnOppDoc(oppList.get(0).Opprtunity_Documents__r.get(0), STATUS_RECIEVED);
				if (oppDocId != null) 
				{
					System.debug('OppDocId.........' + OppDocId);
					Attachment natt = new Attachment();
					natt.parentId = oppDocId;
					natt.Name = documentName;
					System.debug('documentblob.......' + documentblob);
					natt.Body = documentblob;
					natt.ContentType = MiME_Type;
					//natt.ContentType = 'txt/html';
					insert natt;
					return new ReturnDocumentWrapper(externalID, sourceSystem, 'true', 'success', natt.Id);
				}
				/*List<Attachment> attachmentList = [SELECT Id, Name, Body FROM Attachment WHERE parentId = :oppList.get(0).Id];   
                    if(!attachmentList.isEmpty()) {
                        for(Attachment att :attachmentList) {
                            docuemntList.add( new DocumentWrapper(att.Id, att.Name, att.Body));   
                        }
                    }*/


			} 
			else 
			{
				//res.StatusCode  = 400;
				//res.addHeader('Error','Application Error: Invalid Source System!');
				return new ReturnDocumentWrapper(externalID, sourceSystem, 'true', 'Invalid Source System!', 'null');
			}
		} 
		else
		{
			//res.StatusCode  = 400;
			//res.addHeader('Error','Application Error: External ID Required!');
			return new ReturnDocumentWrapper(externalID, sourceSystem, 'false', 'fail : External ID Required!', 'null');
		}
		return new ReturnDocumentWrapper(externalID, sourceSystem, 'false', 'fail', 'null');
	}

	private static String returnOppDoc(Oppr_Document__c oppDoc, String status) {
		if (oppDoc != NULL && status != NULL) {
			/* Commented by DS-CONAM
			if (oppDoc.Document_Name__c == 'Contract') {

			}
			*/
			oppDoc.Status__c = status;
			upsert oppDoc;
			if (oppDoc.Id != NULL) {
				return oppDoc.Id;
			}

		}
		return null;
	}


	global class ReturnDocumentWrapper {
		webservice String sourceSystem {get;set;}
		webservice String externalID {get;set;}
		webservice String isSuccess {get;set;}
		webservice String message {get;set;}
		webservice String totalSize {get;set;}
		webservice String attachmentID {get;set;}
		//global List<DocumentWrapper> documentList {get; set;}

		global ReturnDocumentWrapper(String externalID, String sourceSystem, String isSuccess, String message, String attID)
		{
			this.sourceSystem = sourceSystem;
			this.externalID = externalID;
			this.message = message;
			this.totalSize = '1'; // String.valueOf(documentList.size());
			this.isSuccess = isSuccess;
			//this.documentList = documentList;
			this.attachmentID = attID;
		}
	}

	/* 
    global class DocumentWrapper {       
        global String documentedID {get; set;}      
        global String documentName {get; set;}
        global Blob documentblob {get; set;}
                
        global DocumentWrapper(String documentedID, String documentName, Blob documentblob) {
            this.documentedID = documentedID;
            this.documentName = documentName;
            this.documentblob = documentblob; 
        }
        
    }
     */
    /* Commneted by DS-CONAM
	static testMethod void SendDocuments_UnitTest() {

		Opportunity opp = Biz2CreditUtils.createOpportunity();
		Oppr_Document__c OppDoc = Biz2CreditUtils.createOppDoc(opp);
		Attachment att = Biz2CreditUtils.createAttachment(OppDoc);
		// request 1 
		sendDocuments.sendDocuments(opp.External_ID__c, opp.Source_System__c, att.Id, att.Name, att.Body, 'txt');
		// request 2
		sendDocuments.sendDocuments(opp.External_ID__c, '', att.Id, att.Name, att.Body, 'txt');


	}*/
}