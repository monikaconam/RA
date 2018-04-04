/*
@Name            : WebServicePartnerAccountInfoToCALC
@Author          : DS-Conam
@Date            : 27 June 2016
@Description     : 
*/
global class WebServicePartnerAccountInfoToCALC
{
    webservice static String sendData(String recID)
    {
        String jsonString=null;
        try
        {
            String keyCode=Account.sObjectType.getDescribe().getKeyPrefix();

            if(recID.startsWith(keyCode))
            {
                Map<String, String> recValueMap=new Map<String, String>();
                Schema.FieldSet accfieldSet=Schema.SObjectType.Account.FieldSets.getMap().get('CALC_Partner_Account_Descriptor');
                AccountResponse arTemp =new AccountResponse();
                arTemp.isSuccess=false;
                arTemp.Records=null;
                if(accfieldSet!=null)
                {                
                    List<Schema.FieldSetMember> fieldList=accfieldSet.getFields();
                    String query='Select ';   
                    for(Schema.FieldSetMember fsTemp : fieldList)
                    {
                        query += fsTemp.getFieldPath() + ', ';
                        recValueMap.put(fsTemp.getFieldPath().toLowerCase(),null);
                    }
                    
                    query += ' createddate FROM Account where id=\''+recID+'\' LIMIT 1';
                    
                    Account acc=Database.query(query);
                    List<RecordWrapper> jwList=new List<RecordWrapper>();
                    
                    for(Schema.FieldSetMember fsTemp : fieldList)
                        recValueMap.put(fsTemp.getFieldPath().toLowerCase(),String.valueOF(acc.get(String.valueOf(fsTemp.getFieldPath()))));                       
            
                    for(String s : recValueMap.keyset())
                    {
                        System.debug('==========='+s +'::::::::'+ recValueMap.get(s));
                        RecordWrapper jw=new RecordWrapper(s,recValueMap.get(s));
                        /*jw.key=s;
                        jw.value=recValueMap.get(s);*/
                        jwList.add(jw);
                    }
                                    
                    arTemp.isSuccess=True;
                    arTemp.Records=new List<RecordWrapper>();
                    arTemp.Records=jwList;
                    arTemp.message='Success';
                }
                else
                {
                    arTemp.message='Unable to find the Partner Descriptor in Salesforce';
                }
                jsonString=JSON.serialize(arTemp).replace('category_contains_banks__c','Category_Contains_Banks__c').replace('category_contains_cuso__c','Category_Contains_CUSO__c').replace('category_contains_credit_union__c','Category_Contains_Credit_Union__c');
            }
            else
            {
                Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
                for(Schema.SObjectType objectInstance : gd.values())
                {
                    // if ID other than Account is passed
                    if(objectInstance.getDescribe().getKeyPrefix() == recID.subString(0,3))
                    {
                        AccountResponse arTemp =new AccountResponse();
                        arTemp.isSuccess=false;
                        arTemp.Records=null;
                        arTemp.message='Unable to process request expected record type is Account but found '+ objectInstance.getDescribe().getName();
                        jsonString=JSON.serialize(arTemp);
                    }
                    else
                    {
                        // if Value other than any valid Salesforce id is passed 
                        AccountResponse arTemp =new AccountResponse();
                        arTemp.isSuccess=false;
                        arTemp.Records=null;
                        arTemp.message='Unknown Type Record Id -'+recId;
                        jsonString=JSON.serialize(arTemp);
                    }                    
                }
            }
        }
        catch(Exception e)
        {
            AccountResponse arTemp =new AccountResponse();
            arTemp.isSuccess=false;
            arTemp.Records=null;
            arTemp.message='Unable to process request due to an exception - '+e.getMessage()+'@Line-'+e.getLinenumber();
            jsonString=JSON.serialize(arTemp);
            System.debug(jsonString);
        }
        System.debug(jsonString);
        return jsonString;
    }
    
    public class AccountResponse
    {
        public Boolean isSuccess;
        List<RecordWrapper> Records;
        String message;
        public AccountResponse()
        {
            isSuccess=false;
            Records=new List<RecordWrapper>();
        }
    }
    
    public class RecordWrapper
    {
        public String key;
        public String value;
        
        public RecordWrapper(String key,String value)
        {
            this.key=key;
            this.value=value;
        }
    }
}