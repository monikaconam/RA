/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MiniLeaderboardController {
    global static String imgUrlLarge {
        get;
    }
    global static String imgUrlSmall {
        get;
    }
    global static Boolean popupsEnabled {
        get;
    }
    global MiniLeaderboardController() {

    }
    @RemoteAction
    global static List<ePrize_Zemzu.MiniLeaderboardController.ContestJson> getActiveContests() {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.ResourceLeaderboard.JsonData getLeaderboard(Id lbId) {
        return null;
    }
    @RemoteAction
    global static List<ePrize_Zemzu.Messages.Message> getMessages() {
        return null;
    }
global class ContestJson {
    global String bulletinBoard;
    global String contestId;
    global String contestName;
    global ePrize_Zemzu.CurrencyUtil.CurrencyFormat currencyFormat;
    global Double displayPriority;
    global Datetime endDate;
    global String format;
    global String goal;
    global Boolean isAdmin;
    global String isoCode;
    global Boolean isParticipant;
    global Datetime startDate;
    global ContestJson(ePrize_Zemzu__Contest__c con) {

    }
}
}
