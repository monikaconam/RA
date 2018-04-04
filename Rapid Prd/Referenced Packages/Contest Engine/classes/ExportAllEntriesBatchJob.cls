/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ExportAllEntriesBatchJob implements Database.Batchable<SObject>, Database.Stateful {
    global Integer actionRecordsProcessed;
    global String contestId;
    global String csvHeader;
    global List<String> csvRows;
    global Integer emailsWithAttachmentsSent;
    global String filterTextForEmail;
    global ePrize_Zemzu.Contest fullContest;
    global Integer lastRecordNumberSentInExport;
    global String leaderboardRankByField;
    global Integer MAX_RECORDS_PER_EMAIL;
    global String query;
    global ePrize_Zemzu.Team team;
    global String teamIdToFilterOn;
    global List<String> teamMemberIdsToFilterOn;
    global Integer totalActionCount;
    global String userIdToFilterOn;
    global Id userWhoCreatedJob;
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
}
