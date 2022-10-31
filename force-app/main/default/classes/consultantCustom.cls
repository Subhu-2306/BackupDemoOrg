public with sharing class consultantCustom {
public Consultant__C con{get;set;}

public consultantCustom(){
con = new Consultant__C();
}

public PageReference Edit(){
upsert con;
PageReference pnext = new PageReference('/apex/conCustomOutput?id='+con.id);
pnext.setRedirect(true);
return pnext;
}
}