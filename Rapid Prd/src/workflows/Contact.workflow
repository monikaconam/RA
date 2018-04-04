<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Birthday_Emails</fullName>
        <description>Birthday Emails</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Birthday_Cards2010</template>
    </alerts>
    <fieldUpdates>
        <fullName>BouncedEmailContactUpdate</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Bounced Email Contact Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EmailOptOutforBouncedContacts</fullName>
        <description>When an email is bounced, the email opt out checkbox is checked.</description>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Email Opt Out for Bounced - Contacts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Birthday Email Workflow</fullName>
        <active>false</active>
        <formula>TODAY() =  DATE(Year(TODAY()),Month(Birthdate),Day(Birthdate))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Bounced Email Contact Rule</fullName>
        <actions>
            <name>BouncedEmailContactUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.EmailBouncedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EmailOptOut - Contacts Bounced</fullName>
        <actions>
            <name>EmailOptOutforBouncedContacts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.EmailBouncedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>If an email in a contact record is bounced, the email opt out check box is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
