public class copyAdd{
    public static void autoCopyAdd(List<Contact> conList){
        List<Id> accIds = new List<Id>();
        Map<Id, Account> accounts = new Map<Id, Account>();
        for(Contact con: conList){
            accounts.put(con.AccountId, new Account(Id=con.AccountId));
        }
        accounts.remove(null);
        for(Contact con: conList){
            Account acc = accounts.get(con.AccountId);
            con.pref__c=true;
            if(acc != null) {
                acc.ShippingStreet=con.MailingStreet;
                acc.ShippingCity=con.MailingCity;
                acc.ShippingState=con.MailingState;
                acc.ShippingCountry=con.MailingCountry;
                acc.ShippingPostalCode=con.MailingPostalCode;
            }
        }
        update accounts.values();
    }
}