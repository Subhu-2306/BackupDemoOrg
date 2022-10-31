public class contactPhoneUpdateByAccPhone implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT id,Phone,account.Phone FROM Contact');
    }
    public void execute(Database.BatchableContext bc, List<Contact> contactList){
     for(Contact eachContact : contactList)
        {
           eachContact.Phone = eachContact.account.phone;
        }
        update contactList;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Successfully Update');
    }
}