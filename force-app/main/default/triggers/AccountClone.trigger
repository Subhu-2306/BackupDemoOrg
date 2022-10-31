trigger AccountClone on Account (after insert) 
{
   if(checkRun.runonce()) 
   {
     List<Account> act = new List<Account>();   
     for (Account record : trigger.new)
        {
            act.add(record.clone(false, false, false, false));
    
        }
        if(act.size()>0){
            INSERT act;
        }
   }
}