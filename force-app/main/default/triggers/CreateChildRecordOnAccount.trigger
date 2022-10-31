trigger CreateChildRecordOnAccount on Account (after insert)
{
   List<Contact> cList= new List<Contact>();
    
   for(Account a : trigger.new)
   {                  
          Contact c= new Contact();
          c.LastName='Shubhangi';
          cList.add(c);  
   }
    insert cList;
}