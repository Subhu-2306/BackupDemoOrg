public with sharing class Act {
    public Account acc;
    
    public Attachment attachment 
    {
      get {
              if (attachment == null)
                attachment = new Attachment();
              return attachment;
        }
      set;
     }
     
    public Act(ApexPages.StandardController controller) 
    {
        this.acc= (Account)controller.getRecord();
    }

    public pageReference save()
        {
            upsert acc;
            Attachment a = new Attachment(ParentId =acc.Id, name = 'file-1'+attachment.Name, body = attachment.Body);
            
            try {
                       insert a;
                } 
            catch (DMLException e)
              {
                  ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
                  return null;
               } finally 
               {
                  attachment = new Attachment(); 
                }
        
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
            
                    pageReference pNext= new pageReference('/apex/AccountOutput?id='+acc.id);
                    return pNext;
        }
        
 
}