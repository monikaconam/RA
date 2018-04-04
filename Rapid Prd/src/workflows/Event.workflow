<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Event_with_details</fullName>
        <field>Description</field>
        <formula>IF( OR( Object_Type__c = &quot;Lead&quot;,Object_Type__c = &quot;Contact&quot;), &quot;Lead/Contact Link: https://na33.salesforce.com/&quot; +  WhoId + BR()+ BR() +
 Description
,
&quot;Account/Opportunity Link: https://na33.salesforce.com/&quot; +  WhatId + BR()+ BR() +
 Description)</formula>
        <name>Update Event with details</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update event with salesforce link</fullName>
        <actions>
            <name>Update_Event_with_details</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Subject</field>
            <operation>equals</operation>
            <value>Scheduled Follow Up,Second Voice,Mid Call,Documents Needed,Presentation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Event.Object_Type__c</field>
            <operation>equals</operation>
            <value>Lead,Contact,Account,Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
