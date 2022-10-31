trigger CascadeDeletionOnEmployee on Employee__c (before delete) 
{
    List<id> empid= new List<id>();
	    
	for(Employee__c e:trigger.old)
    {
        empid.add(e.Id);  
    }
    
    List<Salary_Detail__c> c=[select id from Salary_Detail__c where Employee__c IN:empid];
    
    delete c;
}