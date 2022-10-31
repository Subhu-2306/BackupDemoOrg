global class contactStatusUpdate implements Database.Batchable<sObject>
{
	    List <Contact> toUpdate = new List <Contact> ();

	global Database.QueryLocator start(Database.BatchableContext BC)
	{
        String query = 'SELECT Id,status__c,account.status__c from contact';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<contact> scope)
    {
        for ( contact c : scope)
        {
           c.status__c=c.account.status__c;
           toUpdate.add(c); 
        }
        update toUpdate;
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}