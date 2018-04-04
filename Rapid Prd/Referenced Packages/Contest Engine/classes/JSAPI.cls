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
    @RemoteAction
    global static ePrize_Zemzu.JSAPI.ContestValidationResponse validateContest(ePrize_Zemzu.JSAPI.RequestFilter rf) {
        return null;
    }
global class ContestValidationResponse {
    global Id contestId;
    global List<String> errors;
    global Boolean isValid;
    global ContestValidationResponse(Id contestId, Boolean isValid, List<String> errors) {

    }
}
global class JSAPIException extends Exception {
}
global class RequestFilter {
    global String objectId;
    global RequestFilter() {

    }
}
}
