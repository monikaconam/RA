trigger CheckLeadExistTgr on GetFeedback_Survey__c (after insert) {

    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            GetFeedBackHandler.getFeedbackList(Trigger.new);
        }
    }
}