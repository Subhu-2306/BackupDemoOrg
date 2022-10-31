trigger OnInsertionOfEFTTrans on EFT_Transaction_Status__c (after insert)
{   
    //for related object we always need to perform in after insert.
    List<Case> cList= new List<Case>();
    
    Map<Id, EFT_Transaction_Status__c> objMap = new Map<Id, EFT_Transaction_Status__c>([
        SELECT Id,Transaction_status__c, SalesHeader__r.status__c,SalesHeader__r.account__c,SalesHeader__r.contact__c,SalesHeader__r.Account__r.name
        FROM EFT_Transaction_Status__c
        WHERE Id IN : Trigger.new
    ]);
        
     for(EFT_Transaction_Status__c a : trigger.new)
       {     
            if(a.Method_Name__c =='Credit Card Address Verify' && a.Transaction_Status__c=='Declined' && objMap.get(a.Id).SalesHeader__r.status__c=='open')
                
    		{
                  Case c= new Case();
                //retrive the id by using the schema class.
                  c.RecordTypeId=Schema.SObjectType.case.getRecordTypeInfosByName().get('Assignment').getRecordTypeId();                
                  c.Origin='Internal';
                  c.Reason='Address Did Not Verify';
                  c.Priority='High';
                  c.Status='New';
                  c.AccountId = objMap.get(a.Id).SalesHeader__r.Account__c;                  
                  c.ContactId = objMap.get(a.Id).SalesHeader__r.Contact__c;
                  c.Type='Address Did not Verify';
                  c.Subject= objMap.get(a.Id).SalesHeader__r.Account__r.name +' '+c.Type;
                  cList.add(c); 
                  
        	}
       }
    	insert cList;
}