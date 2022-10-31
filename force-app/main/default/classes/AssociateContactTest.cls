@isTest
private class AssociateContactTest {
    static testMethod void validateAId() {
        Account a= new Account();
        a.name='test.com';
        insert a;
        
        Contact tempc = new contact();
        tempc.LastName='TestContact';
        tempc.email='primary@test.com';
        insert tempc;
        
        ID AI= a.ID;
        Contact check=[select ID,accountid from contact where accountid=:AI];
        system.assertEquals(check.AccountId,AI);
    }  
}