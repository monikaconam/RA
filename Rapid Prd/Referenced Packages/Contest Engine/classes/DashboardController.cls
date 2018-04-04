/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DashboardController {
    global DashboardController() {

    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson cloneContest(String contestId) {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson cloneTemplate(String contestId) {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestResponse deleteContests(List<Id> contestIds) {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestResponse finalizeContests(List<String> contestIds) {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestResponse getContests() {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson newContest() {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson newContestFromTemplate(String templateId) {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson newParentContest() {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.DashboardController.ContestJson newTemplate() {
        return null;
    }
global class ContestCreator {
    global String email;
    global String firstName;
    global String fullPhotoUrl;
    global String lastName;
    global String smallPhotoUrl;
    global String userId;
    global ContestCreator() {

    }
}
global class ContestJson {
    global Integer behaviorCount;
    global Set<String> behaviorObjects;
    global String contestEditUrl;
    global String contestId;
    global String contestName;
    global ePrize_Zemzu.DashboardController.ContestCreator createdBy;
    global Datetime createdDate;
    global Datetime endDate;
    global Boolean isDraft;
    global Boolean isFinalized;
    global Boolean isHidden;
    global Boolean isTemplate;
    global Datetime lastModified;
    global ePrize_Zemzu.DashboardController.ContestCreator modifiedBy;
    global String parentContestId;
    global Boolean preventChatterGroup;
    global Datetime startDate;
    global String templateId;
    global String templateType;
    global ContestJson() {

    }
}
global class ContestResponse {
    global List<ePrize_Zemzu.DashboardController.ContestJson> contests;
    global List<ePrize_Zemzu.DashboardController.ContestJson> templates;
    global ContestResponse() {

    }
}
}
