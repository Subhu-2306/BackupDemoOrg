global class RemoveDuplicateLeadEmail implements Database.Batchable<SObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([Select Email, Name from Lead where Email != NUll and Name !=NULL]);
      }
    
    global void execute(Database.BatchableContext BC , List<Lead> scope){
        
		List<Lead> duplicatelist = new List<Lead>();
        
        Map<String , Lead> Emailmap = new Map<String , Lead>();
        
        Map<String , Lead> Namemap = new Map<String , Lead>();
        
        for(Lead s : scope){
			if(!(Emailmap.containsKey(s.Email) && Namemap.containsKey(s.Name))){
				Emailmap.put(s.Email , s);
                Namemap.put(s.Name , s);
			}
			else{
				duplicatelist.add(s);			
			}                        
        }  

		if(duplicatelist.size() > 0){
			delete duplicatelist;
		}
    }
        global void finish(Database.BatchableContext BC){
        
    }
        

}