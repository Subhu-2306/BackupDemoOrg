public with sharing class Translation {

    public Student__c acc;

    public string selectedLang{get;set;}
    public List<selectoption> listOfLang {get;set;}
    
    public Translation(ApexPages.StandardController controller) 
    {
        selectedLang='en';

        listOfLang = new List<selectOption>();
        listOfLang.add(new selectOption('en','English'));
        listOfLang.add(new selectOption('es','Spanish'));
        listOfLang.add(new selectOption('fr','French'));
        
        this.acc=(Student__c)controller.getRecord();
        acc.OwnerId=UserInfo.getUserId();

    }
    
    public void clear()
    {
        acc.clear();
    }
    

    public pageReference Save()
        {
            upsert acc;
            PageReference pnext = new PageReference('/apex/StudentFormOutput?id='+acc.id);
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Check button is clicked')); 
            pnext.setRedirect(true);
            return pnext;
        }
        
}