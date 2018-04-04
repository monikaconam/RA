<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Bid_has_been_created</fullName>
        <description>Bid has been created!</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kaitlinadams@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>snazal@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tzilli@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>zflood@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BOBA_Templates/Bid_Created</template>
    </alerts>
    <alerts>
        <fullName>Contract_Requested</fullName>
        <description>Contract Requested</description>
        <protected>false</protected>
        <recipients>
            <recipient>kaitlinadams@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>zflood@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BOBA_Templates/Contract_has_been_Requested</template>
    </alerts>
    <rules>
        <fullName>Bid Created</fullName>
        <actions>
            <name>Bid_has_been_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2</booleanFilter>
        <criteriaItems>
            <field>Bids__c.Max__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bids__c.Max__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>Email to BA when a bid is created on BOOP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contract Requested</fullName>
        <actions>
            <name>Contract_Requested</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Bids__c.Contract_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sends email to Katie/Zach when a Contract is Requested</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
