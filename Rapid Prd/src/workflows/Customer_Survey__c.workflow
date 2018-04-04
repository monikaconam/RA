<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CustomerSatisfactionSurveyReceived</fullName>
        <description>Customer Satisfaction Survey Received</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jbrown@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jlooney@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>risk@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>smensah@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Click_Tools_Templates/Customer_Sat_Survey_Rec_d</template>
    </alerts>
    <rules>
        <fullName>Customer Survey Recieved</fullName>
        <actions>
            <name>CustomerSatisfactionSurveyReceived</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Survey__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
