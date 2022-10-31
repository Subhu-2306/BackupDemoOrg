trigger UpdateAllParentAccountOnChildOpportunity on Opportunity (after insert) {
    
   Set<ID> collectAccSet = new Set<ID>();
    
   for(Opportunity opp : Trigger.new)
   {
      collectAccSet.add(opp.AccountId); 
   }
   
   map<ID,Opportunity> oppMap = new map<ID,Opportunity>();
    
   for(opportunity o: Trigger.new)
   {
       oppMap.put(o.AccountId,o);
   }

   for(Account obj : [select id,Active__c from Account where ID IN : collectAccSet])
   {
       if(oppMap.get(obj.id).amount >=20000){
           obj.active__c='Yes';
       }
       else{
           obj.active__c='No';
       }
   }
   
}