/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SuccessPlanTemplates {
    global SuccessPlanTemplates() {

    }
global class CustomQuestionJSON {
    global String answeredBy;
    global String name;
    global String placeholder;
    global String question;
    global l11_sc.SuccessPlanTemplates.CustomQuestionOptions questionOptions;
    global Boolean required;
    global Integer sortOrder;
    global String successPlanTemplateId;
    global String type;
    global String visibility;
    global CustomQuestionJSON() {

    }
}
global class CustomQuestionOptions {
    global List<String> selectListOptions;
    global CustomQuestionOptions() {

    }
}
global class SuccessPlanTemplateJSON {
    global Boolean acknowledgmentRequired;
    global Boolean actionItemsDisabled;
    global Boolean actionItemsTasks;
    global Integer assignmentCount;
    global List<l11_sc.QuestionTemplates.CustomQuestionJSON> customQuestions;
    global String description;
    global Integer endingNotificationDays;
    global String name;
    global Boolean scheduledGoalsEnabled;
    global String successPlanTemplateId;
    global SuccessPlanTemplateJSON() {

    }
}
}
