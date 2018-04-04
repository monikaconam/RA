/*
@Name            : Five9OpportunityRecordTrg
@Author          : SS Conam
@Date            : July 14, 2015
@Description     : Creates Five9LSP__Five9_List_Item__c record on Opportunity insertion.

@Revision History
@Author          : DS-Conam
@Date            : Nov 3, 2015
@Description     : Modified the Five9 Namespace from Five9PS to Five9LSP due to change in Five9 namespace.

*/

trigger Five9OpportunityRecordTrg on Opportunity (after delete, after insert, after undelete) {
    
    if(trigger.isInsert || trigger.isUndelete){
        Five9OppHandlerCls.checkFive9OppOnInsert(trigger.newMap);
    }
    
    if(trigger.isDelete){
        Five9OppHandlerCls.checkFive9OppOnDelete(trigger.old);
    }
}