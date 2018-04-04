global with sharing class Extjs_Applicant_Credit 
{
    // a class for supplying field property info to the VF component for use in setting up the grid
    global class FieldInfo 
    {
        global String name;
        global Boolean modifiable;
        global Boolean sortable;
        global Boolean nillable;
        global String fieldType;
        global String label;
        // a List of string pairs as needed by pickList column editor
        global List<List<String>> pickListValues;     
    }

    global class DescribeException extends Exception 
    {
    }

    // get object metadata and supply to component
    @RemoteAction
    global static List<FieldInfo>
    describeFields(String objName,List<String> fieldNames) 
    {
        Map<String, Schema.sObjectType> objTypeMap = Schema.getGlobalDescribe();
        if (!objTypeMap.containsKey(objName))
        {
            throw new DescribeException('No sObject named ' + objName + ' found');
        }

        // TODO: check for accessibility as well
        Schema.sObjectType sObj = objTypeMap.get(objName);
        Map<String, Schema.sObjectField> fieldMap = sObj.getDescribe().fields.getMap();
        // iterate, supplying meta information in format Ext likes
        List<FieldInfo> result = new List<FieldInfo>();
        for (String field : fieldNames) 
        {
            if (!fieldMap.containsKey(field))
            {
                throw new DescribeException('No field named ' + field + ' found in sObject ' + objName);
            }
            Schema.DescribeFieldResult dfr = fieldMap.get(field).getDescribe();
            FieldInfo fi = new FieldInfo();
            fi.name = field;
            fi.modifiable = dfr.isCreateable() | dfr.isUpdateable();
            fi.sortable = dfr.isSortable();
            fi.nillable = dfr.isNillable();
            fi.fieldType = String.valueOf(dfr.getType()).toLowerCase();
            fi.label = dfr.getLabel();
                        
            if (dfr.getType() == Schema.DisplayType.PickList) 
            {
                fi.pickListValues = new List<List<String> >();
                for (Schema.PickListEntry plv : dfr.getPickListValues()) 
                {
                    if (plv.isActive()) 
                    {
                        fi.pickListValues.add(new String[]{plv.getLabel(), plv.getValue()});
                    }
                }
                // add empty string option if nillable
                if (dfr.isNillable()) 
                {
                    fi.pickListValues.add(new String[]{'', null});
                }
            }
                result.add(fi);
        }
            return result;
    }

    // a user-defined class that will serialize to the JSON expected by the ExtJS DirectProxy api methods
    global class CRUDResponse 
    {
        global Boolean success;
        global String errorMessage;
        global List<sObject> records;
        global Integer total;
        CRUDResponse() 
        {
            records = new List<sObject>();
            success = true;
        }
    }
    
    // Unfortunately JS Remoting member functions must be static, so cannot access non-static class members,
    // which means we cannot cache query results in this controller but must respond to each request anew
    
    global class QueryObj 
    {
        global String sObjname;
        global String fields;
        global Integer start;
        global Integer recordCount;
        global String parentFieldName;
        global String oppId;
        global List<Map<String, String> > sortParams;
    }
    
    // turn grid's page load/sort request into SOQL and return data
    @RemoteAction
    global static CRUDResponse query(QueryObj qobj) 
    {
        CRUDResponse resp = new CRUDResponse();    
        Set<String> conIds = new Set<String>(); 
        List<OpportunityContactRole> opcList = [SELECT ContactId 
        FROM OpportunityContactRole 
        WHERE OpportunityId =: qobj.oppId]; 
        for(OpportunityContactRole opc : opcList)
        {
            String temp = opc.ContactId;
            conIds.add(opc.ContactId); 
        }
        // construct a count query.  Two SOQL statements - one COUNT(), one with LIMIT -
        // seems to be faster than one query without LIMIT
        
        String countstr = 'SELECT COUNT() FROM ' + qobj.sObjname +' WHERE Id IN: conIds'; 
        //countstr = String.escapeSingleQuotes(countstr);
        resp.total = Database.countQuery(countstr);   // ExtJS grid needs the true total here
        // construct a query string
        String qstr = 'SELECT ' + qobj.fields + ' FROM ' + qobj.sObjname+' WHERE Id IN: conIds ';
        if (qobj.sortParams != null) 
        {
            qstr += ' ORDER BY ';
            // collect sort fields/directions
            qstr += qobj.sortParams[0].get('property');
            for (Integer i = 1; i < qobj.sortParams.size(); i++) 
            {
                qstr += ',' + qobj.sortParams[i].get('property');
            }
            // SOQL only supports a single direction, so ignoring others. Probably should return error instead.
            qstr += ' ' + qobj.sortParams[0].get('direction');
        }
        // data reduction: LIMIT and OFFSET
        // calculate the index of the first record returned by the query
        // OFFSET has some tricky limitations.  First, the maximum value is 2000, so if the first desired record
        // is beyond that point we will have to access some records we don't want.  Second, the use of OFFSET
        // causes the maximum number of records returned to be 200 - this appears to be undocumented.
        Integer startrec = 0;                
        if (qobj.recordCount > 200) 
        {
            // cannot use OFFSET; start at zero and include records before our desired region
            Integer reclimit = qobj.start + qobj.recordCount;
            qstr += ' LIMIT ' + String.valueOf(reclimit);
        }        
        else 
        {
            startrec = Math.min(qobj.start, 2000);
            // record count to get is the sum of the mandatory unwanted records (those over 2000) and those we want
            Integer reclimit = (qobj.start - startrec) + qobj.recordCount;
            qstr += ' LIMIT ' + String.valueOf(reclimit);
            qstr += ' OFFSET ' + String.valueOf(startrec);
        }        
        //qstr = String.escapeSingleQuotes(qstr);   // sanitize for SOQL injection
        Integer current_result = startrec;        // initialize with the true offset
        String[] fieldNames = qobj.fields.split(','); 
        try
        {
            for (List<sObject> rlit : Database.query(qstr)) 
            {
                for (sObject rit : rlit) 
                {
                    if ((current_result >= qobj.start) && (current_result < (qobj.start + qobj.recordCount))) 
                    {
                        resp.records.add(rit);
                    }
                    current_result++;
                }
            }
        } 
        catch (Exception e) 
        {
            resp.success = false;
            resp.records = null;
            resp.errorMessage = e.getMessage();
            return resp;
        }
            return resp;
    }
    
    // C,U,D methods from DirectProxy all have the same argument format:
    global class CRUDData
    {
        global String sObjname;
        global String fields;
        global String oppId;
        global String parentFieldName;
        global List<Map<String, String> > records;
    }
    
    // Utility method to refresh newly created/updated objects after the DML operation, for returning to the grid
    global static CRUDResponse refreshObjects(CRUDData crudData, List<sObject> sObjs) 
    {
        CRUDResponse resp = new CRUDResponse();    
        String objName = crudData.sObjname;
        String fieldList = crudData.fields;
        String[] fieldNames = fieldList.split(',');
        Set<ID> updatedIds = new Set<ID>();
        for (sObject sObj : sObjs) 
        {
            updatedIds.add(sObj.id);
        }
        for (List<sObject> rlit : Database.query('SELECT ' + fieldList + ' FROM ' + objName +
        ' WHERE Id IN :updatedIds')) 
        {
            for (sObject rit : rlit) 
            {
                resp.records.add(rit);
            }
        }
        return resp;        
    }

    // Create and Update are very similar.
    // Create supplies all specified fields but no Id; Update specifies Id and only the fields that changed
    @RemoteAction
    global static CRUDResponse create(CRUDData crudData) 
    {
        CRUDResponse resp = new CRUDResponse();
        List<sObject> sObjs = unpacksObjects('create', crudData, resp);
            if (!resp.success) 
            {
                return resp;
            }
    
        try 
        {
            insert sObjs;
        } 
        catch (Exception e) 
        {
            resp.success = false;
            resp.errorMessage = 'create: insert failed with error ' + e.getMessage();
            return resp;
        }
        return refreshObjects(crudData, sObjs);
    }
    
    // "update" and "delete" are keywords so must pick something else
    // Ken Thompson is supposed to have said that if he could redo anything about Unix,
    // he'd spell "creat" with an extra "e".  So in that spirit:
    @RemoteAction
    global static CRUDResponse updat(CRUDData crudData) 
    {
        CRUDResponse resp = new CRUDResponse();
        List<sObject> sObjs = unpacksObjects('update', crudData, resp);
        if (!resp.success) 
        {
            return resp;
        }    
        try 
        {
            update sObjs;
        } 
        catch (Exception e) 
        {
            resp.success = false;
            resp.errorMessage = 'update: failed with error ' + e.getMessage();
            return resp;
        }
        return refreshObjects(crudData, sObjs);
    }

    @RemoteAction
    global static CRUDResponse delet(CRUDData crudData) 
    {
        CRUDResponse resp = new CRUDResponse();    
        // produce a List of IDs from each supplied sObject
        List<Map<String, String> > sObjs = crudData.records;
        List<String> idList = new List<String>();
        for (Map<String, String> sObj : sObjs) 
        {
            idList.add(sObj.get('Id'));
        }
        try 
        {
            Database.delete(idList);
        } 
        catch (Exception e) 
        {
            resp.success = false;
            resp.errorMessage = 'delete: failed with error ' + e.getMessage();
        }        
        return resp;
    }

    // utility functions
    // create, update, and delete all supply things that resemble sObjects
    // (although update only has changed fields and delete only has IDs)
    // this method may seem a bit redundant when Remoting can now accept sObjects.  There are two important
    // things we do here that can't be done just by accepting List<sObject> in our methods:
    // 1) a generic sObject (not created from a describe "token") and without an Id cannot be used in DML,
    //    so we have to generate a new sObject anyway for "create" operations
    // 2) There is something funny about Date fields - I haven't been able to find a format
    //    that the server will accept.  A plain Date parameter can be supplied via UTC string, but
    //    one that is a field inside an sObject gives problems.  Converting from a string works fine though.
    
    static List<sObject> unpacksObjects(String action, CRUDData crudData, CRUDResponse resp) 
    {
        resp.success = false;    
        // use "base" params to find the sObject type we need to create
        if (crudData.sObjname == null) 
        {
            resp.errorMessage = 'sObject name not supplied in client call';
            return null;
        }
    
        String objName = crudData.sObjname;
        String oppId = crudData.oppId;
        String parentField = crudData.parentFieldName;            
        Map<String, Schema.sObjectType> objTypeMap = Schema.getGlobalDescribe();
        if (!objTypeMap.containsKey(objName)) 
        {
            resp.errorMessage = 'No sObject named ' + objName + ' found';
            return null;
        }
        
        Schema.sObjectType sObjToken = objTypeMap.get(objName);  // "token" representing this sObject type
        Map<String, Schema.sObjectField>fieldMap = sObjToken.getDescribe().fields.getMap();        
        if (crudData.records == null)
        {
            resp.errorMessage = 'argument ' + crudData + ' contained no records field';
            return null;
        }
        List<Map<String, String> > records = crudData.records;
        List<sObject> sObjs = new List<sObject>();
        for(Map<String, String>recMap : records) 
        {
            sObject sObj;
            if (recMap.containsKey('Id')) 
            {
                // create sObject using supplied Id (setting it as a field will fail)
                sObj = sObjToken.newsObject(recMap.get('Id'));
            }
            else 
            {
                sObj = sObjToken.newsObject();
            }
            for (String k : recMap.keySet()) 
            {
                // definitely an empty value if null, empty string, or the string 'null' but the type is not string
                // TODO it does seem like I should be able to Map 'null' to null somehow in MapUnpack()
                Boolean emptyValue = (recMap.get(k) == null) || (recMap.get(k) == '') ||
                (fieldMap.get(k).getDescribe().getType() != Schema.DisplayType.string) &&
                (recMap.get(k) == 'null');
                if ((k != 'Id') &&  // never try to set Id this way (see above)
                ((action == 'update') || // don't try to set an empty value unless this is an update
                !emptyValue)) 
                {
                    if (emptyValue) 
                    {
                        sObj.put(k, null);
                    } 
                        else if (fieldMap.get(k).getDescribe().getType() == Schema.DisplayType.date) 
                        {
                            // sObj.put(k, Date.valueOf(recMap.get(k)));
                            sObj.put(k, Date.parse(recMap.get(k)));
                        } 
                        else if (fieldMap.get(k).getDescribe().getType() == Schema.DisplayType.boolean) 
                        {
                            sObj.put(k, Boolean.valueOf(recMap.get(k)));
                        } 
                        else if (fieldMap.get(k).getDescribe().getType() == Schema.DisplayType.integer) 
                        {
                            sObj.put(k, Integer.valueOf(recMap.get(k)));
                        } 
                        else if (fieldMap.get(k).getDescribe().getType() == Schema.DisplayType.double) 
                        {
                            sObj.put(k, Double.valueOf(recMap.get(k)));
                        }
                        else if (fieldMap.get(k).getDescribe().getType() == Schema.DisplayType.Currency) 
                        {
                            sObj.put(k, Decimal.valueOf(recMap.get(k)));
                        } 
                        else 
                        {
                            sObj.put(k, recMap.get(k));
                        } 
                        // TODO: handle other types, esp. Currency
                        //sObj.put('Opportunity__c', crudData.oppId);
                        //sObj.put(parentField , crudData.oppId);
                        sObj.put(parentField , recMap.get('Id'));
                }
            }
            sObjs.add(sObj);
        }
            resp.success = true;
            return sObjs;
    }
}