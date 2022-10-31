@isTest
private class TestFinalReview {

   static testMethod void testMethod1() 
     {
         Opportunity testopps = new Opportunity();
         testopps.Name='Test Opportunity record' ;
         testopps.CloseDate=system.today();
         testopps.stageName='Closed Won';
         insert testopps;
         
         PageReference testPage = Page.FinalReview; 
         Test.setCurrentPage(testPage);
         testPage.getParameters().put('Id', String.valueOf(testopps.Id));
         
          ApexPages.StandardController sc = new ApexPages.StandardController(testopps);
          OppPriceBookSelector testAccPlan = new OppPriceBookSelector(sc);
          testAccPlan.save();

          
       List<opportunity> al = [SELECT Id, Name, StageName, Amount,CloseDate, Pricebook2Id, Pricing_Type__c FROM Opportunity where Name LIKE '%Test Opportunity record%' LIMIT 1];
       System.assertEquals(1, al.size());
         
         
     }

}