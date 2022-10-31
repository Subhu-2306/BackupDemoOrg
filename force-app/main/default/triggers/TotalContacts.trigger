trigger TotalContacts on Contact (after update,after insert) {
    //step 1. Create the list to store parent account Records.
    List<Account> lstAccount=new List<Account>();
    
    //Step 2. Create the set to store the account related IDs.
    Set<ID> setAccountsID= new Set<ID>();
    
    //step 3. collect all the Account IDS from the child  
    for (contact con :trigger.new)
    {
        setAccountsID.add(con.AccountId);
    }
    
    //step 4. creating map to store the map records iof related records
    map<ID,contact> mapAccountIdCon=new map<ID, contact>();
    
    for(contact con:trigger.new)
    {
       mapAccountIdCon.put(con.AccountId,con) ;
    }
    
    //step 5. Update the Last updated and the count with the respective child records get updated
    for(Account obj : [SELECT Id,Contact_Count__c  FROM Account where ID IN:setAccountsID])
    {
        obj.Contact_Count__c += 1;
        lstAccount.add(obj);
    }
    update lstAccount;
}