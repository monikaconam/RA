/**
*********************************************************************************************************************
* Module Name   : GetOffers Webservice
* Description   :  This method will   
* Throws        : <Any Exceptions/messages thrown by this class/triggers>
* Calls         : <Any classes/utilities called by this class | None if it does not call>
* Test Class    :  
* 
* Organization  : Rainmaker Associates LLC
*
* Revision History:-
* Version  Date           Author           WO#         Description of Action
* 1.0      12/16/2012     Milligan                 Initial Version
*******************************************************************************************************************
**/ 
@RestResource(urlMapping='/GetOffers/*')
global with sharing class GetOffers 
{
    
    @HttpGet
    global static  ReturnOfferDetails  doGet() 
    { 
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        List<Oppr_Offer__c> oppOfferRows = new List<Oppr_Offer__c>();
        List<OpportunityOffer> oppOfferList = new List<OpportunityOffer>();     
        
         if(RestContext.request.params.get('id') != null && RestContext.request.params.get('SourceSystem') != null)
         {    
        
            String id = RestContext.request.params.get('id');
            String source = RestContext.request.params.get('SourceSystem');
        
            if (source == 'B2C') 
            {
                source = 'Biz2Credit';
            }
            Opportunity opp = new Opportunity();
                opp = [SELECT 
                           id, external_id__c, Status__c 
                       FROM 
                           Opportunity 
                       WHERE  
                           Source_System__c =: source 
                       AND 
                           External_ID__c =: id limit 1]; 
 
                if(opp.id <> null)
                {
                    oppOfferRows = [SELECT 
                                        Product__c, OwnerId, Opportunity__c, NumOfPayments__c,Notes__c, Name, Id, 
                                        Duration__c, Daily_Percentage__c,Daily_Payment__c, CreatedDate,
                                        Amount__c, Amount_Sold__c, 
                                        LOC_Drawterm__c, LOC_Fee__c, LOC_Limit__c, 
                                        LOC_totalterm__c 
                                    FROM 
                                        Oppr_Offer__c 
                                    WHERE  
                                        opportunity__c =: Opp.id];
                }
                
                if(!oppOfferRows.IsEmpty())
                {
                
                    if(opp.Status__c != 'Qualified Offer' && opp.Status__c != 'Reviewing Documents')
                    {
                        res.StatusCode  = 400;
                        res.addHeader('Error','Offers not available. HTTP Error 400');                  
                        return new ReturnOfferDetails('false', 'Offers not available. HTTP Error 400', oppOfferList);
                    }
            
                    for(Oppr_Offer__c oppf: oppOfferRows)
                    {
                    
                        OpportunityOffer oppOff = new OpportunityOffer();
                    
                        oppOff.OfferID = oppf.Name;
                        oppOff.Amount = oppf.Amount__c;
                        oppOff.Notes = oppf.Notes__c;
                        oppOff.DailyCollection = oppf.Daily_Percentage__c;
                        oppOff.Duration = oppf.Duration__c;
                        oppOff.ProductName = oppf.Product__c;
                        oppOff.Purchase =  oppf.Amount_Sold__c; 
                        oppOff.DailyPayment = oppf.Daily_Payment__c; 
                        oppOff.LOC_Fee = oppf.LOC_Drawterm__c;
                        oppOff.LOC_Limit = oppf.LOC_Fee__c;
                        oppOff.LOC_Drawterm = oppf.LOC_Limit__c;
                        oppOff.LOC_totalterm = oppf.LOC_totalterm__c;
                        oppOff.NumOfPayments = oppf.NumOfPayments__c;                   
                        
                        oppOfferList.add(oppOff);
                    
                   }
            
            }
        }
        else
        {
            res.StatusCode  = 400;
            res.addHeader('Error','No Results Found');              
            return new ReturnOfferDetails('false', 'No Results Found', oppOfferList);           
        }
        
        return new ReturnOfferDetails('true', 'Success', oppOfferList);
    }
    
    global class ReturnOfferDetails 
    {
    
        global Integer totalSize = 0;
        global String message;
        global List<OpportunityOffer> offerOverrideList;
    
        global ReturnOfferDetails(String success, String message, List<OpportunityOffer> records) 
        {
            if(records.size() > 0)
                this.totalSize = records.size();
                this.message = message;
                this.offerOverrideList = records;
        }
    }   
    

}