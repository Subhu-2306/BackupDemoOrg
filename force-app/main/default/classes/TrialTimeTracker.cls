Public with sharing class TrialTimeTracker {


   public final Contact contactRecord{get;set;}
    public Time_Entry__c timeEntryRecord{get;set;} 
    public List<Time_Entry__c> ListTimeEntryRecords{get; set;}
    public String name{get;set;}
    public map<Date,Decimal> DailyHoursMap{get;set;}
 
    public TrialTimeTracker(ApexPages.StandardController controller){
        this.contactRecord = new Contact();
        String contactId = system.CurrentPageReference().GetParameters().get('contactId');
        this.contactRecord.id = contactId;  
        name = system.CurrentPageReference().GetParameters().get('name');
        System.debug(name);
        System.debug('Contact Record Id is : '+ contactRecord);
        
        ListTimeEntryRecords = new List<Time_Entry__c>();
        Time_Entry__c timeEntryRecord= new Time_Entry__c();
        timeEntryRecord.Contact__c = contactRecord.id;
        //DailyHoursMap.put(timeEntryRecord.date__C,  timeEntryRecord.Units__c);
        System.debug(DailyHoursMap);
        ListTimeEntryRecords.add(timeEntryRecord);
    }

    public void logTime(){
        
        Time_Entry__c timeEntryRecord= new Time_Entry__c();
        timeEntryRecord.Contact__c = contactRecord.id;
        ListTimeEntryRecords.add(timeEntryRecord);
    }

    public PageReference saveRecords(){
        upsert ListTimeEntryRecords;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Time Entries added to database'));
        return null;// Page.AllAccountssaved;
    }
    
    public PageReference Logout(){
        PageReference NextPage = Page.WelcomePage;
        NextPage.setRedirect(true);
        return NextPage;
    }
    
    public PageReference timeSheets(){
        pageReference pNext= new pageReference('/apex/DetailedTimeEntry?id='+system.CurrentPageReference().GetParameters().get('contactId'));
        pNext.setRedirect(true);
        return pNext;
    }
}