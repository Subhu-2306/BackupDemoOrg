@istest
public class LeadManagerTest2 {
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
       /* 
        Lead lead1=[SELECT id ,Name FROM Lead WHERE id =:recordId];
        Lead lead2= new Lead();

        LeadManager.ResponseWrapper updatewrapper = new LeadManager.ResponseWrapper();
        try{
            //this call will not get executed as value for one of the required filed Company is not provided
            insert lead2;
            updatewrapper = LeadManager.updateLead('TestTest','TestTest1','Eternus','TestTest@gmail.com','9658997754');
        }catch(DmlException dml){
            //this will call the exeception part of creatLead method present in handler
            updatewrapper = LeadManager.updateLead('TestTest','TestTest1','Eternus','TestTest@gmail.com','9658997754');
            System.debug('Exception occurs while creating the record: ' + dml);
        }*/
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