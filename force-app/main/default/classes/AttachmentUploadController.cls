public with sharing class AttachmentUploadController 
{
    public Account recordId;

    public AttachmentUploadController(ApexPages.StandardController controller) 
    {
        this.recordId = (Account)controller.getRecord();
    }


    public Attachment attachment 
    {
      get {
              if (attachment == null)
                attachment = new Attachment();
              return attachment;
        }
      set;
     }

  public PageReference upload() 
  {
     
    Attachment a = new Attachment(ParentId =recordId.Id, name = 'file-1'+attachment.Name, body = attachment.Body);
            
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
    return null;
  }
}