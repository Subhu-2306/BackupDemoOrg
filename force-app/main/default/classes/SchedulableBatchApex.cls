global class SchedulableBatchApex implements Schedulable{
    global void execute(SchedulableContext sc){
        // We now call the batch class to be scheduled
        RemoveDuplicateLeadEmail b = new RemoveDuplicateLeadEmail();
       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,200);
    }
   
}