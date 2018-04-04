/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class JSAPI {
    global JSAPI() {

    }
    @AuraEnabled
    @RemoteAction
    global static void acknowledgeCoachingNote(l11_sc.JSAPI.RequestFilter rf) {

    }
    @AuraEnabled
    @RemoteAction
    global static void acknowledgeSuccessPlan(l11_sc.JSAPI.RequestFilter rf) {

    }
    @AuraEnabled
    @RemoteAction
    global static Object cloneConfig(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object deleteActionItem(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object deleteCoachingNote(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object deleteQuestionTemplate(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object deleteSuccessPlan(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object deleteSuccessPlanTemplate(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getActionItems(l11_sc.JSAPI.RequestFilter actionItemRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getChart(l11_sc.JSAPI.RequestFilter chartRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getCoachingNote(l11_sc.JSAPI.RequestFilter coachingRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getCoachingNotes(l11_sc.JSAPI.RequestFilter coachingRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getConfig(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getConfigs(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getHistoricalActivityData(l11_sc.JSAPI.RequestFilter coachingRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getLeaderboard(l11_sc.JSAPI.RequestFilter leaderboardRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getMetricScores(l11_sc.JSAPI.RequestFilter scoreRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getQuestionTemplate(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getQuestionTemplates(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getScheduledGoals(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getSuccessPlan(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getSuccessPlanTemplate(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getSuccessPlanTemplates(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getSuccessPlans(l11_sc.JSAPI.RequestFilter rf) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getTeamAverage(l11_sc.JSAPI.RequestFilter coachingRequest) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveActionItem(l11_sc.ActionItems.ActionItemJSON aiJSON) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveActionItems(List<l11_sc.ActionItems.ActionItemJSON> aijs) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveCoachingNote(l11_sc.CoachingNotes.CoachingNoteJSON cnObject) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static void saveCoachingNoteComment(l11_sc.NoteComments.NoteCommentJSON noteComm) {

    }
    @AuraEnabled
    @RemoteAction
    global static Object saveQuestionTemplate(l11_sc.QuestionTemplates.QuestionTemplateJSON qtJSON) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveScheduledGoal(l11_sc.ScheduledGoals.ScheduledGoalJson sgj) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveSuccessPlan(l11_sc.SuccessPlans.SuccessPlanJSON spObject) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object saveSuccessPlanTemplates(l11_sc.SuccessPlanTemplates.SuccessPlanTemplateJSON sptJSON) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static void sendAcknowledgmentReminder(l11_sc.JSAPI.RequestFilter rf) {

    }
    @AuraEnabled
    @RemoteAction
    global static void sendSuccessPlanAcknowledgmentReminder(l11_sc.JSAPI.RequestFilter rf) {

    }
global class AverageActivityResponse {
    global String configId;
    global String metricId;
    global Double score;
    global AverageActivityResponse() {

    }
}
global class DeleteResponse {
    global Boolean isDeleted;
    global String objectId;
    global DeleteResponse(String objectId, Boolean isDeleted) {

    }
}
global class GetChartResponse {
    global String configId {
        get;
        set;
    }
    global String metricId {
        get;
        set;
    }
    global l11_sc.Chart.ChartData result {
        get;
        set;
    }
    global String teamId {
        get;
        set;
    }
    global String timeframe {
        get;
        set;
    }
    global GetChartResponse() {

    }
}
global class HistoricalActivity {
    global Double score;
    global Double target;
    global String timeframe;
    global HistoricalActivity() {

    }
}
global class HistoricalActivityResponse {
    global String configId;
    global List<l11_sc.JSAPI.HistoricalActivity> historicalActivityData;
    global String metricId;
    global String userId;
    global HistoricalActivityResponse() {

    }
}
global class JSAPIException extends Exception {
}
global class RequestFilter {
    global String configId;
    global List<Date> dates;
    global Long endDateMillis;
    global String managerId;
    global String metricId;
    global Integer month;
    global String objectId;
    global Integer queryLimit;
    global Long startDateMillis;
    global String teamId;
    global String timeframe;
    global String userId;
    global List<String> userIds;
    global Integer year;
    global RequestFilter() {

    }
}
}
