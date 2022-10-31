//Avoid update of the record if the employee is not active anymore in the system.
trigger AvoidUpdateOfEmployee on Employee__c (after update)
{
	/*for(Integer i=0;i<trigger.new.size();i++)
    {
        if(trigger.old[i].is_active__c==false && trigger.new[i].is_active__c !=false)
        {
            trigger.new[i].addError('You cannot update the employee as active....');
        }
    }*/
    
    For(Employee__c emp:trigger.new)
    {
       if(trigger.oldmap.get(emp.id).is_active__c==false && emp.is_active__c !=false)
       {
           emp.addError('You cannot update the employee as active.... from the map');
       }
    }
}