trigger AddMrOnConsultant on Consultant__c (before update) 
{
    TriggerSetting__c triggerHit= [SELECT Is_Active__c FROM TriggerSetting__c where Trigger_Method__c='accountAfterUpdate'];
    
	for(Consultant__c c: trigger.new)
        {
            if(triggerHit.Is_Active__c)
            {
                if(c.Type__c=='Employee')
                {
                   c.Name='Mr.'+c.Name;
                }
                if(c.Type__c=='Vendor')
                {
                    c.Name='Dr.'+c.Name;
                }
            }
        }
}