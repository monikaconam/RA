/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ResourceLeaderboard implements ePrize_Zemzu.MotownResource {
global class JsonData {
    global String bulletinBoard;
    global String contestId;
    global String contestName;
    global ePrize_Zemzu.CurrencyUtil.CurrencyFormat currencyFormat;
    global Boolean displayGoals;
    global Decimal displayPriority;
    global Datetime endDate;
    global String format;
    global String goal;
    global Boolean hasTeams;
    global String imgUrl;
    global String isoCode;
    global Integer participantCount;
    global List<ePrize_Zemzu.ResourceLeaderboard.ParticipantJsonData> participants;
    global String rankingStyle;
    global Datetime startDate;
    global String status;
    global Integer teamCount;
    global List<ePrize_Zemzu.ResourceLeaderboard.TeamJsonData> teams;
    global JsonData() {

    }
}
global class ParticipantJsonData {
    global String contestUserId;
    global String email;
    global String firstName;
    global Decimal goal;
    global String imgUrl;
    global String lastName;
    global Decimal perDay;
    global Integer place;
    global Decimal score;
    global String userId;
    global ParticipantJsonData() {

    }
}
global class TeamJsonData {
    global Decimal goal;
    global String imgUrl;
    global Decimal perDay;
    global Integer place;
    global Decimal score;
    global String teamId;
    global List<String> teamMemberIds;
    global String teamName;
    global TeamJsonData() {

    }
}
}
