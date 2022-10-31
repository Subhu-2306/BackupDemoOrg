public with sharing class OppPriceBookSelector {
    private final opportunity opp;
    public string SelectedBook {get;set;}
    public string showBook {get;set;}
    public OppPriceBookSelector(ApexPages.StandardController controller) {
        this.opp=(opportunity)controller.getRecord();
    }
    
    public pageReference Save()
        {
            // upsert opp;
            showBook=opp.Pricing_Type__c;
            Pricebook2 pBook=[select id,name from Pricebook2 where name=:showBook];
            SelectedBook=pBook.id;
           // opportunity op=[SELECT Id, Name, StageName, Amount,CloseDate, Pricebook2Id, Pricing_Type__c FROM Opportunity where Id=:opp.id]; 
            opp.Pricebook2Id=SelectedBook;
            opp.PlaceOrder__Pricing_Type__c=showBook;
            upsert opp;
            PageReference pnext = new ApexPages.StandardController(opp).view();
            pnext.setRedirect(true);
            return pnext;
        }
        

}