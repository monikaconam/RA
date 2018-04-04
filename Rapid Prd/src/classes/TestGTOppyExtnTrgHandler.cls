@isTest

private class TestGTOppyExtnTrgHandler {
    static testmethod void initialCommissionAmtTest() {
        Test.startTest();
        
        Campaign campTemp = new Campaign(Name = 'Green Tree Funding', IsActive = True, Status = 'Sent');
            insert campTemp;
        
        Opportunity oppt1 = new Opportunity(Name ='Test GTF1',
                            StageName = 'Customer Won',
                            Amount = 10000,
                            CloseDate = System.today()  ,
                            LeadSource = 'Radio' ,
                            CampaignId =  campTemp.Id , 
                            Renewal_Funded_Amount__c =  1000
                            );
                            
        insert oppt1;
        
                            
        Opportunity oppt2 = new Opportunity(Name ='Test GTF2',
                            StageName = 'Customer Won',
                            Amount = 10000,
                            CloseDate = System.today()  ,
                            LeadSource = 'Radio' ,
                            CampaignId =  campTemp.Id , 
                            Renewal_Funded_Amount__c =  1000
                            ); 
                            
        insert oppt2;
                            
        Opportunity oppt3 = new Opportunity(Name ='Test GTF3',
                            StageName = 'Customer Won',
                            Amount = 10000,
                            CloseDate = System.today()  ,
                            LeadSource = 'Radio' ,
                            CampaignId =  campTemp.Id , 
                            Renewal_Funded_Amount__c =  1000
                            );  

        insert oppt3;  
        
        Opportunity oppt4 = new Opportunity(Name ='Test GTF4',
                            StageName = 'Customer Won',
                            Amount = 10000,
                            CloseDate = System.today()  ,
                            LeadSource = 'Radio' ,
                            CampaignId =  campTemp.Id , 
                            Renewal_Funded_Amount__c =  1000
                            );  

        insert oppt4;         
                         
        Green_Tree_Oppy_Extension__c gtoppExtnTemp1 = new Green_Tree_Oppy_Extension__c(Amount_Sold__c = 14000 , 
                                                        Amount__c = 1000, Opportunity__c = oppt1.id);
                                                        
        insert gtoppExtnTemp1;
        
        gtoppExtnTemp1.Amount_Sold__c = 15000 ;
        
        Update gtoppExtnTemp1;
                                                        
        Green_Tree_Oppy_Extension__c gtoppExtnTemp2 = new Green_Tree_Oppy_Extension__c(Amount_Sold__c = 14000 , 
                                                        Amount__c = 1000, Opportunity__c = oppt2.id);
                                                        
        insert gtoppExtnTemp2;
        
        gtoppExtnTemp2.Amount_Sold__c = 15000 ;
        
        Update gtoppExtnTemp2;
                                                             
        Green_Tree_Oppy_Extension__c gtoppExtnTemp3 = new Green_Tree_Oppy_Extension__c(Amount_Sold__c = 14000 , 
                                                        Amount__c = 1000, Opportunity__c = oppt3.id);   
                                                        
        insert gtoppExtnTemp3;
        
        gtoppExtnTemp3.Amount_Sold__c = 15000 ;
        
        Update gtoppExtnTemp3;
        
        Green_Tree_Oppy_Extension__c gtoppExtnTemp4 = new Green_Tree_Oppy_Extension__c(Amount_Sold__c = 14000 , 
                                                        Amount__c = 1000, Opportunity__c = oppt4.id);   
                                                        
        insert gtoppExtnTemp4;
        
        gtoppExtnTemp3.Amount_Sold__c = 16000 ;
        
        Update gtoppExtnTemp4;   
                
        Test.stopTest();
    }
}