global with sharing class Application {
    //Contact 
    global String firstName {get;set;}
    global String lastName {get;set;}
    global String jobTitle {get;set;}
    global String dateOfBirth {get;set;} ////FORMAT YYYYMMDD

    global String homeAddress1 {get;set;}
    global String homeAddress2 {get;set;}
    global String homeCity {get;set;}
    global String homeState {get;set;}
    global String homeZip {get;set;}
    global String homeMobilePhone {get;set;}
    global Integer borrowerOwnershipPct {get;set;}
    global String ssn {get;set;}
    global String residenceStatus {get;set;}
    global String homeCountry {get;set;}
    // Account
    global String merchantID {get;set;}
    global String legalBusName {get;set;}
    global String industry {get;set;}
    global String subIndustry {get;set;}
    global String businessAddress1 {get;set;}
    global String businessAddress2 {get;set;}
    global String businessCity {get;set;}
    global String businessState {get;set;}
    global String businessZip {get;set;}
    global String businessMobilePhone {get;set;}
    global String businessCountry {get;set;}

    global Integer avgAnnualRevenue {get;set;}
    global String legalStructure {get;set;}
    global String ageOfBusinessYrs {get;set;} //FORMAT YYYYMMDD
    global String ageOfBusinessMonths {get;set;}
    global String federalTaxId {get;set;}

    // Opportunity
    global String loanIntent {get;set;}
    global String existingCashAdvance {get;set;}
    global Decimal cashAdvance {get;set;}
    global Decimal mcaCompany {get;set;}
    global Integer avgMonthSales {get;set;} //*
    global String majorCreditCardsProc {get;set;} //*   
    global Integer avgMonthTrans {get;set;}
    global Integer ccSalesLastMonth {get;set;}
    global Integer ccSalesLast1Month {get;set;}
    global Integer ccSalesLast2Month {get;set;}
    global Integer ccSalesLast3Month {get;set;}
    global Integer numOfTransLastMonth {get;set;}
    global Integer numOfTrans1Month {get;set;}
    global Integer numOfTrans2Month {get;set;}
    global Integer numOfTrans3Month {get;set;}

    global String sourceSystem {get;set;}
    global String leadSource {get;set;}//A001*
    global String campaignID {get;set;} // find default*
    global String closeDate {get;set;} //FORMAT YYYYMMDD

    global String stage {get;set;} // Prospecting*
    global String product {get;set;} // Product__c*
    global String oppRecType{get;set;} //find *
    global String externalID {get;set;} //*

}