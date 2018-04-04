<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Campaign_Added_Decline_Program</fullName>
        <description>Campaign Added Decline Program</description>
        <protected>false</protected>
        <recipients>
            <recipient>BusinessDevelopment</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>SalesAssistants</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Campaign_Added_Decline_Program</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Removed_Decline_Program</fullName>
        <description>Campaign Removed Decline Program</description>
        <protected>false</protected>
        <recipients>
            <recipient>BusinessDevelopment</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>SalesAssistants</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Campaign_Removed_Decline_Program</template>
    </alerts>
    <alerts>
        <fullName>First_Funded_Deal</fullName>
        <description>First Funded Deal</description>
        <protected>false</protected>
        <recipients>
            <recipient>rapid@conamtechnologies.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/First_Funded_Deal_Partner</template>
    </alerts>
    <alerts>
        <fullName>Ini_Funding_Survey</fullName>
        <description>Survey Action for Initial Funding</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Partner_Survey</template>
    </alerts>
    <alerts>
        <fullName>NewPartnerSignedCampaignCreated</fullName>
        <description>New Partner Signed. Campaign Created.</description>
        <protected>false</protected>
        <recipients>
            <recipient>tsitzler@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/NewPartnerCampaignCreated</template>
    </alerts>
    <fieldUpdates>
        <fullName>Auto_Populate_CA_Timestamp</fullName>
        <field>Date_CA_License_was_received_delete__c</field>
        <formula>NOW()</formula>
        <name>Auto Populate CA Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update3</fullName>
        <field>Activity__c</field>
        <literalValue>Inactive</literalValue>
        <name>Field Update3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Send_BD_Notifications_On</fullName>
        <field>BD_Send_Notifications__c</field>
        <literalValue>1</literalValue>
        <name>Send BD Notifications = On</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <field>Status</field>
        <literalValue>Dormant</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status1</fullName>
        <field>Status</field>
        <literalValue>Aborted</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status2</fullName>
        <field>Activity__c</field>
        <literalValue>Inactive</literalValue>
        <name>Update Status2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Dormant</fullName>
        <field>Activity__c</field>
        <literalValue>Dormant</literalValue>
        <name>Update Status to Dormant</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Inactive</fullName>
        <field>Activity__c</field>
        <literalValue>Inactive</literalValue>
        <name>Update Status to Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_funding</fullName>
        <field>Activity__c</field>
        <literalValue>Funding</literalValue>
        <name>Update Status to funding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CA Lenders License Timestamp</fullName>
        <actions>
            <name>Auto_Populate_CA_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>if(Ispickval(ISO_Account__r.CA_Lenders_License__c,&quot;Active&quot;), true, false)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Campaign Added Decline Program</fullName>
        <actions>
            <name>Campaign_Added_Decline_Program</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>(ISNEW()
||
ISCHANGED( Decline_Program__c ))
&amp;&amp;
Decline_Program__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Campaign Removed Decline Program</fullName>
        <actions>
            <name>Campaign_Removed_Decline_Program</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Decline_Program__c )
&amp;&amp;
NOT( Decline_Program__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Dormant to Aborted status</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Status</field>
            <operation>equals</operation>
            <value>Dormant</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Dormant_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status1</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.Formula_Dormant_Partner_Date__c</offsetFromField>
            <timeLength>95</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Funding to Inactive status</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Activity__c</field>
            <operation>equals</operation>
            <value>Funding</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Funding_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Funding_Partner_Flag__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Field_Update3</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.Funding_Partner_Date__c</offsetFromField>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>High Signing to Funding</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Activity__c</field>
            <operation>equals</operation>
            <value>High Signing Activity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.High_Activity_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_funding</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.High_Activity_Partner_Date__c</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>High Signing to Inactive</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Activity__c</field>
            <operation>equals</operation>
            <value>High Signing Activity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.High_Activity_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Inactive</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.High_Activity_Partner_Date__c</offsetFromField>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Inactive to Dormant status</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Activity__c</field>
            <operation>equals</operation>
            <value>Inactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Inactive_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Dormant</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.Inactive_Partner_Date__c</offsetFromField>
            <timeLength>120</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>New Partner Campaign%21</fullName>
        <actions>
            <name>NewPartnerSignedCampaignCreated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Ashley created a new partner campaign.  Signed contract was received from partner.</description>
        <formula>ISNULL( TEXT(Type) ) || TEXT(Type) = &quot;Partners&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Send Notification to BD Override</fullName>
        <actions>
            <name>Send_BD_Notifications_On</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Owner.Alias = &quot;gmack&quot; || 
Owner.Alias = &quot;rflei&quot; || 
Additional_Owner__r.Alias=&quot;gmack&quot; || 
Additional_Owner__r.Alias=&quot;rflei&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submitting to Inactive status</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Activity__c</field>
            <operation>equals</operation>
            <value>Submitting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Submitting_Partner_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status2</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.Submitting_Partner_Date__c</offsetFromField>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
