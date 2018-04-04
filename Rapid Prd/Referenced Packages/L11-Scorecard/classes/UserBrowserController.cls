/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UserBrowserController {
    global UserBrowserController() {

    }
    @RemoteAction
    global static l11_sc.UserBrowserController.UserQueryResult getUsers(l11_sc.UserBrowserController.UserQueryConfig config) {
        return null;
    }
global class UserJson {
    global String email;
    global String firstName;
    global String imgUrlLarge;
    global String imgUrlSmall;
    global Boolean isScorecardAdmin;
    global Boolean isScorecardUser;
    global String lastName;
    global l11_sc.UserBrowserController.UserProfileJson profile;
    global l11_sc.UserBrowserController.UserRoleJson role;
    global l11_sc.UserBrowserController.UserProfileJson scorecardProfile;
    global String title;
    global String userId;
    global String username;
    global UserJson() {

    }
}
global class UserProfileJson {
    global String profileId;
    global String profileName;
    global UserProfileJson() {

    }
}
global class UserQueryConfig {
    global Boolean excludeAssigned;
    global List<String> excludedUserIds;
    global List<String> names;
    global Boolean permissionSetsOnly;
    global List<String> profiles;
    global List<String> roles;
    global List<String> titles;
    global UserQueryConfig() {

    }
}
global class UserQueryResult {
    global l11_sc.UserBrowserController.UserQueryConfig config;
    global Integer count;
    global List<l11_sc.UserBrowserController.UserJson> users;
    global UserQueryResult() {

    }
    global UserQueryResult(l11_sc.UserBrowserController.UserQueryConfig config, List<l11_sc.UserBrowserController.UserJson> users) {

    }
}
global class UserRoleJson {
    global String roleId;
    global String roleName;
    global UserRoleJson() {

    }
}
}
