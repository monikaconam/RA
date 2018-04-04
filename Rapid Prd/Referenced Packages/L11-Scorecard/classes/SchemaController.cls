/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SchemaController {
    global SchemaController() {

    }
    @RemoteAction
    global static l11_sc.SchemaController.ObjectDescribe describeObject(String obj) {
        return null;
    }
    @RemoteAction
    global static List<l11_sc.SchemaController.ObjectField> getObjectFields(String obj) {
        return null;
    }
    @RemoteAction
    global static List<l11_sc.SchemaController.GetObjectsResult> getObjectOptions() {
        return null;
    }
    @RemoteAction
    global static List<String> getObjects() {
        return null;
    }
global class FieldPicklistValue {
    global Boolean isActive {
        get;
        set;
    }
    global Boolean isDefault {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global FieldPicklistValue() {

    }
}
global class GetObjectsResult implements System.Comparable {
    global String apiName {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global GetObjectsResult() {

    }
    global GetObjectsResult(String name, String apiName) {

    }
    global Integer compareTo(Object compareTo) {
        return null;
    }
}
global class ObjectDescribe {
    global String apiName {
        get;
        set;
    }
    global Integer fieldDescribes {
        get;
        set;
    }
    global List<l11_sc.SchemaController.ObjectField> fields {
        get;
        set;
    }
    global Boolean isShallow {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global String labelPlural {
        get;
        set;
    }
    global Integer picklistDescribes {
        get;
        set;
    }
    global Boolean writable {
        get;
        set;
    }
    global ObjectDescribe() {

    }
}
global class ObjectField {
    global String apiName {
        get;
        set;
    }
    global Boolean calculated {
        get;
        set;
    }
    global Boolean custom {
        get;
        set;
    }
    global Boolean fullyDescribed {
        get;
        set;
    }
    global String helperText {
        get;
        set;
    }
    global Boolean isFilterable {
        get;
        set;
    }
    global Boolean isNameField {
        get;
        set;
    }
    global Boolean isNamePointing {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global String localName {
        get;
        set;
    }
    global List<l11_sc.SchemaController.FieldPicklistValue> picklistValues {
        get;
        set;
    }
    global Integer precision {
        get;
        set;
    }
    global l11_sc.SchemaController.ObjectDescribe relatedObject {
        get;
        set;
    }
    global List<String> relatedTo {
        get;
        set;
    }
    global String relationshipName {
        get;
        set;
    }
    global String type {
        get;
        set;
    }
    global Boolean writable {
        get;
        set;
    }
    global ObjectField() {

    }
}
}
