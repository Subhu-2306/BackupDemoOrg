@istest
public class LeadManagerTest {
    @istest
    public static void getLeadTest(){
        string recordId = createTestRecord();// in this method we are using Id for getting the records
        string url='/Service/apexrest/v1/Lead/'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI=url;
        request.httpMethod='GET';
        RestContext.request =request;
        Test.startTest();
        LeadManager.ResponseWrapper wrapper = LeadManager.getLead();
        system.assertNotEquals(null, wrapper);
        Test.stopTest();
    }
    public static testMethod void postLeadTest(){
        string url = '/service/apexrest/v1/Lead';// In this method we have to create the record first.we dont need Id here.
        RestRequest request = new RestRequest();
        request.requestURI=url;
        request.httpMethod='POST';
        Lead le= new lead(firstname='Test',
                          LastName='Demo',Company='TestDemocomp');
        string testMessage ='This is the message from test class';
        LeadManager.ResponseWrapper rw = new LeadManager.ResponseWrapper();
        rw.leadRec= le;
        rw.message=testMessage;
        RestContext.request = request;
        Test.startTest();
        LeadManager.createLead('TestFirst', 'TestLast', 'TESTcopm', 'test@gmail.com', '56235689');//assert
        system.assertNotEquals(null, rw);
        Test.stopTest();
        try{
            //this call will not get executed as value for one of the required filed Company is not provided
            rw = LeadManager.createLead('Sanjay','Kumar','test@eternus.com','8888888888',null); }catch(DmlException dml){
                //this will call the exeception part of creatLead method present in handler
                rw = LeadManager.createLead('Sanjay','Kumar','test@eternus.com','8888888888',null);
                System.debug('Exception occurs while creating the record: ' + dml);
            }
    }
   @isTest
    public static void updateLeadTest(){
        String recordId = createTestRecord(); // for update we need record id so we are using this utility method here.
        string url = '/service/apexrest/v1/Lead/'+recordId;
        
        RestRequest request = new RestRequest();
        request.requestURI=url;
        request.httpMethod='PATCH';
        
        Lead lead = [SELECT id ,Name,company FROM Lead WHERE id =:recordId];
        RestContext.request = request;
        
        LeadManager.ResponseWrapper wrapper = new LeadManager.ResponseWrapper();
        
        Test.startTest();
        LeadManager.updateLead('TestName','TestLast','TestCompany','test.tset@gmail.com','8956232565');
        System.assertNotEquals('TestCompany',lead.Company);
        Test.stopTest();

        LeadManager.ResponseWrapper updatewrapper = new LeadManager.ResponseWrapper();
        try{
            //this call will not get executed as value for one of the required filed Company is not provided
            updatewrapper = LeadManager.updateLead('TestTest','TestTest1',null,'TestTest@gmail.com','9658997754');
        }catch(DmlException dml){
            //this will call the exeception part of creatLead method present in handler
            updatewrapper = LeadManager.updateLead('TestTest','TestTest1',null,'TestTest@gmail.com','9658997754');
            System.debug('Exception occurs while creating the record: ' + dml);
        }
    }
    @isTest
    public static void deleteLeadTest(){
        String recordId = createTestRecord();//for delete we need Id so we are using this utility method here
        string url = '/service/apexrest/v1/Lead/'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI=url;
        request.httpMethod='DELETE';
        RestContext.request = request;
        Test.startTest();
        LeadManager.deleteLead();
        System.assertEquals([SELECT COUNT() FROM Lead],0);
        Test.stopTest();
        
        LeadManager.ResponseWrapper deletewrapper = new LeadManager.ResponseWrapper();
        
         try{
            //this call will not get executed as value for one of the required filed Company is not provided
            deletewrapper = LeadManager.deleteLead();
        }catch(DmlException dml){
            //this will call the exeception part of creatLead method present in handler
            deletewrapper = LeadManager.deleteLead();
            System.debug('Exception occurs while creating the record: ' + dml);
        }
        
    }
    public static Id createTestRecord(){
        Lead lead = new Lead();
        lead.FirstName='Test Lead';
        lead.LastName='Tested Lead';
        lead.Company='Test Test';
        lead.Email='test.test@gmail.com';
        lead.Phone='9999999999';
        insert lead;
        return lead.Id;
    }
}