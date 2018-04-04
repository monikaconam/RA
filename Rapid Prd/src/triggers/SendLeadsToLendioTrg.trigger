trigger SendLeadsToLendioTrg on Lead (after insert, after update) {
    
    try{
        Set<Id> leadIds = new Set<Id>();
        for(Lead ld : Trigger.new){
            
            Boolean lendioPartner = false;
            if(ld.Partners__c !=  null) {
                if(ld.Partners__c.contains(';')){
                    List<String> lenPartnerList = ld.Partners__c.split(';');
                    for(String s : lenPartnerList){
                        if(s =='Lendio'){
                            lendioPartner = true;
                        }
                    }
                }else if(ld.Partners__c=='Lendio'){
                    lendioPartner = true;
                }
            }
                
            if(lendioPartner && ld.Lendio_Timestamp__c == null && (trigger.isInsert || (Trigger.isUpdate && ld.Partners__c != Trigger.oldMap.get(ld.Id).Partners__c))){
                 
                String reqField = 'The following required field(s) are missing for Lendio. Please populate them in order to transfer this Lead. </br>';
                Boolean reqFieldFound = false;
                
                if(ld.Email == null){
                    reqFieldFound = true;
                    reqField += ' Email </br>';
                } 
                if(ld.Phone == null){
                    reqFieldFound = true;
                    reqField += ' Phone </br>';
                }
                if(ld.Gross_Monthly_Sales_Cur__c== null){
                    reqFieldFound = true;
                    reqField += ' Gross Monthly Sales </br>';
                }
                if(ld.DateBusinessStarted__c== null){
                    reqFieldFound = true;
                    reqField += ' Business Open Date </br>';
                }
                if(ld.Industry == null){
                    reqFieldFound = true;
                    reqField += ' Industry </br>';
                }
                if(reqFieldFound){
                    ld.addError(reqField,false);  
                }
                
                if(ld.Industry == 'Automotive' || ld.Industry == 'Auto Parts' || ld.Industry == 'Not For Profit' ){
                    ld.addError('This lead has a restricted Industry value and cannot be sent to partner.');
                }
                
                leadIds.add(ld.Id);
            }
        }
         if(leadIds.size()>0){
            LendIOSendleadsHandler.sendLeadsToPartner(leadIds);
        }
    }
    catch(Exception e){
        System.debug('An exception has occurred: ' + e.getMessage() + ' - ' + e.getLineNumber());
    }
}