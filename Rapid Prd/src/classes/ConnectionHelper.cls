public class ConnectionHelper 
{

    public static Id getConnectionId(String connectionName)
    {
    
        List<PartnerNetworkConnection> partnerNetConList =[Select 
        															id 
															from 
																	PartnerNetworkConnection 
															where 	
																	connectionStatus = 'Accepted' 
															and 
																	connectionName = :connectionName];
        
        if ( partnerNetConList.size() != 0 ) 
        {
            return partnerNetConList.get(0).Id;		
        }
        
        return null;
    }
}