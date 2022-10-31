public class AccountDetails 
{
    public static List<Account> accountRecords(String stateAbbr)
    {
      return [SELECT Id, Name, BillingState FROM Account WHERE BillingState=:stateAbbr];
	}
}