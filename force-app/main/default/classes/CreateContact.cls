public with sharing class CreateContact
 { public Contact ContactRecord{get;set;} 
   public CreateContact()
   { 
    ContactRecord=new Contact(); 
   } 
   
   public Pagereference SaveRecord()
   {
     ContactRecord.OwnerId=Apexpages.currentPage().getParameters().get('UserId'); 
     Insert ContactRecord; 
     Pagereference pr=new Pagereference('https://creative-badger-6m9kdq-dev-ed.lightning.force.com/lightning/o/Contact/list?filterName=00B5j00000HbDg3EAF'); 
     return pr; 
   } 
   
}