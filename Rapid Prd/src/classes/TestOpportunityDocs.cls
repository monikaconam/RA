@isTest

public class TestOpportunityDocs
{
    static testMethod void testDoc()
    {
        Test.startTest();
         OpportunityDocs oppOD = new OpportunityDocs();
         
         oppOD.DocumentName ='TestDocumentName';
         oppOD.Description ='TestDescription';
         oppOD.AdditionalNotes ='TestAdditionalNotes';
         oppOD.DocumentID ='TestDocumentID';
         oppOD.Status ='TestStatus';
         Test.stopTest();  
         
    }
}