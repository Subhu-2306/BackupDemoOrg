public class documentExt {
    public documentExt(ApexPages.StandardController controller) {
        Document d = (Document) controller.getRecord();
        d.folderid = UserInfo.getUserId(); //this puts it in My Personal Documents
    }    
    
     public pageReference save()
        {
            pageReference pNext= new pageReference('/apex/AccountOutput');
            return pNext;
        }             
}