global class SoapAPIClass {
    
     global class Result {
        public Boolean isSuccess;
        public String lead;
        public String status;
    }
    
    webservice static Result CreateLead(String FName,String LName,String Company){
        Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
        Lead l=new lead();
        l.FirstName=FName;
        l.LastName=LName;
        l.Company=Company;
        insert l;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = l.Id;
        
        return res1;
    }
    
    webservice static Result UpdateLead(String LeadID){
        Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
        Lead obj=new Lead();
        obj=[select id,name,company from Lead where id=:LeadID];
        obj.company='Persistent';
        update obj;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = obj.Id;
        
        return res1;
    }
    
    webservice static Result DeleteLead(String LeadID){
        Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
        Lead obj=new Lead();
        obj=[select id,name,company from Lead where id=:LeadID];
        delete obj;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = obj.Id;
        
        return res1;
    }
}