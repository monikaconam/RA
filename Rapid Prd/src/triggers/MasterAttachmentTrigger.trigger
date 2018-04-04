trigger MasterAttachmentTrigger on Attachment (after delete)
{
    if (trigger.isAfter)
    {
        if (trigger.isDelete)
        {
            AttachmentTriggerHandler.adAttachment_Delete_SiteSurvey(trigger.old);
        }
    }
}