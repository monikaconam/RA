public with sharing class ScheduleBatchReevaluteDeals implements schedulable{
	
	public void execute(SchedulableContext sc)
	{
		BatchReevaluateDeals deals=new BatchReevaluateDeals();
		Database.executeBatch(deals,1500);
		
	}
	
	public static String scheduleExecution(String name)
	{
			String sched='0 45 1 * * ?'; 
			ScheduleBatchReevaluteDeals schLeads=new ScheduleBatchReevaluteDeals();
			return System.schedule(name ,sched,schLeads);
		
	}

}