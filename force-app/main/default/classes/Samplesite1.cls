public with sharing class Samplesite1 {
public String password { get; set; }
public String username { get; set; }

    public PageReference registerUser() {
        List<contact> obj = new List<contact>();
if(username != null && username != '')
{
obj = [Select Username__c,Password__c from contact where Username__c =:username Limit 1];
if(obj.size()>0)
{
for(contact log : obj){
if(password == log.Password__c)
{
    return Page.Welcomepage ;
}
else
{
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Invalid Password' );
    ApexPages.addMessage(myMsg);
    system.debug('MyMsg:'+myMsg);
}
}
}
else
{
ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Username does not exist' );
ApexPages.addMessage(myMsg);
system.debug('MyMsg:'+myMsg);
}
}
return null;

    }

}