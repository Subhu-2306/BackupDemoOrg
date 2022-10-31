@RestResource(urlMapping='/UpdateLead')
global class UpdateLeadAPI {
    ///services/apexrest/UpdateLead?id=00Q5j00000AuOUFEA3
   global class Result {
        public Boolean isSuccess;
        public String lead;
        public String status;
    }
    
     @httpput
      global Static string fetchAccount(){
      RestRequest req = RestContext.request;
      RestResponse res = Restcontext.response;
      string jsonString=req.requestBody.tostring();
      responseWrapper wResp=(responseWrapper) JSON.deserialize(jsonString,responseWrapper.class);   
      Lead obj=new Lead();
      obj=[select id,name,company from Lead where company=:wResp.company];
      obj.company='Closed Won';
      update obj;
      return 'Success';
      }
       global class responseWrapper{
       global string company;
      }
}