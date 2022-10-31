@isTest
private class FinalReviewTestClass {

    @testSetup static void setup() {
             
         Opportunity testopps = new Opportunity();
         testopps.Name='Final Review' ;
         testopps.CloseDate=system.today();
         testopps.stageName='Closed Won';
         insert testopps;  
        
         
         Test.StartTest(); 
          ApexPages.StandardController sc = new ApexPages.StandardController(testopps);
          OppPriceBookSelector testAccPlan = new OppPriceBookSelector(sc);
          testAccPlan.save();
         Test.StopTest();
         
       
    }
    
    @isTest static void testMethod1() {
        // Get the first test Opportunity by using a SOQL query
        Opportunity acct = [SELECT name,Pricing_Type__c,price_book_id__c FROM Opportunity WHERE Name='Final Review' LIMIT 1];
        // Modify first Opportunity
        acct.name = 'Final Review abc';
        // This update is local to this test method only.
        update acct;
        
        
        // Delete second Opportunity
        Opportunity acct2 = [SELECT name,Pricing_Type__c,price_book_id__c FROM Opportunity WHERE Name='Final Review abc' LIMIT 1];
        // This deletion is local to this test method only.
        delete acct2;
        
        // Perform some testing
        System.assertNotEquals(null, acct.id);
        System.assertNotEquals(null, acct2);
    }

}