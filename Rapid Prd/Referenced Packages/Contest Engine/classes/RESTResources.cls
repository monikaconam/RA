/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RESTResources {
    global RESTResources() {

    }
global class ActionJSON {
    global Datetime actionDate;
    global String actionId;
    global String actionName;
    global String behaviorName;
    global String contestId;
    global String contestName;
    global ePrize_Zemzu.CurrencyUtil.CurrencyFormat currencyFormat;
    global String email;
    global String firstName;
    global String format;
    global String isoCode;
    global String lastName;
    global String teamName;
    global String userId;
    global Decimal value;
    global ActionJSON() {

    }
}
global class BehaviorJSON {
    global String behaviorId;
    global String behaviorName;
    global Integer points;
    global BehaviorJSON() {

    }
}
global class ContestJSON {
    global List<ePrize_Zemzu.RESTResources.BehaviorJSON> behaviors;
    global String chatterGroupId;
    global String contestId;
    global String contestName;
    global ePrize_Zemzu.CurrencyUtil.CurrencyFormat currencyFormat;
    global Datetime endDate;
    global List<ePrize_Zemzu.RESTResources.ContestUserJSON> participants;
    global List<ePrize_Zemzu.RESTResources.PrizeJSON> prizes;
    global String rankingStyle;
    global Datetime startDate;
    global List<ePrize_Zemzu.RESTResources.ContestUserJSON> teamParticipants;
    global ContestJSON() {

    }
}
global class ContestUserJSON {
    global String contestId;
    global String contestUserId;
    global String email;
    global String firstName;
    global String format;
    global Decimal goal;
    global String imgUrl;
    global String isoCode;
    global String lastName;
    global Decimal perDay;
    global Integer place;
    global Decimal score;
    global String teamId;
    global String type;
    global String userId;
    global ContestUserJSON() {

    }
}
global class PrizeJSON {
    global String description;
    global Integer place;
    global String prizeId;
    global String prizeName;
    global Decimal value;
    global PrizeJSON() {

    }
}
global class ProfileJSON {
    global List<ePrize_Zemzu.RESTResources.ContestJSON> currentContests;
    global String email;
    global String firstName;
    global String fullPhotoUrl;
    global String lastName;
    global String orgId;
    global String orgName;
    global List<ePrize_Zemzu.RESTResources.ContestJSON> pastContests;
    global String smallPhotoUrl;
    global Integer topTens;
    global Integer totalContests;
    global String userId;
    global Integer wins;
    global ProfileJSON() {

    }
}
}
