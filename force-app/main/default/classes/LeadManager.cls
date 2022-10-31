@RestResource(urlmapping='/v1/Lead/*')
global class LeadManager{
    @httpGet
    global static ResponseWrapper getLead(){
        RestRequest request = RestContext.request;
        string requestURI=request.requestURI;
        string Id = requestURI.substringAfterLast('/');
        List<Lead> leadList = [Select id,Name, FirstName, LastName, Company,Email,Phone FROM Lead WHERE id =: ID];
        ResponseWrapper Wrapper = new ResponseWrapper();
        Wrapper.leadRec = leadList.get(0);
        try{
            Wrapper.isSuccess=true;
            Wrapper.leadId=leadList[0].id;
            Wrapper.status='Success';
            wrapper.message= 'Lead Record';
            wrapper.leadRec=leadList.get(0);
            Wrapper.fullName=leadList[0].Name;
        }
        catch(Exception e)
        {
            Wrapper.isSuccess = False;
            Wrapper.status = 'Error';
        }
        return Wrapper;
    }
    @httpPost
    global static ResponseWrapper createLead(string firstname,string lastname,string company,string email, string phone){
        Lead leadRecord = new Lead(FirstName=firstname,LastName=lastname,Company=company,Email=email, Phone=phone);
        ResponseWrapper wrapper = new ResponseWrapper();
        try{
            insert leadRecord;
            system.debug('**'+leadRecord);
            wrapper.leadRec=leadRecord;
            wrapper.leadId =leadRecord.id;
            wrapper.isSuccess = True;
            wrapper.status = 'Success';
            // Wrapper.fullName=leadRecord.Name;
            wrapper.message= 'Lead Record Created';
        }catch(Exception e){
            wrapper.isSuccess = False;
            wrapper.status = 'Error';
        }
        return wrapper;
    }
    @httpDelete
    global static ResponseWrapper deleteLead(){
        //list<string> leadFullName = new List<String>();
        RestRequest request = RestContext.request;
        string requestURI=request.requestURI;
        system.debug('requestURI'+requestURI);
        string Id = requestURI.substringAfterLast('/');
        List<lead> leLead=[SELECT id,Name,FirstName,LastName,Email,Phone FROM Lead WHERE id =:Id];
        ResponseWrapper Wrapper = new ResponseWrapper();
        if(leLead!=null && leLead.size()>0){
            try{

                delete leLead;
                Wrapper.isSuccess=true;
                wrapper.message= 'Lead Record Deleted';
                Wrapper.fullName=leLead[0].Name;
                Wrapper.leadId=leLead[0].id;
                //Wrapper.leadRec=leLead;
                Wrapper.status='Success';
            }catch(system.Exception ex){
                Wrapper.isSuccess=false;
                Wrapper.status='Error';
            }
        }
        return Wrapper;
    }
    @httpPatch
    global static ResponseWrapper updateLead(string firstname,string lastname,string company,string email, string phone){
        RestRequest request = RestContext.request;
        string requestURI=request.requestURI;
        string Id = requestURI.substringAfterLast('/');
        //prepare lead
        List<Lead> leadList = [SELECT id From Lead where id =:Id];
        Lead leadRec;
        ResponseWrapper wrapper = new ResponseWrapper();
        if(leadList!=null && leadList.size()>0){
            leadRec = new lead(id=Id,FirstName=firstname, LastName=lastname, Company=company, Email=email, Phone=phone);
            try
            {
                update leadRec;
                wrapper.leadRec=leadRec;
                wrapper.isSuccess = True;
                wrapper.status='Success';
                wrapper.leadId=leadList[0].id;
                wrapper.message= 'Lead Record Updated';
            }
            catch(system.Exception ex){
                wrapper.isSuccess = False;
                wrapper.status = 'Error';
            }
        }
        return wrapper;
    }
    global class ResponseWrapper{
        global lead leadRec;
        global string leadId;
        global string message;
        global boolean isSuccess;
        global string status;
        global string fullName;
    }
}