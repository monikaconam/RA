public with sharing class PKChunkingIDs{

    public PKChunkingIDs(Apexpages.Standardcontroller controller){
    }

    @RemoteAction
    public static List<Task> queryChunk(String firstId, String lastId, Boolean isLast) {
        
        //last Id range uses <=, all others use <
        String lastClause = 'AND Id < \''+ lastId +'\'  ';
        if (isLast) {
            lastClause = 'AND Id <= \''+ lastId +'\'  ';    
        }       
        
        String SOQL =   'SELECT Id ' +
                        'FROM Task ' +
                        'WHERE isdeleted=false ' +
                        'AND Id >= \'' + firstId + '\' ' +
                        lastClause;
        System.debug(SOQL );  
        System.debug('xxxxxxx '+firstId +'>>>>>>>>>>'+lastClause);             
        return database.query(SOQL);
    }    



    
}