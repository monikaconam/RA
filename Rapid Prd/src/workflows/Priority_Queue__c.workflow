<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_1</fullName>
        <field>Priority__c</field>
        <formula>1</formula>
        <name>Priority Queue - Set to 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_2</fullName>
        <field>Priority__c</field>
        <formula>2</formula>
        <name>Priority Queue - Set to 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_3</fullName>
        <field>Priority__c</field>
        <formula>3</formula>
        <name>Priority Queue - Set to 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_4</fullName>
        <field>Priority__c</field>
        <formula>4</formula>
        <name>Priority Queue - Set to 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_5</fullName>
        <field>Priority__c</field>
        <formula>5</formula>
        <name>Priority Queue - Set to 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_6</fullName>
        <field>Priority__c</field>
        <formula>6</formula>
        <name>Priority Queue - Set to 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Priority_Queue_Set_to_7</fullName>
        <field>Priority__c</field>
        <formula>7</formula>
        <name>Priority Queue - Set to 7</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Run_Uncheck</fullName>
        <description>Uncheck the Workflow Run checkbox for Priority Queues. Will trigger a cascade to fire off other workflows.</description>
        <field>Run_Workflow__c</field>
        <literalValue>0</literalValue>
        <name>Workflow Run Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Priority Queue %231 %28Lead%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND 2) OR (3 AND 6) OR (4 AND 6) OR (5 AND 6)) AND 7</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Calling - No Contact Made</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Lead_Created_Date__c</field>
            <operation>equals</operation>
            <value>LAST 3 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>In Progress - Awaiting Statements,In Progress - Follow Up Call Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Initial Call Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>In Progress - Pending Approval,In Progress - Pending Quote</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Last_Activity_Date__c</field>
            <operation>equals</operation>
            <value>LAST 3 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Lead</value>
        </criteriaItems>
        <description>Modified by ConAm NJ.
Changed the rule criteria no. 6 from Last Modified Date to Last Activity Date.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %232 %28Opportunity%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND (((2 OR 3) AND 4) OR 5) AND (6))</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>C-1 Contract Signed - More Info Needed,B - Quote Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Statements Rec&apos;d Follow Up,C - Offer Accepted - Awaiting Compl Apps</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Last_Activity_Date__c</field>
            <operation>equals</operation>
            <value>LAST 7 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>notEqual</operation>
            <value>NO Contact Made,Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.All_Approved_With_Conditions_Met__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Modified by ConAm NJ. 
Changed the rule criteria no. 4 from Last Modified Date to Last Activity Date.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %233 %28Opportunity - Closed Won%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND ((3 AND 4) OR 5)</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>greaterOrEqual</operation>
            <value>50</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>lessOrEqual</operation>
            <value>65</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>greaterOrEqual</operation>
            <value>100</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %234 %28Opportunity - Submitted Deal%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND (2 OR (3 AND 4)))</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Submitted Deal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>greaterThan</operation>
            <value>65</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>lessThan</operation>
            <value>90</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %235 %28Lead%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND (((2 OR 3) AND 4 AND 5) OR (7 AND 8 AND 9)) AND 6)</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Lead</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>In Progress - Pending Approval,In Progress - Awaiting Statements</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>In Progress - Follow Up Call Needed,In Progress - Pending Quote</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Last_Activity_Date__c</field>
            <operation>notEqual</operation>
            <value>LAST 3 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Last_Activity_Date__c</field>
            <operation>equals</operation>
            <value>LAST 14 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Ref_LastModifiedById__c</field>
            <operation>notEqual</operation>
            <value>Web Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Calling - No Contact Made</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.CreatedDate</field>
            <operation>notEqual</operation>
            <value>LAST 3 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.CreatedDate</field>
            <operation>equals</operation>
            <value>LAST 10 DAYS</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %236 %28Lead%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_6</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Calling - No Contact Made,In Progress - Awaiting Statements,In Progress - Follow Up Call Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Last_Activity_Date__c</field>
            <operation>notEqual</operation>
            <value>LAST WEEK</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Ref_LastModifiedById__c</field>
            <operation>notEqual</operation>
            <value>Web Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Lead</value>
        </criteriaItems>
        <description>Modified by ConAm NJ. 
Changed the rule criteria no. 2 from Last Modified Date to Last Activity Date.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Priority Queue %237 %28Opportunity%29</fullName>
        <actions>
            <name>Priority_Queue_Set_to_7</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Run_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND (2 OR (3 AND 4) OR 5))</booleanFilter>
        <criteriaItems>
            <field>Priority_Queue__c.Type__c</field>
            <operation>equals</operation>
            <value>Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Auto Decline-To Processing,Declined,Unqualified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Percent_Complete_PO__c</field>
            <operation>lessThan</operation>
            <value>50</value>
        </criteriaItems>
        <criteriaItems>
            <field>Priority_Queue__c.Stage_Status__c</field>
            <operation>equals</operation>
            <value>Rescinded by RapidAdvance</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
