public with sharing class TestFunctionality {

    public String searchString { get; set; }
    public List<Account> accList{get;set;} 
    
    public List<WrapperClass> sub {get;set;}
    public List<Account> del {get;set;}
    
    public class WrapperClass
    {
        public Account acc{get;set;}
        public Boolean check_box{get;set;}
        
        public WrapperClass(Account acc,Boolean check_box)
        {
        this.acc = acc;
        this.check_box=check_box;
        }
    }
    
    public TestFunctionality()
    {
      sub = new List<WrapperClass>();
    }
       
    public PageReference Search() {
        String searchString = 'select id,name,rating from Account where name like \'%'+ searchString + '%\'';
        accList = Database.query(searchString);
        
        for(Account acc:accList)
        {
         sub.add(new WrapperClass (acc, false));
        }
        return null;
    }

    public Pagereference deleteSelected()
    {
        del=new list<Account>();
        for(WrapperClass wc: sub)
        {
            if(wc.check_box)
            {
            del.add(wc.acc);
            }
        }
        delete del;
        PageReference pr = new PageReference(System.currentPageReference().getURL());
        pr.setRedirect(true);
        return pr;
    }

     
}