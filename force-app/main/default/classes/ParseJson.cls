public class ParseJson {

    public static void ParseJson(String jsonString){
        map<String,Object> jsonObjMap= (map<String,Object>)JSON.deserializeUntyped(jsonString);
        map<String,Object> jsonFieldsMap= (map<String,Object>)jsonObjMap.get('JSON');
        
        if(jsonObjMap.get('objectName')=='Account'){
            Schema.Account acc = new Schema.Account(Name=(String)jsonFieldsMap.get('Name'));
             
           insert acc;
           system.debug('JSON Account Inserted :'+acc);
        }
        
    }
}