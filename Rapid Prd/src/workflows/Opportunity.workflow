<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Pre_Qual_Due_Now</fullName>
        <description>Alert - Pre-Qual Due Now!!</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Alert_Pre_Qual_Due_in_15_Minutes</template>
    </alerts>
    <alerts>
        <fullName>Alex_L_Pre_Qualification_Email_Alert</fullName>
        <description>Alex L. Pre-Qualification - Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Pre_Qualification_Request</template>
    </alerts>
    <alerts>
        <fullName>ApprovedDealHasNowBeenDECLINEDInternal</fullName>
        <description>Approved Deal Has Now Been DECLINED - Internal</description>
        <protected>false</protected>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/DealUpdate</template>
    </alerts>
    <alerts>
        <fullName>Approved_Deal_Has_Now_Been_DECLINED_Internal</fullName>
        <description>Approved Deal Has Now Been DECLINED - Internal</description>
        <protected>false</protected>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/DealUpdatenew</template>
    </alerts>
    <alerts>
        <fullName>B2C_Prequal_Alert</fullName>
        <description>B2C Prequal Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Biz2Cred</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>rdearborn@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Biz2Credit_Alert</template>
    </alerts>
    <alerts>
        <fullName>BD_Alert_Partner_has_not_signed_Premium_MCA</fullName>
        <ccEmails>BD@rapidadvance.com</ccEmails>
        <description>BD Alert - Partner has not signed Premium MCA</description>
        <protected>false</protected>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Alert_Partner_has_not_signed_Premium_MCA</template>
    </alerts>
    <alerts>
        <fullName>BD_Stage_Changed_Alert</fullName>
        <description>BD Stage Changed Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Campaign_Owner_Additional_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Campaign_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/BD_Notification_Stage_Change</template>
    </alerts>
    <alerts>
        <fullName>BF_Renewal_Alert</fullName>
        <ccEmails>kmiranda@onlinemcf.com</ccEmails>
        <description>BF Renewal Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>renewaldepartment@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Renewal_Alert</template>
    </alerts>
    <alerts>
        <fullName>Biz2Credit_Deal_Alert</fullName>
        <description>Biz2Credit Deal Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Biz2Cred</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Biz2Credit_Alert</template>
    </alerts>
    <alerts>
        <fullName>Card_Activated_Email</fullName>
        <description>Card Activated Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Incentive_Activation_Email</template>
    </alerts>
    <alerts>
        <fullName>CustomerSatisfactionSurveySent</fullName>
        <description>Customer Satisfaction Survey Sent</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Click_Tools_Templates/CustomerSatisfactionSurvey</template>
    </alerts>
    <alerts>
        <fullName>Decision_and_Processor_Rep_Assigned</fullName>
        <description>Decision and Processor Rep Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/UW_Approved_Processor_Rep_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Decline_Program_Deal_to_QC</fullName>
        <description>Decline Program Deal to QC</description>
        <protected>false</protected>
        <recipients>
            <recipient>dataqc@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>llogan@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mabiola@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Submitted_to_QC</template>
    </alerts>
    <alerts>
        <fullName>Decline_Program_Deal_to_QC_queue</fullName>
        <description>Decline Program Deal to QC</description>
        <protected>false</protected>
        <recipients>
            <recipient>dataqc@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ecord@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Deal_in_QC_Decline_Program_Queue</template>
    </alerts>
    <alerts>
        <fullName>DeclinedbyUW</fullName>
        <description>Declined by UW</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/DeclinedbyUW</template>
    </alerts>
    <alerts>
        <fullName>DevinYourdealhasbeenupdatedInternal</fullName>
        <description>Devin - Your deal has been updated. - Internal</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesforcePRMEmailTemplates/StatusUpdate</template>
    </alerts>
    <alerts>
        <fullName>DistEngOppAssignmentOwner</fullName>
        <description>DistEngOppAssignmentOwner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/OppsNewassignmentnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_Bankcard_One_Inc_Matt_Milmeister_Updates</fullName>
        <ccEmails>apps@elitedatacorp.com; justin.milmeister@elitedatacorp.com; pnsapps@elitedatacorp.com</ccEmails>
        <description>Elite Data Bankcard One, Inc. - Matt Milmeister Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_EMS_Agoura_Jeff_Brodsly_Updates</fullName>
        <ccEmails>jeffb@elitedatacorp.com; pnsapps@elitedatacorp.com; unitedapps@elitedatacorp.com</ccEmails>
        <description>Elite Data United Agoura - Jeff Brodsly Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_EMS_Kanas_Stephanie_Bowlin_Updates</fullName>
        <ccEmails>stephaniej.bowlin@gmail.com;sjbservices@sbcglobal.net; justin.milmeister@elitedatacorp.com; pnsapps@elitedatacorp.com</ccEmails>
        <description>Elite Data EMS Kanas - Stephanie Bowlin Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_Electronic_Merchant_Solutions_Inc_Richard_Cha_Updates</fullName>
        <ccEmails>emsapps@elitedatacorp.com; pnsapps@elitedatacorp.com</ccEmails>
        <description>Elite Data Electronic Merchant Solutions, Inc. - Richard Cha Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_United_Paul_Rasidakis_Updates</fullName>
        <ccEmails>unitedapps@elitedatacorp.com; pnsapps@elitedatacorp.com; justin.milmeister@elitedatacorp.com</ccEmails>
        <description>Elite Data United - Paul Rasidakis Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Elite_Data_Updates</fullName>
        <ccEmails>pnsapps@elitedatacorp.com; justin.milmeister@elitedatacorp.com</ccEmails>
        <description>Elite Data Updates</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Email_Notification</fullName>
        <description>Email Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Unqualified_Opp</template>
    </alerts>
    <alerts>
        <fullName>Fundbox_Email</fullName>
        <description>Fundbox Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>aspeck@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>connorneme@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michaelmoussawel@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmckenzie@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Fundbox_MARBLE</template>
    </alerts>
    <alerts>
        <fullName>Funding_Notification</fullName>
        <description>Funding Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Funding_Status_Complete</template>
    </alerts>
    <alerts>
        <fullName>GTF_Opp_Email_Alert</fullName>
        <description>GTF Opp Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>GTF_Account_Executive</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>GTF_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/GTF_Decline_Opp_Alert</template>
    </alerts>
    <alerts>
        <fullName>GTF_Opp_Pending_Management_Review_Alert</fullName>
        <description>GTF Opp Pending Management Review Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>GTF_Account_Executive</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>GTF_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/GTF_Decline_Pending_Management_Review</template>
    </alerts>
    <alerts>
        <fullName>Lendio_Opportunity_Email</fullName>
        <ccEmails>nyc.rapid.lt@lendio.com</ccEmails>
        <description>Lendio Opportunity Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>bklenk@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmckenzie@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>pachanti@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>External_Emails/Opportunity_Info_Transfer</template>
    </alerts>
    <alerts>
        <fullName>Lendr_Marble</fullName>
        <description>Lendr Marble</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>connorneme@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michaelmoussawel@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmckenzie@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Lendr_Op</template>
    </alerts>
    <alerts>
        <fullName>Management_Sign_Off_Completed</fullName>
        <description>Management Sign Off Completed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Management_Sign_Off</template>
    </alerts>
    <alerts>
        <fullName>Merchant_One_Submitted_for_Funding</fullName>
        <description>Merchant One Submitted for Funding</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Submitted_for_Funding</template>
    </alerts>
    <alerts>
        <fullName>Merchant_One_Submitted_to_Underwriting</fullName>
        <description>Merchant One Submitted to Underwriting</description>
        <protected>false</protected>
        <recipients>
            <recipient>QualityControl</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>alsims@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mrivera@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tbenjamin@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Submitted_to_UW</template>
    </alerts>
    <alerts>
        <fullName>New_Opp</fullName>
        <description>New Opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>dpolk@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_10</fullName>
        <description>New Opp 10</description>
        <protected>false</protected>
        <recipients>
            <recipient>nscallion@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_11</fullName>
        <description>New Opp 11</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrewmatos@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_12</fullName>
        <description>New Opp 12</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrewmatos@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_13</fullName>
        <description>New Opp 13</description>
        <protected>false</protected>
        <recipients>
            <recipient>aperla@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_14</fullName>
        <description>New Opp 14</description>
        <protected>false</protected>
        <recipients>
            <recipient>aperla@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_15</fullName>
        <description>New Opp 15</description>
        <protected>false</protected>
        <recipients>
            <recipient>cprunesti@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_16</fullName>
        <description>New Opp 16</description>
        <protected>false</protected>
        <recipients>
            <recipient>cprunesti@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_17</fullName>
        <description>New Opp 17</description>
        <protected>false</protected>
        <recipients>
            <recipient>jlafalcia@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_18</fullName>
        <description>New Opp 18</description>
        <protected>false</protected>
        <recipients>
            <recipient>jlafalcia@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_19</fullName>
        <description>New Opp 19</description>
        <protected>false</protected>
        <recipients>
            <recipient>hsowa@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_2</fullName>
        <description>New Opp 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>dpolk@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_20</fullName>
        <description>New Opp 20</description>
        <protected>false</protected>
        <recipients>
            <recipient>hsowa@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_21</fullName>
        <description>New Opp 21</description>
        <protected>false</protected>
        <recipients>
            <recipient>jbelt@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_22</fullName>
        <description>New Opp 22</description>
        <protected>false</protected>
        <recipients>
            <recipient>jbelt@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_23</fullName>
        <description>New Opp 23</description>
        <protected>false</protected>
        <recipients>
            <recipient>joshblades@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_24</fullName>
        <description>New Opp 24</description>
        <protected>false</protected>
        <recipients>
            <recipient>joshblades@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_25</fullName>
        <description>New Opp 25</description>
        <protected>false</protected>
        <recipients>
            <recipient>phavenstein@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_26</fullName>
        <description>New Opp 26</description>
        <protected>false</protected>
        <recipients>
            <recipient>phavenstein@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_3</fullName>
        <description>New Opp 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>bmcbride@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_4</fullName>
        <description>New Opp 4</description>
        <protected>false</protected>
        <recipients>
            <recipient>bmcbride@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_5</fullName>
        <description>New Opp 5</description>
        <protected>false</protected>
        <recipients>
            <recipient>jperkins@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_6</fullName>
        <description>New Opp 6</description>
        <protected>false</protected>
        <recipients>
            <recipient>jperkins@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_7</fullName>
        <description>New Opp 7</description>
        <protected>false</protected>
        <recipients>
            <recipient>cwagner@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_8</fullName>
        <description>New Opp 8</description>
        <protected>false</protected>
        <recipients>
            <recipient>cwagner@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_Opp_9</fullName>
        <description>New Opp 9</description>
        <protected>false</protected>
        <recipients>
            <recipient>nscallion@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/OppCreated</template>
    </alerts>
    <alerts>
        <fullName>New_UCS_Lead</fullName>
        <description>New UCS Lead</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/LENDR_MARBLE</template>
    </alerts>
    <alerts>
        <fullName>Offer_Accepted</fullName>
        <description>Offer Accepted</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Offer_Accepted</template>
    </alerts>
    <alerts>
        <fullName>Opp_Owner_Decline_Program_Eligible</fullName>
        <ccEmails>submissions@rapidadvance.com</ccEmails>
        <description>Opp Owner Decline Program Eligible</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Decline_Program_Eligible</template>
    </alerts>
    <alerts>
        <fullName>Opp_Payment_Status</fullName>
        <description>Opp Payment Status</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>renewaldepartment@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Paydown_Progress_Updates</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_AE_Email_Update</fullName>
        <description>Opportunity AE Email Update</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/DealUpdate</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_AE_Email_Update2</fullName>
        <description>Opportunity AE Email Update2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>awalter@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/DealUpdate2</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Mgmt_Sign_Off_Email_Update</fullName>
        <description>Opportunity Mgmt Sign Off Email Update</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Management_Sign_Off</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Partner_Email_Update</fullName>
        <description>Opportunity Partner Email Update</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Updates</template>
    </alerts>
    <alerts>
        <fullName>Overdue_Initial_File_Review_Alert</fullName>
        <description>Overdue Initial File Review Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>faithkustra@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Alert_Overdue_UW_Initial_File_Review</template>
    </alerts>
    <alerts>
        <fullName>Overdue_QC_Decision_Alert</fullName>
        <description>Overdue QC Decision Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>dataqc@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ecord@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vwashington@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Alert_Overdue_QC_Decision</template>
    </alerts>
    <alerts>
        <fullName>PREMIUM_MCA_NOT_SIGNED_FOR_PARTNER_AE_Alert</fullName>
        <description>PREMIUM MCA NOT SIGNED FOR PARTNER - AE Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Alert_Partner_has_not_signed_Premium_MCA_AE</template>
    </alerts>
    <alerts>
        <fullName>Partner_Funding_Notification</fullName>
        <description>Partner Funding Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Funding_Notification</template>
    </alerts>
    <alerts>
        <fullName>Partner_Opportunity_Assignment</fullName>
        <description>Partner Opportunity Assignment</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Partner_Opp_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Partner_Pre_Qual_Fail</fullName>
        <description>Partner Pre-Qual Fail</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bd@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Partner_Pre_Qual_Fail_HTML</template>
    </alerts>
    <alerts>
        <fullName>Partner_Prefund_Notification</fullName>
        <description>Partner Prefund Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>QualifiedWebLeadTemplates/PreFund_Completed</template>
    </alerts>
    <alerts>
        <fullName>Pay_Off_Letter_Requested</fullName>
        <description>Pay Off Letter Requested</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cwelch@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rdearborn@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmckenzie@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>skachal@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>snazal@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Pay_Off_Requested</template>
    </alerts>
    <alerts>
        <fullName>Pre_Qual_1hour_since_submission</fullName>
        <description>Pre-Qual - 1hour since submission</description>
        <protected>false</protected>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>srafii@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Alert_Pre_Qual_Due_in_15_Minutes</template>
    </alerts>
    <alerts>
        <fullName>Pre_Qual_Pending_Return_to_QC</fullName>
        <description>Pre-Qual Pending Return to QC</description>
        <protected>false</protected>
        <recipients>
            <recipient>apompee@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>wcastor@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Pre_Qual_Pending</template>
    </alerts>
    <alerts>
        <fullName>Pre_Qualification_FAIL_Email_Alert</fullName>
        <ccEmails>nikhil@conamtechnologies.com</ccEmails>
        <description>Pre-Qualification FAIL - Email Alert</description>
        <protected>false</protected>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Pre_Qualification_Request</template>
    </alerts>
    <alerts>
        <fullName>Pre_Qualification_PASS_Credit_Only_Email_Alert</fullName>
        <description>Pre-Qualification PASS Credit Only - Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Pre_Qualification_Request</template>
    </alerts>
    <alerts>
        <fullName>Pre_Qualification_PASS_Email_Alert</fullName>
        <description>Pre-Qualification PASS - Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Pre_Qualification_Request</template>
    </alerts>
    <alerts>
        <fullName>ProMac_Deal_Approved</fullName>
        <description>ProMac Deal Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>ddechiaro@promedhcf.com</recipient>
            <type>partnerUser</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Deal_Approved</template>
    </alerts>
    <alerts>
        <fullName>QC_Sandra_Galdamez</fullName>
        <ccEmails>sgadlamez@rapidadvance.com</ccEmails>
        <description>QC: Sandra Galdamez Deals</description>
        <protected>false</protected>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Submitted_to_QC</template>
    </alerts>
    <alerts>
        <fullName>QC_Theresa_Dupree_Deals</fullName>
        <description>QC: Theresa Dupree Deals</description>
        <protected>false</protected>
        <recipients>
            <recipient>juanfeldman@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/Submitted_to_QC</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Eligibility_Update</fullName>
        <description>Renewal Eligibility Update</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>eharry@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Renewal_Eligibility_Update</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Email_1</fullName>
        <description>Renewal Email 1</description>
        <protected>false</protected>
        <recipients>
            <field>Preferred_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/BARENEW1</template>
    </alerts>
    <alerts>
        <fullName>ReprisedFRSAHasBeenSignedbyMerchant</fullName>
        <description>Repriced FRSA Has Been Signed by Merchant</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Underwriting</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/RepricedFRSAWasReceived</template>
    </alerts>
    <alerts>
        <fullName>ReprisedFRSAHasBeenSignedbyMerchant1</fullName>
        <description>Repriced FRSA Has Been Signed by Merchant</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Underwriting</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Auto_E_Mail_Templates/RepricedFRSAWasReceivednew</template>
    </alerts>
    <alerts>
        <fullName>RescindedApprovedAlert</fullName>
        <description>Rescinded  =&gt; Approved Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/UWApprovalStatusChangeRescindedtoApproved</template>
    </alerts>
    <alerts>
        <fullName>Review_for_funding_approval</fullName>
        <description>Review for funding approval</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/Review_Funding_Approval</template>
    </alerts>
    <alerts>
        <fullName>Review_for_funding_approval_Merchant_One</fullName>
        <description>Review for funding approval - Merchant One</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Email_1__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_3__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_4__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_5__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Email_6__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Email_Templates/Review_Funding_Approval</template>
    </alerts>
    <alerts>
        <fullName>Rocket_Loans_Opportunity_Email</fullName>
        <description>Rocket Loans Opportunity Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>External_Emails/Rocket_Loans_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>SBS_Funding</fullName>
        <ccEmails>inbox@sbscash.com</ccEmails>
        <ccEmails>paustin@sbscash.com</ccEmails>
        <ccEmails>arty@sbscash.com</ccEmails>
        <ccEmails>greg@sbscash.com</ccEmails>
        <ccEmails>mbernier@sbscash.com</ccEmails>
        <description>SBS Funding Notification</description>
        <protected>false</protected>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Funding_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_for_Green_Tree_Oppt</fullName>
        <description>Send Email for Green Tree Oppt</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jhageman@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/GTF_Decline_Opp_Alert_New</template>
    </alerts>
    <alerts>
        <fullName>Send_GTF_Ownership_Change</fullName>
        <description>Send GTF Ownership Change</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jhageman@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/OppsNewassignmentnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Send_Risk_Alert</fullName>
        <ccEmails>tbrown@rapidadvance.com</ccEmails>
        <description>Send Risk Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Send_Risk_Alert_From__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Send_Risk_Alert_To__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Risk_Issues_for_Processing</template>
    </alerts>
    <alerts>
        <fullName>Send_an_Email_Alert_to_BD_rapidadvance_com</fullName>
        <ccEmails>BD@rapidadvance.com</ccEmails>
        <description>Send an Email Alert to BD@rapidadvance.com in case the Active Preferred/Select Addendum is not checked.</description>
        <protected>false</protected>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Alert_Partner_has_not_signed_Preferred_Select_Addendum</template>
    </alerts>
    <alerts>
        <fullName>SignedContractReceived</fullName>
        <ccEmails>DS@rapidadvance.com</ccEmails>
        <description>Signed Contract Received.</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>aspeck@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cwelch@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rdearborn@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>aspeck@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/SignedContractReceived</template>
    </alerts>
    <alerts>
        <fullName>Signed_Contract_Received_Direct</fullName>
        <description>Signed Contract Received - Direct</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cwelch@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>daliff@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mrivera@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rdearborn@rapidadvance.com</recipient>
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
        <senderAddress>rmckenzie@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/SignedContractReceived</template>
    </alerts>
    <alerts>
        <fullName>Signed_Contract_Received_Partner</fullName>
        <description>Signed Contract Received - Partner</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>aspeck@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cwelch@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddelany@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mcerminaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mrivera@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rdearborn@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>mcerminaro@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/SignedContractReceived</template>
    </alerts>
    <alerts>
        <fullName>SplitReductionNotificationInternal</fullName>
        <ccEmails>tbrown@rapidadvance.com</ccEmails>
        <description>Email % Split Reduction Notification - Internal</description>
        <protected>false</protected>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/SplitReduction</template>
    </alerts>
    <alerts>
        <fullName>Syndication_Amount_Ent</fullName>
        <ccEmails>adierksheide@rapidadvance.com</ccEmails>
        <description>Syndication Amount Entered</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Syndication_Amount_Entered_Email</template>
    </alerts>
    <alerts>
        <fullName>Syndication_Amount_Missing</fullName>
        <ccEmails>njaitly@rapidadvance.com</ccEmails>
        <description>Syndication Amount Missing</description>
        <protected>false</protected>
        <senderAddress>services@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All_Templates/Syndication_Amount_Missing</template>
    </alerts>
    <alerts>
        <fullName>UWApprovalStatusChangeDeclinedtoApproved</fullName>
        <description>UW Approval Status Change =&gt; Declined to Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Processors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/UWApprovalStatusChangeDeclinedtoApproved</template>
    </alerts>
    <alerts>
        <fullName>UW_Assigned</fullName>
        <description>UW Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>underwriting@rapidadvance.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Auto_E_Mail_Templates/Submitted_to_UW</template>
    </alerts>
    <alerts>
        <fullName>UW_Unqual</fullName>
        <description>UW Unqual</description>
        <protected>false</protected>
        <recipients>
            <recipient>aconnell@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>connorneme@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ddechiaro@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michaelmoussawel@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rmckenzie@rapidadvance.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Detroit1/Unqualified_Opp</template>
    </alerts>
    <alerts>
        <fullName>UnqualifiedNotificationEmail</fullName>
        <description>Unqualified Notification Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All_Templates/Unqualified_Opportunity</template>
    </alerts>
    <fieldUpdates>
        <fullName>AccOppStageUpdate</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>text(StageName)</formula>
        <name>AccOppStageUpdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_Closed_Won</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Closed Won&quot;</formula>
        <name>AccOppStage-Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_PQF</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Pre-Qual FAIL&quot;</formula>
        <name>AccOppStage-PQF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_PQP</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Pre-Qual Pass&quot;</formula>
        <name>AccOppStage-PQP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_PQP_Credit_Only</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Pre-Qual Pass Credit Only&quot;</formula>
        <name>AccOppStage-PQP Credit Only</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_UnqReconsider</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Unqualified - Will Reconsider Later&quot;</formula>
        <name>AccOppStage-UnqReconsider</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AccOppStage_Unqualified</fullName>
        <field>Current_Opp_Stage__c</field>
        <formula>&quot;Unqualified&quot;</formula>
        <name>AccOppStage-Unqualified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_List_888_Partner_Leads</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbrMA&quot;</formula>
        <name>Add List - 999 Ineligible Renewals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_001_List_Upload_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c390000095mUv&quot;</formula>
        <name>Add to 001 - List Upload Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Alex_Perla_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMNAAZ&quot;</formula>
        <name>Add to Alex Perla List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Alex_Perla_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMNAAZ&quot;</formula>
        <name>Add to Alex Perla List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Andrew_Matos_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMIAAZ&quot;</formula>
        <name>Add to Andrew Matos List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Andrew_Matos_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMIAAZ&quot;</formula>
        <name>Add to Andrew Matos List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_BA_Opps_1</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Add to BA Opps 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_BA_Owned_Opps_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Add to BA Owned Opps 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_BA_Owned_Opps_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Add to BA Owned Opps 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_BA_Owned_Opps_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Add to BA Owned Opps 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_BA_Owned_Opps_5</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Add to BA Owned Opps 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Brendan_McBride_Personal_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLoAAJ&quot;</formula>
        <name>Add to Brendan McBride Personal List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Brendan_McBride_Personal_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLoAAJ&quot;</formula>
        <name>Add to Brendan McBride Personal List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Cayce_Prunesti_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMSAAZ&quot;</formula>
        <name>Add to Cayce Prunesti List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Cayce_Prunesti_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMSAAZ&quot;</formula>
        <name>Add to Cayce Prunesti List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Chaz_Wagner_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsM3AAJ&quot;</formula>
        <name>Add to Chaz Wagner List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Chaz_Wagner_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsM3AAJ&quot;</formula>
        <name>Add to Chaz Wagner List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Darius_Polk_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLtAAJ&quot;</formula>
        <name>Add to Darius Polk List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Darius_Polk_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLtAAJ&quot;</formula>
        <name>Add to Darius Polk List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Five9_List_001_RC_QL_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c390000095r64&quot;</formula>
        <name>Add to Five9 List - 001 - RC-QL Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Five9_List_001_Tier_2_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Add to Five9 List - 001 - Tier 2 Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Five9_List_001_Tier_3_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Add to Five9 List - 001 - Tier 3 Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Five9_List_002_Frontline_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Add to Five9 List - 002 - Frontline Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Holly_Sowa_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMcAAJ&quot;</formula>
        <name>Add to Holly Sowa List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Holly_Sowa_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMcAAJ&quot;</formula>
        <name>Add to Holly Sowa List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Jason_Perkins_Personal_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLyAAJ&quot;</formula>
        <name>Add to Jason Perkins Personal List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Jason_Perkins_Personal_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsLyAAJ&quot;</formula>
        <name>Add to Jason Perkins Personal List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Jesse_Belt_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMhAAJ&quot;</formula>
        <name>Add to Jesse Belt List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Jesse_Belt_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMhAAJ&quot;</formula>
        <name>Add to Jesse Belt List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Joe_LaFalcia_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMXAAZ&quot;</formula>
        <name>Add to Joe LaFalcia List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Joe_LaFalcia_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMXAAZ&quot;</formula>
        <name>Add to Joe LaFalcia List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Josh_Blades_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMmAAJ&quot;</formula>
        <name>Add to Josh Blades List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Josh_Blades_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMmAAJ&quot;</formula>
        <name>Add to Josh Blades List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AjXtqAAF&quot;</formula>
        <name>Add to List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_002_Frontline_Leads</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000B5Xf7&quot;</formula>
        <name>Add to List - 007 - Fora BFS leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Eapp</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000B5Xf7&quot;</formula>
        <name>Add to List - Eapp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Personal_Dialer</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawe&quot;</formula>
        <name>Add to List - Partner Personal Dialer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Team_1</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawK&quot;</formula>
        <name>Add to List - Partner Team 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Team_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawP&quot;</formula>
        <name>Add to List - Partner Team 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Team_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawU&quot;</formula>
        <name>Add to List - Partner Team 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Team_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawZ&quot;</formula>
        <name>Add to List - Partner Team 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Tier_1_NEW</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AjXmVAAV&quot;</formula>
        <name>Add to List - Partner Tier 1 NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Tier_2_NEW</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AjXqr&quot;</formula>
        <name>Add to List - Partner Tier 2 NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Tier_3_NEW</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AjXtqAAF&quot;</formula>
        <name>Add to List - Partner Tier 3 NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_List_Partner_Tier_4_New</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000AjXtvAAF&quot;</formula>
        <name>Add to List - Partner Tier 4 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Nick_Scallion_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsM8AAJ&quot;</formula>
        <name>Add to Nick Scallion List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Nick_Scallion_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsM8AAJ&quot;</formula>
        <name>Add to Nick Scallion List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Personal_Dialer</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawe&quot;</formula>
        <name>Add to Partner Personal Dialer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Add to Partner Unqualified Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Add to Partner Unqualified Opps 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Add to Partner Unqualified Opps 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Add to Partner Unqualified Opps 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps_5</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Add to Partner Unqualified Opps 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Partner_Unqualified_Opps_6</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BbbD7&quot;</formula>
        <name>Add to Partner Unqualified Opps 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Pete_Havenstein_List_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMrAAJ&quot;</formula>
        <name>Add to Pete Havenstein List 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Pete_Havenstein_List_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsMrAAJ&quot;</formula>
        <name>Add to Pete Havenstein List 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Prospect_Partner_List</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawj&quot;</formula>
        <name>Add to Prospect Partner List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Snorlax_List</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsV5&quot;</formula>
        <name>Add to Snorlax List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_to_Snorlax_List_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsV5&quot;</formula>
        <name>Add to Snorlax List 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AmountReprice</fullName>
        <field>Amount</field>
        <formula>New_Advance_Price__c 

