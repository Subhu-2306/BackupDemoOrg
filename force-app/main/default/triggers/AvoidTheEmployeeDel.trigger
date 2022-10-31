trigger AvoidTheEmployeeDel on Employee__c (before delete) 
{
	List<Id> dlist=New List<Id>();
    
    For(Employee__c e:trigger.old)
    {
        dlist.add(e.Department__c);
    }
    
    Map<ID,Department__c> mapDept=new Map<ID,Department__c>();
    
    For(Department__c c:[select id,name from Department__c where ID IN :dlist])
    {
        mapDept.put(c.Id, c);
    }
    
    For(Employee__c eList: Trigger.old)
    {
        if(mapDept.containsKey(eList.Department__c))
        {
            if(mapDept.get(eList.Department__c).Department_Name__c=='Finance')
        {
            elist.adderror('You Cannot delete the record');
        }
            
        }
    }
}