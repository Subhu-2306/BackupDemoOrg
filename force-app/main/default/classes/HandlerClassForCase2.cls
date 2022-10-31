public class HandlerClassForCase2 {
    public static void createConAcc(List<Case> caseList){
        
        Set<String> emailDomains = new Set<String>();
        Set<String> phoneDomains = new Set<String>();
        
        for (Case c : caseList) {
        if (c.SuppliedEmail != null || c.SuppliedPhone !=Null) {
            emailDomains.add(c.SuppliedEmail);
            phoneDomains.add(c.SuppliedPhone);
        }           
       
            if(!emailDomains.isEmpty() || !phoneDomains.isEmpty()){
                
                Map<String, Account> emailDomainToAccountMap = new Map<String, Account>();               
        
                for (Account a : [select Name,Id,email__c from Account where Email__c in :emailDomains])
                {
                    emailDomainToAccountMap.put(a.Email__c, a);
                }
                
                List<Case> casesToUpdate = new List<Case>();
                 for (case l : caseList) {
                        if (l.SuppliedEmail != null || l.SuppliedPhone !=Null) 
                        {
                            if (emailDomainToAccountMap.containsKey(l.SuppliedEmail)) {
                                                               
                                Account conts = new Account(Name='acc',
                                                            Email__c=l.SuppliedEmail,
                                                            phone=l.suppliedPhone
                                            );
                				emailDomainToAccountMap.put(l.SuppliedEmail,conts);
                                casesToUpdate.add(l);
                            }               
                        }     
        			}
                
                List<Account> newAccounts = emailDomainToAccountMap.values();
    			insert newAccounts;
                
                for (Case con:casesToUpdate) {
                    Account newAccount = emailDomainToAccountMap.get(c.SuppliedEmail);
                    
                    con.AccountId = newAccount.Id;
                }
            }
    }
    }
}