trigger UpdateTheAccount on Opportunity (after insert) 
{
	//step 1. Collect all the new IDs of opportunity and account which are coming 
	
    set<ID> setIds=new set<ID>();
    
    For(Opportunity opp:Trigger.new)
    {
        setIds.add(opp.AccountId);
    }
    
    //step 2. create the map to store the related account and opportunity
    
    Map<ID,Opportunity> oppids=new  Map<ID,Opportunity>();
    
    For(Opportunity opp:Trigger.new)
    {
        oppids.put(opp.AccountId, opp);
    }
    
    //step 3. compare and update the value for the account 
    
    List<Account> actList=new List<Account>();
    
    For(Account obj:[SELECT id, Premium__c FROM Account WHERE ID IN :setIds])
    {
        If(oppids.get(obj.id).Amount >=20000)
        {
            obj.Premium__c=true;
        }else
        {
            obj.Premium__c=false;
        }
        
        actList.add(obj);
    }
    
    update actList;
}