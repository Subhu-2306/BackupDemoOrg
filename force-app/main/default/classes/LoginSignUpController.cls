public class LoginSignUpController {
  public Contact Contact{get;set;} //Assume it to be ur custom user

public LoginSignUpController()
{
    contact=new contact();
    
}
    public PageReference login()
    {
       if( (contact.Email == null) || (contact.Password__c == null))
       {
           return null;
       }                                
        
        return null;
    }
    
    public PageReference signUp()
    {
      insert contact;
      PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
      pageRef.setRedirect(true);
      return pageRef;

      
    }
    
    
}