@isTest
private class AssociateContactTest2 {

    @testSetup static void setup() {
             
        // Create common test accounts
       List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<2;i++) {
            testAccts.add(new Account(Name = 'gmail'+i+'.com'));
        }
        insert testAccts;  
        
        List<Contact> testcons = new List<Contact>();
        for(Integer i=0;i<2;i++) {
            testcons.add(new Contact(LastName = 'TestContact'+i,email='primary@gmail'+i+'.com'));
        }
        insert testcons;
    }
    
    @isTest static void testMethod1() {
        // Get the first test account by using a SOQL query
        Account acct = [SELECT name FROM Account WHERE Name='gmail0.com' LIMIT 1];
        // Modify first account
        acct.Phone = '555-1212';
        // This update is local to this test method only.
        update acct;
        
        
        // Delete second account
        Account acct2 = [SELECT Id FROM Account WHERE Name='gmail1.com' LIMIT 1];
        // This deletion is local to this test method only.
        delete acct2;
        
        Contact con = [SELECT email FROM Contact WHERE email='primary@gmail0.com' LIMIT 1];
        
        // Perform some testing
        System.assertNotEquals(null, acct.id);
        System.assertNotEquals(null, acct2);
        System.assertEquals(acct.Name, con.Email.split('@').get(1));
    }

}