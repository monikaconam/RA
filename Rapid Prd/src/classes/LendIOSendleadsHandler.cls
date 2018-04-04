public class LendIOSendleadsHandler {

    public static Map<String,Integer> avgMonthlySalesMethod(){
        
        Map<String,Integer> avgMonthlySalesMap = new Map<String,Integer>();
        avgMonthlySalesMap.put('0 - 2,500',1152);
        avgMonthlySalesMap.put('2,500 - 5,000',1154);
        avgMonthlySalesMap.put('5,000 - 10,000',1156);
        avgMonthlySalesMap.put('10,000 - 20,000',1158);
        avgMonthlySalesMap.put('20,000 - 40,000',1160);
        avgMonthlySalesMap.put('40,000 - 60,000',1162);
        avgMonthlySalesMap.put('60,000 - 80,000',1162);
        avgMonthlySalesMap.put('80,000 - 100,000',1164);
        avgMonthlySalesMap.put('100,000 - 120,000',1164);
        avgMonthlySalesMap.put('120,000 - 140,000',1164);
        avgMonthlySalesMap.put('140,000 - 160,000',1164);
        avgMonthlySalesMap.put('160,000 - 180,000',1164);
        avgMonthlySalesMap.put('180,000 - 200,000',1164);
        avgMonthlySalesMap.put('200,000+',1166);
        
        return avgMonthlySalesMap;
    }
    
    public static Map<String,Integer> timeInBusinessMethod(){
    
        Map<String,Integer> timeInBusinessMap = new Map<String,Integer>();
        timeInBusinessMap.put('0-2 months',1170);
        timeInBusinessMap.put('3-5 months',110);
        timeInBusinessMap.put('6-11 months',111);
        timeInBusinessMap.put('1-2 years',112);
        timeInBusinessMap.put('2-3 years',862);
        timeInBusinessMap.put('3-5 years',864);
        timeInBusinessMap.put('5 or more years',183);
        
        return timeInBusinessMap;
    }
    
    public static Map<String,Integer> industryMethod(){
    
        Map<String,Integer> industryMap = new Map<String,Integer>();
        industryMap.put('Agriculture',1030);
        industryMap.put('Apparel',1088);
        industryMap.put('Banking',1044);
        industryMap.put('Biotechnology',1102);
        industryMap.put('Chemicals',1102);
        industryMap.put('Communications',1060);
        industryMap.put('Construction',1040);
        industryMap.put('Consulting',1038);
        industryMap.put('Education',1042);
        industryMap.put('Electronics',1088);
        industryMap.put('Energy',1092);
        industryMap.put('Engineering',1102);
        industryMap.put('Entertainment',1032);
        industryMap.put('Environmental',1054);
        industryMap.put('Finance',1044);
        industryMap.put('Food & Beverage',1086);
        industryMap.put('Government',1078);
        industryMap.put('Hair Salon',1074);
        industryMap.put('Healthcare',1056);
        industryMap.put('Hospitality',1058);
        industryMap.put('Insurance',1044);
        industryMap.put('Machinery',1066);
        industryMap.put('Manufacturing',1066);
        industryMap.put('Media',1038);
        industryMap.put('Other',1072);
        industryMap.put('Recreation',1032);
        industryMap.put('Restuarant',1086);
        industryMap.put('Retail',1088);
        industryMap.put('Salon & Nails',1074);
        industryMap.put('Shipping',1038);
        industryMap.put('Tanning Salon',1074);
        industryMap.put('Technology',1060);
        industryMap.put('Telecommunications',1060);
        industryMap.put('Transportation',1090);
        industryMap.put('Utilities',1092);
        
        return industryMap;
    }
    
    @future(callout=true)
    public static void sendLeadsToPartner(Set<Id> leadIds){
        
        try{
            List<Lead> ldUpdateList = new List<Lead>();
            List<Task> tskList = new List<Task>();
            
            List<Lead> ldList = [Select Id,Name,Gross_Monthly_Sales_Cur__c,DateBusinessStarted__c,Company,Email,Phone,Street,City,State,
                                        PostalCode,Industry,Lendio_Timestamp__c,Lendio_Id__c,Lendio_Payment__c,Lendio_URL__c,
                                        Lendio_Processing_Message__c
                                  From Lead 
                                  Where ID IN : leadIds];
            
            String serverURL = 'https://www.lendio.com/api/borrowers';
            String userName = 'affiliate';
            String passWord = 'ghief6Ag1Jad1I';     
             
            for(Lead ld : ldList){
                
                LendIOSendleadsObject lendioSerObj = new LendIOSendleadsObject();
                
                lendioSerObj.affiliate = '2396083845';
                lendioSerObj.full_name = ld.Name;
                
                String timeFilter=null;
                Date startDate = date.newInstance(ld.DateBusinessStarted__c.year(), ld.DateBusinessStarted__c.month(), ld.DateBusinessStarted__c.day());
                Date todayDate= date.newInstance(System.today().year(), System.today().month(), System.today().day());
                Integer numberDaysDue = todayDate.daysBetween(startDate );
                
                if(numberDaysDue<60)
                    timeFilter='0-2 months';
                else if(numberDaysDue>=60 && numberDaysDue<180)
                    timeFilter='3-5 months';
                else if(numberDaysDue>=180 && numberDaysDue<365)
                    timeFilter='6-11 months';
                else if(numberDaysDue>=365 && numberDaysDue<730)
                    timeFilter='1-2 years';
                else if(numberDaysDue>=730 && numberDaysDue<1095)
                    timeFilter='2-3 years';
                else if(numberDaysDue>=1095 && numberDaysDue<1825)
                    timeFilter='3-5 years';
                else
                    timeFilter='5 or more years';
                    
                lendioSerObj.time_in_business = timeInBusinessMethod().get(timeFilter);
                
                lendioSerObj.industry = industryMethod().get(ld.Industry);
                
                lendioSerObj.business_name = ld.Company;
                lendioSerObj.email = ld.Email;
                lendioSerObj.primary_phone = ld.Phone;
                if(ld.Street != null){ lendioSerObj.business_street = ld.Street;}
                if(ld.City != null){ lendioSerObj.business_city = ld.City;}
                if(ld.State != null){ lendioSerObj.business_state = ld.State;}
                if(ld.PostalCode != null){ lendioSerObj.business_zip = ld.PostalCode;}
                
                String salesFilter=null;
                
                if(ld.Gross_Monthly_Sales_Cur__c>=0 && ld.Gross_Monthly_Sales_Cur__c<2500)
                    salesFilter='0 - 2,500';
                else if(ld.Gross_Monthly_Sales_Cur__c>=2500 && ld.Gross_Monthly_Sales_Cur__c<5000)
                    salesFilter='2,500 - 5,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=5000 && ld.Gross_Monthly_Sales_Cur__c<10000)
                    salesFilter='5,000 - 10,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=10000 && ld.Gross_Monthly_Sales_Cur__c<20000)
                    salesFilter='10,000 - 20,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=20000 && ld.Gross_Monthly_Sales_Cur__c<40000)
                    salesFilter='20,000 - 40,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=40000 && ld.Gross_Monthly_Sales_Cur__c<60000)
                    salesFilter='40,000 - 60,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=60000 && ld.Gross_Monthly_Sales_Cur__c<80000)
                    salesFilter='60,000 - 80,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=80000 && ld.Gross_Monthly_Sales_Cur__c<100000)
                    salesFilter='80,000 - 100,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=100000 && ld.Gross_Monthly_Sales_Cur__c<120000)
                    salesFilter='100,000 - 120,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=120000 && ld.Gross_Monthly_Sales_Cur__c<140000)
                    salesFilter='120,000 - 140,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=140000 && ld.Gross_Monthly_Sales_Cur__c<160000)
                    salesFilter='140,000 - 160,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=160000 && ld.Gross_Monthly_Sales_Cur__c<180000)
                    salesFilter='160,000 - 180,000';
                else if(ld.Gross_Monthly_Sales_Cur__c>=180000 && ld.Gross_Monthly_Sales_Cur__c<200000)
                    salesFilter='180,000 - 200,000';
                else
                    salesFilter='200,000+';
                
                lendioSerObj.average_monthly_sales = avgMonthlySalesMethod().get(salesFilter);
                
                String serializeJson = JSON.serialize(lendioSerObj);
                
                String response;
                if(!Test.isRunningTest()){
                    //Authentication with LendIO:
                    HttpRequest request = new HttpRequest();
                    request.setEndpoint(serverURL);
                    request.setMethod('POST');
                    Blob headerValue = Blob.valueOf(userName + ':' + passWord);
                    String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
                    request.setHeader('Authorization', authorizationHeader);
                    request.setHeader('Content-Type', 'application/json');
                    request.setBody(serializeJson);
                    response = (new Http()).send(request).getBody();
                
                }else{
                    response = '{"error":false,"code":201,"payment":"0.00","message":"success","lead_type":"new","redirect_url":"https://www.lendio.com/bp/token?e=xyzy%40sms.com&t=hulkd20f70d20d01a6f68ef8fcc897f9c92befcac597adcc8eb522718184261280cd1093779468f13d2ec7018d9d2f0f99f371358f0845ecce00f560a893cf740f9b&affiliate=2396083845","id":630043,"first_name":"Test","last_name":"Lendio collateral","email_address":"xyzy@sms.com","registration_date":"2016-06-08 23:46:17","business_name":"Test Legal Name","addresses":[{"street":null,"street2":null,"city":null,"county":null,"state_abbreviation":null,"postal_code":null,"type":"business"}],"phones":[{"number":"5656565656","type":"primary"}],"campaign":"Test for Dev Team","subid":"","industry":"Information and Technology","credit_score":null,"finance_amount":null,"time_in_business":"2-3 years","monthly_charges":null,"average_monthly_sales":"$4,001 - $8,000","tier":3,"first_verification_date":null,"last_verification_date":null}';
                }        
                LendIOSendleadsJsonParser obj = (LendIOSendleadsJsonParser)JSON.deserialize(response,LendIOSendleadsJsonParser.class);
                
                if(obj.error == false){
                    ld.Lendio_Timestamp__c = DateTime.now();
                    ld.Lendio_Id__c = obj.id;
                    ld.Lendio_Payment__c = obj.payment;
                    ld.Lendio_URL__c = obj.redirect_url;
                    ld.Lendio_Processing_Message__c = 'Success';
                    ldUpdateList.add(ld);
                    Task t = new Task();
                    t.WhoId = ld.Id;
                    t.Subject = 'Lendio Transfer';
                    t.Status = 'Completed';
                    t.ActivityDate = Date.today();
                    List<User> uList = [Select Id From User Where Name = 'Premasai Achanti' AND isActive = true];
                    if(uList.size()>0){t.OwnerId = uList[0].Id;}
                    else{t.OwnerId = UserInfo.getUserId();}
                    tskList.add(t);
                } else{
                   ld.Lendio_Processing_Message__c = 'There is an error while processing this lead. Error: ' + obj.message; 
                   ldUpdateList.add(ld);
                }
            }
            if(ldUpdateList.size() > 0){
                update ldUpdateList;
                insert tskList;
            }
        }
        catch(Exception e){
            System.debug('An exception has occurred: '+ e.getMessage() + ' - ' + e.getLineNumber());
        }
    }
    
    public class LendIOSendleadsJsonParser{
        public Boolean error;
        public String payment;
        public String message;
        public String redirect_url; 
        public String id;      
        
    }
    
    public class LendIOSendleadsObject{
        
        public String affiliate;
        public String full_name;   
        public String email;
        public String primary_phone;
        public Integer time_in_business;
        public Integer industry;
        public String business_name;
        public String business_street;
        public String business_city;
        public String business_state;
        public String business_zip;
        public Integer average_monthly_sales;
    }
}