public with sharing class DetailedTEController {
public contact con;
    public DetailedTEController(ApexPages.StandardController controller) {
        this.con= (Contact)controller.getRecord();
    }
    
     public pageReference save()
        {    
            pageReference pNext= new pageReference('/apex/LoginToTimrEntry');
            return pNext;
        }
}