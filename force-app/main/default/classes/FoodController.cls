public class FoodController {
    @AuraEnabled
    public static List<Order__c> searchContact( String searchKeyWord ) {
        List<Order__c> returnList = new List<Order__c>();
        String searchKey = String.isBlank(searchKeyWord) ? '%%' : searchKeyWord + '%';
        System.debug(searchKey);
        returnList = [select name, Customer__r.name from order__c where Customer__r.name LIKE : searchKey LIMIT 2];
        System.debug('search' +returnList);
        return returnList;
    }
    @AuraEnabled
    public static List<Order__c> orderListOfCon(String cusID){
        List<Order__c> orders = [SELECT id,
                                 Name,
                                 Order_Date__c,
                                 Status__c,
                                 Paid_in_Advance__c FROM Order__c WHERE Customer__r.id =: cusID];
        
				return orders;
    }
    @AuraEnabled
    public static List<Order__c> cancelOrder(String orderID) {
        List<Order__c> order = new List<Order__c>();
        order = [SELECT id,
                 Name,
                 Order_Date__c,
                 Status__c,
                 Paid_in_Advance__c FROM Order__c WHERE id =: orderID];
        System.debug('order detail ' + order);
        List<Order__c> updatedList = new List<Order__c>();
        for(Order__c record : order)
        {
            record.Status__c = 'Cancelled';
            updatedList.add(record);
        }
        try{
            update updatedList;
        }
        catch(Exception e) {
            System.debug('Error'+ e.getMessage());
        }
        return updatedList;
    }
    @AuraEnabled
    public static List<Order__c> reOrder(String orderID){
        List<Order__c> order = new List<Order__c>();
        order = [SELECT id,
                 Name,
                 Order_Date__c,
                 Status__c,
                 Paid_in_Advance__c FROM Order__c WHERE id =: orderID];
        List<Order__c> updatedList = new List<Order__c>();
        for(Order__c record : order)
        {
            record.Status__c = 'Preparing';
            updatedList.add(record);
        }
        try{
            update updatedList;
        }
        catch(Exception e) {
            System.debug('Error'+ e.getMessage());
        }
        return updatedList;
    }
}