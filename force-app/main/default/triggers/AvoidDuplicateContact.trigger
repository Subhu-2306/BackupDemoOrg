trigger AvoidDuplicateContact on Contact (before insert,before update) 
{
    
     map<Id,Contact> existingContactMap = new map<Id,Contact>([Select Id, Name, email, Phone From Contact Where email != null and Phone !=null]); 

     try {
         
             for(Contact a : Trigger.new){
                
                if(a.email == existingContactMap.get(a.Id).Email && a.phone == existingContactMap.get(a.Id).Phone){
                  a.adderror('You cannot create a dulplicate Contact');
                }
             }
     }
     catch (System.NullPointerException e) {

            e.getMessage();

        }
}