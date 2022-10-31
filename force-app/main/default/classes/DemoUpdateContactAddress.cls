public class DemoUpdateContactAddress {
	
    public static void contactAfterUpdate(List<Contact> conList){
        // Collect all the account first 
        
        set<ID> accIdSet= new set<ID>();
        
        for(Contact c: conList){
            if(c.AccountId!=null){
                accIdSet.add(c.AccountId);
            }
        }
        // Then to filter out the account ID from the account itself 
        Map<ID,Account> accMap=new Map<ID,Account>();
        
        for(Account a:[select Id,Name,BillingStreet,BillingCity,BillingState,BillingCountry,ShippingStreet,ShippingCity,ShippingState,ShippingCountry 
                       from Account 
                       Where Id IN:accIdSet]){
                        
                        accMap.put(a.Id,a);   
                           
                       }
        // check the start date and end date if lies within the update the address 
        List<Account> updateAccList= new List<Account>();
        
        for(Contact c:conList){
            if(c.Seasonal_Start_Date__c<=System.today() && c.Seasonal_End_Date__c>=System.today()){
                accMap.get(c.AccountId).BillingStreet=c.OtherStreet;
                updateAccList.addAll(accMap.values());
            }
        }
        Database.update(updateAccList);
    }
}