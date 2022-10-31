trigger AvoidDuplicationOfRecordOnLead on Lead (before insert) 
{
   List<String> LeadEmail=new List<String>();
    
   for(Lead l:Trigger.new)
   {
       LeadEmail.add(l.Email);
   }
    
   List<Contact> con=[Select id, email from Contact where email IN :LeadEmail];
   
   List<String> DupliEmail=new List<String>();
    
   for(Contact c:con)
   {
       DupliEmail.add(c.Email);
   }
    
    for(Lead l : trigger.new)
    {
       if(DupliEmail.contains(l.Email))
       {
             l.addError('Duplicate name exists'+l.email);
       }
    }
}