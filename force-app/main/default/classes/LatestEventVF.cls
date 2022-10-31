public with sharing class LatestEventVF {
    public Date StartDate{get;set;}
    public Date EndDate{get;set;}
    public string selectedEvent{get;set;}
    public string selectedGuest{get;set;}
    public List<Selectoption> EventList{get;set;}
    public List<Selectoption> GuestList{get;set;}
    public string GuestName{get;set;}
   
    public List<Selectoption> evOption=new List<Selectoption>();
    public void SearchEvent(){
        evOption.clear();
            evOption.add(new selectOption('','--None of these--'));
        List<Event__c> evList=[Select Id,Name from Event__c where Event_Date__c>=:StartDate];
        for(Event__c ev : evList){
            evOption.add(new selectOption(ev.id,ev.Name));
        }
        EventList=evOption;
    }
    public List<selectOption> gcList = new List<selectOption>();
    public void SearchGuest(){
        gcList.clear();
        gcList.add(new selectOption('','None of these'));
        List<Pkg__c > pckList=[Select Id,Name,Event__c,Grip__c From Pkg__c where Event__c=:SelectedEvent];
        set<Id> gcIds = new Set<Id>();
        for(Pkg__c pkVar : pckList){
            gcIds.add(pkVar.Grip__c);
        }
       
        List<Grip__c> gcList1 = [Select Name from Grip__c where Id=:gcIds];
        for(Grip__c gc : gcList1){
            gcList.add(new selectOption(gc.id,gc.Name));          
        }
        GuestList=gcList;
    }
    public void SaveGuest(){
        Gest__c guest = new Gest__c();
        //guest.Event__c='Event :'+ selectedEvent +'Group Code:' +selectedGuest;
        guest .Name=GuestName;
        insert guest;
    }
}