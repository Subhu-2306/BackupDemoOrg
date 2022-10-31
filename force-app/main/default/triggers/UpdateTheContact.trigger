trigger UpdateTheContact on Account (after update) 
{
    // step 1. collect the ids where newly created contact 
    
    List<Contact> Clist=new List<Contact>([select id, lastname, AccountWebsite__c, Accountid from Contact where AccountID IN: Trigger.new]);
    
    Map<Id, Account> amap=new Map<Id, Account>([select id, website from Account where ID IN:Trigger.new]);
    
    List<Contact> lstcontactToUpdate=new List<Contact>();
    
    for(Contact c:Clist)
    {
       Account obj=amap.get(c.AccountID);
       c.AccountWebsite__c=obj.website;
       lstcontactToUpdate.add(c);
    }
    
    if(lstcontactToUpdate.size()>0)
    {
        update lstcontactToUpdate;
    }
}