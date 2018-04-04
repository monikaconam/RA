<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alexandra_All_Approved_Conditions</fullName>
        <description>Alexandra All Approved Conditions</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Operations</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>QualifiedWebLeadTemplates/Approval_With_Conditions</template>
    </alerts>
    <alerts>
        <fullName>Eligible_for_Rapid_Funding</fullName>
        <description>Eligible for Rapid Funding</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Eligible_for_Rapid_Funding</template>
    </alerts>
    <fieldUpdates>
        <fullName>Calculate_Percent_Paid_Off</fullName>
        <field>Percent_Paid_Off__c</field>
        <formula>Total_Repay_Amount__c  /  Purchase_Amount__c</formula>
        <name>Calculate Percent Paid Off</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Called_Confirmed_Add_l_Signer_Email</fullName>
        <field>Called_Confirmed_Add_l_Signer_Email__c</field>
        <literalValue>Not Applicable</literalValue>
        <name>Called Confirmed Add&apos;l Signer Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Called_Confirmed_Add_l_Signer_Number</fullName>
        <field>Called_Confirmed_Add_l_Signer_Number__c</field>
        <literalValue>Not Applicable</literalValue>
        <name>Called Confirmed Add&apos;l Signer Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Initial_File_Review</fullName>
        <field>Initial_File_Review__c</field>
        <formula>NOW()</formula>
        <name>Initial File Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UW_Assigned_DTS</fullName>
        <field>UW_Assigned_Date_Stamp__c</field>
        <formula>NOW()</formula>
        <name>UW Assigned DTS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateUniqueOpportunity</fullName>
        <description>Populate Opp ID</description>
        <field>OppIDD__c</field>
        <formula>Opportunity__c</formula>
        <name>UpdateUniqueOpportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alexandra Approval With Conditions</fullName>
        <actions>
            <name>Alexandra_All_Approved_Conditions</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>UW</description>
        <formula>and( ISPICKVAL(Opportunity__r.Processing_Representative__c, &quot;Alexandra&quot;) , All_Approved_With_Conditions_Met__c  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Percent Paid Off</fullName>
        <actions>
            <name>Calculate_Percent_Paid_Off</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(Total_Repay_Amount__c)) , NOT(ISBLANK(Purchase_Amount__c) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Eligible for Rapid Funding</fullName>
        <actions>
            <name>Eligible_for_Rapid_Funding</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Underwriting__c.Eligible_for_Rapid_Funding__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Initial File Review</fullName>
        <actions>
            <name>Initial_File_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged( Initial_File_Review_Complete__c ) &amp;&amp;
Initial_File_Review_Complete__c=TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Karl Approval With Conditions</fullName>
        <active>false</active>
        <description>UW</description>
        <formula>and( ISPICKVAL(Opportunity__r.Processing_Representative__c, &quot;Philippe&quot;) , All_Approved_With_Conditions_Met__c  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Test Decisioning</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Underwriting__c.Decision_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>UW Assignment DTS</fullName>
        <actions>
            <name>UW_Assigned_DTS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2) OR 3</booleanFilter>
        <criteriaItems>
            <field>Underwriting__c.Auto_Decisioned_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Underwriting__c.Underwriter_Assigned__c</field>
            <operation>equals</operation>
            <value>AUTO DECISION</value>
        </criteriaItems>
        <criteriaItems>
            <field>Underwriting__c.Underwriter_Assigned__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Umaru Approval With Conditions</fullName>
        <active>false</active>
        <description>UW</description>
        <formula>and( ISPICKVAL(Opportunity__r.Processing_Representative__c, &quot;Umaru&quot;) , All_Approved_With_Conditions_Met__c  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>UpdateUniqueOpportunity</fullName>
        <actions>
            <name>UpdateUniqueOpportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>To avoid duplicate underwriting records</description>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
