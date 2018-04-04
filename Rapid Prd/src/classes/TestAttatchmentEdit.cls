public with sharing class TestAttatchmentEdit {
  
  Static TestMethod Void TestMethod1()
  {
      CALC.ApexTesting();
        Account acc = TestUtils.createAccount();
      Campaign cam =  TestUtils.createCampaign();
      Opportunity opp = TestUtils.createOpportunity(acc, cam);
      
      Attachment attachment = new Attachment();
      attachment.Body = Blob.valueOf('Test Attatchment on Class');
      attachment.Name = String.valueOf('test.txt');
      attachment.ParentId = opp.Id; 
      try{
      insert attachment;
      }
      catch(Exception Ex){Ex.getMessage();}
      
      ApexPages.currentPage().getParameters().put('id', attachment.Id);
      ApexPages.StandardController sc = new ApexPages.standardController(attachment);
      AttachmentEditExt attatchObj = new AttachmentEditExt(sc);
      attatchObj.save();
      attatchObj.cancel();
  }
}