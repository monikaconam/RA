/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class JobDaemon implements System.Schedulable {
    global JobDaemon() {

    }
    @Future(callout=false)
    global static void assignPermissions() {

    }
    global static void cleanPushTopics() {

    }
    global void doWork() {

    }
    global void execute(System.SchedulableContext SC) {

    }
    global static Boolean getChatterEnabled() {
        return null;
    }
    global Boolean getIsForTesting() {
        return null;
    }
    global String getJobCron() {
        return null;
    }
    global String getJobId() {
        return null;
    }
    global String getJobName() {
        return null;
    }
    global String getJobOwnerId() {
        return null;
    }
    global static void purgeOldActionRecords() {

    }
    global static void purgeOldMessages() {

    }
    @Future(callout=false)
    global static void removeOldChatterGroups() {

    }
    global static void run() {

    }
    global String schedule() {
        return null;
    }
    global static void scheduleContests() {

    }
    global void sendJobCompleteEmail() {

    }
    global void sendJobCompleteEmailWithMessage(String message) {

    }
    @Future(callout=false)
    global static void sendNotifications(String jobOwnerId) {

    }
    global static void sendNotificationsBatch(String jobOwnerId) {

    }
    global void setIsForTesting(Boolean isForTesting) {

    }
    global void setJobCron(String cron) {

    }
    global void setJobName(String name) {

    }
    @Deprecated
    @Future(callout=true)
    global static void setupChanceToWin(Boolean isForTesting) {

    }
    global void unschedule() {

    }
}