/*UW_New_Advance_Price__c*/</formula>
        <name>Amount Reprice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Amount_Reprise</fullName>
        <field>Amount</field>
        <formula>New_Advance_Price__c</formula>
        <name>Amount Reprise</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ApprovedorAutoApproveFU</fullName>
        <field>StageName</field>
        <literalValue>Approved</literalValue>
        <name>Approved or Auto Approve FU</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Appvdpendingtoapproved</fullName>
        <field>StageName</field>
        <literalValue>Approved</literalValue>
        <name>Appvd pending to approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AutoDeclineStageChange</fullName>
        <field>StageName</field>
        <literalValue>Auto Decline-To Processing</literalValue>
        <name>Auto Decline Stage Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Auto_Declined_Deal</fullName>
        <field>StageName</field>
        <literalValue>Auto Decline-To Processing</literalValue>
        <name>Auto Declined Deal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Delete 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_4</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Delete 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_5</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Delete 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_6</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opp Delete 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opp_Delete_7</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQug&quot;</formula>
        <name>BA Opp Delete 7</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Opps_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQugAAE&quot;</formula>
        <name>BA Opps Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Owned_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqTAAT&quot;</formula>
        <name>BA Owned Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Owned_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLbqTAAT&quot;</formula>
        <name>BA Owned Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BA_Owned_Opp_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqTAAT&quot;</formula>
        <name>BA Owned Opp Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Last_6</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvA&quot;</formula>
        <name>BOBA Last 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Add_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Add 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Add_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Add 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Add_5</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Add 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Add_6</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvA&quot;</formula>
        <name>BOBA Opp Add 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXpDAAX&quot;</formula>
        <name>BOBA Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Delete_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Delete 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Last_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Last 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Last_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Last 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Opp_Last_5</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvAAAU&quot;</formula>
        <name>BOBA Opp Last 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_TRUE_AGED_Opp_Add_1</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLxexAAD&quot;</formula>
        <name>BOBA TRUE AGED Opp Add 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_TRUE_AGED_Opp_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLxexAAD&quot;</formula>
        <name>BOBA TRUE AGED Opp Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Transfer_DT</fullName>
        <field>BOBA_Transfer_Date__c</field>
        <formula>NOW()</formula>
        <name>BOBA Transfer DT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOBA_Transfer_User</fullName>
        <field>BOBA_Transfer_BA__c</field>
        <formula>$User.FirstName &amp;&apos; &apos;&amp; $User.LastName</formula>
        <name>BOBA Transfer User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Boba_Transfer_DTOP</fullName>
        <field>BOBA_Transfer_Date__c</field>
        <formula>now()</formula>
        <name>Boba Transfer DT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Broker_Out_Island_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXpDAAX&quot;</formula>
        <name>Broker Out Island Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Broker_Out_Island_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXpDAAX&quot;</formula>
        <name>Broker Out Island Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Broker_Out_Island_Opp_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLXpDAAX&quot;</formula>
        <name>Broker Out Island Opp Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>C_1_Submitted_Updated_to_Incomplete</fullName>
        <field>StageName</field>
        <literalValue>C-1 Contract Signed - More Info Needed</literalValue>
        <name>C-1 Submitted Updated to Incomplete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_1_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXoyAAH&quot;</formula>
        <name>Castaway Bay 1 Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_1_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXoyAAH&quot;</formula>
        <name>Castaway Bay 1 Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_1_Opps_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXoy&quot;</formula>
        <name>Castaway Bay 1 Opps Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_2_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp3AAH&quot;</formula>
        <name>Castaway Bay 2 Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_2_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp3AAH&quot;</formula>
        <name>Castaway Bay 2 Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_2_Opps_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp3&quot;</formula>
        <name>Castaway Bay 2 Opps Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_3_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp8AAH&quot;</formula>
        <name>Castaway Bay 3 Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_3_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp8AAH&quot;</formula>
        <name>Castaway Bay 3 Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_3_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp8AAH&quot;</formula>
        <name>Castaway Bay 3 Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_3_Opp_Last_List</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLXp8AAH&quot;</formula>
        <name>Castaway Bay 3 Opp Last List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Castaway_Bay_3_Opps_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXp8&quot;</formula>
        <name>Castaway Bay 3 Opps Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Leadsource</fullName>
        <field>LeadSource</field>
        <literalValue>Rapid Form MSLP3</literalValue>
        <name>Change Leadsource</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Opportuniy_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Pre_Qual_Record_Type</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Opportuniy Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Alex_Perla_3</fullName>
        <field>OwnerId</field>
        <lookupValue>aperla@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Alex Perla 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Alex_Perla_4</fullName>
        <field>OwnerId</field>
        <lookupValue>aperla@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Alex Perla 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Andrew_Matos_3</fullName>
        <field>OwnerId</field>
        <lookupValue>andrewmatos@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Andrew Matos 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Andrew_Matos_4</fullName>
        <field>OwnerId</field>
        <lookupValue>andrewmatos@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Andrew Matos 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Brendan_McBride_3</fullName>
        <field>OwnerId</field>
        <lookupValue>bmcbride@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Brendan McBride 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Brendan_McBride_4</fullName>
        <field>OwnerId</field>
        <lookupValue>bmcbride@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Brendan McBride 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Cayce_Prunesti_3</fullName>
        <field>OwnerId</field>
        <lookupValue>cprunesti@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Cayce Prunesti 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Cayce_Prunesti_4</fullName>
        <field>OwnerId</field>
        <lookupValue>cprunesti@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Cayce Prunesti 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Chaz_Wagner_3</fullName>
        <field>OwnerId</field>
        <lookupValue>cwagner@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Chaz Wagner 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Chaz_Wagner_4</fullName>
        <field>OwnerId</field>
        <lookupValue>cwagner@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Chaz Wagner 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Darius_Polk_3</fullName>
        <field>OwnerId</field>
        <lookupValue>dpolk@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Darius Polk 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Darius_Polk_4</fullName>
        <field>OwnerId</field>
        <lookupValue>dpolk@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Darius Polk 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Holly_Sowa_3</fullName>
        <field>OwnerId</field>
        <lookupValue>hsowa@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Holly Sowa 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Holly_Sowa_4</fullName>
        <field>OwnerId</field>
        <lookupValue>hsowa@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Holly Sowa 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Jason_Perkins_3</fullName>
        <field>OwnerId</field>
        <lookupValue>jperkins@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Jason Perkins 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Jason_Perkins_4</fullName>
        <field>OwnerId</field>
        <lookupValue>jperkins@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Jason Perkins 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Jesse_Belt_3</fullName>
        <field>OwnerId</field>
        <lookupValue>jbelt@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Jesse Belt 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Jesse_Belt_4</fullName>
        <field>OwnerId</field>
        <lookupValue>jbelt@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Jesse Belt 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Joe_LaFalcia_3</fullName>
        <field>OwnerId</field>
        <lookupValue>jlafalcia@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Joe LaFalcia 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Joe_LaFalcia_4</fullName>
        <field>OwnerId</field>
        <lookupValue>jlafalcia@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Joe LaFalcia 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Josh_Blades_3</fullName>
        <field>OwnerId</field>
        <lookupValue>joshblades@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Josh Blades 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Josh_Blades_4</fullName>
        <field>OwnerId</field>
        <lookupValue>joshblades@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Josh Blades 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Nick_Scallion_3</fullName>
        <field>OwnerId</field>
        <lookupValue>nscallion@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Nick Scallion 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Nick_Scallion_4</fullName>
        <field>OwnerId</field>
        <lookupValue>nscallion@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Nick Scallion 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Peter_Havenstein_3</fullName>
        <field>OwnerId</field>
        <lookupValue>phavenstein@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Peter Havenstein 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Peter_Havenstein_4</fullName>
        <field>OwnerId</field>
        <lookupValue>phavenstein@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Peter Havenstein 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_PL</fullName>
        <description>Update the Lead Owner to PL</description>
        <field>OwnerId</field>
        <lookupValue>patricklord@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change to PL</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_UCC_Filing</fullName>
        <field>UCC_Filing__c</field>
        <name>Clear UCC Filing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_UCC_Filing_Reason</fullName>
        <field>UCC_Filing_Reason__c</field>
        <name>Clear UCC Filing Reason</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_UCC_Requested_Date</fullName>
        <field>UCC_Date__c</field>
        <name>Clear UCC Requested Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Confirmed_Add_l_Signer_Mobile_Number</fullName>
        <field>Confirmed_Add_l_Signer_Mobile_Number__c</field>
        <literalValue>Not Applicable</literalValue>
        <name>Confirmed Add&apos;l Signer Mobile Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Confirmed_Add_l_Signer_Phone_Number</fullName>
        <field>Confirmed_Add_l_Signer_Phone_Number__c</field>
        <literalValue>Not Applicable</literalValue>
        <name>Confirmed Add&apos;l Signer Phone Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DT_UPdate</fullName>
        <field>Frontline_TransferDate__c</field>
        <formula>Now()</formula>
        <name>DT UPdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Decision_Date_timestamp</fullName>
        <description>Set the Decision Date to the present date/time</description>
        <field>Decision_Date__c</field>
        <formula>NOW()</formula>
        <name>Decision Date timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DeclineFieldUpdate</fullName>
        <field>StageName</field>
        <literalValue>Declined</literalValue>
        <name>Decline Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DeclinePendingMgmntReviewFU</fullName>
        <field>StageName</field>
        <literalValue>Declined - Pending Mgmt Review</literalValue>
        <name>Decline - Pending Mgmnt Review FU</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_777_Direct_Renewals</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbrM5&quot;</formula>
        <name>Delete from 777 Direct Renewals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Broker_Out_Island_Opps</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXpD&quot;</formula>
        <name>Delete from Broker Out Island Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Five9_List_03</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>Last_Five9_List__c</formula>
        <name>Delete from Five9 List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Five9_List_Partner_Team_1</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawK&quot;</formula>
        <name>Delete from Five9 List - Partner Team 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Five9_List_Partner_Team_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawP&quot;</formula>
        <name>Delete from Five9 List - Partner Team 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Five9_List_Partner_Team_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawU&quot;</formula>
        <name>Delete from Five9 List - Partner Team 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Five9_List_Partner_Team_4</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawZ&quot;</formula>
        <name>Delete from Five9 List - Partner Team 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Greater_than_7_Months_Paid</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsV0&quot;</formula>
        <name>Delete from Greater than 7 Months Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_OPEN</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawj&quot;</formula>
        <name>Delete from Partner OPEN</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_OPEN_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawj&quot;</formula>
        <name>Delete from Partner OPEN 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Personal_Dialer_List</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000Bbawe&quot;</formula>
        <name>Delete from Partner Personal Dialer List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Team_1</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawK&quot;</formula>
        <name>Delete from Partner Team 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Team_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawP&quot;</formula>
        <name>Delete from Partner Team 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Team_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawU&quot;</formula>
        <name>Delete from Partner Team 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Team_4</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BbawZ&quot;</formula>
        <name>Delete from Partner Team 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Tier1_Leads</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009qGIK&quot;</formula>
        <name>Delete from Partner Tier1 Leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Tier2_List</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009qGIP&quot;</formula>
        <name>Delete from Partner Tier2 List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Tier3_Leads</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009qGIj&quot;</formula>
        <name>Delete from Partner Tier3 Leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_from_Partner_Tier4_Leads</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009qQRh&quot;</formula>
        <name>Delete from Partner Tier4 Leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FL_USER_UPDATE</fullName>
        <field>Frontline_User__c</field>
        <formula>$User.FirstName &amp;&apos; &apos;&amp; $User.LastName</formula>
        <name>FL USER UPDATE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Alex_Perla</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Alex Perla&quot;</formula>
        <name>Five9 Opp List ID Alex Perla</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Alex_Perla_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Alex Perla&quot;</formula>
        <name>Five9 Opp List ID Alex Perla 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Andrew_Matos</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Andrew Matos&quot;</formula>
        <name>Five9 Opp List ID Andrew Matos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Andrew_Matos_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Andrew Matos&quot;</formula>
        <name>Five9 Opp List ID Andrew Matos 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Brendan_McBride</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Brendan McBride&quot;</formula>
        <name>Five9 Opp List ID Brendan McBride</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Brendan_McBride_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Brendan McBride&quot;</formula>
        <name>Five9 Opp List ID Brendan McBride 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Cayce_Prunesti</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Cayce Prunesti&quot;</formula>
        <name>Five9 Opp List ID Cayce Prunesti</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Cayce_Prunesti_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Cayce Prunesti&quot;</formula>
        <name>Five9 Opp List ID Cayce Prunesti 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Chaz_Wagner</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Chaz Wagner&quot;</formula>
        <name>Five9 Opp List ID Chaz Wagner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Chaz_Wagner_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Chaz Wagner&quot;</formula>
        <name>Five9 Opp List ID Chaz Wagner 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Darius_Polk</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Darius Polk&quot;</formula>
        <name>Five9 Opp List ID Darius Polk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Darius_Polk_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Darius Polk&quot;</formula>
        <name>Five9 Opp List ID Darius Polk 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Holly_Sowa</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Holly Sowa&quot;</formula>
        <name>Five9 Opp List ID Holly Sowa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Holly_Sowa_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Holly Sowa&quot;</formula>
        <name>Five9 Opp List ID Holly Sowa 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Jason_Perkins</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Jason Perkins&quot;</formula>
        <name>Five9 Opp List ID Jason Perkins</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Jason_Perkins_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Jason Perkins&quot;</formula>
        <name>Five9 Opp List ID Jason Perkins 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Jesse_Belt</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Jesse Belt&quot;</formula>
        <name>Five9 Opp List ID Jesse Belt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Jesse_Belt_3</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Jesse Belt&quot;</formula>
        <name>Five9 Opp List ID Jesse Belt 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Joe_LaFalcia</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Joe LaFalcia&quot;</formula>
        <name>Five9 Opp List ID Joe LaFalcia</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Joe_LaFalcia_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Joe LaFalcia&quot;</formula>
        <name>Five9 Opp List ID Joe LaFalcia 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Josh_Blades</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Josh Blades&quot;</formula>
        <name>Five9 Opp List ID Josh Blades</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Josh_Blades_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Josh Blades&quot;</formula>
        <name>Five9 Opp List ID Josh Blades 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Nick_Scallion</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Nick Scallion&quot;</formula>
        <name>Five9 Opp List ID Nick Scallion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Nick_Scallion_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Nick Scallion&quot;</formula>
        <name>Five9 Opp List ID Nick Scallion 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Pete_Havenstein</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Pete Havenstein&quot;</formula>
        <name>Five9 Opp List ID Pete Havenstein</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Five9_Opp_List_ID_Pete_Havenstein_2</fullName>
        <field>Five9_Opp_List_ID__c</field>
        <formula>&quot;Pete Havenstein&quot;</formula>
        <name>Five9 Opp List ID Pete Havenstein 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete_4</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete_5</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Frontline_Opp_Delete_6</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvFAAU&quot;</formula>
        <name>Frontline Opp Delete 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FundedClosedWon</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Funded - ClosedWon</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GTF_Record</fullName>
        <field>RecordTypeId</field>
        <lookupValue>GreenTree</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>GTF Record</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ignition_Leads_Delete_2</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXmYAAX&quot;</formula>
        <name>Ignition Leads Delete 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ignition_Opp_Delete</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXnCAAX&quot;</formula>
        <name>Ignition Opp Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ignition_Specialty_Lead_Delete_3</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BLXmdAAH&quot;</formula>
        <name>Ignition Specialty Lead Delete 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>InitialApprovalDTS</fullName>
        <field>Initial_Approval_DateStamp__c</field>
        <formula>NOW()</formula>
        <name>InitialApprovalDTS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_BA_Owned_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Last BA Owned Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Five9_List_001_RC_QL_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c390000095r64&quot;</formula>
        <name>Last Five9 List - 001 - RC-QL Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Five9_List_001_Tier_2_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Last Five9 List - 001 - Tier 2 Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Five9_List_001_Tier_3_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Last Five9 List - 001 - Tier 3 Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Five9_List_002_Frontline_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AkxWn&quot;</formula>
        <name>Last Five9 List - 002 - Frontline Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Five9_List_03</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;&quot;</formula>
        <name>Last Five9 List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_001_List_Upload_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c390000095mUv&quot;</formula>
        <name>Last List - 001 - List Upload Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_007_Fora_BFS_leads</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000B5Xf7&quot;</formula>
        <name>Last List - 007 - Fora BFS leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_999_Ineligible_Renewals</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbrMA&quot;</formula>
        <name>Last List - 999 Ineligible Renewals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Alex_Perla_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMNAAZ&quot;</formula>
        <name>Last List Alex Perla 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Alex_Perla_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMNAAZ&quot;</formula>
        <name>Last List Alex Perla 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Andrew_Matos_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMIAAZ&quot;</formula>
        <name>Last List Andrew Matos 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Andrew_Matos_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMIAAZ&quot;</formula>
        <name>Last List Andrew Matos 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_BA_Opps_1</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Last List BA Opps 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_BA_Owned_Opps_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Last List BA Owned Opps 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_BA_Owned_Opps_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Last List BA Owned Opps 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_BA_Owned_Opps_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BLbqT&quot;</formula>
        <name>Last List BA Owned Opps 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Brendan_McBride_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLoAAJ&quot;</formula>
        <name>Last List Brendan McBride 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Brendan_McBride_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLoAAJ&quot;</formula>
        <name>Last List Brendan McBride 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Cayce_Prunesti_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMSAAZ&quot;</formula>
        <name>Last List Cayce Prunesti 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Cayce_Prunesti_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMSAAZ&quot;</formula>
        <name>Last List Cayce Prunesti 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Chaz_Wagner_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsM3AAJ&quot;</formula>
        <name>Last List Chaz Wagner 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Chaz_Wagner_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsM3AAJ&quot;</formula>
        <name>Last List Chaz Wagner 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Darius_Polk_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLtAAJ&quot;</formula>
        <name>Last List Darius Polk 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Darius_Polk_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLtAAJ&quot;</formula>
        <name>Last List Darius Polk 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Holly_Sowa_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMcAAJ&quot;</formula>
        <name>Last List Holly Sowa 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Holly_Sowa_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMcAAJ&quot;</formula>
        <name>Last List Holly Sowa 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Jason_Perkins_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLyAAJ&quot;</formula>
        <name>Last List Jason Perkins 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Jason_Perkins_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsLyAAJ&quot;</formula>
        <name>Last List Jason Perkins 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Jesse_Belt_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMhAAJ&quot;</formula>
        <name>Last List Jesse Belt 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Jesse_Belt_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMhAAJ&quot;</formula>
        <name>Last List Jesse Belt 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Joe_LaFalcia_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMXAAZ&quot;</formula>
        <name>Last List Joe LaFalcia 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Joe_LaFalcia_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMXAAZ&quot;</formula>
        <name>Last List Joe LaFalcia 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Josh_Blades_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMmAAJ&quot;</formula>
        <name>Last List Josh Blades 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Josh_Blades_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMmAAJ&quot;</formula>
        <name>Last List Josh Blades 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Nick_Scallion_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsM8AAJ&quot;</formula>
        <name>Last List Nick Scallion 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Nick_Scallion_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsM8AAJ&quot;</formula>
        <name>Last List Nick Scallion 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Personal_Dialer</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000Bbawe&quot;</formula>
        <name>Last List - Partner Personal Dialer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Personal_Dialer_1</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000Bbawe&quot;</formula>
        <name>Last List Partner Personal Dialer 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Team_1</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbawK&quot;</formula>
        <name>Last List - Partner Team 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Team_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbawP&quot;</formula>
        <name>Last List - Partner Team 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Team_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbawU&quot;</formula>
        <name>Last List - Partner Team 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Team_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbawZ&quot;</formula>
        <name>Last List - Partner Team 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Tier_1_NEW</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AjXmVAAV&quot;</formula>
        <name>Last List - Partner Tier 1 NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Tier_2_New</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AjXqr&quot;</formula>
        <name>Last List - Partner Tier 2 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Tier_3_New</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AjXtqAAF&quot;</formula>
        <name>Last List - Partner Tier 3 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Tier_4_New</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AjXtvAAF&quot;</formula>
        <name>Last List - Partner Tier 4 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Last List Partner Unqualified Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Last List Partner Unqualified Opps 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Last List Partner Unqualified Opps 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Last List Partner Unqualified Opps 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps_5</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7AAJ&quot;</formula>
        <name>Last List Partner Unqualified Opps 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Partner_Unqualified_Opps_6</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BbbD7&quot;</formula>
        <name>Last List Partner Unqualified Opps 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Pete_Havenstein_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMrAAJ&quot;</formula>
        <name>Last List Pete Havenstein 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Pete_Havenstein_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsMrAAJ&quot;</formula>
        <name>Last List Pete Havenstein 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Prospect_Partner</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000Bbawj&quot;</formula>
        <name>Last List Prospect Partner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Snorlax_List</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsV5&quot;</formula>
        <name>Last List Snorlax List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Snorlax_List_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000BnsV5&quot;</formula>
        <name>Last List Snorlax List 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_List_Update</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000AjXtqAAF&quot;</formula>
        <name>Last List Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Converted_to_Opp_from_SA</fullName>
        <field>StageName</field>
        <literalValue>Prospecting</literalValue>
        <name>Lead Converted to Opp from SA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manual_FICO_1</fullName>
        <field>Manual_Applicant_1_FICO__c</field>
        <formula>Manual_Applicant_1_FICO_Score__c</formula>
        <name>Manual FICO 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NOVACards</fullName>
        <field>Visa_MC__c</field>
        <literalValue>1</literalValue>
        <name>NOVA Cards</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NewDaystoRepay</fullName>
        <field>Estimated_Days_to_Repay__c</field>
        <formula>New_Est_Days_to_Complete__c 

