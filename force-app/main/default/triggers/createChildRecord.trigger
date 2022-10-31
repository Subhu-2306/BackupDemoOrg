trigger createChildRecord on Account (after insert) {
	//create child record with same lastname as that of parent account,
	// when a new 	Account record is created with rating is hot and industry is banking.
	
    List<Contact> cList= new List<Contact>();
    
    for(Account a: Trigger.new)
    {
        if(a.rating =='HOT' && a.industry =='Banking')
        {
            contact c=new contact();
            c.AccountId =a.id;
            c.LastName =a.Name;
            cList.add(c);
        }
    }
    insert cList;
}