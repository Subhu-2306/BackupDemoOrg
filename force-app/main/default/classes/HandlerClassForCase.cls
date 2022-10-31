public class HandlerClassForCase {
    public static void createConAcc(List<Case> caseList){
        //First collect the Ids where newly cases are created with email and phone is not null 
        List<String> caseEmail = new List<String>();
        List<String> casePhone = new List<String>();
        
        For(Case c: caseList)
        {
            caseEmail.add(c.SuppliedEmail);
            casePhone.add(c.SuppliedPhone);
        }
        
        //Check if email and phone is already there is already contact with email and phone is existed or not 
        
        List<Contact> conList=[SELECT Id, accountId,LastName, Phone, Email FROM Contact WHERE Email IN : caseEmail and Phone IN : casePhone];
        
        //collect the duplicate emails to verfiy that they are existing or not in the system 
        List<String> duplicateEmails = new List<String>();
        
        List<String> duplicatePhone = new List<String>(); 
        
        // Iterate over the conatct whether they are existing or not 
        For(Contact con: conList){
            duplicateEmails.add(con.email);
            duplicatePhone.add(con.Phone);
        }
        
        //check in the case whether they are existed or not.
        List<contact> insertCon = new List<contact>();
        
        List<Account> insertAcc = new List<Account>();
        
        map<ID,Contact> conMap = new map<ID,Contact>();
        
        map<ID,Account> accMap = new map<ID,Account>();
        
        for(case c:caseList){
            if(duplicateEmails.contains(c.SuppliedEmail) && duplicatePhone.contains(c.SuppliedPhone))
            {
                c.adderror('Duplicate Contact is existed');
            }else{
                   Contact con = new contact();
                   Account acc = new Account();
                
                   con.Email = c.ContactEmail;
                   con.Phone = c.ContactPhone;
                
                   acc.Phone = c.ContactPhone;
                   acc.email__c = c.ContactEmail;
                   
                 insertCon.add(con); 
                 insertAcc.add(acc);
            }
        }
        
        insert insertCon;
        insert insertAcc;
    }
}