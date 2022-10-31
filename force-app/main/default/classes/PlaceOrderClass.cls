public class PlaceOrderClass {
	@AuraEnabled
    public static void placeOrder(String cname,String ostreet,String ocity,String ostate,String ocountry,String opincode,Integer quant,String fi)
    {
       Order_Item__c c=new Order_Item__c();
       c.Customer_Name__c=cname;
       c.Street__c=ostreet;
       c.City__c=ocity;
       c.State__c=ostate;
       c.Country__c=ocountry;
       c.PinCode__c=opincode;
       c.Quantity__c=quant;
       c.Food_Item__c=fi;
       insert c;
    }
}