public with sharing class ScheduleBatchReevaluteOppforDeals implements Schedulable {
	
	public void execute(SchedulableContext sc)
	{
		BatchReevaluteOpportunityforDeals opps=new BatchReevaluteOpportunityforDeals();
		Database.executeBatch(opps,1500);
		
	}
	
	public static String scheduleExecution(String name)
	{
			String sched='0 30 1 * * ?'; // execute every night at 1:30 AM
			ScheduleBatchReevaluteOppforDeals schOpps=new ScheduleBatchReevaluteOppforDeals();
			return System.schedule(name ,sched,schOpps);
		
	}

}