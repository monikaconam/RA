<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Merchant_One_Site_Survey_Review_Pass</fullName>
        <ccEmails>peter@merchant1solutions.com</ccEmails>
        <ccEmails>justin@merchant1solutions.com</ccEmails>
        <description>Merchant One Site Survey Review Pass</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Site_Survey_Review_Complete</template>
    </alerts>
    <alerts>
        <fullName>SiteSurveyReceived</fullName>
        <ccEmails>riskemployees@rapidadvance.com</ccEmails>
        <description>Site Survey Received</description>
        <protected>false</protected>
        <recipients>
            <recipient>risk@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Notification_of_Site_Survey</template>
    </alerts>
    <alerts>
        <fullName>SiteSurveyRejected</fullName>
        <description>Site Survey Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>SalesAssistants</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/RejectedSiteSurvey</template>
    </alerts>
    <alerts>
        <fullName>Site_Inspection_Alert</fullName>
        <description>Site Inspection Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Site_Survey_Update</template>
    </alerts>
    <alerts>
        <fullName>Site_Survey_Review_Complete</fullName>
        <description>Site Survey Review Complete</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Site_Survey_Review_Complete</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_NVMS_Status_to_Cancelled</fullName>
        <field>NVMS_Status__c</field>
        <formula>&quot;Cancelled&quot;</formula>
        <name>Change NVMS Status to Cancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateOrderCategory</fullName>
        <field>Order_Category__c</field>
        <literalValue>Risk Department</literalValue>
        <name>Update Order Category</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateReviewCompleted</fullName>
        <description>Updates &quot;Review Completed&quot; with NOW()</description>
        <field>Review_Completed__c</field>
        <formula>NOW()</formula>
        <name>Update Review Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Site Survey</fullName>
        <actions>
            <name>SiteSurveyReceived</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Site_Survey__c.CreatedById</field>
            <operation>equals</operation>
            <value>Risk Department</value>
        </criteriaItems>
        <criteriaItems>
            <field>Site_Survey__c.NVMS_Status__c</field>
            <operation>equals</operation>
            <value>Delivered</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Site Survey Blank Document Upon Cancel</fullName>
        <actions>
            <name>Change_NVMS_Status_to_Cancelled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Site_Survey__c.NVMS_Status__c</field>
            <operation>equals</operation>
            <value>Delivered</value>
        </criteriaItems>
        <criteriaItems>
            <field>Site_Survey__c.Inspection_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>This WFR maintains the &quot;Cancel&quot; status if a blank document is received.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Site Survey Rejected</fullName>
        <actions>
            <name>SiteSurveyRejected</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Site_Survey__c.NVMS_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Site Survey Review Complete</fullName>
        <actions>
            <name>Site_Survey_Review_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Site_Survey__c.Review_Status__c</field>
            <operation>startsWith</operation>
            <value>Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Site Survey Review Pass</fullName>
        <actions>
            <name>Merchant_One_Site_Survey_Review_Pass</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Site_Survey__c.Review_Status__c</field>
            <operation>equals</operation>
            <value>Reviewed - Pass</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>equals</operation>
            <value>Merchant One Solutions,LLC dba TwinFold Capital</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Site Survey Update</fullName>
        <actions>
            <name>Site_Inspection_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ischanged( NVMS_Status__c ) ||
ischanged( Review_Completed__c ) ||
ischanged( Review_Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Order Category</fullName>
        <actions>
            <name>UpdateOrderCategory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Site_Survey__c.CreatedById</field>
            <operation>equals</operation>
            <value>Risk Department,Legal Department</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
