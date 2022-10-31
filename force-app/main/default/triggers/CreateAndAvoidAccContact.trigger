/*You have been asked to build a mechanism to auto populate Account and Contact details on Case 
 * when the Case is created in Salesforce based on the Email or Phone Number details present on Case.
Requirements:
· At present when Case is created in Salesforce from an Email-to-Case or web-to-case 
  then the Account and Contact details are not getting populated onto the case
· Once the case is created in Salesforce users are manually searching for Account and Contact 
  and linking the same with the Case. This process is time consuming and users wants it to be automated
· With the new process when new Case is created in Salesforce and if Email or Phone Number 
  is populated the backend logic will check for existing Contact and link the same with the newly created Case*/
trigger CreateAndAvoidAccContact on Case (before insert) {
    if(Trigger.isbefore && Trigger.isInsert){
        HandlerClassForCase2.createConAcc(trigger.new);
    }
}