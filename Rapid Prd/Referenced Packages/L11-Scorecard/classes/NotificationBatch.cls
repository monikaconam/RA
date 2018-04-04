/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class NotificationBatch implements Database.Batchable<SObject>, Database.Stateful {
    global NotificationBatch() {

    }
    global static Boolean digestShouldRun() {
        return null;
    }
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global static Id run() {
        return null;
    }
    global static Id run(Integer scope) {
        return null;
    }
    global void setDigestTargetUsers(Set<Id> digestTargetUserIds) {

    }
    global void setWarningNotifications(List<l11_sc__Notification_Log__c> warningNotes) {

    }
    global void setWarningTargetUsers(Set<Id> warningTargetUserIds) {

    }
    global static Boolean shouldRun() {
        return null;
    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
    global static Boolean warningShouldRun() {
        return null;
    }
}
