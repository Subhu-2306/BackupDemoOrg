public class LogOfAccount 
{
    public static void logs()
    {
             
        try {  
            	List<Account> srlist=new List<Account>();
                for (Integer i = 0; i <= 10; i++) 
                {
                    Account accts = new Account(Name='Account For Testing Demo wise'+i);
                    srlist.add(accts);  
                }           
               insert srlist;
        }catch(DmlException e)
        {
            Log__c logList=new Log__c(name = 'new error', Log_Description__c= 'Error'+e);
            system.debug(e);
            insert logList; 
        } 
    }
}