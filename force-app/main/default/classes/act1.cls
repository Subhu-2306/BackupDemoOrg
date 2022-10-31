public with sharing class act1 {
public Account acc;

    public act1(ApexPages.StandardController controller) {
        this.acc= (Account)controller.getRecord();
        acc.ownerID=UserInfo.getuserID();
    }
    
    public pageReference save()
        {    
            pageReference pNext= new pageReference('/apex/AccountCustom');
            return pNext;
        }

}