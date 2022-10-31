public class ContactUserCtrl {
Contact newCon;

public ContactUserCtrl(ApexPages.StandardController con) {
this.newCon = (Contact)con.getRecord();
}
public pagereference save(){
try{
if(String.isNotBlank(newCon.FirstName) && String.isNotBlank(newCon.LastName)
&& String.isNotBlank(newCon.Email) && String.isNotBlank(newCon.User_code__c )
&& String.isNotBlank(newCon.MailingCity) && String.isNotBlank(newCon.MailingCountry)
&& String.isNotBlank(newCon.MailingState) && String.isNotBlank(newCon.MailingStreet)
&& String.isNotBlank(newCon.MailingPostalCode)){

if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}', newCon.Email)){

User contUserRec = New User(username= newCon.FirstName + '.' + newCon.LastName+'@test12.com'
,Email = newCon.Email,FirstName = newCon.FirstName
,LastName = newCon.LastName
,ProfileId = [Select Name,Id from profile where Name='System Administrator'].Id
,User_Code__c =newCon.User_Code__c
,City=newCon.MailingCity
,Street=newCon.MailingStreet
,PostalCode=newCon.MailingPostalCode
,Country=newCon.MailingCountry
,State=newCon.MailingState
,EmailEncodingKey='UTF-8'
,LocaleSidKey='en_US'
,TimeZoneSidKey='America/Los_Angeles'
,LanguageLocaleKey='en_US'
,Alias= newCon.FirstName.substring(0,2)+ newCon.LastName.substring(2,3)+ 'test'
);
Insert contUserRec;

newCon.OwnerId = contUserRec.id;
upsert newCon;

Pagereference pr = New PageReference('/' + newCon.id);
return pr;

}else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter correct email format!!'));
return null;
}
}else{
String errorMessage = (newCon.FirstName==null)?'First Name':'';
errorMessage+= (String.isBlank(newCon.Email))?String.isBlank(errorMessage)?'Email Address':', Email Address':'';

errorMessage+= (newCon.MailingStreet==null)?String.isBlank(errorMessage)?'Mailing Street':', Mailing Street':'';
errorMessage+= (newCon.MailingCity==null)?String.isBlank(errorMessage)?'Mailing City':', Mailing City':'';
errorMessage+= (newCon.MailingState==null)?String.isBlank(errorMessage)?'Mailing State':', Mailing State':'';
errorMessage+= (newCon.MailingPostalCode==null)?String.isBlank(errorMessage)?'Mailing Postal Code':', Mailing Postal Code':'';
errorMessage+= (newCon.MailingCountry==null)?String.isBlank(errorMessage)?'Mailing Country':', Mailing Country':'';

errorMessage+= (newCon.User_Code__c ==null)?String.isBlank(errorMessage)?'User Code':', User Code':'';
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter value for '

+errorMessage+' field!!!'));
return null;
}
}catch(Exception ex){
if(ex.getMessage().split(';')[1].contains('LICENSE_LIMIT_EXCEEDED')){
Id firstSysAdmProfilId = [Select Name,Id from profile where Name='System Administrator' LIMIT 1].Id;
Id firstSysAdmUserId = [Select Id,Name From User Where ProfileId =:firstSysAdmProfilId AND IsActive=true LIMIT 1].Id;
if(firstSysAdmUserId!=null){
newCon.OwnerId = firstSysAdmUserId;
upsert newCon;

Pagereference pr = New PageReference('/' + newCon.id);
return pr;
}else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Please add at least single user with System Admin Profile and in active status then try again!!!'));
return null;
}

}else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage().split(';')[1]+' Please try to Contact System Admin!!'));
return null;
}

}
}

}