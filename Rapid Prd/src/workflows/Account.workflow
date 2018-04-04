<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Initial_Funding_Survey</fullName>
        <description>Initial Funding Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Name__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>bd@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/First_Funding_Partner_Survey</template>
    </alerts>
    <alerts>
        <fullName>New_Account_Needs_Marketing_Agreement</fullName>
        <description>New Account Needs Marketing Agreement</description>
        <protected>false</protected>
        <recipients>
            <recipient>rapid@conamtechnologies.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/New_Partner_Account_Needs_Agreement</template>
    </alerts>
    <fieldUpdates>
        <fullName>Bonus_Suppression_Date</fullName>
        <field>Bonus_Suppression_Date__c</field>
        <formula>NOW()</formula>
        <name>Bonus Suppression Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BusDevStatusFieldUpdate</fullName>
        <description>When a contract is maked received, the status is updated to active</description>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>BusDev Status Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CA_Lenders_License_Timestamp</fullName>
        <field>Date_CA_License_was_received__c</field>
        <formula>now()</formula>
        <name>CA Lenders License Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ClawBackNPC</fullName>
        <field>No_Claw_back_Language__c</field>
        <literalValue>1</literalValue>
        <name>ClawBack - NPC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CustomerID</fullName>
        <field>Customer_ID_as_a_number__c</field>
        <formula>Id</formula>
        <name>Customer ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Funding_Survey_DT</fullName>
        <field>Initial_Funding_Survey_Sent__c</field>
        <formula>TODAY()</formula>
        <name>Funding Survey DT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INIFS_Update</fullName>
        <field>Initial_Funding_Survey__c</field>
        <literalValue>1</literalValue>
        <name>INIFS Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoActive</fullName>
        <field>Status__c</field>
        <literalValue>Active</literalValue>
        <name>Status to Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Transfer_Member_Email</fullName>
        <field>Transfer_Member_Email__c</field>
        <formula>Transfer_Member__r.Email__c</formula>
        <name>Update Transfer Member Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Bonus Suppression Date</fullName>
        <actions>
            <name>Bonus_Suppression_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Bonus_Suppression__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CA Lenders License Timestamp</fullName>
        <actions>
            <name>CA_Lenders_License_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CA_Lenders_License__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>InitialFundingSurvey</fullName>
        <actions>
            <name>Initial_Funding_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Funding_Survey_DT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>INIFS_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Fundings__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partners</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Initial_Funding_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Funding_Status__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Account Needs Marketing Agreement</fullName>
        <actions>
            <name>New_Account_Needs_Marketing_Agreement</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partners</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Timothy Sitzler</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Contract_Sent__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>NoClawBack NPC</fullName>
        <actions>
            <name>ClawBackNPC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>contains</operation>
            <value>NPC,Nova</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notContain</operation>
            <value>innovat</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
            <value>World Data Systems (for non NPC deals)</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Potential Partner Follow Up</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Contract_Sent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Contract_Received_Signed__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.No_Fee__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partners</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Potential_Partner_Follow_Up</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Contract_Sent__c</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update Transfer Member Email</fullName>
        <actions>
            <name>Update_Transfer_Member_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Transfer_Member__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Potential_Partner_Follow_Up</fullName>
        <assignedTo>BusinessDevelopment</assignedTo>
        <assignedToType>role</assignedToType>
        <description>According to the Partner Account, an Agreement was sent to a Partner 2 weeks ago and we have yet to receive a Signed Contract back. Please follow up with this potential partner.</description>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Potential Partner Follow Up</subject>
    </tasks>
</Workflow>