/*UW_Est_Days_to_Repay__c*/</formula>
        <name>New Days to Repay</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Days_to_Repay</fullName>
        <field>Estimated_Days_to_Repay__c</field>
        <formula>Est_Days_to_Repay__c</formula>
        <name>New Days to Repay</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>2a - Pre-Qual in Progress</literalValue>
        <name>Opportunity Level Update 2a</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_10</fullName>
        <description>Auto Decline-To Processing, Declined, Declined - Pending Mgmt Review</description>
        <field>Opportunity_Level__c</field>
        <literalValue>10 - Deal is Declined</literalValue>
        <name>Opportunity Level Update 10</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_10a</fullName>
        <description>Unqualified, Do Not Call, Closed Lost</description>
        <field>Opportunity_Level__c</field>
        <literalValue>10a - Deal is Unqualified - No Chance of Future Business</literalValue>
        <name>Opportunity Level Update 10a</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_11</fullName>
        <description>Unqualified, Do Not Call, Closed Lost</description>
        <field>Opportunity_Level__c</field>
        <literalValue>11 - Deal May be Eligible for Future Business</literalValue>
        <name>Opportunity Level Update 11</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_2</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>2 - Needs Additional Follow Up</literalValue>
        <name>Opportunity Level Update 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_3</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>3 - Merchant Sending CC Statements</literalValue>
        <name>Opportunity Level Update 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_4</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>4 - AE Preparing Quote</literalValue>
        <name>Opportunity Level Update 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_5</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>5 - Submitted Quote to Merchant</literalValue>
        <name>Opportunity Level Update 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_6</fullName>
        <description>C - Offer Accepted - Awaiting Compl Apps</description>
        <field>Opportunity_Level__c</field>
        <literalValue>6 - Verbal Acceptance, Need Additional Docs</literalValue>
        <name>Opportunity Level Update 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_7</fullName>
        <description>C-1 Contract Signed - More Info Needed</description>
        <field>Opportunity_Level__c</field>
        <literalValue>7 - Rec&apos;d Signed Contract, Still Need Additional Docs</literalValue>
        <name>Opportunity Level Update 7</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_8</fullName>
        <description>Submitted Deal</description>
        <field>Opportunity_Level__c</field>
        <literalValue>8 - All Docs Recieved from AE, Submitted to SA for Verification</literalValue>
        <name>Opportunity Level Update 8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Level_Update_9</fullName>
        <description>Approved, Approved - Pending Mgmnt Signature, Auto Approve-To Processing, Forwarded To Processing</description>
        <field>Opportunity_Level__c</field>
        <literalValue>9 - Deal is Approved</literalValue>
        <name>Opportunity Level Update 9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PQ_Data_Entry_Date</fullName>
        <field>PQ_Data_Entry_Date__c</field>
        <formula>NOW()</formula>
        <name>PQ Data Entry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Personal_Team_1</fullName>
        <field>Workflow_Activated__c</field>
        <formula>111</formula>
        <name>Partner Personal Team 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Personal_Team_2</fullName>
        <field>Workflow_Activated__c</field>
        <formula>222</formula>
        <name>Partner Personal Team 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Personal_Team_3</fullName>
        <field>Workflow_Activated__c</field>
        <formula>333</formula>
        <name>Partner Personal Team 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Personal_Team_4</fullName>
        <field>Workflow_Activated__c</field>
        <formula>444</formula>
        <name>Partner Personal Team 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PaybackAmountReprice</fullName>
        <field>Pay_Back_Amount__c</field>
        <formula>New_Payback_Price__c 
