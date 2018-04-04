public class Utils {
 
         public static Date AddWeekdays(Datetime date1, double numdays){
           DateTime x = null;
            Date retdate = Date.newInstance(date1.year(), date1.month(), date1.day());
            if (date1.hour() >= 15){
                retdate =  retdate + 1;
             }
			System.debug(retdate.daysBetween(retDate.toStartOfWeek()));
            if (retdate.daysBetween(retDate.toStartOfWeek()) == -6){
                 retdate = retdate + 1;
            }
            if (retdate.daysBetween(retDate.toStartOfWeek()) == 0){
                 retdate = retdate + 1;
            }

            for (integer i = 0; i < numdays; i++){
                retdate = retdate + 1;

                if (retdate.daysBetween(retDate.toStartOfWeek()) == -6){
                     retdate = retdate + 1;
                }
                if (retdate.daysBetween(retDate.toStartOfWeek()) == 0){
                     retdate = retdate + 1;
                }
            }
            return retDate;
            
        }
        
        public static Date AddWeekdays1730(Datetime date1, double numdays){
           DateTime x = null;
            Date retdate = Date.newInstance(date1.year(), date1.month(), date1.day());
            if ((date1.hour() == 17 && date1.minute() > 30) || date1.hour() > 17) {
                retdate =  retdate + 1;
            }

            if (retdate.daysBetween(retDate.toStartOfWeek()) == -6){
                 retdate = retdate + 1;
            }
            if (retdate.daysBetween(retDate.toStartOfWeek()) == 0){
                 retdate = retdate + 1;
            }

            for (integer i = 0; i < numdays; i++){
                retdate = retdate + 1;

                if (retdate.daysBetween(retDate.toStartOfWeek()) == -6){
                     retdate = retdate + 1;
                }
                if (retdate.daysBetween(retDate.toStartOfWeek()) == 0){
                     retdate = retdate + 1;
                }
            }
            return retDate;
            
        }
        
        public static Date ConvertDateTimeToDate(Datetime date1){
           DateTime x = null;
            Date retdate = Date.newInstance(date1.year(), date1.month(), date1.day());
            return retDate;
            
        }
 }