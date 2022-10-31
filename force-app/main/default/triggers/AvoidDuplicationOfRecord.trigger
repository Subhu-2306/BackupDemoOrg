trigger AvoidDuplicationOfRecord on Account (before insert) 
{
    List<string> acname=new List<string>();
    
    for(Account a : Trigger.new)
    {
        acname.add(a.name);
    }
    
    List<Account> accList=[select id, name from Account where name IN :acname];
    
    List<string> dupliName=new List<string>();
    
    for(Account acc : accList)
    {
        dupliName.add(acc.Name);
    }
    
    for(Account a: trigger.new)
    {
        if(dupliName.contains(a.Name))
        {
            a.addError('Duplicate name exists'+a.name); 
        }
    }
}