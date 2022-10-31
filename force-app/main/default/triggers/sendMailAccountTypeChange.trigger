/* Write a trigger on Account when an account is update when account type changes 
* send an email to all its contacts that your account information has been changed.
* Subject: Account Update Info
* Body: Your account information has been updated successfully.
* Account Name: XYZ.
*/
trigger sendMailAccountTypeChange on Account (after update) {
    
    //step 1. collect the account Ids which are recently updated
    
    Set<ID> accIds = new Set<ID>();
    for(Account a:Trigger.new){
        if(a.type !=Trigger.oldMap.get(a.id).type){
            accIds.add(a.Id);
        }
    }
    
    List<Contact> ccList =[Select Id,LastName,Email,AccountId,Account.Name from Contact where AccountId=:accIds ];
    
    List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
    
    if(ccList.size()>0){
        for(Contact c:ccList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(c.Id);
            mail.setSenderDisplayName('System Administrator');
            mail.setUseSignature(false);
            mail.setBccSender(false);
            mail.setSaveAsActivity(false);
            mail.setSubject(' Account Update Info.');
            String body = 'Dear '+c.LastName+', <br/>';
            body+='Your account information has been updated successfully.<br/><br/>Account Name : '+c.Account.Name;
            mail.setHtmlBody(body);
            mail.toAddresses = new String[]{c.Email};
                //Adding singleEMailMessage to List of singleEMailMessage
                emailList.add(mail);
        }
    }
    
    if(emailList.size()>0){
        //Sending the List of singleEMailMessage
        Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
        if (results[0].success){
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '+ results[0].errors[0].message);
        }
    }
}