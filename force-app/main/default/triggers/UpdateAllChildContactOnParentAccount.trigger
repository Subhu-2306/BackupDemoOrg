trigger UpdateAllChildContactOnParentAccount on Account (after update) {
/*
Update all the child contacts if parent account is updated
*/
    //prepare a list to store the account records which are related to contacts
    List<Contact> ccList = new List<Contact>([select id, AccountID, AccountWebsite__c from Contact where accountId IN : Trigger.new]);
    
    map<ID,Account> accMap = new map<ID,Account>([select id, name, website from account where ID IN : Trigger.new]);
    
    List<Contact> updateContactList = new List<Contact>();
    
    for(Contact c:ccList)
    {
        Account objAccount = accMap.get(c.AccountId);
        c.AccountWebsite__c = objAccount.website;
        updateContactList.add(c);
    }
    
    if(updateContactList.size()>0)
    {
        update updateContactList;
    }
}