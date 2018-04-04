/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Motown {
    global static ePrize_Zemzu.Motown.Response res;
    global Motown() {

    }
    global static void error(Exception ex) {

    }
    global static void error(String error) {

    }
    global static void fieldError(String fieldName, String message) {

    }
    global static Boolean getBooleanValue(System.JSONParser parser) {
        return null;
    }
    global static Datetime getDateTime(System.JSONParser parser) {
        return null;
    }
    global static Date getDateValue(System.JSONParser parser) {
        return null;
    }
    global static Decimal getDecimalValue(System.JSONParser parser) {
        return null;
    }
    global static Long getLongValue(System.JSONParser parser) {
        return null;
    }
    global static String getStringValue(System.JSONParser parser) {
        return null;
    }
    global static void handleDeleteResult(Database.DeleteResult dr, Map<String,String> keys) {

    }
    global static void handleDeleteResult(List<Database.DeleteResult> drs, Map<String,String> keys) {

    }
    global static void handleSaveResult(Database.SaveResult sr, Map<String,String> keys) {

    }
    global static void handleSaveResult(List<Database.SaveResult> srs, Map<String,String> keys) {

    }
    global static void handleUpsertResult(Database.UpsertResult ur, Map<String,String> keys) {

    }
    global static void handleUpsertResult(List<Database.UpsertResult> urs, Map<String,String> keys) {

    }
    global static ePrize_Zemzu.Motown.Response respond() {
        return null;
    }
    global static ePrize_Zemzu.Motown.Response respond(Integer statusCode) {
        return null;
    }
    global static ePrize_Zemzu.Motown.Response respond(Object body) {
        return null;
    }
    global static ePrize_Zemzu.Motown.Response respond(Integer statusCode, Object body) {
        return null;
    }
    global static void setResponseBody(Object body) {

    }
global class Response {
    global Object body {
        get;
        set;
    }
    global List<String> errors {
        get;
        set;
    }
    global Map<String,List<String>> fieldErrors {
        get;
        set;
    }
    global Integer statusCode {
        get;
        set;
    }
    global Response() {

    }
}
}
