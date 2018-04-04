<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Leadership_Email</fullName>
        <description>Leadership Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>rapid@conamtechnologies.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Internal_Emails/QA_Escalation_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Task_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Funding_Call_Task</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Task Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>QA Escalation Email</fullName>
        <actions>
            <name>Leadership_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>QA - Not Interested Escalation,QA - Client Relations Escalation</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
