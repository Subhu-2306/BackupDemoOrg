public class LofOfLeads 
{
	public static void logs()
        {
            try
            {
                List<Lead> leads=new List<Lead>();
                
                for (Integer i = 0; i <= 10; i++)
                {
                    Lead leds = new Lead(Lastname=('Lead For lastname '+i), company=('Lead for comapny'+i), status=('Lead for status '+i));
                    leads.add(leds);
                }
                insert leads;
            }
            catch(DmlException e)
            {
              	Log__c logList=new Log__c(name = 'new error', Log_Description__c= 'Error'+e);
            	system.debug(e);
            	insert logList;      
            }
        }
}