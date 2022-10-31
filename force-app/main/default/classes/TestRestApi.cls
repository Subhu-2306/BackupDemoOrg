@isTest
public class TestRestApi {
    
    @testSetup
    static void dataSetup() {
        Lead acc = new Lead();
        acc.FirstName = 'Testing_FirstName';
        acc.LastName = 'Testing_LastName';
        acc.Company = 'Eternus Solution Limited';
        insert acc;
        
    }
    
    static testMethod void testDelete() {
        Lead acc = [ SELECT Id FROM Lead LIMIT 1 ];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/CreateLead/' + acc.Id;
        req.httpMethod = 'DELETE';
        RestContext.request = req;
        RestContext.response= res;
        CreateLeadAPI.deleteLeads();
        system.assertEquals( [ SELECT COUNT() FROM Lead ], 0);
    }
    
    static testMethod void testPost() {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
            
        req.requestURI = '/services/apexrest/CreateLead/';  
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest(); 
            CreateLeadAPI.CreateLead();
        Test.stopTest();
                 
    }
    static testMethod void testPut() {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
            
        req.requestURI = '/services/apexrest/CreateLead?id=';  
        req.httpMethod = 'PUT';
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest(); 
            CreateLeadAPI.updateLeads('Persistent');
        Test.stopTest();
                 
    }
    
}