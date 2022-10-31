global class TrialLoginPage {
    
    global static String userName{get;set;}
    global static String password{get;set;}
    public static Contact contactRecord{get;set;}
    //public static String name{get;set;}
    
    public TrialLoginPage(){
        System.debug('In constructor');
        //userName = null;
        //password = null;
    }
    
    public TrialLoginPage(ApexPages.StandardController controller){
        System.debug('In constructor '+ username);
        //userName = null;
        //password = null;
    }
    
    public PageReference logintoSalesforce()
    {         
        
        System.debug('UserName enetered on VF page is : '+ userName + ' and password is : '+ password);
        List<Contact> con_List=[Select Id,name,Username__c,Password__c from Contact where Username__c =: userName Limit 1];
        if(con_List.size() == 0)
        {
           System.debug('User does not exist');
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'User does not exist'));
           return null;
        }
        else
        {
            if(con_List[0].Password__c==password)
            {
                contactRecord=con_List[0];
                System.debug('Login successfull!!!! \n\nWelcome , '+con_List[0].name);
                PageReference NextPage = Page.LoginToTimrEntry;
                NextPage.getParameters().put('contactId', contactRecord.Id);
                NextPage.getParameters().put('name', contactRecord.name);
                NextPage.setRedirect(true);
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'LOGIN successfull'));
                return NextPage;
                //PageReference pageRef = new PageReference('/apex/TimeTracker');
                //return pageRef;
                //return Site.login(username,password,'/apex/TimeTracker/');
            }
            else
            {
                System.debug('Invalid password! \n Please try using a valid password or contact administrator!!!!');
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid password! \n Please try using a valid password or contact administrator!!!!'));
                return null;
            }
        }
    }
    
    public PageReference ResetPassword(){
        PageReference NextPage = Page.ChangePassword;
         return NextPage;
    }
    
    public PageReference ForgotPassword(){
        PageReference NextPage = Page.ForgotPasswordPage;
        //NextPage.getParameters().put('userName', userName);
        NextPage.setRedirect(true);
        return NextPage;
    }
    
}