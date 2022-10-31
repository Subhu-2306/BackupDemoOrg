public with sharing class DisplayContact {
    public List<Account> conList {get;set;}
    public DisplayContact(ApexPages.StandardSetController controller) {

    }
    
    public PageReference ContactLists()
    {
    if(ApexPages.currentPage().getParameters().get('id') != null)
      conList = [Select id,Name,website from Account where Id =: ApexPages.currentPage().getParameters().get('id')];
     return null;
    }   

}