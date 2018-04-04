<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Access_to_information_about_account</fullName>
        <description>If Overall satisfaction with aspect to: Access to information about client&apos;s account is Not at all Satisfied and slightly satisfied, an email is sent to Maria.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Access_To_Information_about_Account</template>
    </alerts>
    <alerts>
        <fullName>Accomplish_goals_with_financing</fullName>
        <description>If the value of &quot;Accomplish goals with financing&quot; field is less than 4, an email is sent to Maria.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Accomplish_goals_with_financing</template>
    </alerts>
    <alerts>
        <fullName>BA_not_knowledgeable_and_Accurate</fullName>
        <description>If BA not Knowledgeable enough and Didn&apos;t set accurate expectations,an email is sent to Maria.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_BA_not_knowledgeable_and_Accurate</template>
    </alerts>
    <alerts>
        <fullName>GFS_BA_Service_Rating</fullName>
        <description>When BA Service Rating is less than 4, an email notification is sent to Maria Mahon.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_BA_Service_Rating</template>
    </alerts>
    <alerts>
        <fullName>GFS_Experienced_problem_with_customer_service</fullName>
        <description>When problem faced with the customer service, an email is sent to Sheila.</description>
        <protected>false</protected>
        <recipients>
            <recipient>bhalliman@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bryanstclair@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tbrown@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Experienced_problem_with_customer_service</template>
    </alerts>
    <alerts>
        <fullName>GFS_Long_Approval_and_Many_Conditions</fullName>
        <description>If both fields &quot;Took long to get approval from UW&quot; &amp; &quot;Many conditions prior to funding&quot; are checked, an email is sent to Faith / Ericka.</description>
        <protected>false</protected>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Long_Approval_and_Many_Conditions</template>
    </alerts>
    <alerts>
        <fullName>GFS_Long_Decision_Expectation_Changed_Intrusive_Disruptive</fullName>
        <description>When &quot;Took long to get decision from UW&quot;,  &quot;Expectation of Approval changed in UW&quot;, &quot;UW Process Intrusive and Disruptive&quot; fields are checked an email is sent to Faith / Ericka.</description>
        <protected>false</protected>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Long_Decision_Expectation_Changed_Intrusive_Disruptive</template>
    </alerts>
    <alerts>
        <fullName>GFS_Too_Long_To_Get_Approval_Decision</fullName>
        <description>When it takes too long to get the approval decision, an email is sent to the Faith / Ericka.</description>
        <protected>false</protected>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Too_Long_To_Get_Approval_Decision</template>
    </alerts>
    <alerts>
        <fullName>Many_conditions_prior_to_funding</fullName>
        <description>If after approval there are many conditions prior to funding, an email is sent to Faith / Ericka.</description>
        <protected>false</protected>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Many_conditions_prior_to_funding</template>
    </alerts>
    <alerts>
        <fullName>No_Call_back</fullName>
        <description>If the customer didn&apos;t get the call back when promised.</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Didn_t_get_called_back_when_promised</template>
    </alerts>
    <alerts>
        <fullName>Overall_Satisfaction_less_than_4</fullName>
        <description>When GFS Overall Satisfaction field value is less than 4, an email is sent to Maria Mahon.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Overall_Satisfaction</template>
    </alerts>
    <alerts>
        <fullName>Underwriting_decision_clearly_explained</fullName>
        <description>When the value of  &quot;Underwriting decision clearly explained&quot; field is less than 4, an email is sent to Maria.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Underwriting_decision_clearly_explained</template>
    </alerts>
    <alerts>
        <fullName>Yes_at_comparable_or_better_terms</fullName>
        <description>If from picklist &quot;Secured funding from another lender&quot; the user selects &quot;Yes, at comparable or better terms than RapidAdvance initially offered&quot;, an email is sent to Maria.</description>
        <protected>false</protected>
        <recipients>
            <recipient>mariakuczynski@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/GFS_Secured_funding_from_another_lender_better_terms</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_RecordType_to_Client_Service_Surv</fullName>
        <description>Update GetFeedback Survey RecordType to Client Service Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Client_Service_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update RecordType to Client Service Surv</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_RecordType_to_Funding_Survey</fullName>
        <description>Update GetFeedback Survey RecordType to Funding Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Funding_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update RecordType to Funding Survey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_RecordType_to_Satisfaction_Survey</fullName>
        <description>Update GetFeedback Survey RecordType to Satisfaction Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Satisfaction_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update RecordType to Satisfaction Survey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>GFS %09Accomplish goals with financing</fullName>
        <actions>
            <name>Accomplish_goals_with_financing</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND ( (2 AND 3) OR (4 AND 5) OR (6 AND 7))</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Able_to_accomplish_goals_with_fi__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Able_to_accomplish_goals_with_fi__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Future_funding_choice_is_Rapid__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Future_funding_choice_is_Rapid__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Comfortable_funding_repayment__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Comfortable_funding_repayment__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>If the value of &quot;Accomplish goals with financing&quot; field is less than 4, an email is sent to Maria.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Access To Information about Account</fullName>
        <actions>
            <name>Access_to_information_about_account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Access_To_Information_about_Account__c</field>
            <operation>equals</operation>
            <value>Not at All Satisfied,Slightly Satisfied</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.The_process_of_repaying_funding__c</field>
            <operation>equals</operation>
            <value>Not at All Satisfied,Slightly Satisfied</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.The_RapidAdvance_client_portal__c</field>
            <operation>equals</operation>
            <value>Not at All Satisfied,Slightly Satisfied</value>
        </criteriaItems>
        <description>If Overall satisfaction with aspect to: Access to information about client&apos;s account is Not at all Satisfied and slightly satisfied, an email is sent to Maria.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS BA Service Rating</fullName>
        <actions>
            <name>GFS_BA_Service_Rating</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey,Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.BA_Service_Rating__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.BA_Service_Rating__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When BA Service Rating is less than 4, an email notification is sent to Maria Mahon.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS BA not knowledgeable and Accurate</fullName>
        <actions>
            <name>BA_not_knowledgeable_and_Accurate</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Funding Survey,Satisfaction Survey,Client Service Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.BA_did_not_set_expectation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.BA_was_not_knowledgeable__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If BA not Knowledgeable enough and Didn&apos;t set accurate expectations,an email is sent to Maria.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Didn%27t get called back when promised</fullName>
        <actions>
            <name>No_Call_back</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Funding Survey,Client Service Survey,Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.BA_Did_not_get_called_back__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If the customer do not get the call back when promised, an email is sent to Krez.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Experienced problems with cust service</fullName>
        <actions>
            <name>GFS_Experienced_problem_with_customer_service</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_problems_with_cust_serv__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When problem faced with the customer service, an email is sent to Sheila.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Long Approval and Many Conditions</fullName>
        <actions>
            <name>GFS_Long_Approval_and_Many_Conditions</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_many_conditions_prior_funding__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_took_long_for_approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If both fields &quot;Took long to get approval from UW&quot; &amp; &quot;Many conditions prior to funding&quot; are checked, an email is sent to Faith / Ericka.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Long Decision Expectation Changed Intrusive Disruptive</fullName>
        <actions>
            <name>GFS_Long_Decision_Expectation_Changed_Intrusive_Disruptive</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_Approval_Expectation_changed_in_UW__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_took_long_for_decision__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_UW_Process_Intrusive_Disruptive__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When &quot;Took long to get decision from UW&quot;,  &quot;Expectation of Approval changed in UW&quot;, &quot;UW Process Intrusive and Disruptive&quot; fields are checked an email is sent to Faith / Ericka.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Many conditions prior to funding</fullName>
        <actions>
            <name>Many_conditions_prior_to_funding</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_many_conditions_prior_funding__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_took_long_for_approval__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>If after approval there are many conditions prior to funding, an email is sent to Faith/ Ericka.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Overall Satisfaction</fullName>
        <actions>
            <name>Overall_Satisfaction_less_than_4</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey,Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Overall_Satisfaction__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Overall_Satisfaction__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When GFS Overall Satisfaction field value is less than 4, an email is sent to Maria Mahon.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Secured funding from another lender better terms</fullName>
        <actions>
            <name>Yes_at_comparable_or_better_terms</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Secured_funding_from_another_lender__c</field>
            <operation>equals</operation>
            <value>&quot;Yes, at comparable or better terms than RapidAdvance initially offered.&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Secured_funding_from_another_lender__c</field>
            <operation>equals</operation>
            <value>&quot;Yes, but at less advantageous terms than RapidAdvance initially offered.&quot;</value>
        </criteriaItems>
        <description>If from picklist &quot;Secured funding from another lender&quot; the user selects &quot;Yes, at comparable or better terms than RapidAdvance initially offered&quot;, an email is sent to Maria.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Too Long To Get Approval Decision</fullName>
        <actions>
            <name>GFS_Too_Long_To_Get_Approval_Decision</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Client Service Survey,Funding Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_took_long_for_approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.OS_many_conditions_prior_funding__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>When It takes too long to get the approval decision from underwriting, an email is sent to Faith / Ericka</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GFS Underwriting decision clearly explained</fullName>
        <actions>
            <name>Underwriting_decision_clearly_explained</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND ((2 AND 3) OR (4 AND 5) OR (6 AND 7) OR (8 AND 9))</booleanFilter>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Satisfaction Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Underwriting_decision_clearly_explained__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Underwriting_decision_clearly_explained__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Consider_RapidAdvance_for_next_funding__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Consider_RapidAdvance_for_next_funding__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Understanding_of_approval_requirements__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.Understanding_of_approval_requirements__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RapidAdvance_evaluated_thoroughly__c</field>
            <operation>lessThan</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>GetFeedback_Survey__c.RapidAdvance_evaluated_thoroughly__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When the value of  &quot;Underwriting decision clearly explained&quot; field is less than 4, an email is sent to Maria.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update RecordType to Client Service Survey</fullName>
        <actions>
            <name>Update_RecordType_to_Client_Service_Surv</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GetFeedback_Survey__c.GetFeedback_Survey_Name__c</field>
            <operation>equals</operation>
            <value>RapidAdvance - Client Service Survey 90 days</value>
        </criteriaItems>
        <description>Update GetFeedback Survey RecordType to Client Service Survey</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update RecordType to Funding Survey</fullName>
        <actions>
            <name>Update_RecordType_to_Funding_Survey</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GetFeedback_Survey__c.GetFeedback_Survey_Name__c</field>
            <operation>equals</operation>
            <value>RapidAdvance - Funding Survey -1 day</value>
        </criteriaItems>
        <description>Update GetFeedback Survey RecordType to Funding Survey</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update RecordType to Satisfaction Survey</fullName>
        <actions>
            <name>Update_RecordType_to_Satisfaction_Survey</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GetFeedback_Survey__c.GetFeedback_Survey_Name__c</field>
            <operation>equals</operation>
            <value>RapidAdvance - Satisfaction Survey 15 days</value>
        </criteriaItems>
        <description>Update GetFeedback Survey RecordType to Satisfaction Survey</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
