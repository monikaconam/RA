/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Messages {
    global Messages() {

    }
    webService static List<ePrize_Zemzu.Messages.Message> get() {
        return null;
    }
global class Message {
    @WebService
    webService String contestId;
    @WebService
    webService Datetime deliverAfter;
    @WebService
    webService String link;
    @WebService
    webService Id messageId;
    @WebService
    webService String text;
    @WebService
    webService String title;
    @WebService
    webService String type;
    @WebService
    webService String userId;
    global Message(ePrize_Zemzu__Message__c message) {

    }
    global Message(String text, String link) {

    }
    global Message(String title, String text, String link, String userId) {

    }
}
}
