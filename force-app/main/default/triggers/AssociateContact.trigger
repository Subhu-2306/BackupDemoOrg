trigger AssociateContact on Contact (before insert) 
{
    Set<String> emailDomains = new Set<String>();
    
    for (Contact l : Trigger.New) {
        if (l.Email != null) {
            emailDomains.add(l.Email.split('@').get(1));
        }           
       
    }
    
    if (!emailDomains.isEmpty()) {
        Map<String, Account> emailDomainToAccountMap = new Map<String, Account>();
        
        for (Account a : [select Name,Id from Account where Name in :emailDomains])
        {
            emailDomainToAccountMap.put(a.Name, a);
        }   
        
        for (Contact l : Trigger.New) {
            if (l.Email != null) 
            {
                 String domain = l.Email.split('@').get(1);
            
                if (emailDomainToAccountMap.containsKey(domain)) {
                     l.AccountId= emailDomainToAccountMap.get(domain).Id;
                }               
            }
            
           
        }
    }
}