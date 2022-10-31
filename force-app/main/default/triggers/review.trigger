trigger review on Case (before insert) {

    List<String> UseremailAddresses = new List<String>();   
    List<String> UserPhone = new List<String>();
    
    //First exclude any cases where the contact is set
    for (Case c:Trigger.new) {
        if (c.ContactId==null && c.AccountId==null && c.SuppliedPhone!='' ||
            c.SuppliedEmail!=''|| c.SuppliedEmail==null || c.SuppliedPhone==null)
        {
            UseremailAddresses.add(c.SuppliedEmail);
            UserPhone.add(c.SuppliedPhone);
        }
    }

    //Now we have a nice list of all the email addresses.  Let's query on it and see how many contacts already exist.
    List<Contact> listofallContacts = [Select Id,Email,accountid,phone From Contact Where Email in:UseremailAddresses and phone in: UserPhone];
    
    Set<String> ExstingEmails = new Set<String>();
    Set<String> ExstingPhones = new Set<String>();
    for (Contact c:listofallContacts) {
        ExstingEmails.add(c.Email);
        ExstingPhones.add(c.phone);
    }
    
    
    Map<String,Contact> emailToContactMap = new Map<String,Contact>();
    Map<String,Account> emailToAccountMap = new Map<String,Account>();
    
    List<Case> casesToUpdate = new List<Case>();

    for (Case c:Trigger.new) {
      if(ExstingEmails.contains(c.SuppliedEmail) || Exstingphones.contains(c.Suppliedphone))  
      {
          c.addError('Duplicate Contact exist');
      }else if (c.ContactId==null && c.AccountId==null &&
                c.SuppliedEmail!=null &&
               !ExstingEmails.contains(c.SuppliedEmail))
            {
                //The case was created with a null contact
                //Let's make a contact for it
                  String[] Emailheader = c.SuppliedEmail.split(' ',2);
                    Contact conts = new Contact(FirstName=Emailheader[0],
                                                LastName='Contact Case'+Emailheader[0],
                                                Email=c.SuppliedEmail,
                                                phone=c.SuppliedPhone
                                                );
                    Account acc = new Account(name='Account case'+Emailheader[0],
                                              email__c=c.SuppliedEmail,
                                              phone=c.SuppliedPhone);
                    emailToContactMap.put(c.SuppliedEmail,conts);
                    emailToAccountMap.put(c.SuppliedEmail,acc);
                    casesToUpdate.add(c);
            }
    }
    
    List<Contact> newContacts = emailToContactMap.values();
    List<Account> newAccounts = emailToAccountMap.values();
    insert newContacts;
    insert newAccounts;
    
    for (Case c:casesToUpdate) {
        Contact newContact = emailToContactMap.get(c.SuppliedEmail);
        Account newAccount = emailToAccountMap.get(c.SuppliedEmail);
        
        c.ContactId = newContact.Id;
        c.AccountId = newAccount.Id;
    }
}