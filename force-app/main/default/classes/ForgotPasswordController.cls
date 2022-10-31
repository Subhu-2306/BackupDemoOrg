/**
* An apex page controller that exposes the site forgot password functionality
*/
public with sharing class ForgotPasswordController {
    
    public String bornInCity { get; set; }
    public String username {get; set;}   
    
    public ForgotPasswordController() {}
    
    public PageReference forgotPassword() {
        boolean success = Site.forgotPassword(username);
        PageReference pr = Page.ForgotPasswordConfirm;
        pr.setRedirect(true);
        List<contact> contactRecord = [select id,email,ForgotPasswordCity__c from Contact where UserName__c =: username];
        System.debug(contactRecord);
        if (success && contactRecord[0].ForgotPasswordCity__c == bornInCity) {
            contactRecord[0].password__C = 'ESPL@2022';
            upsert(contactRecord);
            System.debug('Born city is correct :'+ bornInCity);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {contactRecord[0].email};
                mail.setToAddresses(toAddresses);
            mail.setReplyTo(username);
            mail.setSenderDisplayName('Salesforce Support');
            mail.setSubject('Password Reset');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            //mail.setPlainTextBody('Hi , Please note you next password is : XYZ');
            mail.setHtmlBody('<b>Hi , Please note you next password is : ESPL@2022</b>');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            return pr;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Contact administrator for password reset as answer for security question is not as expected'));
            return null;
        }
    }
}