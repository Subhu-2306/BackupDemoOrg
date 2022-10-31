trigger AvoidCreatiobOfDupliAcc on Account (before insert) {
/*Avoid creation of duplicate account which is already existed in the system*/
  
  //Collect all the account name first which are getting newly inserted.
  List<String> totalAccountList = new List<String>();
    
  for(Account a:trigger.new)
  {
     totalAccountList.add(a.Name);
  }
  
  //filter out the name from existed one
  List<Account> accList = [select id,name from Account Where name IN :totalAccountList];
    
  //Create a list to store the duplicate names  
  List<String> dupliAccList = new List<String>();
  
  for(Account a: accList)
  {
      dupliAccList.add(a.Name);         
  }
  
   //Now compare all the records duplicate records with the account if found then throw error
   for(Account a: Trigger.new)
   {
       if(dupliAccList.contains(a.Name))
       {
           a.addError('Account name is already there in system.');
       }
   }
}