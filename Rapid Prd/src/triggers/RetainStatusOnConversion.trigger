trigger RetainStatusOnConversion on Lead (before update) {

    List<Lead> leads = new List<Lead>();
    
    
    
    for(Lead l :System.Trigger.New)
    {
        if((l.isConverted==true)&&(l.status != 'Converted'))
        {
                    l.status='Converted';
        }
      } 
      
      

    

}