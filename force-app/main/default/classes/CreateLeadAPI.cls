@RestResource(urlMapping='/CreateLead')
global class CreateLeadAPI {
    
   global class Result {
        public Boolean isSuccess;
        public String lead;
        public String status;
    }
    
    @HttpPost
    global static Result createLead() {
        
     Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
	 String firstName, lastName,company;
     String fieldName,fieldValue;
        
     RestRequest req=RestContext.request;
     RestResponse res=RestContext.response;
        
     String jsonBody =req.requestBody.toString();
     
     JSONParser parser =JSON.createParser(jsonBody);
        
        while(parser.nextToken() !=NULL){
            if(parser.getCurrentToken() !=JSONToken.END_OBJECT)
            {
                fieldName=parser.getCurrentName();
                fieldValue=parser.getText();
                
                if(fieldName=='FirstName'){
                    firstName=fieldValue;
                    
                }else if(fieldName=='LastName'){
                    lastName=fieldValue;
                    
                }else if(fieldName=='Company'){
                    company=fieldvalue;
                }                
            }
        }
        
        Lead l=new Lead(FirstName=FirstName,LastName=LastName,Company=Company);
            
        insert l;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = l.Id;
        
        return res1;
	}
    
     @HttpDelete ///services/data/v22.0/sobjects/Lead/00Q5j00000AuOUFEA3
    global static Result deleteLeads() {
        
        Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String leadId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Lead l = [SELECT Id FROM Lead WHERE Id = :leadId];
        delete l;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = l.Id;
        
        return res1;
    }
    
    @HttpPut  ///services/apexrest/CreateLead?id=00Q5j00000AuOUFEA3
    global static result updateLeads( String company){
        
        Result res1= new Result();
        res1.isSuccess = false;
        res1.status = 'Error';
        
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        
        string jsonString=req.requestBody.tostring();
        
        responseWrapper wResp=(responseWrapper) JSON.deserialize(jsonString,responseWrapper.class);
        
        Lead obj=new Lead();
        obj=[select id,name,company from Lead where company=:wResp.company];
        obj.company='Closed Won';
        update obj;
        
        res1.isSuccess = true;
        res1.status = 'Success';
        res1.lead = obj.Id;
        
        return res1; 
    }  
    global class responseWrapper{
       global string company;
      }

}