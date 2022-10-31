public class Post_Copy_CustomSettings_Email {
    //TODO handle encodingType for SPARK AGN_SPARK_USER_Settings custom settings
    String emailUTFEncoding = 'UTF-8';
    public static void UpdateCustomSettingsEmails(){
        Map < String, Schema.SObjectType > gd = Schema.getGlobalDescribe();        
        for ( String objectName : gd.keySet() ) {            
            Schema.SObjectType result = gd.get( objectName );            
            if ( result.getDescribe().isCustomSetting() ) {                
                String query = 'SELECT ';
                List <String> listFields = new List <String>();
                Map <String, Schema.SObjectField> objectFields = result.getDescribe().fields.getMap();
                for (String s : objectFields.keySet()) {                    
                    if (String.valueOf( objectFields.get(s).getDescribe().getType()) == 'Email' || String.valueOf(objectFields.get(s).getDescribe().getType()) == 'String'){ 
                         //&& Integer.valueOf(objectFields.get(s).getDescribe().getLength()) > 100)) {                         
                        //System.debug( 'Iterating the email fields and retrieving');
                        query += s + ',';
                        listFields.add(s);                            
                    }
                }
                if (listFields.size() > 0 ) {
                    query = query.removeEnd( ',' );
                    query += ' FROM ' + objectName;
                    system.debug(query);
                    List<sObject> listRecords = Database.query( query );
                    //if (listRecords.size() > 0 ) {
                    for (sObject obj : listRecords ) {
                        for (String strField : listFields ) {
                            if (obj.get(strField) != null && PostCopyValidateUtil.validateEmail(String.valueOf(obj.get(strField)))){ //Regex to compare value if email or not
                                obj.put(strField, obj.get(strField) +'.invalid');                                
                            }
                        }
                        try{
                            //update listRecords;
                        }
                        Catch(DmlException exp){
                            System.debug('DML operation has failed');
                        } 
                        
                        
                        
                        //}
                    }
                }
                
                /*BatchJobProcess_CustomMetadata custMetadataJob = new BatchJobProcess_CustomMetadata();
                 Database.executeBatch(custMetadataJob,20);*/
            }
        }
    }
}