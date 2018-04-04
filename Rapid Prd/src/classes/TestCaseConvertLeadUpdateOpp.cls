public class TestCaseConvertLeadUpdateOpp

{ 
   static testMethod Void testMethodtrgUpdateOpportunity()    
    {
        Lead ld =  new Lead();
        ld.firstname = 'fn';
        ld.lastname = 'ln';
        ld.status = 'Open-Not Contacted';
        ld.company = 'ABC';
        insert ld;
        Database.LeadConvert lc = new database.LeadConvert(); 
        lc.setLeadId(ld.id);
        lc.setConvertedStatus('Converted');
    }
}