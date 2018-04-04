public with sharing class ScheduleBatchReevaluteLeadforDeals implements Schedulable{

	public void execute(SchedulableContext sc)
	{
		BatchReevaluteLeadforDeals leads=new BatchReevaluteLeadforDeals();
		Database.executeBatch(leads,1500);
		
	}
	
	public static String scheduleExecution(String name)
	{
			String sched='0 0 1 * * ?'; // execute every night at 1 AM
			ScheduleBatchReevaluteLeadforDeals schLeads=new ScheduleBatchReevaluteLeadforDeals();
			return System.schedule(name ,sched,schLeads);
		
	}

}