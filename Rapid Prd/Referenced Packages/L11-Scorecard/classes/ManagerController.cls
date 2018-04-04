/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ManagerController {
    global ManagerController() {

    }
    @RemoteAction
    global static List<l11_sc.ScorecardConfigs.ScorecardConfigJson> getAllConfigsForManager() {
        return null;
    }
    @RemoteAction
    global static l11_sc.ManagerController.GetAllMetricScoresForConfigResponse getAllMetricScoresForConfig(String configId, String userId) {
        return null;
    }
    @RemoteAction
    global static List<l11_sc.ManagerScore> getAllMetricScoresForManager(String configId) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object getLPILeaderboard(String configId, String teamId) {
        return null;
    }
    @RemoteAction
    global static l11_sc.Leaderboard.LeaderboardData getLeaderboardForMetric(String configId, String metricId, String timeframe) {
        return null;
    }
    @RemoteAction
    global static Object getManagerGoals(String configId, String teamId, String metricId) {
        return null;
    }
    @RemoteAction
    global static l11_sc.ManagerController.GetPlotPointsForMetricResponse getPlotPointsForMetric(String configId, String metricId, String timeframe) {
        return null;
    }
    @RemoteAction
    global static l11_sc.ManagerController.GetPlotPointsForMetricResponse getPlotPointsForMetricTeam(String configId, String metricId, String timeframe, String teamId) {
        return null;
    }
    @RemoteAction
    global static Object getTargets(String configId, String teamId, String metricId) {
        return null;
    }
    @RemoteAction
    global static l11_sc.ManagerScore getUpdatedMetricScoreForManager(String configId, String metricId) {
        return null;
    }
    @RemoteAction
    global static l11_sc.ManagerScore getUpdatedMetricScoreForManagerByTeam(String configId, String metricId, String teamId) {
        return null;
    }
    @RemoteAction
    global static Object saveGoals(List<l11_sc.ManagerController.GoalObject> goals) {
        return null;
    }
    @RemoteAction
    global static List<l11_sc.ManagerScore> setAllGoalsForManager(List<l11_sc.ManagerScore> scores) {
        return null;
    }
global class GetAllMetricScoresForConfigResponse {
    global String configId {
        get;
        set;
    }
    global List<l11_sc.MetricScore> scores {
        get;
        set;
    }
    global String userId {
        get;
        set;
    }
    global GetAllMetricScoresForConfigResponse() {

    }
}
global class GetPlotPointsForMetricResponse {
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
    global GetPlotPointsForMetricResponse() {

    }
}
global class GoalObject {
    global String configId {
        get;
        set;
    }
    global Double goal {
        get;
        set;
    }
    global String metricId {
        get;
        set;
    }
    global String teamId {
        get;
        set;
    }
    global String userId {
        get;
        set;
    }
    global GoalObject() {

    }
}
}
