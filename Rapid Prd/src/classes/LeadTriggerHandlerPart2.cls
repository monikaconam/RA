public class LeadTriggerHandlerPart2
{
    public static void auPopulateAccountLeadCreatedDate(Map<Id,Lead> newMap, Map<Id,Lead>  oldMap)
    {
        Map<id,Lead> leadMap=new Map<id,Lead>();
        List<Account> upAccount=new List<Account>();
        List<Database.SaveResult> srList;
        try
        {
            
            for(Id iTemp : newMap.keyset())
            {
                if((newMap.get(iTemp).isConverted!=oldMap.get(iTemp).isConverted) &&
                (newMap.get(iTemp).isConverted==true))
                {
                    leadMap.put(newMap.get(iTemp).ConvertedAccountID, newMap.get(iTemp));
                }
            }
            
            if(leadMap.size()>0)
            {
                for(Account acc :[Select id,Lead_created_date__c from Account where id in : leadMap.keyset()])
                {
                    acc.Lead_created_date__c=leadMap.get(acc.id).CreatedDate;
                    upAccount.add(acc);
                }
                
                if(upAccount.size()>0)
                    srList=Database.update(upAccount,false);
            }
        }
        catch(Exception e)
        {
           System.debug('An exception has occurred -'+e.getMessage()+'at '+e.getLineNumber());
        }               
    }  
    
    public static void partnerAutoIncrementUpdate(List <Lead>leadList,Map<Id,Lead> oldMap)
    {
        System.debug('called====>');
        try
        {
            Map<Integer, String> userMapOpen=new Map<Integer, String>{1=>'Darius Polk',2=>'Brendan McBride', 3=>'Jason Perkins',
                                                                    4=>'Charles Wagner',5=>'Nick Scallion', 6=>'Jesse Belt',
                                                                    7=>'Peter Havenstein',8=>'Alexander Perla', 9=>'Cayce Prunesti',
                                                                    10=>'Joseph LaFalcia',11=>'Holly Sowa'};
            Map<Integer, String> userMapT1=new Map<Integer, String>{1=>'Darius Polk',2=>'Brendan McBride', 3=>'Jason Perkins'};
            Map<Integer, String> userMapT2=new Map<Integer, String>{1=>'Charles Wagner',2=>'Nick Scallion', 3=>'Jesse Belt',4=>'Peter Havenstein'};	   
			Map<Integer, String> userMapT3=new Map<Integer, String>{1=>'Alexander Perla',2=>'Cayce Prunesti', 3=>'Joseph LaFalcia',4=>'Holly Sowa'};
            Map<Integer, String> userMapT4=new Map<Integer, String>();
            Map<String,Id> userOORMap=new Map<String,Id>();
        
            Map<Id, Id> leadCampList=new Map<Id, Id>();
            Map<Id, Campaign> campaignMap=new Map<Id, Campaign>();
            Map<Id,Lead>leadMap=new Map<id,Lead>();
            Set<Id>campIds=new Set<id>();
            
            system.debug('====ttemp'+[Select id, user__c, user__r.name from Tiger_Teams__c where user__r.isactive=true]);
            
            for(Tiger_Teams__c tTemp :[Select id, user__c, user__r.name from Tiger_Teams__c where user__r.isactive=true])
            {
                userOORMap.put(tTemp.user__r.name.toLowerCase(),tTemp.user__c);
            }
            
            List<Lead> upLead=new List<Lead>();
            
            for(Lead lTemp : leadList)
            {
                leadMap.put(lTemp.id,lTemp);
            }
            
            System.debug('=====leadMap'+leadMap.keyset());
            system.debug('=====ctemp'+[Select id, campaignId, leadId from CampaignMember where leadId in : leadMap.keyset()order by createddate]);
            
            if(leadMap.size()>0)
            {
                for(CampaignMember cmTemp :[Select id, campaignId, leadId from CampaignMember where leadId in : leadMap.keyset() order by createddate])
                {
                    leadCampList.put(cmTemp.leadId, cmTemp.campaignId);

                    campIds.add(cmTemp.campaignId);
                }
                for(campaign cTemp : [Select id , Partner_Campaign_Team__c from campaign where id in : campIds])
                {
                    campaignMap.put(cTemp.id,cTemp);
                }
            }
            
            List<Open_Dialer_Team_Counter__c> panList = new  List<Open_Dialer_Team_Counter__c>();
            panList = Open_Dialer_Team_Counter__c.getall().values();
            
            List<Tiger_Team_1_Counter__c> team1counter = new List<Tiger_Team_1_Counter__c>();
            team1counter = Tiger_Team_1_Counter__c.getall().values();
            
            List<Tiger_Team_2_Counter__c> team2counter = new List<Tiger_Team_2_Counter__c>();
            team2counter = Tiger_Team_2_Counter__c.getall().values();
            
            List<Tiger_Team_3_Counter__c> team3counter = new List<Tiger_Team_3_Counter__c>();
            team3counter = Tiger_Team_3_Counter__c.getall().values();
            
            List<Tiger_Team_4_Counter__c> team4counter = new List<Tiger_Team_4_Counter__c>();
            team4counter = Tiger_Team_4_Counter__c.getall().values();

            if(leadCampList.size()>0)
            {
                for(Id iTemp : leadCampList.keyset())
                {
                    Id cTemp=leadCampList.get(iTemp);
                    Lead Ld=leadMap.get(iTemp);
                    System.debug('campaignMap.get(cTemp).Partner_Campaign_Team__c>>>>'+campaignMap.get(cTemp).Partner_Campaign_Team__c);
                    System.debug('oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c>>>>'+oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c);
                    System.debug('ld.DMSDocsFirstRoundComplete__c>>>>'+ld.DMSDocsFirstRoundComplete__c);
                    if(campaignMap.get(cTemp).Partner_Campaign_Team__c=='T1' && (oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c == Null && ld.DMSDocsFirstRoundComplete__c !=null))
                    {
                        //ld.Tiger_Team_1_Counter__c = team1counter[0].Partner_Number__c;
                        //team1counter[0].Partner_Number__c = team1counter[0].Partner_Number__c + 1;

                        //System.debug('initial counter '+team1counter[0].Partner_Number__c);
                        Integer currentRecCount=Integer.valueOf(team1counter[0].Partner_Number__c);
                        Integer currentteamMemberCounter=0;
                        Boolean canBeAllocated=false;
                        while((canBeAllocated==false) && currentteamMemberCounter<userMapT1.size())
                        {
                            System.debug('while counter '+team1counter[0].Partner_Number__c);
                            Integer modReminder=Math.mod(Integer.valueOf(team1counter[0].Partner_Number__c),userMapT1.size())+1;
                            System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter);
                            
                            String userName=userMapT1.get(modReminder);
                            System.debug('userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));

                            if(userOORMap.containsKey(userName.toLowerCase()))
                            {
                                team1counter[0].Partner_Number__c=team1counter[0].Partner_Number__c+1;
                            }
                            else
                            {
                                ld.Tiger_Team_1_Counter__c = team1counter[0].Partner_Number__c;
                                System.debug(' dev ld.Tiger_Team_1_Counter__c ===>'+ld.Tiger_Team_1_Counter__c);
                                canBeAllocated=true;
                            }
                            currentteamMemberCounter++;
                        }
                        
                        if(canBeAllocated==false)
                        {
                            System.debug('no member active reseting to inital counter===>'+currentRecCount);
                            ld.Tiger_Team_1_Counter__c =currentRecCount;
                        }
                        team1counter[0].Partner_Number__c = team1counter[0].Partner_Number__c + 1;
                        System.debug('new counter team1counter[0].Partner_Number__c===>'+team1counter[0].Partner_Number__c+' >>> dev 2 ld.Tiger_Team_1_Counter__c ===>'+ld.Tiger_Team_1_Counter__c);
                    }
                    if(campaignMap.get(cTemp).Partner_Campaign_Team__c=='T2' && (oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c == Null && ld.DMSDocsFirstRoundComplete__c !=null))
                    {
                        //ld.Tiger_Team_2_Counter__c = team2counter[0].Partner_Number__c;
                        //team2counter[0].Partner_Number__c = team2counter[0].Partner_Number__c + 1;
                        
                        System.debug('initial counter '+team2counter[0].Partner_Number__c);
                        Integer currentRecCount=Integer.valueOf(team2counter[0].Partner_Number__c);
                        Integer currentteamMemberCounter=0;
                        Boolean canBeAllocated=false;
                        while((canBeAllocated==false) && currentteamMemberCounter<userMapT2.size())
                        {
                            System.debug('while counter '+team2counter[0].Partner_Number__c);
                            Integer modReminder=Math.mod(Integer.valueOf(team2counter[0].Partner_Number__c),userMapT2.size())+1;
                            System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter);
                            
                            String userName=userMapT2.get(modReminder);
                            System.debug('userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                            
                            if(userOORMap.containsKey(userName.toLowerCase()))
                            {
                                team2counter[0].Partner_Number__c=team2counter[0].Partner_Number__c+1;
                            }
                            else
                            {
                                ld.Tiger_Team_2_Counter__c = team2counter[0].Partner_Number__c;
                                System.debug(' dev ld.Tiger_Team_2_Counter__c ===>'+ld.Tiger_Team_2_Counter__c);
                                canBeAllocated=true;
                            }
                            currentteamMemberCounter++;
                        }
                    
                        if(canBeAllocated==false)
                        {
                            System.debug('no member active reseting to inital counter===>'+currentRecCount);
                            ld.Tiger_Team_2_Counter__c =currentRecCount;
                        }
                        team2counter[0].Partner_Number__c = team2counter[0].Partner_Number__c + 1;
                        System.debug('new counter team2counter[0].Partner_Number__c===>'+team2counter[0].Partner_Number__c+' >>> dev 2 ld.Tiger_Team_2_Counter__c ===>'+ld.Tiger_Team_2_Counter__c);
                    }
                    
                    if(campaignMap.get(cTemp).Partner_Campaign_Team__c=='T3' && (oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c == Null && ld.DMSDocsFirstRoundComplete__c !=null))
                    {
                        //ld.Tiger_Team_3_Counter__c = team3counter[0].Partner_Number__c;
                        //team3counter[0].Partner_Number__c = team3counter[0].Partner_Number__c + 1;
                        
                        System.debug('initial counter '+team3counter[0].Partner_Number__c);
                        Integer currentRecCount=Integer.valueOf(team3counter[0].Partner_Number__c);
                        Integer currentteamMemberCounter=0;
                        Boolean canBeAllocated=false;
                        while((canBeAllocated==false) && currentteamMemberCounter<userMapT3.size())
                        {
                            System.debug('while counter '+team3counter[0].Partner_Number__c);
                            Integer modReminder=Math.mod(Integer.valueOf(team3counter[0].Partner_Number__c),userMapT3.size())+1;
                            System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter);
                            
                            String userName=userMapT3.get(modReminder);
                            System.debug('userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                            if(userOORMap.containsKey(userName.toLowerCase()))
                            {
                                team3counter[0].Partner_Number__c=team3counter[0].Partner_Number__c+1;
                            }
                            else
                            {
                                ld.Tiger_Team_3_Counter__c = team3counter[0].Partner_Number__c;
                                System.debug(' dev ld.Tiger_Team_3_Counter__c ===>'+ld.Tiger_Team_3_Counter__c);
                                canBeAllocated=true;
                            }
                            currentteamMemberCounter++;
                        }
                    
                        if(canBeAllocated==false)
                        {
                            System.debug('no member active reseting to inital counter===>'+currentRecCount);
                            ld.Tiger_Team_3_Counter__c =currentRecCount;
                        }
                        team3counter[0].Partner_Number__c = team3counter[0].Partner_Number__c + 1;
                    }
                    
                    if(campaignMap.get(cTemp).Partner_Campaign_Team__c=='T4' && (oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c == Null && ld.DMSDocsFirstRoundComplete__c !=null))
                    {
                        //ld.Tiger_Team_4_Counter__c = team4counter[0].Partner_Number__c;
                        //team4counter[0].Partner_Number__c = team4counter[0].Partner_Number__c + 1;
                        
                        Integer currentRecCount=Integer.valueOf(team4counter[0].Partner_Number__c);
                        Integer currentteamMemberCounter=0;
                        Boolean canBeAllocated=false;
                        while((canBeAllocated==false) && currentteamMemberCounter<userMapT4.size())
                        {
                            System.debug('while counter '+team4counter[0].Partner_Number__c);
                            Integer modReminder=Math.mod(Integer.valueOf(team4counter[0].Partner_Number__c),userMapT4.size())+1;
                            System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter);
                            
                            String userName=userMapT4.get(modReminder);
                            System.debug('userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                            if(userOORMap.containsKey(userName.toLowerCase()))
                            {
                                team4counter[0].Partner_Number__c=team4counter[0].Partner_Number__c+1;
                            }
                            else
                            {
                                ld.Tiger_Team_4_Counter__c = team4counter[0].Partner_Number__c;
                                System.debug(' dev opp.Tiger_Team_4_Counter__c ===>'+ld.Tiger_Team_4_Counter__c);
                                canBeAllocated=true;
                            }
                            currentteamMemberCounter++;
                        }
                        
                        if(canBeAllocated==false)
                        {
                            System.debug('no member active reseting to inital counter===>'+currentRecCount);
                            ld.Tiger_Team_4_Counter__c =currentRecCount;
                        }
                        team4counter[0].Partner_Number__c = team4counter[0].Partner_Number__c + 1;
                    }
                    
                    if(campaignMap.get(cTemp).Partner_Campaign_Team__c==null && (oldMap.get(ld.Id).DMSDocsFirstRoundComplete__c == Null && ld.DMSDocsFirstRoundComplete__c !=null))
                    {
                        //ld.OPEN_Tiger_Team_Counter__c = panList[0].counter__c;
                        //panList[0].counter__c = panList[0].counter__c + 1;
                        Integer currentRecCount=Integer.valueOf(panList[0].counter__c );
                        Integer currentteamMemberCounter=0;
                        Boolean canBeAllocated=false;
                        
                        while((canBeAllocated==false) && currentteamMemberCounter<userMapOpen.size())
                        {
                            System.debug('while counter '+panList[0].counter__c );
                            Integer modReminder=Math.mod(Integer.valueOf(panList[0].counter__c ),userMapOpen.size())+1;
                            System.debug('The remainder was ===>'+modReminder+' >>>>> currentteamMemberCounter ===>'+currentteamMemberCounter);
                            
                            String userName=userMapOpen.get(modReminder);
                            System.debug('userName===>'+userName+' >>>>> userOORMap.containsKey====>'+userOORMap.containsKey(userName.toLowerCase()));
                            if(userOORMap.containsKey(userName.toLowerCase()))
                            {
                                panList[0].counter__c =panList[0].counter__c +1;
                            }
                            else
                            {
                                ld.OPEN_Tiger_Team_Counter__c= panList[0].counter__c ;
                                System.debug(' dev opp.Tiger_Team_1_Counter__c ===>'+ld.OPEN_Tiger_Team_Counter__c);
                                canBeAllocated=true;
                            }
                            currentteamMemberCounter++;
                        }
                        
                        if(canBeAllocated==false)
                        {
                            System.debug('no member active reseting to inital counter===>'+currentRecCount);
                            ld.OPEN_Tiger_Team_Counter__c=currentRecCount;
                            //opp.ownerId=userMapOpen.get(userMapOpen.keyset()[0]);
                            system.debug(Math.mod(Integer.valueOf(currentRecCount),userMapOpen.size())+1);
                        }
                        panList[0].counter__c = panList[0].counter__c + 1;
                    }
                }
            }
            
            
            if(!panList.isEmpty())
                update panList;
                
            if(!team1counter.isEmpty())
                update team1counter;
                
            if(!team2counter.isEmpty())
                update team2counter;
                
            if(!team3counter.isEmpty())
                update team3counter;
                
            if(!team4counter.isEmpty())
                update team4counter;
        }    
            
        catch(Exception e)
        {
           System.debug('An exception has occurred '+e.getMessage()+'@'+e.getLinenumber());
        }      
    } 
}