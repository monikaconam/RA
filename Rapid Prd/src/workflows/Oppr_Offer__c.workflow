<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>OppOfferUpdate</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Oppr_Offer__c.Status__c</field>
            <operation>equals</operation>
            <value>Offered</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