/*UW_New_Payback_Price__c*/</formula>
        <name>Payback Amount Reprice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payback_Amount_Reprice</fullName>
        <field>Pay_Back_Amount__c</field>
        <formula>New_Payback_Price__c</formula>
        <name>Payback Amount Reprice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PendingMgmntReviewFU</fullName>
        <field>StageName</field>
        <literalValue>Pending Management Review</literalValue>
        <name>Pending Mgmnt Review FU</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PercentPaybackReprice</fullName>
        <field>Percent_Payback__c</field>
        <formula>New_Percent_Payback__c 

/*UW_New_Percent_Payback__c*/</formula>
        <name>Percent Payback Reprice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Percent_Payback_Reprice</fullName>
        <field>Percent_Payback__c</field>
        <formula>New_Percent_Payback__c</formula>
        <name>Percent Payback Reprice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PopulateInitialunderwritingapproval</fullName>
        <field>Initial_underwriting_approval__c</field>
        <formula>CASE(Underwriting_Approval__c,&quot;Approved&quot;,&quot;Approved&quot;,
&quot;Approved by Credit Committee&quot;,&quot;Approved by Credit Committee&quot;,
&quot;Approved Re-price&quot;,&quot;Approved Re-price&quot;,
&quot;Approved by Credit Committee with conditions&quot;,&quot;Approved by Credit Committee with conditions&quot;,
&quot;Approved - Pending Management Review&quot;,&quot;Approved - Pending Management Review&quot;,
&quot;Auto Approved&quot;,&quot;Auto Approved&quot;,
&quot;Auto Declined&quot;,&quot;Auto Declined&quot;,
&quot;Declined&quot;,&quot;Declined&quot;,
&quot;Declined by Credit Committee&quot;,&quot;Declined by Credit Committee&quot;,
&quot;Declined - Pending Management Review&quot;,&quot;Declined - Pending Management Review&quot;,
&quot;Pending&quot;,&quot;Pending&quot;,
&quot;Pending management review returned to u/w&quot;,&quot;Pending management review returned to u/w&quot;,
&quot;Rescinded by merchant&quot;,&quot;Rescinded by merchant&quot;,
&quot;Rescinded by Processing&quot;,&quot;Rescinded by Processing&quot;,
&quot;Rescinded by RapidAdvance&quot;,&quot;Rescinded by RapidAdvance&quot;,
&quot;Rescinded by Underwriting&quot;,&quot;Rescinded by Underwriting&quot;,
&quot;Scheduled for credit committee&quot;,&quot;Scheduled for credit committee&quot;,
&quot;Unqualified - Comp. Pay Off too High - Reconsider Later&quot;,&quot;Unqualified - Comp. Pay Off too High - Reconsider Later&quot;,
&quot;Unqualified - Will Not Reconsider&quot;,&quot;Unqualified - Will Not Reconsider&quot;,
&quot;Unqualified - Will Reconsider in the Future&quot;,&quot;Unqualified - Will Reconsider in the Future&quot;,&quot;Error&quot;)</formula>
        <name>Populate Initial underwriting approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Decision_Date_Update</fullName>
        <field>Pre_Qual_Decision_Date__c</field>
        <formula>NOW()</formula>
        <name>Pre-Qual Decision Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Declined</fullName>
        <field>StageName</field>
        <literalValue>Pre-Qual FAIL</literalValue>
        <name>Pre-Qual Declined</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Entry_Time_Update</fullName>
        <field>Approval_Process_Entry_Time__c</field>
        <formula>NOW()</formula>
        <name>Pre-Qual Entry Time Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Info_Complete</fullName>
        <field>StageName</field>
        <literalValue>Pre-Qual in Progress</literalValue>
        <name>Pre-Qual Info Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Pending_Date_Update</fullName>
        <field>Pre_Qual_Pending_Date__c</field>
        <formula>NOW()</formula>
        <name>Pre-Qual Pending Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Type_Updated</fullName>
        <field>Type</field>
        <literalValue>Pre-Qualification New</literalValue>
        <name>Pre-Qual Type Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Type_Updated_Renew</fullName>
        <field>Type</field>
        <literalValue>Pre-Qualification Renewal</literalValue>
        <name>Pre-Qual Type Updated - Renew</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Unqualified</fullName>
        <field>StageName</field>
        <literalValue>Unqualified</literalValue>
        <name>Pre-Qual Unqualified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qual_Unqualified_Will_Reconsider</fullName>
        <field>StageName</field>
        <literalValue>Unqualified - Will Reconsider Later</literalValue>
        <name>Pre-Qual Unqualified Will Reconsider</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre_Qualification_PASS</fullName>
        <description>Pre-qualification has been completed and deal has passed.</description>
        <field>Type</field>
        <literalValue>Pre-Qualification New</literalValue>
        <name>Pre-Qualification - PASS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Processing_Rep_Stamp</fullName>
        <field>Processing_Rep_Assigned__c</field>
        <formula>NOW()</formula>
        <name>Processing Rep Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>QCDataEntryDate</fullName>
        <field>Data_Entry_Date__c</field>
        <formula>QC_Decision_Date__c</formula>
        <name>QC --&gt; Data Entry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>QC_Calculate_Due_Dates_Update</fullName>
        <field>Calculate_Due_Dates__c</field>
        <formula>NOW()</formula>
        <name>QC Calculate Due Dates Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Submission_Date</fullName>
        <field>Quote_Submission_Date__c</field>
        <formula>TODAY()</formula>
        <name>Quote Submission Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Regular_Opportunity</fullName>
        <field>RecordTypeId</field>
        <lookupValue>NewOpportunity</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Regular Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_from_0_7_Months_Paid</fullName>
        <field>delete_from_f9list_id__c</field>
        <formula>&quot;a0c3900000BnsUv&quot;</formula>
        <name>Remove from 0-7 Months Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_Number</fullName>
        <field>Renewal_Number__c</field>
        <formula>if(AND(Renewal__c,NOT(Addon_Oppy__c)),(Account.renewal_count__c+1),NULL)</formula>
        <name>Renewal Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RescindedByMerchants</fullName>
        <field>StageName</field>
        <literalValue>Signed Contract Rescinded by Merchant</literalValue>
        <name>Rescinded By Merchants</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RescindedByProcessing</fullName>
        <field>StageName</field>
        <literalValue>Rescinded by RapidAdvance</literalValue>
        <name>Rescinded By Processing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RescindedDealRA</fullName>
        <field>StageName</field>
        <literalValue>Rescinded by RapidAdvance</literalValue>
        <name>Rescinded Deal - RA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Green_Tree_Opportunity_indicator</fullName>
        <description>The field needs to be reset so the workflow is not triggered again on ownership changes</description>
        <field>Green_Tree_opportunity__c</field>
        <literalValue>No</literalValue>
        <name>Reset Green Tree Opportunity indicator</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RestStrtDate</fullName>
        <field>QC_Start_Date__c</field>
        <name>RestStrtDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Risk_Employee_Review_Date</fullName>
        <field>Risk_Employee_Review_Date__c</field>
        <formula>NOW()</formula>
        <name>Risk Employee Review Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Send_Declined_SurveyOn</fullName>
        <field>Send_Declined_Survey_On__c</field>
        <formula>now()</formula>
        <name>Send Declined Survey On</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Send_Mail_90_Days_Post_Funding_Survey</fullName>
        <field>X90_Days_Post_Funding_Survey__c</field>
        <literalValue>1</literalValue>
        <name>Send Mail 90-Days Post Funding Survey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Send_Mail_Client_Funding_Survey</fullName>
        <field>Client_Funding_Survey__c</field>
        <literalValue>1</literalValue>
        <name>Send Mail Client Funding Survey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Campaign_Additional_Owner_Email</fullName>
        <field>Campaign_Owner_Additional_Email__c</field>
        <formula>Campaign.BD_Send_Addtl_Owner__c</formula>
        <name>Set Campaign Additional Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Campaign_Owner_Email</fullName>
        <field>Campaign_Owner_Email__c</field>
        <formula>Campaign.BD_Send_Cmpn_Owner__c</formula>
        <name>Set Campaign Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SignedContractRecievedFieldUpdate</fullName>
        <field>Signed_Contract_Received__c</field>
        <formula>NOW()</formula>
        <name>Signed Contract Recieved Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_2</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_3</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_4</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_5</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_6</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Add_8</fullName>
        <field>add_to_f9list_id__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Add 8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_2</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_3</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_4</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_5</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_6</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sleeper_Opp_Last_8</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c39000009dQvoAAE&quot;</formula>
        <name>Sleeper Opp Last 8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StageChangetoClosedWon</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Stage Change to Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Pre_Qual_PASSED</fullName>
        <field>StageName</field>
        <literalValue>Pre-Qual Pass</literalValue>
        <name>Stage Pre-Qual PASSED</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Pre_Qual_Pass_Credit_Only</fullName>
        <field>StageName</field>
        <literalValue>Pre-Qual Pass Credit Only</literalValue>
        <name>Stage Pre-Qual Pass Credit Only</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submit_to_SA_DTS</fullName>
        <field>Submit_to_Sales_Assistant__c</field>
        <formula>now()</formula>
        <name>Submit to SA DTS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submit_to_UW_DTS</fullName>
        <field>Submit_to_UW_Processing__c</field>
        <formula>now()</formula>
        <name>Submit to UW DTS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubmittedtoQCDealComplt</fullName>
        <field>StageName</field>
        <literalValue>Submitted Deal</literalValue>
        <name>Submitted to QC - Deal Complt.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Survey_1_day</fullName>
        <field>Send_Client_Funding_Survey_On__c</field>
        <formula>now()</formula>
        <name>Survey 1 day</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Survey_90_day</fullName>
        <field>Send_90_Day_Post_Funding_Survey_On__c</field>
        <formula>now()</formula>
        <name>Survey 90 day</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEST</fullName>
        <field>Quick_Notes__c</field>
        <formula>&quot;Working&quot;</formula>
        <name>TEST</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Time</fullName>
        <field>Marble_Date__c</field>
        <formula>today()</formula>
        <name>Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_DS_Start_Date_Time</fullName>
        <field>DS_Start_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Timestamp: DS Start Date/Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UCCDebtorLegalNameRule</fullName>
        <description>Pulls the Account Name into the Debtor Legal Name field.</description>
        <field>UCC_Debtor_Legal_Name__c</field>
        <formula>Legal_Name__c</formula>
        <name>UCC Debtor Legal Name Rule</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPdate_Business_Phone</fullName>
        <field>Business_Phone_Phone__c</field>
        <formula>Account.Phone</formula>
        <name>UPdate Business Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPdate_Business_Phone_Ext</fullName>
        <field>Business_Phone_Phone_Ext__c</field>
        <formula>Account.Phone_Ext__c</formula>
        <name>UPdate Business Phone Ext</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPdate_QCdatetime</fullName>
        <field>QC_Start_Date__c</field>
        <formula>Now()</formula>
        <name>UPdate QCdatetime</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Send_Risk_Alert</fullName>
        <field>Send_Risk_Alert__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Send Risk Alert</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unqual_DT_Appen</fullName>
        <field>Unqualified_Date__c</field>
        <formula>Now()</formula>
        <name>Unqual DT Appen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unqualified</fullName>
        <field>StageName</field>
        <literalValue>Unqualified</literalValue>
        <name>Unqualified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unqualifiedwillconsiderlater</fullName>
        <field>StageName</field>
        <literalValue>Unqualified - Will Reconsider Later</literalValue>
        <name>Unqualified - will consider later</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateOpportuniyInternationalField</fullName>
        <field>International_Sale_Hidden_Text__c</field>
        <formula>Account.BillingCountry</formula>
        <name>Update Opportuniy International Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Existing_Competitor_Advance</fullName>
        <field>Existing_Competitor_Advance2__c</field>
        <literalValue>NO</literalValue>
        <name>Update Existing Competitor Advance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Initial_File_Review_Complete_Date</fullName>
        <field>Initial_File_Review2__c</field>
        <formula>NOW()</formula>
        <name>Update Initial File Review Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_List_Eapp</fullName>
        <field>Last_Five9_List__c</field>
        <formula>&quot;a0c3900000B5Xf7&quot;</formula>
        <name>Update Last List - Eapp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_Partner_Team</fullName>
        <description>Assign to Partner team where Lead Source is &apos;eApplication&apos; and Campaign Type is &apos;Pratners&apos;</description>
        <field>OwnerId</field>
        <lookupValue>partnerteamuser@rapidadvance.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Owner to Partner Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Email_1</fullName>
        <field>Partner_Email_1__c</field>
        <formula>HiddenPartnerEmail1__c</formula>
        <name>Update Partner Email 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Email_2</fullName>
        <field>Partner_Email_2__c</field>
        <formula>HiddenPartnerEmail2__c</formula>
        <name>Update Partner Email 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Email_3</fullName>
        <field>Partner_Email_3__c</field>
        <formula>HiddenPartnerEmail3__c</formula>
        <name>Update Partner Email 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Email_6</fullName>
        <field>Partner_Email_6__c</field>
        <formula>HiddenPartnerEmail6__c</formula>
        <name>Update Partner Email 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Percent_Complete</fullName>
        <field>Percent_Paid_Off__c</field>
        <formula>Total_Repay_Amount__c /  Purchase_Amount__c</formula>
        <name>Update Percent Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Run_WF_Rule</fullName>
        <field>Run_WF_Rule_1__c</field>
        <literalValue>0</literalValue>
        <name>Update Run WF Rule</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_Closed_Rule_10</fullName>
        <field>Status__c</field>
        <literalValue>Closed - Funded</literalValue>
        <name>Update Status To Closed Rule 10</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_File_In_Review_Rule_3</fullName>
        <field>Status__c</field>
        <literalValue>File Review</literalValue>
        <name>Update Status To File In Review Rule 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_No_Offer_Available_Rule</fullName>
        <field>Status__c</field>
        <literalValue>No Offer Available</literalValue>
        <name>Update Status To No Offer Available Rule</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_Process_Contract_Rule_8</fullName>
        <field>Status__c</field>
        <literalValue>Processing</literalValue>
        <name>Update Status To Process Contract Rule 8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_QC_InProgress</fullName>
        <field>Status__c</field>
        <literalValue>QC in Progress</literalValue>
        <name>Update Status To QC_InProgress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_Qualified_Offer_Rule_4a</fullName>
        <field>Status__c</field>
        <literalValue>Qualified Offer</literalValue>
        <name>Update Status To Qualified Offer Rule 4a</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_To_Submitted_For_Funding_A</fullName>
        <field>Status__c</field>
        <literalValue>Funding In Progress</literalValue>
        <name>Update Status To Submitted For Funding A</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_UCC_Filing_Reason</fullName>
        <field>UCC_Filing_Reason__c</field>
        <literalValue>Loan</literalValue>
        <name>Update UCC Filing Reason</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_UCC_Filling</fullName>
        <field>UCC_Filing__c</field>
        <literalValue>Full UCC-1</literalValue>
        <name>Update UCC Filling</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_UCC_Request_Date</fullName>
        <field>UCC_Date__c</field>
        <formula>Today()</formula>
        <name>Update UCC Request Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_field_Type_after_Recall</fullName>
        <field>Type</field>
        <name>Update field Type after Recall</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>User_Update</fullName>
        <field>Frontline_User__c</field>
        <formula>$User.FirstName&amp;&quot; &quot;&amp; $User.LastName</formula>
        <name>User Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_001</fullName>
        <field>Workflow_Activated__c</field>
        <formula>001</formula>
        <name>Workflow Activated 001</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_002</fullName>
        <field>Workflow_Activated__c</field>
        <formula>002</formula>
        <name>Workflow Activated 002</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_003</fullName>
        <field>Workflow_Activated__c</field>
        <formula>003</formula>
        <name>Workflow Activated 003</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_004</fullName>
        <field>Workflow_Activated__c</field>
        <formula>004</formula>
        <name>Workflow Activated 004</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_007</fullName>
        <field>Workflow_Activated__c</field>
        <formula>007</formula>
        <name>Workflow Activated 007</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_13</fullName>
        <field>Workflow_Activated__c</field>
        <formula>13</formula>
        <name>Workflow Activated 13</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_14</fullName>
        <field>Workflow_Activated__c</field>
        <formula>14</formula>
        <name>Workflow Activated 14</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_15</fullName>
        <field>Workflow_Activated__c</field>
        <formula>15</formula>
        <name>Workflow Activated 15</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_16</fullName>
        <field>Workflow_Activated__c</field>
        <formula>16</formula>
        <name>Workflow Activated 16</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_17</fullName>
        <field>Workflow_Activated__c</field>
        <formula>17</formula>
        <name>Workflow Activated 17</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_18</fullName>
        <field>Workflow_Activated__c</field>
        <formula>18</formula>
        <name>Workflow Activated 18</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_19</fullName>
        <field>Workflow_Activated__c</field>
        <formula>19</formula>
        <name>Workflow Activated 19</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_20</fullName>
        <field>Workflow_Activated__c</field>
        <formula>20</formula>
        <name>Workflow Activated 20</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_21</fullName>
        <field>Workflow_Activated__c</field>
        <formula>21</formula>
        <name>Workflow Activated 21</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_22</fullName>
        <field>Workflow_Activated__c</field>
        <formula>22</formula>
        <name>Workflow Activated 22</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_23</fullName>
        <field>Workflow_Activated__c</field>
        <formula>23</formula>
        <name>Workflow Activated 23</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Activated_777</fullName>
        <field>Workflow_Activated__c</field>
        <formula>777</formula>
        <name>Workflow Activated 777</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Working_Opp_Level</fullName>
        <field>Opportunity_Level__c</field>
        <literalValue>1 - Actively Working Opportunity</literalValue>
        <name>Opportunity Level Update 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>%24%24%24Five9 - 004 - Fora%2FBFS Opps</fullName>
        <actions>
            <name>Add_to_List_002_Frontline_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_007_Fora_BFS_leads</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5 and 6 and 7) OR (8 and 2 and 6)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_1__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_2__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_4__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>contains</operation>
            <value>Fora,&quot;Capital Source Group,LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>eApplication</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 - Castaway Bay Opps</fullName>
        <actions>
            <name>Castaway_Bay_3_Opp_Add</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_3_Opp_Last_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Ignition_Leads_Delete_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Ignition_Specialty_Lead_Delete_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BLXmYAAX,a0c3900000BLXmdAAH</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>notEqual</operation>
            <value>Fundera</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>notEqual</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>contains</operation>
            <value>PL Leads,MSLP3,Two Step LP1,Rapid Form MSLP 1,Rapid Form QV1,Rapid Form QV2,Rapid Form MSLP2,Rapid Form MSLP3,Customer Journey</value>
        </criteriaItems>
        <description>New Opps into Castaway Bay 3</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 - UCS Specialty Allocation</fullName>
        <actions>
            <name>New_UCS_Lead</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_to_PL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>equals</operation>
            <value>&quot;United Capital Source, LLC - Specialty&quot;</value>
        </criteriaItems>
        <description>***Deactivated per RMcKenzie request, 8-11-2017***</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BA Owned Leads to BA Owned Opps</fullName>
        <actions>
            <name>Add_to_BA_Owned_Opps_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_BA_Owned_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Activated_007</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;Capital Source Group,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>notEqual</operation>
            <value>Not Interested,Unqualified,BOBA Unqualified,BOBA Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
            <value>Brian Klenk,Alyssa Palafox,005700000036J0lAAE,00539000004Y50PAAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>contains</operation>
            <value>a0c3900000BLbqY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notEqual</operation>
            <value>Partner,Referral</value>
        </criteriaItems>
        <description>**Created 9/6/17 to move BA owned leads to BA Owned Opps**</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BA Owned Opps %28Broker Out Island Opps Delete%29</fullName>
        <actions>
            <name>Add_to_BA_Owned_Opps_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Broker_Out_Island_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_BA_Owned_Opps_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Activated_004</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;Capital Source Group,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>notEqual</operation>
            <value>Not Interested,Unqualified,BOBA Unqualified,BOBA Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
            <value>Brian Klenk,Alyssa Palafox,005700000036J0lAAE,00539000004Y50PAAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BLXpD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BA Owned Opps %28Castaway Bay 1 Opps Delete%29</fullName>
        <actions>
            <name>Add_to_BA_Opps_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_1_Opps_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_BA_Opps_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Activated_001</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;Capital Source Group,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>notEqual</operation>
            <value>Not Interested,Unqualified,BOBA Unqualified,BOBA Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
            <value>Brian Klenk,Alyssa Palafox,005700000036J0lAAE,00539000004Y50PAAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>contains</operation>
            <value>a0c3900000BLXoy</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BA Owned Opps %28Castaway Bay 2 Opps Delete%29</fullName>
        <actions>
            <name>Add_to_BA_Owned_Opps_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_2_Opps_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_BA_Owned_Opps_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Activated_002</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;Capital Source Group,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>notEqual</operation>
            <value>Not Interested,Unqualified,BOBA Unqualified,BOBA Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
            <value>Brian Klenk,Alyssa Palafox,005700000036J0lAAE,00539000004Y50PAAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>contains</operation>
            <value>a0c3900000BLXp3</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BA Owned Opps %28Castaway Bay 3 Opps Delete%29</fullName>
        <actions>
            <name>Add_to_BA_Owned_Opps_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_3_Opps_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_BA_Owned_Opps_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Activated_003</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;Capital Source Group,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>notEqual</operation>
            <value>Not Interested,Unqualified,BOBA Unqualified,BOBA Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
            <value>Brian Klenk,Alyssa Palafox,005700000036J0lAAE,00539000004Y50PAAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>contains</operation>
            <value>a0c3900000BLXp8</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - BOBA Unqualified%2FNot Interested%2FMarble Created to BOBA TRUE AGED</fullName>
        <actions>
            <name>BOBA_Opp_Delete_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BOBA_TRUE_AGED_Opp_Add_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BOBA_TRUE_AGED_Opp_Last</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BLXpDAAX</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>BOBA Unqualified,BOBA Not Interested,Marble Created</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - Broker Out Island Opps</fullName>
        <actions>
            <name>BA_Owned_Opp_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Broker_Out_Island_Opp_Add</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Broker_Out_Island_Opp_Last</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_1_Opp_Delete_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_2_Opp_Delete_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Castaway_Bay_3_Opp_Delete_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 or 3) and 2 and 4</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notEqual</operation>
            <value>Partner,Rapid API,Quicken Loans - Hot Transfer,Rock Connections - Transfer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Quicken,Copperline,Worldpay</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%24%24%24Five9 Opps - Direct Renewals to Ineligible Renewals</fullName>
        <actions>
            <name>Add_List_888_Partner_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_777_Direct_Renewals</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_999_Ineligible_Renewals</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and (2 or 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BbrM5</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Renewal - Ineligible</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal_Unqualified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Loyalty Renewal - 0 to 7 Months Snorlaxed%25</fullName>
        <actions>
            <name>Add_to_Snorlax_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Snorlax_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Remove_from_0_7_Months_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BnsUv</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Renewal - Ineligible,Renewal - Loyalty Call Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Loyalty Renewal - Greater than 7 Months Snorlaxed%25</fullName>
        <actions>
            <name>Add_to_Snorlax_List_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Greater_than_7_Months_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Snorlax_List_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BnsV0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Renewal - Ineligible,Renewal - Loyalty Call Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp -  OPEN Tiger Team - Darius Polk%25</fullName>
        <actions>
            <name>New_Opp_2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Darius_Polk_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Darius_Polk_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Darius_Polk_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Darius_Polk_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - OPEN Tiger Team - Brendan McBride%25</fullName>
        <actions>
            <name>New_Opp_4</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Brendan_McBride_Personal_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Brendan_McBride_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Brendan_McBride_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Brendan_McBride_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 1 - Brendan McBride%25</fullName>
        <actions>
            <name>New_Opp_3</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Brendan_McBride_Personal_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Brendan_McBride_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Brendan_McBride</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Brendan_McBride_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_1_Route_ID__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 1 - Darius Polk%25</fullName>
        <actions>
            <name>New_Opp</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Darius_Polk_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Darius_Polk_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Darius_Polk</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Darius_Polk_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_1_Route_ID__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 1 - Jason Perkins%25</fullName>
        <actions>
            <name>New_Opp_5</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Jason_Perkins_Personal_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Jason_Perkins_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Jason_Perkins</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Jason_Perkins_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_1_Route_ID__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 2 - Chaz Wagner%25</fullName>
        <actions>
            <name>New_Opp_7</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Chaz_Wagner_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Chaz_Wagner_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Chaz_Wagner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Chaz_Wagner_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_2_Route_ID__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 2 - Jesse Belt%25</fullName>
        <actions>
            <name>New_Opp_21</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Jesse_Belt_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Jesse_Belt_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Jesse_Belt</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Jesse_Belt_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_2_Route_ID__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 2 - Nick Scallion%25</fullName>
        <actions>
            <name>New_Opp_9</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Nick_Scallion_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Nick_Scallion_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Nick_Scallion</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Nick_Scallion_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_2_Route_ID__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 2 - Pete Havenstein</fullName>
        <actions>
            <name>New_Opp_25</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Pete_Havenstein_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Peter_Havenstein_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Pete_Havenstein</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Pete_Havenstein_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_2_Route_ID__c</field>
            <operation>equals</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 3 - Alex Perla%25</fullName>
        <actions>
            <name>New_Opp_13</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Alex_Perla_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Alex_Perla_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Alex_Perla</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Alex_Perla_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_3_Route_ID__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 3 - Andrew Matos%25</fullName>
        <actions>
            <name>New_Opp_11</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Andrew_Matos_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Andrew_Matos_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Andrew_Matos</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Andrew_Matos_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_3_Route_ID__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 3 - Cayce Prunesti%25</fullName>
        <actions>
            <name>New_Opp_15</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Cayce_Prunesti_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Cayce_Prunesti_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Cayce_Prunesti</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Cayce_Prunesti_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_3_Route_ID__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 3 - Holly Sowa%25</fullName>
        <actions>
            <name>New_Opp_19</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Holly_Sowa_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Holly_Sowa_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Holly_Sowa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Holly_Sowa_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_3_Route_ID__c</field>
            <operation>equals</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 3 - Joe LaFalcia%25</fullName>
        <actions>
            <name>New_Opp_17</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Joe_LaFalcia_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Joe_LaFalcia_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Joe_LaFalcia</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Joe_LaFalcia_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_3_Route_ID__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team 4 - Josh Blades%25</fullName>
        <actions>
            <name>New_Opp_23</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Josh_Blades_List_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Josh_Blades_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Josh_Blades</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Josh_Blades_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_4_Route_ID__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Alex Perla%25</fullName>
        <actions>
            <name>New_Opp_14</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Alex_Perla_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Alex_Perla_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Alex_Perla_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Alex_Perla_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>8</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Andrew Matos%25</fullName>
        <actions>
            <name>New_Opp_12</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Andrew_Matos_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Andrew_Matos_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Andrew_Matos_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Andrew_Matos_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Cayce Prunesti%25</fullName>
        <actions>
            <name>New_Opp_16</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Cayce_Prunesti_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Cayce_Prunesti_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Cayce_Prunesti_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Cayce_Prunesti_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>9</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Chaz Wagner%25</fullName>
        <actions>
            <name>New_Opp_8</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Chaz_Wagner_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Chaz_Wagner_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Chaz_Wagner_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Chaz_Wagner_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Holly Sowa%25</fullName>
        <actions>
            <name>New_Opp_20</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Holly_Sowa_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Holly_Sowa_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Holly_Sowa_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Holly_Sowa_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>11</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Jason Perkins%25</fullName>
        <actions>
            <name>New_Opp_6</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Jason_Perkins_Personal_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Jason_Perkins_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Jason_Perkins_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Jason_Perkins_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Jesse Belt%25</fullName>
        <actions>
            <name>New_Opp_22</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Jesse_Belt_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Jesse_Belt_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Jesse_Belt_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Jesse_Belt_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Joe LaFalcia%25</fullName>
        <actions>
            <name>New_Opp_18</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Joe_LaFalcia_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Joe_LaFalcia_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Joe_LaFalcia_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Joe_LaFalcia_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>10</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Josh Blades%25</fullName>
        <actions>
            <name>New_Opp_24</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Josh_Blades_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Josh_Blades_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Josh_Blades_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Josh_Blades_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>12</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Nick Scallion%25</fullName>
        <actions>
            <name>New_Opp_10</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Nick_Scallion_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Nick_Scallion_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Nick_Scallion_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Nick_Scallion_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>5</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%25Opp - Tiger Team OPEN - Pete Havenstein</fullName>
        <actions>
            <name>New_Opp_26</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_to_Pete_Havenstein_List_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Peter_Havenstein_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Five9_Opp_List_ID_Pete_Havenstein_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Pete_Havenstein_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Tiger_Team_OPEN_Route_ID__c</field>
            <operation>equals</operation>
            <value>7</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Ann Jones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner OPEN Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps_6</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_OPEN_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000Bbawj</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer CREATE</fullName>
        <actions>
            <name>Add_to_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>contains</operation>
            <value>Partner Account Executive,Partner Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>notEqual</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>notEqual</operation>
            <value>&quot;United Capital Source, LLC - Specialty&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer List Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Personal_Dialer_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000Bbawe</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer OPEN</fullName>
        <actions>
            <name>Add_to_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_OPEN</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6 and 7 and 8</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>contains</operation>
            <value>Partner Account Executive,Partner Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>OPEN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>notEqual</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Velan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer Team 1</fullName>
        <actions>
            <name>Add_to_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Five9_List_Partner_Team_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Personal_Team_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>bmcbride@rapidadvance.com,dpolk@rapidadvance.com,ericbenman@rapidadvance.com,jperkins@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer Team 2</fullName>
        <actions>
            <name>Add_to_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Five9_List_Partner_Team_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Personal_Team_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>cwagner@rapidadvance.com,danspadafora@rapidadvance.com,jkonkolewski@rapidadvance.com,nscallion@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer Team 3</fullName>
        <actions>
            <name>Add_to_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Five9_List_Partner_Team_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Personal_Team_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>andrewmatos@rapidadvance.com,aperla@rapidadvance.com,cprunesti@rapidadvance.com,jlafalcia@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Personal Dialer Team 4</fullName>
        <actions>
            <name>Add_to_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Five9_List_Partner_Team_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Personal_Dialer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Personal_Team_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>hsowa@rapidadvance.com,jbelt@rapidadvance.com,jblades@rapidadvance.com,phavenstein@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 1</fullName>
        <actions>
            <name>Add_to_List_Partner_Team_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Team_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>***UCS Specialty coming through per RMcKenzie&apos;s request 8-11-2017***</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 1 Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Team_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BbawK</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 2</fullName>
        <actions>
            <name>Add_to_List_Partner_Team_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Team_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 2 Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Team_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BbawP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 3</fullName>
        <actions>
            <name>Add_to_List_Partner_Team_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Team_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 3 Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Team_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BbawU</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 4</fullName>
        <actions>
            <name>Add_to_List_Partner_Team_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Team_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>T4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team 4 Unqualified Move and Delete</fullName>
        <actions>
            <name>Add_to_Partner_Unqualified_Opps_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Team_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Unqualified_Opps_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 4 and (3 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000BbawZ</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqual - Industry,Unqual - Credit,Unqual - Other,Unqual - Time In Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%26%26%26Five9 - Partner Team OPEN</fullName>
        <actions>
            <name>Add_to_Prospect_Partner_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Prospect_Partner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 and 6 and 8 and 9) or (5 and 7 and 9)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Partner_Campaign_Team__c</field>
            <operation>equals</operation>
            <value>OPEN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>contains</operation>
            <value>Donna Hinrichs</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Email__c</field>
            <operation>equals</operation>
            <value>annjones@rapidadvance.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.DMSDocsFirstRoundComplete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Five9_Lead_List_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>**Five9 - 002 - Frontline Opps</fullName>
        <actions>
            <name>Add_to_Five9_List_002_Frontline_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Five9_List_002_Frontline_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2 AND 3 and 6) OR (4 AND 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c39000008D27F,a0c3900000B5vsV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>notEqual</operation>
            <value>Fundera</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>notEqual</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c3900000B5vsV,a0c39000009q1Yq,a0c39000009qTZ5AAM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>contains</operation>
            <value>PL Leads,MSLP3,Two Step LP1,Rapid Form MSLP 1,Rapid Form QV1,Rapid Form QV2,Rapid Form MSLP2,Rapid Form MSLP3,Customer Journey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notEqual</operation>
            <value>Manually Created</value>
        </criteriaItems>
        <description>This workflow rule pushes new opportunities created from the below Last Five9 Lists to 002 - Frontline Opps</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>**Five9 Opps - BA DNQ to BOBA %28WA 21%29</fullName>
        <actions>
            <name>BA_Opp_Delete_7</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BOBA_Last_6</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BOBA_Opp_Add_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 3) and 2 and 4</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_Disposition__c</field>
            <operation>equals</operation>
            <value>Unqualified,Not Interested,Does Not Qualify</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notEqual</operation>
            <value>Partner,Rapid API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Quicken,Copperline,Worldpay</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ACON Notification</fullName>
        <actions>
            <name>Email_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Owner_Role__c</field>
            <operation>equals</operation>
            <value>Business Advisor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submitted_to_UW_Flag__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Unqualified_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AccountOwnerUpdate</fullName>
        <active>false</active>
        <formula>(PRIORVALUE(OwnerId) = &apos;005700000037L5a&apos; || 
PRIORVALUE(OwnerId) = &apos;00570000001ApYJ&apos; || 
PRIORVALUE(OwnerId) = &apos;00570000001xJS0&apos; || 
PRIORVALUE(OwnerId) = &apos;005700000037OXw&apos; || 
PRIORVALUE(OwnerId) = &apos;005700000037jIO&apos;)  &amp;&amp;
Owner.UserRoleId = &apos;00E30000000rFm2&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alex Lopez Pre-Qual PASSED</fullName>
        <actions>
            <name>Alex_L_Pre_Qualification_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>2 AND (1 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pre-Qual Pass</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>alex lopez</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>Declined</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>All Approved With Conditions Met date</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Decision_Date__c</field>
            <operation>equals</operation>
            <value>8/7/2014</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>All Approved With Conditions Met date update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.All_Approved_With_Conditions_Met__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Approved or Auto Approve</fullName>
        <actions>
            <name>ApprovedorAutoApproveFU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Approved by Credit Committee,Auto Approved,Approved by Credit Committee with conditions,Approved Re-price,Auto Approved Re-Price,Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Repriced</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Apvd Pending to Approved</fullName>
        <actions>
            <name>Appvdpendingtoapproved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign E-App Deals to Partner Team</fullName>
        <actions>
            <name>Update_Owner_to_Partner_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>For all the Partner deals coming through E-Application assign to Partner Team</description>
        <formula>Text(Campaign.Type) = &apos;Partners&apos; &amp;&amp; Text(LeadSource) = &apos;eApplication&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto Declined</fullName>
        <actions>
            <name>AutoDeclineStageChange</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Auto Declined</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Auto Declined Deal</fullName>
        <actions>
            <name>Auto_Declined_Deal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Auto Declined</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.QC_Decision__c</field>
            <operation>equals</operation>
            <value>Decline-Pending Management Review</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>B2C_Opp</fullName>
        <actions>
            <name>Biz2Credit_Deal_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>PrimaryCampaignSource__c = &quot;Biz2Credit&quot; &amp;&amp; ( (ISNEW()&amp;&amp;(NOT(ISPICKVAL(Status__c,&quot;&quot;)))) || ISCHANGED(Status__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>B2C_Prequal</fullName>
        <actions>
            <name>B2C_Prequal_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>PrimaryCampaignSource__c =&quot;Biz2Credit&quot; &amp;&amp; ischanged(Pre_Qual_Decision__c) &amp;&amp; not(ISPICKVAL(Pre_Qual_Decision__c,&quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BD Stage Notification</fullName>
        <actions>
            <name>BD_Stage_Changed_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Set_Campaign_Additional_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Campaign_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If BD Notifications are enabled (or overridden) on the Primary Campaign Source, send an email to the Campaign Owner(s)</description>
        <formula>ISCHANGED(StageName) &amp;&amp; (Campaign.BD_Send_Notifications__c=true || Campaign.BD_Notification_Override__c=true)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BF Renewal Alert</fullName>
        <actions>
            <name>BF_Renewal_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Product__c</field>
            <operation>equals</operation>
            <value>Decline Program</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Percent_Paid_Off__c</field>
            <operation>greaterOrEqual</operation>
            <value>75</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>startsWith</operation>
            <value>Merchant Capital Funding</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BOBA Transfer DT</fullName>
        <actions>
            <name>Boba_Transfer_DTOP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FL_USER_UPDATE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Frontline_Broker_Out__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BOBA Transfer Info Update</fullName>
        <actions>
            <name>BOBA_Transfer_DT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BOBA_Transfer_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.BA_Unqualified_Transfer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Card Activated</fullName>
        <actions>
            <name>Card_Activated_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Your_card_is_activated</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Card_Activated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sends an email to the client after the card activated field on the opportunity object is set to true. This is set in place for the Incentive Program.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Chad - Deal has been updated%2E</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>otinger</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LastModifiedById</field>
            <operation>notContain</operation>
            <value>kohlhepp,otinger,khadysha,dodge,baker hill,kholfi</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear UCC Filings on creation of Renewal</fullName>
        <actions>
            <name>Clear_UCC_Filing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_UCC_Filing_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_UCC_Requested_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>And(Renewal__c=true, OR(Not(ISBLANK(TEXT(UCC_Filing__c))) ,Not(ISBLANK(TEXT(UCC_Filing_Reason__c))), Not(ISBLANK(UCC_Date__c))))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Confirmed Add%27l Signer Number</fullName>
        <actions>
            <name>Confirmed_Add_l_Signer_Mobile_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Confirmed_Add_l_Signer_Phone_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Multiples_Owners__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Confirmed_Add_l_Signer_Mobile_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Confirmed_Add_l_Signer_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create Quancor Follow Up Call for Opportunity</fullName>
        <actions>
            <name>PlaceFollowUpCall</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Recycle Project - Quancor MAY 2008</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Deal is being rescinded - Missing information</fullName>
        <actions>
            <name>DealRescindedMissingInformation</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Rescinded by RapidAdvance</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Decline - Pending Mgmnt Review</fullName>
        <actions>
            <name>DeclinePendingMgmntReviewFU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 or (2 and 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Declined - Pending Management Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.QC_Decision__c</field>
            <operation>equals</operation>
            <value>Decline-Pending Management Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Decline Program Deal to QC Queue</fullName>
        <actions>
            <name>Decline_Program_Deal_to_QC_queue</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product__c</field>
            <operation>equals</operation>
            <value>Decline Program</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>notContain</operation>
            <value>Green Tree</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Decline Program Eligible</fullName>
        <actions>
            <name>Opp_Owner_Decline_Program_Eligible</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(Eligible_for_Decline_Program__c,&quot;YES&quot;) &amp;&amp; Campaign.Decline_Program__c &amp;&amp; ( ISPICKVAL(Pre_Qual_Decision__c,&quot;FAIL&quot;) || Declined_Flag__c = 1 )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Declined Deal</fullName>
        <actions>
            <name>DeclineFieldUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Declined,Declined by Credit Committee</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Declined by UW</fullName>
        <actions>
            <name>DeclinedbyUW</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Declined,Auto Declined</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Decision_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DistEngOppAssignment</fullName>
        <actions>
            <name>DistEngOppAssignmentOwner</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp;
OwnerId &lt;&gt; &apos;005700000037L5a&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;005700000037L5aAAE&apos; &amp;&amp;
(Owner.UserRoleId  &lt;&gt; &apos;00E70000000uowp&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DistEngOppAssignment_PartnerAlert</fullName>
        <actions>
            <name>Partner_Opportunity_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp;
OwnerId &lt;&gt; &apos;005700000037L5a&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;005700000037L5aAAE&apos; &amp;&amp;
(TEXT(StageName) = &apos;Pre-Qual Pass&apos; ||
TEXT(StageName) = &apos;Pre-Qual Pass Credit Only&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DistEngOppAssignment_PartnerAlert_Fail</fullName>
        <actions>
            <name>Partner_Pre_Qual_Fail</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>TEXT(StageName) = &apos;Pre-Qual FAIL&apos; &amp;&amp;
($User.UserRoleId &lt;&gt; &apos;00E70000000shym&apos; || 
 $User.Username = &apos;webservices@rapidadvance.com&apos; ||
 $User.Username = &apos;webapps@rapidadvance.com&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data Bankcard One%2C Inc%2E - Matt Milmeister Updates</fullName>
        <actions>
            <name>Elite_Data_Bankcard_One_Inc_Matt_Milmeister_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL( User__c , &quot;Bankcard One, Inc. - Matt Milmeister&quot;)   &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data EMS Kanas - Stephanie Bowlin Updates</fullName>
        <actions>
            <name>Elite_Data_EMS_Kanas_Stephanie_Bowlin_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL( User__c , &quot;EMS Kanas - Stephanie Bowlin&quot;)   &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data Electronic Merchant Solutions%2C Inc%2E - Richard Cha Updates</fullName>
        <actions>
            <name>Elite_Data_Electronic_Merchant_Solutions_Inc_Richard_Cha_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL( User__c , &quot;Electronic Merchant Solutions, Inc. - Richard Cha&quot;)   &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data Processing Updates</fullName>
        <actions>
            <name>Elite_Data_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>(Campaign.Name  = &quot;Chase-Elite Data Processing&quot;)  &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data United - Paul Rasidakis Updates</fullName>
        <actions>
            <name>Elite_Data_United_Paul_Rasidakis_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL( User__c , &quot;United - Paul Rasidakis&quot;)   &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Elite Data United Agoura - Jeff Brodsly Updates</fullName>
        <actions>
            <name>Elite_Data_EMS_Agoura_Jeff_Brodsly_Updates</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL( User__c , &quot;United Agoura - Jeff Brodsly&quot;)   &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FM %26 Associates Updates</fullName>
        <active>false</active>
        <formula>(Campaign.Name  = &quot;FM &amp; Associates&quot;)  &amp;&amp; (ISCHANGED(StageName)  ||  ISCHANGED(Description)   ||  ISCHANGED( Processing_Notes__c )  ||  ISCHANGED( Underwriting_Notes__c )   ||  ISCHANGED( Sales_Check_List_Notes__c ) ) &amp;&amp;   (Renewal__c  = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>First Merchant Payment Deal Update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>contains</operation>
            <value>First Merchant Payment</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LastModifiedById</field>
            <operation>notContain</operation>
            <value>baker hill,account team,kholfi</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>notEqual</operation>
            <value>Pending management review returned to u/w</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - 001 - List Upload Opps</fullName>
        <actions>
            <name>Add_to_001_List_Upload_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_001_List_Upload_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c390000095mUl</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - 001 - RC-QL Opps</fullName>
        <actions>
            <name>Add_to_Five9_List_001_RC_QL_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Five9_List_001_RC_QL_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c390000095r5z</value>
        </criteriaItems>
        <description>This workflow rule pushes new opportunities created from the below Last Five9 Lists to 001 - RC-QL Opps Five9 List: 
001 - RC-QL Leads</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - OP Partner Campaign Tier 1</fullName>
        <actions>
            <name>Add_to_List_Partner_Tier_1_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Tier1_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Tier_1_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>5 and 1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_1__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>notContain</operation>
            <value>&quot;United Capital Source, LLC - Specialty&quot;</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - Partner Op Campaign Tier 2</fullName>
        <actions>
            <name>Add_to_List_Partner_Tier_2_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Tier2_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Tier_2_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_2__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_name__c</field>
            <operation>notEqual</operation>
            <value>United Capital Source,LLC - Specialty</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - Partner Op Campaign Tier 3</fullName>
        <actions>
            <name>Add_to_List_Partner_Tier_3_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Tier3_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Tier_3_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_1__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_2__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_4__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>notContain</operation>
            <value>Fora,BFS,Business Financial Services,&quot;United Capital Source,LLC - Specialty&quot;,&quot;United Capital Source,LLC&quot;,&quot;Capital Direct, LLC&quot;</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - Partner Op Campaign Tier 4</fullName>
        <actions>
            <name>Add_to_List_Partner_Tier_4_New</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Delete_from_Partner_Tier4_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Partner_Tier_4_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_4__c</field>
            <operation>equals</operation>
            <value>4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_name__c</field>
            <operation>notEqual</operation>
            <value>United Capital Source,LLC - Specialty</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - Partner Op Campaign Tier MyBizAdv</fullName>
        <actions>
            <name>Add_to_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_List_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>eApplication</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_1__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_2__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_Tier_4__c</field>
            <operation>equals</operation>
            <value>3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_name__c</field>
            <operation>contains</operation>
            <value>My Biz Advance</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Five9 - Partner Op EAPP %28Hits Fora%2FBFS List%29</fullName>
        <actions>
            <name>Add_to_List_Eapp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Last_List_Eapp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>eApplication</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>Partner Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Preferred_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Frontline DT Update</fullName>
        <actions>
            <name>DT_UPdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>User_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Frontline_Transfer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fundbox_Email</fullName>
        <actions>
            <name>Fundbox_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Not Interested,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>contains</operation>
            <value>Truck,Service,Paint,Construction,Transportation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notContain</operation>
            <value>Quicken,Rock</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Funded - Closed Won</fullName>
        <actions>
            <name>Funding_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>AccOppStage_Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FundedClosedWon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Funding Call Alert</fullName>
        <actions>
            <name>Complete_Funding_Call</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <description>Creates a task for the opportunity owner to complete the funding call within four days of the funds being wired</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GTF Conversion</fullName>
        <actions>
            <name>GTF_Record</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>Sales - Brokerage</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>Sales - Brokerage Manager</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GTF Pending Management Review</fullName>
        <actions>
            <name>GTF_Opp_Pending_Management_Review_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Declined - Pending Management Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>equals</operation>
            <value>Rapid Advance Internal Campaign,Internet</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GTF Qualified Opp</fullName>
        <actions>
            <name>GTF_Opp_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pending Management Review,Auto Decline-To Processing,Declined,Declined - Pending Mgmt Review,Unqualified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notEqual</operation>
            <value>Partner,Partner-Web,Telemarketing - Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>General Funding Notification</fullName>
        <actions>
            <name>Funding_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>not(isnull( Funded_by_WC__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Initial Approval DTS</fullName>
        <actions>
            <name>InitialApprovalDTS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Initial_Approval_DateStamp__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Jeff - Deal has been updated</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>contains</operation>
            <value>jeff h</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LastModifiedById</field>
            <operation>notContain</operation>
            <value>kohlhepp,jeff h,khadysha,dodge,baker hill,kholfi</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lendr Email</fullName>
        <actions>
            <name>Lendr_Marble</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.State_HomeBased_Unqual__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lock Opportunity Records</fullName>
        <actions>
            <name>Update_Run_WF_Rule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Approved,Auto Decline-To Processing,Declined,Declined - Pending Mgmt Review,Unqualified,Closed Won,Rescinded by RapidAdvance,Signed Contract Rescinded by Merchant,Unqualified - Will Reconsider Later,Calc Decline</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Run_WF_Rule_1__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Manny - Deal has been updated</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>equals</operation>
            <value>manoug habibian</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LastModifiedById</field>
            <operation>notContain</operation>
            <value>kohlhepp,manoug,khadysha,dodge,baker hill,kholfi</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Manual FICO 1</fullName>
        <actions>
            <name>Manual_FICO_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Manual_Applicant_1_FICO_Score__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Manual_Applicant_1_FICO__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notification%3A Decision and Processor Rep Assigned</fullName>
        <actions>
            <name>Decision_and_Processor_Rep_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>contains</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Processing_Rep_Assigned__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Processing_Representative__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Offer Accepted</fullName>
        <actions>
            <name>Offer_Accepted</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>(ISPICKVAL(StageName, &quot;C - Offer Accepted&quot;) || ISPICKVAL(StageName, &quot;C - Offer Accepted - Awaiting Compl Apps&quot;)) &amp;&amp;     $User.Username  = &quot;webapps@rapidadvance.com&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>OppPaymentStatus</fullName>
        <actions>
            <name>Opp_Payment_Status</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>OR(OwnerId &lt;&gt; &quot;00550000000rsgHAAQ&quot;, OwnerId &lt;&gt; &quot;00530000000jbYtAAI&quot; ,OwnerId &lt;&gt; &quot;00570000001ApYJAA0&quot;, OwnerId &lt;&gt; &quot;00570000001uleYAAQ&quot;, OwnerId &lt;&gt; &quot;00570000001uu0SAAQ&quot;,
OwnerId &lt;&gt;  &quot;00570000001v4zQAAQ&quot;,
Owner.UserRoleId &lt;&gt; &quot;00E70000001b7oLEAQ&quot;) &amp;&amp; ( (Percent_Paid_Off__c&gt;=0.15&amp;&amp;PRIORVALUE(Percent_Paid_Off__c)&lt;0.15) || (Percent_Paid_Off__c&gt;=0.35&amp;&amp;PRIORVALUE(Percent_Paid_Off__c)&lt;0.35) || (Percent_Paid_Off__c&gt;=0.55&amp;&amp;PRIORVALUE(Percent_Paid_Off__c)&lt;0.55) || (Percent_Paid_Off__c&gt;=0.75&amp;&amp;PRIORVALUE(Percent_Paid_Off__c)&lt;0.75) || (Percent_Paid_Off__c&gt;=0.90&amp;&amp;PRIORVALUE(Percent_Paid_Off__c)&lt;0.90) ) &amp;&amp; ISNULL(Write_Off_Date__c) &amp;&amp; Advance_Payoff_Date__c=Date(1900,1,1) &amp;&amp; NOT(ISNULL(Funded_by_WC__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>OppStageChange</fullName>
        <actions>
            <name>AccOppStageUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>isnew()|| ischanged( StageName )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity AE Update</fullName>
        <actions>
            <name>Opportunity_AE_Email_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>( 
	(LastModifiedBy.UserRole.Name &lt;&gt; &quot;Administrator&quot;) 
	&amp;&amp; (LastModifiedBy.Username &lt;&gt; &quot;annjones@rapidadvance.com&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;GTF Manager&quot; ) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;GTF Account Executive&quot; ) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Account Executive&quot; ) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Direct Account Executive&quot; ) 
	&amp;&amp; NOT(contains(OwnerId, &quot;00570000001ApYJ&quot;))
	&amp;&amp; NOT(contains(OwnerId, &quot;00539000005j5pT&quot;))	
) 

|| 
( 

	(
		ispickval( Underwriting_Approval__c ,&quot;Rescinded by merchant&quot;) 
		|| ispickval(Underwriting_Approval__c,&quot;Rescinded by Processing&quot;) 
		|| ispickval(Underwriting_Approval__c,&quot;Rescinded by RapidAdvance&quot;) 
		|| ispickval(Underwriting_Approval__c,&quot;Rescinded by Underwriting&quot;)
	) 

	&amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;Administrator&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Senior Partner Account Executive&quot; ) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Partner Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Junior Partner Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Senior Direct Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Direct Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Associate Direct Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Direct Account Executive Coordinator&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Renewal Account Executive&quot;) 
	&amp;&amp; ( LastModifiedBy.UserRole.Name &lt;&gt; &quot;Rock Connections AE&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity AE Update2</fullName>
        <actions>
            <name>Opportunity_AE_Email_Update2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>ischanged(Approved_With_Conditions__c)  
&amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;Administrator&quot;) 
&amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;Account Executive&quot;)
&amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;Direct Account Executive&quot;) 
&amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;GTF Manager&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Info Transfer</fullName>
        <actions>
            <name>Lendio_Transfer</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Partners__c</field>
            <operation>includes</operation>
            <value>Lendio</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 1</fullName>
        <actions>
            <name>Working_Opp_Level</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>NO Contact Made,Prospecting</value>
        </criteriaItems>
        <description>NO Contact Made,Prospecting</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 10</fullName>
        <actions>
            <name>Opportunity_Level_Update_10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Declined - Pending Mgmt Review,Declined,Auto Decline-To Processing</value>
        </criteriaItems>
        <description>Auto Decline-To Processing, Declined, Declined - Pending Mgmt Review</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 10a</fullName>
        <actions>
            <name>Opportunity_Level_Update_10a</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Unqualified,Do Not Call</value>
        </criteriaItems>
        <description>Unqualified, Do Not Call, Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 11</fullName>
        <actions>
            <name>Opportunity_Level_Update_11</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Language Barrier,Not Interested,Rescinded by RapidAdvance,Signed Contract Rescinded by Merchant,Unqualified - Will Reconsider Later,Incomplete Contact or Company Info</value>
        </criteriaItems>
        <description>Language Barrier,Not Interested,Signed Contract Rescinded by Merchant,Rescinded by RapidAdvance,Unqualified - Will Reconsider Later,Incomplete Contact or Company Info</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 2</fullName>
        <actions>
            <name>Opportunity_Level_Update_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contact Made - Follow Up</value>
        </criteriaItems>
        <description>Contact Made - Follow Up</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 2a</fullName>
        <actions>
            <name>Opportunity_Level_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pre-Qual in Progress</value>
        </criteriaItems>
        <description>Pre-Qual in Progress</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 3</fullName>
        <actions>
            <name>Opportunity_Level_Update_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>A - Awaiting CC Statements</value>
        </criteriaItems>
        <description>A - Awaiting CC Statements</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 4</fullName>
        <actions>
            <name>Opportunity_Level_Update_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Statements Rec&apos;d Follow Up</value>
        </criteriaItems>
        <description>Statements Rec&apos;d Follow Up</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 5</fullName>
        <actions>
            <name>Opportunity_Level_Update_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>B - Quote Submitted</value>
        </criteriaItems>
        <description>B - Quote Submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 6</fullName>
        <actions>
            <name>Opportunity_Level_Update_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>C - Offer Accepted - Awaiting Compl Apps</value>
        </criteriaItems>
        <description>C - Offer Accepted - Awaiting Compl Apps</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 7</fullName>
        <actions>
            <name>Opportunity_Level_Update_7</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>C-1 Contract Signed - More Info Needed</value>
        </criteriaItems>
        <description>C-1 Contract Signed - More Info Needed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 8</fullName>
        <actions>
            <name>Opportunity_Level_Update_8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Submitted Deal</value>
        </criteriaItems>
        <description>Submitted Deal</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Level Update 9</fullName>
        <actions>
            <name>Opportunity_Level_Update_9</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Auto Approve-To Processing,Forwarded To Processing,Approved - Pending Mgmnt Signature,Approved</value>
        </criteriaItems>
        <description>Approved, Approved - Pending Mgmnt Signature, Auto Approve-To Processing, Forwarded To Processing</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Managment Sign Off</fullName>
        <actions>
            <name>Opportunity_Mgmt_Sign_Off_Email_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>ISCHANGED(  Management_Sign_Off__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Partner Update</fullName>
        <actions>
            <name>Opportunity_Partner_Email_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>Campaign.Send_Update__c  &amp;&amp; (Renewal__c  = False || AND(Renewal__c  = True,Campaign.Send_Update_On_Renewals__c ))  &amp;&amp; NOT(ISPICKVAL(Underwriting_Approval__c , &quot;Pending management review returned to u/w&quot;))  &amp;&amp; NOT(ISPICKVAL(Underwriting_Approval__c , &quot;Rescinded by RapidAdvance&quot;))  &amp;&amp; NOT(ISPICKVAL( StageName , &quot;Rescinded by RapidAdvance&quot;))  &amp;&amp; (LastModifiedBy.UserRole.Name &lt;&gt; &quot;Administrator&quot;)  &amp;&amp;    (ISCHANGED(Description) 	|| ISCHANGED(Third_Party_UW_Notes__c) 	|| ISCHANGED(StageName) 	|| ISCHANGED(Approved_With_Conditions__c) 	|| ISCHANGED(Underwriting_Approval__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Overdue QC Decision</fullName>
        <actions>
            <name>Overdue_QC_Decision_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Overdue_Trigger_Field__c</field>
            <operation>greaterThan</operation>
            <value>0.083</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.QC_Decision_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>greaterThan</operation>
            <value>3/1/2014</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Overdue UW Initial File Review</fullName>
        <actions>
            <name>Overdue_Initial_File_Review_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 6) or (2 AND 3 AND 4 AND 5 AND 7)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Overdue_Trigger_Field__c</field>
            <operation>greaterThan</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Initial_File_Review2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>greaterThan</operation>
            <value>3/1/2014</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>lessThan</operation>
            <value>75000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterOrEqual</operation>
            <value>75000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Overdue_Trigger_Field__c</field>
            <operation>greaterThan</operation>
            <value>0.35</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PREMIUM MCA NOT SIGNED FOR PARTNER - AE Notice</fullName>
        <actions>
            <name>PREMIUM_MCA_NOT_SIGNED_FOR_PARTNER_AE_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>These stages need to trigger an email to the individual opportunity owner with the subject PREMIUM MCA NOT SIGNED FOR PARTNER.</description>
        <formula>Campaign.Active_Premium_MCA_Agreement__c = False &amp;&amp; text( Product__c ) = &quot;Premium MCA&quot; &amp;&amp; datevalue( CreatedDate ) &gt;  DATE(2014,08,01) &amp;&amp; text(Campaign.Type) = &quot;Partners&quot; &amp;&amp;  (text(StageName) = &quot;Contact Made – Follow Up&quot; || text(StageName) = &quot;Statements Rec’d Follow Up&quot; || text(StageName) = &quot;B – Quote Submitted&quot; || text(StageName) = &quot;C - Offer Accepted - Awaiting Compl Apps&quot; || text(StageName) = &quot;C-1 Contract Signed - More Info Needed&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PREMIUM MCA NOT SIGNED FOR PARTNER - BD Notice</fullName>
        <actions>
            <name>BD_Alert_Partner_has_not_signed_Premium_MCA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>An email to go to BD@rapidadvance.com if we ever have a deal actually hit the approved stage and the Active Premium MCA Agreement is not checked.</description>
        <formula>LEFT( Campaign.Name , 3) &lt;&gt; &quot;NPC&quot; &amp;&amp;
Campaign.Active_Premium_MCA_Agreement__c = False &amp;&amp; datevalue( CreatedDate ) &gt;  DATE(2014,08,01) &amp;&amp; text( Product__c ) = &quot;Premium MCA&quot; &amp;&amp; text(Campaign.Type) = &quot;Partners&quot; &amp;&amp;  (text(StageName) = &quot;Approved&quot; || text(StageName) = &quot;C-1 Contract Signed - More Info Needed&quot; || text(StageName) = &quot;Submitted Deal&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Funding Notification</fullName>
        <actions>
            <name>Partner_Funding_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>AND	( 	NOT	( 		ISNULL(Funded_by_WC__c) 		), 	Campaign.Send_Update__c,  	OR	( 		NOT(Renewal__c),  		AND( 			Renewal__c, 			Campaign.Send_Update_On_Renewals__c  			) 		) 	)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner PreFund Call Notification</fullName>
        <actions>
            <name>Partner_Prefund_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>AND	( 	 PrimaryCampaignSource__c = &quot;Merchant One Solutions, LLC dba TwinFold Capital&quot;, 	Campaign.Send_Update__c,  	OR	( 		NOT(Renewal__c),  		AND( 			Renewal__c, 			Campaign.Send_Update_On_Renewals__c  			) 		) 	)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pay Off Requested</fullName>
        <actions>
            <name>Pay_Off_Letter_Requested</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Open_Account_Pay_Off_Letter_Requested__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pending Mgmnt Review</fullName>
        <actions>
            <name>PendingMgmntReviewFU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Pending Management Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Percent Complete</fullName>
        <actions>
            <name>Update_Percent_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Purchase_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Total_Repay_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Initial underwriting approval</fullName>
        <actions>
            <name>PopulateInitialunderwritingapproval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Using the initial Underwriting Approval value</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate UCC fields</fullName>
        <actions>
            <name>Update_UCC_Filing_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_UCC_Filling</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_UCC_Request_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Whenever the Product is Loan or Lines Of Credit and the opportunity stage reaches Closed Won the following fields are populated with the mentioned values- 

UCC Filing =&quot;Full UCC-1&quot;
UCC Request Date= Today&apos;s Date
UCC Filing Reason =&quot;Loan&quot;</description>
        <formula>AND(AND(ISCHANGED(StageName), ISPickVal(StageName,&quot;Closed Won&quot;)), OR(IsPickval(Product__c,&quot;Loan&quot;), IsPickval(Product__c,&quot;Line of Credit&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PowerPay - Cards Field Update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Processor_Name__c</field>
            <operation>equals</operation>
            <value>Power Pay</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual 1hour since submission</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Approval_Process_Entry_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Pre_Qual_1hour_since_submission</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Approval_Process_Entry_Time__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Pre-Qual Data Entry Date</fullName>
        <actions>
            <name>PQ_Data_Entry_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Person__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Decision Date Update</fullName>
        <actions>
            <name>Pre_Qual_Decision_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>notContain</operation>
            <value>Pending</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Declined</fullName>
        <actions>
            <name>AccOppStage_PQF</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pre_Qual_Declined</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>FAIL</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Initial Submission</fullName>
        <actions>
            <name>Pre_Qual_Entry_Time_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pre_Qual_Type_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pre-Qual in Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Initial Submission Renewal</fullName>
        <actions>
            <name>Pre_Qual_Type_Updated_Renew</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pre-Qual in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual PASSED</fullName>
        <actions>
            <name>Pre_Qualification_PASS_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>AccOppStage_PQP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_Pre_Qual_PASSED</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>PASS</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Pass Credit Only</fullName>
        <actions>
            <name>Pre_Qualification_PASS_Credit_Only_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>AccOppStage_PQP_Credit_Only</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_Pre_Qual_Pass_Credit_Only</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>contains</operation>
            <value>PASS CREDIT</value>
        </criteriaItems>
        <description>Opportunity Update and Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Pending Date Update</fullName>
        <actions>
            <name>Pre_Qual_Pending_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>Pending Management Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Pending Return to QC Email Alert</fullName>
        <actions>
            <name>Pre_Qual_Pending_Return_to_QC</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>Pending Management Review Returned to QC</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Unqualified</fullName>
        <actions>
            <name>AccOppStage_Unqualified</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pre_Qual_Unqualified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>Unqualified Not Willing to Reconsider</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Unqualified Will Reconsider</fullName>
        <actions>
            <name>AccOppStage_UnqReconsider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pre_Qual_Unqualified_Will_Reconsider</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Pre_Qual_Decision__c</field>
            <operation>equals</operation>
            <value>Unqualified Willing to Reconsider</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-Qual Update</fullName>
        <actions>
            <name>Change_Opportuniy_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Pre-Qual in Progress</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Preferred%2FSelect NOT SIGNED FOR PARTNER - BD Notice</fullName>
        <actions>
            <name>Send_an_Email_Alert_to_BD_rapidadvance_com</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>An email to go to BD@rapidadvance.com if we ever have a deal actually hit the approved stage and the Active Preferred /Select Addendum is not checked.</description>
        <formula>LEFT( Campaign.Name , 3) &lt;&gt; &quot;NPC&quot; &amp;&amp;
Campaign.Active_PreferredSelect_Addendum__c = False &amp;&amp; datevalue( CreatedDate ) &gt;  DATE(2014,08,01) &amp;&amp; (text( Product__c ) = &quot;Preferred Loan&quot;  || text( Product__c ) = &quot;Select LOan&quot;) &amp;&amp; text(Campaign.Type) = &quot;Partners&quot; &amp;&amp;  (text(StageName) = &quot;Approved&quot; || text(StageName) = &quot;C-1 Contract Signed - More Info Needed&quot; || text(StageName) = &quot;Submitted Deal&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Previous Owner</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ProMac Approved or Auto Approved</fullName>
        <actions>
            <name>ProMac_Deal_Approved</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Approved by Credit Committee,Auto Approved,Approved by Credit Committee with conditions,Approved Re-price,Auto Approved Re-Price,Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Campaign_name__c</field>
            <operation>startsWith</operation>
            <value>Promac Medical,Promac – Non Medical New,Promac – Non Medical Renewals</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Processor Assigned DateStamp</fullName>
        <actions>
            <name>Processing_Rep_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged(Processing_Representative__c ) &amp;&amp;
not (isblank (text (Processing_Representative__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>QC Calculate Due Dates Update</fullName>
        <actions>
            <name>QC_Calculate_Due_Dates_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.QC_Person__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QC Decision - Auto Decline</fullName>
        <actions>
            <name>Decision_Date_timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.QC_Decision__c</field>
            <operation>equals</operation>
            <value>Auto Declined</value>
        </criteriaItems>
        <description>Set the Decision Date when the QC Decision is set to Auto-Decline</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QC Decision Date</fullName>
        <actions>
            <name>QCDataEntryDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED( QC_Decision_Date__c ) &amp;&amp; ISNULL( Data_Entry_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>QC Time Check</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.QC_Decision__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>RestStrtDate</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Opportunity.QC_flag__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>QC%3A Sandra Galdamez Deals</fullName>
        <actions>
            <name>QC_Sandra_Galdamez</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK( Submit_to_UW_Processing__c )) &amp;&amp; ISPICKVAL(QC_Person__c,&quot;Sandra Galdamez&quot;) &amp;&amp; ISBLANK( Data_Entry_Date__c ) &amp;&amp; OR(ISPICKVAL(StageName,&quot;C-1 Contract Signed - More Info Needed&quot;),ISPICKVAL(StageName,&quot;Submitted Deal&quot;)) &amp;&amp; ISCHANGED(StageName)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>QC%3A Theresa Dupree Deals</fullName>
        <actions>
            <name>QC_Theresa_Dupree_Deals</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK( Submit_to_UW_Processing__c )) &amp;&amp; ISPICKVAL(QC_Person__c,&quot;Theresa Dupree&quot;) &amp;&amp; ISBLANK( Data_Entry_Date__c ) &amp;&amp; OR(ISPICKVAL(StageName,&quot;C-1 Contract Signed - More Info Needed&quot;),ISPICKVAL(StageName,&quot;Submitted Deal&quot;)) &amp;&amp; ISCHANGED(StageName)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Quote Submitted Date</fullName>
        <actions>
            <name>Quote_Submission_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
    TEXT(StageName) = &apos;B - Quote Submitted&apos;,
    ISBLANK(Quote_Submission_Date__c)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RapidAdvance %E2%80%93 Funding Declined Survey</fullName>
        <active>true</active>
        <formula>AND(OR(text(StageName)=&quot;Unqualified – Will Reconsider Later&quot;,
text(StageName)=&quot;Unqualified - Will Reconsider Later&quot;,
text(StageName)=&quot;Unqualified&quot;,text(StageName)=&quot;Declined&quot;,text(StageName)=&quot;Declined - Pending Mgmt Review&quot;),signed_flag__c=1,isblank(Advance_ID__c))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Declined_SurveyOn</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>15</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>RapidAdvance %E2%80%93 Funding Survey 1 day</fullName>
        <active>true</active>
        <description>This will be send the next day</description>
        <formula>text(StageName)=&apos;Closed Won&apos; &amp;&amp; Addon_Oppy__c &lt;&gt; true &amp;&amp; Renewal__c &lt;&gt; true</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Survey_1_day</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>RapidAdvance %E2%80%93 Funding Survey 90 day</fullName>
        <active>true</active>
        <description>This will be send after 90 days</description>
        <formula>text(StageName)=&apos;Closed Won&apos; &amp;&amp; Addon_Oppy__c &lt;&gt; true &amp;&amp; Renewal__c &lt;&gt; true</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Survey_90_day</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Reduce Slit Status</fullName>
        <actions>
            <name>SplitReductionNotificationInternal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Date_Split_Changed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Regular Opportunity Update</fullName>
        <actions>
            <name>Regular_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Pre-Qual in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Opportunity,Old Record Type,Pre Qual Record Type</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Remove opps from list</fullName>
        <actions>
            <name>Delete_from_Five9_List_03</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Five9_List_03</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Last_Five9_List__c</field>
            <operation>equals</operation>
            <value>a0c39000008DEUm,a0c390000095l0t,a0c39000008DEWE,a0c390000095r64</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Declined,Unqualified,Closed Won,Not Interested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified - Will Reconsider Later,Duplicate - Opportunity,Wrong Number</value>
        </criteriaItems>
        <description>Workflow removes opps that are not relevant</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renew Email 1</fullName>
        <actions>
            <name>Renewal_Email_1</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Renewal_Initial_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Eligibility Update</fullName>
        <actions>
            <name>Renewal_Eligibility_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Email</description>
        <formula>Percent_Paid_Off__c &gt;40 &amp;&amp; ispickval( StageName,&quot;Closed Won&quot;)&amp;&amp; not(isblank( Funded_by_WC__c )) &amp;&amp; ischanged( Renewal_Eligibility__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Rescinded By RA</fullName>
        <actions>
            <name>RescindedDealRA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Rescinded by Processing,Rescinded by Underwriting,Rescinded by RapidAdvance</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rescinded by Merchant</fullName>
        <actions>
            <name>RescindedByMerchants</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Rescinded by merchant</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Resend Mail 90-Days Post Funding Survey-15 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.X90_Days_Post_Funding_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Send_90_Day_Post_Funding_Survey_On__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Mail_90_Days_Post_Funding_Survey</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>15</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Resend Mail Client Funding Survey 15 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Client_Funding_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Send_Client_Funding_Survey_On__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Mail_Client_Funding_Survey</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>15</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Review Funding Approval</fullName>
        <actions>
            <name>Review_for_funding_approval</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Submitted_For_Funding_Approval__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Review Funding Approval - Merchant One</fullName>
        <actions>
            <name>Review_for_funding_approval_Merchant_One</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Submitted_For_Funding_Approval__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PrimaryCampaignSource__c</field>
            <operation>equals</operation>
            <value>Merchant One Solutions,LLC dba TwinFold Capital</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>equals</operation>
            <value>70170000000KgvP,70170000000KgvPAAS</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Risk Employee Review Date</fullName>
        <actions>
            <name>Risk_Employee_Review_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged(  Risk_Employee__c  ) &amp;&amp; 
not (isblank(text(Risk_Employee__c) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Risk Error Issues</fullName>
        <actions>
            <name>Send_Risk_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Uncheck_Send_Risk_Alert</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Send_Risk_Alert__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send an email indicating Risk Error Issues were encountered when the &quot;Send Risk Alert&quot; checkbox is checked</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RocketLoans Opportunity Info Transfer</fullName>
        <actions>
            <name>Rocket_Loans_Opportunity_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>RocketLoans_Transfer</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Partners__c</field>
            <operation>includes</operation>
            <value>RocketLoans</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SBS Funding Notification</fullName>
        <actions>
            <name>SBS_Funding</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>ISPICKVAL(StageName,&quot;Closed Won&quot;) &amp;&amp; PrimaryCampaignSource__c = &quot;IPayment-Secured Bankcard Services&quot; &amp;&amp; not(isblank(Funded_by_WC__c)) &amp;&amp; ischanged(Funded_by_WC__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>STU Unquals</fullName>
        <actions>
            <name>UW_Unqual</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submitted_to_UW_Flag__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notContain</operation>
            <value>Quicken,Rock</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send CS Survey</fullName>
        <actions>
            <name>CustomerSatisfactionSurveySent</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Email_Address__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>A Customer Sat Survey is sent after deal is funded.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Email On GreenTree Oppt Creation</fullName>
        <actions>
            <name>Send_Email_for_Green_Tree_Oppt</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_Green_Tree_Opportunity_indicator</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Record_Type_Id__c</field>
            <operation>equals</operation>
            <value>012700000009mdp</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Opportunity_Owner_Name__c</field>
            <operation>notEqual</operation>
            <value>Jeff Hageman</value>
        </criteriaItems>
        <description>This workflow will send email to Jeff Hageman and the opportunity owner whenever a Green Tree opportunity is created</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send GT ownership changes</fullName>
        <actions>
            <name>Send_GTF_Ownership_Change</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>equals</operation>
            <value>Matthew Dillingham</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>equals</operation>
            <value>Juan Yanez</value>
        </criteriaItems>
        <description>This WF Rule will send an email alert to Jeff, whenever a GT Oportunity will be assigned to his team members.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set DS Start Date%2FTime</fullName>
        <actions>
            <name>Timestamp_DS_Start_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.DS_Person__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Timestamp for when a DS person is assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Signed Contract Received</fullName>
        <actions>
            <name>SignedContractReceived</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Signed_Contract_Received__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Signed Contract Received - Direct</fullName>
        <actions>
            <name>Signed_Contract_Received_Direct</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Signed_Contract_Received__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Direct</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Signed Contract Received - Partner</fullName>
        <actions>
            <name>Signed_Contract_Received_Partner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Signed_Contract_Received__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Logic_for_Reporting__c</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <description>Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stage Change to Closed Won</fullName>
        <actions>
            <name>StageChangetoClosedWon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Funded_by_WC__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submit to SA Stamp</fullName>
        <actions>
            <name>Submit_to_SA_DTS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Submitted Deal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_Sales_Assistant__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submit to UW Stamp</fullName>
        <actions>
            <name>Submit_to_UW_DTS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Submitted Deal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submitted Deal %28Renewal%29 Stage Update</fullName>
        <actions>
            <name>SubmittedtoQCDealComplt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Submit_to_Sales_Assistant__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.X3_Minute_Application__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.MRA_3_Minute_are_complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Calculator__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When deal (renewal) is submitted to QC the stage will go to &quot;Submitted Deal&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submitted Deal Stage Update</fullName>
        <actions>
            <name>SubmittedtoQCDealComplt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Submit_to_Sales_Assistant__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.X3_Minute_Application__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Legible_4_months_processing_statements__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Submit_to_UW_Processing__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Voided_Check_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Calculator__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.MRA_3_Minute_are_complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Renewal__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Legible_Photo_Identification_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When deal is submitted to QC the stage will go to &quot;Submitted Deal&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submitted for Funding</fullName>
        <actions>
            <name>Merchant_One_Submitted_for_Funding</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND	(  PrimaryCampaignSource__c = &quot;Merchant One Solutions, LLC dba TwinFold Capital&quot;, NOT	(  ISNULL( Submitted_For_Funding_Approval__c )  ),  Campaign.Send_Update__c,  OR	(  NOT(Renewal__c),  AND(  Renewal__c,  Campaign.Send_Update_On_Renewals__c  )  )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Submitted to UW</fullName>
        <actions>
            <name>Merchant_One_Submitted_to_Underwriting</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email</description>
        <formula>AND(NOT(ISNULL( Submit_to_UW_Processing__c )),PrimaryCampaignSource__c = &quot;Merchant One Solutions, LLC dba TwinFold Capital&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Syndication Amount Entered</fullName>
        <actions>
            <name>Syndication_Amount_Ent</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Syndication_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>workflow deactivated as per #25561</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Syndication Amount Missing</fullName>
        <actions>
            <name>Syndication_Amount_Missing</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>This WF rule will send an email alert to the concerned AE and Campaign Owners, if the Syndication Amount is blank.</description>
        <formula>IF(
	AND(
		(Campaign.Syndication_Partner__c  = True), 
		(ISBLANK(Syndication_Amount__c )),
        ISCHANGED(Signed_Contract_Received__c),
        ( PRIORVALUE(Signed_Contract_Received__c)  = null),
		NOT( ISBLANK(Signed_Contract_Received__c) )
		
	)		,true,false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Syndication Details Missing</fullName>
        <active>false</active>
        <formula>IF(
	AND((Campaign.Syndication_Partner__c  = True), ISBLANK(Syndication_Amount__c )),true,false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TEST Email Notification Rule</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>contains</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LastModifiedById</field>
            <operation>notContain</operation>
            <value>baker hill,account team,kholfi</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UCC Legal Name Update</fullName>
        <actions>
            <name>UCCDebtorLegalNameRule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>UCC_Debtor_Legal_Name__c  &lt;&gt;  Legal_Name__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UPdate Business Phone</fullName>
        <actions>
            <name>UPdate_Business_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UPdate_Business_Phone_Ext</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Account.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Phone_Ext__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UW Assigned</fullName>
        <actions>
            <name>UW_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>not(isnull( UW_Assigned_Date_Stamp__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Uncheck Existing Competitor Advance</fullName>
        <actions>
            <name>Update_Existing_Competitor_Advance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Not(isnull( Paid_Off_Letter_Rec_d__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Underwriting Approval Alert - Approved %3D%3E Declined</fullName>
        <actions>
            <name>ApprovedDealHasNowBeenDECLINEDInternal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email When the underwriter approval of a deal changes from (Approved or Auto Approved) to (Declined or Auto Declined), processing receives email notification.</description>
        <formula>AND(OR(ISPICKVAL(Underwriting_Approval__c, &quot;Declined&quot;),ISPICKVAL(Underwriting_Approval__c, &quot;Auto Declined&quot;)), OR(ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Approved&quot;),ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Auto Approved&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Underwriting Approval Alert - Approved %3D%3E Declined new</fullName>
        <actions>
            <name>Approved_Deal_Has_Now_Been_DECLINED_Internal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>When the underwriter approval of a deal changes from (Approved or Auto Approved) to (Declined or Auto Declined), processing receives email notification.</description>
        <formula>AND(OR(ISPICKVAL(Underwriting_Approval__c, &quot;Declined&quot;),ISPICKVAL(Underwriting_Approval__c, &quot;Auto Declined&quot;)), OR(ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Approved&quot;),ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Auto Approved&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Underwriting Approval Alert - Declined %3D%3E Approved</fullName>
        <actions>
            <name>UWApprovalStatusChangeDeclinedtoApproved</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email When the underwriter approval of a deal changes from (Declined or Auto Declined) to (Approved or Auto Approved), Monica receives enail notification.</description>
        <formula>AND(OR(ISPICKVAL(Underwriting_Approval__c, &quot;Approved&quot;),ISPICKVAL(Underwriting_Approval__c, &quot;Auto Approved&quot;)), OR(ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Declined&quot;),ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Auto Declined&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Underwriting Approval Alert - Rescinded %3D%3E Approved</fullName>
        <actions>
            <name>RescindedApprovedAlert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email When the underwriter approval of a deal changes from rescinded by (UW, processing, merchant, RapidAdvance) to approved,  Monica receives enail notification.</description>
        <formula>AND(OR(ISPICKVAL(Underwriting_Approval__c, &quot;Approved&quot;), ISPICKVAL(Underwriting_Approval__c, &quot;Auto Approved&quot;)),  OR(ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Rescinded by merchant&quot;), ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Rescinded by RapidAdvance&quot;), ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Rescinded by Processing&quot;), ISPICKVAL(PRIORVALUE(Underwriting_Approval__c),&quot;Rescinded by Underwriting&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unqualified</fullName>
        <actions>
            <name>AccOppStage_Unqualified</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Unqualified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Unqualified - Will Not Reconsider</value>
        </criteriaItems>
        <description>When underwriting marks a deal &quot;Unqualified&quot; the merchant, AE, and the partner (if applicable) gets an email notification.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Unqualified - will consider later</fullName>
        <actions>
            <name>AccOppStage_UnqReconsider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Unqualifiedwillconsiderlater</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>equals</operation>
            <value>Unqualified - Will Reconsider in the Future,Unqualified - Comp. Pay Off too High - Reconsider Later</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unqualified Date Append</fullName>
        <actions>
            <name>Unqual_DT_Appen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Unqualified,Unqualified - Will Reconsider Later</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Unqualified Opportunity Rule</fullName>
        <actions>
            <name>UnqualifiedNotificationEmail</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Unqualified_Reason__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Underwriting_Approval__c</field>
            <operation>contains</operation>
            <value>Unqualified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Decision_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Email When an opportunity is marked unqualified, the AE gets an auto-email.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Initial File Review Complete Date</fullName>
        <actions>
            <name>Update_Initial_File_Review_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Initial_File_Review_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Lead Source for Customer Journey Opps</fullName>
        <actions>
            <name>Change_Leadsource</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Works only for campaign mentioned below 

SEM | G | Brand | Exact 
SEM | G | Brand | Phrase 
SEM | G | Loan SB | Exact 
SEM | G | Loan | Exact</description>
        <formula>ISPICKVAL(LeadSource,&apos;Two Step LP1&apos;) &amp;&amp; ( Campaign_name__c =&apos;SEM | G | Brand | Exact&apos; || Campaign_name__c =&apos;SEM | G | Brand | Phrase&apos; || Campaign_name__c =&apos;SEM | G | Loan SB | Exact&apos; || Campaign_name__c =&apos;SEM | G | Loan | Exact&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Partner Emails</fullName>
        <actions>
            <name>Update_Partner_Email_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Partner_Email_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Partner_Email_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Partner_Email_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Renewal Number</fullName>
        <actions>
            <name>Renewal_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To Closed Rule 10</fullName>
        <actions>
            <name>Update_Status_To_Closed_Rule_10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISPICKVAL(Status__c , &quot;Funding In Progress&quot;) ,  	ISPICKVAL(StageName,  &apos;Closed Won&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To File In Review Rule 3</fullName>
        <actions>
            <name>Update_Status_To_File_In_Review_Rule_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISPICKVAL(Status__c , &quot;QC In Progress&quot;) ,  ISCHANGED(Data_Entry_Date__c),  ISNULL(PRIORVALUE(Data_Entry_Date__c) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To No Offer Available Rule 4b</fullName>
        <actions>
            <name>Update_Status_To_No_Offer_Available_Rule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISPICKVAL(Status__c , &quot;File Review&quot;) , OR(ISPICKVAL(Underwriting_Approval__c, &quot;Declined&quot;), ISPICKVAL(Underwriting_Approval__c, &quot;Declined by Credit Committee&quot;), ISPICKVAL(Underwriting_Approval__c, &quot;Unqualified - Comp. Pay Off too High - Reconsider Later&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Unqualified - Will Not Reconsider&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Unqualified - Will Reconsider in the Future&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Rescinded by merchant&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Rescinded by Processing&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Rescinded by RapidAdvance&quot;), 	ISPICKVAL(Underwriting_Approval__c, &quot;Rescinded by Underwriting&quot;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To Process Contract Rule 8</fullName>
        <actions>
            <name>Update_Status_To_Process_Contract_Rule_8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Changing from &quot;Contract Available&quot; to &quot;Processing Contract&quot;
If the signed contract is received, the Application/Opportunity should changed to be &quot;Processing Contract&quot;</description>
        <formula>AND( ISPICKVAL(Status__c , &quot;Contract Available&quot;) ,  !ISNULL( Signed_Contract_Received__c ) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To QC_InProgress</fullName>
        <actions>
            <name>Update_Status_To_QC_InProgress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISCHANGED(QC_Person__c), ISPICKVAL(PRIORVALUE(QC_Person__c) , &apos;&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To Qualified Offer Rule 4a</fullName>
        <actions>
            <name>Update_Status_To_Qualified_Offer_Rule_4a</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISPICKVAL(Status__c , &quot;File Review&quot;) , OR(ISPICKVAL(Underwriting_Approval__c, &quot;Approved&quot;), ISPICKVAL(Underwriting_Approval__c, &quot;Approved by Credit Committee&quot;), ISPICKVAL(Underwriting_Approval__c, &quot;Approved by Credit Committee with conditions&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status To Submitted For Funding Approval Rule 9</fullName>
        <actions>
            <name>Update_Status_To_Submitted_For_Funding_A</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISPICKVAL(Status__c , &quot;Processing&quot;),!ISPICKVAL(Product__c, &quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>AutoDecisioned</fullName>
        <assignedTo>Processors</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Deal has been auto decisioned</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Auto Decisioned</subject>
    </tasks>
    <tasks>
        <fullName>BrendanDealmaybereadyforrenewal</fullName>
        <assignedTo>bmcbride@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Brendan - Deal may be ready for renewal</subject>
    </tasks>
    <tasks>
        <fullName>Complete_Funding_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>1. Congratulate and thank our client for doing business with us
2. Foreshadow what will happen next
3. Encourage participation in surveys and testimonials 
4. Obtain referrals
5. Foreshadow renewals</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.Funded_by_WC__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Complete Funding Call</subject>
    </tasks>
    <tasks>
        <fullName>DealRescindedMissingInformation</fullName>
        <assignedToType>owner</assignedToType>
        <description>Deal is being rescinded because they are not submitting the required information.  Please call merchant.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Deal Rescinded - Missing Information</subject>
    </tasks>
    <tasks>
        <fullName>Dealisreadytobeconfirmed</fullName>
        <assignedTo>alsims@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Deal is ready to be confirmed</subject>
    </tasks>
    <tasks>
        <fullName>Dealisreadytoconfirm</fullName>
        <assignedTo>alsims@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Deal is ready to confirm</subject>
    </tasks>
    <tasks>
        <fullName>DevinDealmaybereadyforrenewal</fullName>
        <assignedTo>ddelany@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Devin- Deal may be ready for renewal</subject>
    </tasks>
    <tasks>
        <fullName>Lendio_Transfer</fullName>
        <assignedTo>ddechiaro@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Lendio Transfer</subject>
    </tasks>
    <tasks>
        <fullName>PlaceFollowUpCall</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Place Follow Up Call</subject>
    </tasks>
    <tasks>
        <fullName>RocketLoans_Transfer</fullName>
        <assignedTo>ddechiaro@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>RocketLoans Transfer</subject>
    </tasks>
    <tasks>
        <fullName>RyanDealmaybereadyforrenewal</fullName>
        <assignedTo>rdearborn@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Ryan - Deal may be ready for renewal</subject>
    </tasks>
    <tasks>
        <fullName>SiteInspectionHasALERT</fullName>
        <assignedTo>faithkustra@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Site Inspection Has ALERT</subject>
    </tasks>
    <tasks>
        <fullName>X3_Month_Approved</fullName>
        <assignedTo>ddechiaro@rapidadvance.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>test</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>3 Month Approved</subject>
    </tasks>
    <tasks>
        <fullName>Your_card_is_activated</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Your card is activated!</subject>
    </tasks>
</Workflow>
