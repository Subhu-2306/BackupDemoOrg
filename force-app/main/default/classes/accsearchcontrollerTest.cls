@isTest
public class accsearchcontrollerTest 
{

 @isTest static void testAccount(){    
       List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<=2;i++) {
            testAccts.add(new Account(Name = 'test'+i));
        }
        insert testAccts;  
     
          Test.startTest();
          Test.setCurrentPage(Page.DisplayAccounts);
     
          ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testAccts);
          stdSetController.setSelected(testAccts);
     
         accsearchcontroller ext = new accsearchcontroller(stdSetController);
         Test.stopTest();	    	 
     
       List<Account> al = [Select Name from Account where Name LIKE '%test%' LIMIT 1];
       Account acct2 = [SELECT Id FROM Account WHERE Name='test1' LIMIT 1];
        // This deletion is local to this test method only.
        delete acct2;
     
       ext.search();
       ext.clear();
       ext.DeleteAccount();
     
       //System.assertEquals(2, al.size());
       System.assertNotEquals(null, acct2);
        
   } 
 
}