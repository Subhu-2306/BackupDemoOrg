public class CountVisitTwo_CX {
    public Id accountId;
    public CountVisitTwo_CX(ApexPages.StandardController controller){
        
    }
    public void inIt(){
        accountId=ApexPages.currentPage().getParameters().get('Id');
        Account currentRecord=[Select Id,Name,Visited_Count__c from Account where ID=:accountId];
        if(currentRecord.Visited_Count__c==null)
        {
            currentRecord.Visited_Count__c=1;
            update currentRecord;
        }
        else{
                if(currentRecord.Visited_Count__c!=null){
                    currentRecord.Visited_Count__c=currentRecord.Visited_Count__c+1;
                    update currentRecord;
            }
        }
        return;
    }
}