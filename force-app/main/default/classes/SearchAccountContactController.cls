public with sharing class SearchAccountContactController
{
    public List<Account> varAcc{get;set;}
    public List<Contact> varCon{get;set;}
    public string searchKey{get;set;}
    
    public List<WrapperClass> sub {get;set;}
    public String key {get;set;}
    public Boolean check_box {get;set;}
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
    
    public SearchAccountContactController()
    {
        sub = new List<WrapperClass>();
    }
    public void serachAccount()
    {
        string searchquery='select Name,id from account where name like \'%'+searchKey+'%\' Limit 10';
        //string searchquery='(List<Account>)[Find:searchText Returning Account(Name,Email)][0]';
        varAcc = Database.query(searchQuery);
        for(Account acc:varAcc)
        {
            sub.add(new WrapperClass (acc, false));
        }
        string searchquery1='select Name,id from Contact where name like \'%'+searchKey+'%\' Limit 10';
        //string searchquery='(List<Account>)[Find:searchText Returning Account(Name,Email)][0]';
        varCon = Database.query(searchQuery1);
        
        //return null;
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