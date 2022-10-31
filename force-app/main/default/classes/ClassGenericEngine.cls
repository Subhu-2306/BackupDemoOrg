global class ClassGenericEngine implements Database.Batchable<sObject> {
    global ClassGenericEngine(){
        
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([Select name,JSON__C FROM Event__c WHERE Record_Created__c = False]);
    }
    global void execute(Database.BatchableContext BC,List<Event__c> genericEngine){
        Map<String,String> mapList = new Map<String,String>();
        List<sObject> sObjList = new List<sObject>();
        List<SObject> insertedList = new List<SObject>();
        for(Event__c ge : genericEngine){
            //fetching all the records and data Event__c ,field Object_Name__c and JSON__C
            ge.Record_Created__c = true;
            insertedList.add(ge);
            
            //generic values to store
            mapList = (Map<String,String>)JSON.deserialize(ge.JSON__c, Map<String,String>.class);
            system.debug('maplist--->' + maplist);
            //iterate and storing the values of sObject name of every record
            String sObjectName = ge.name;
            system.debug('sObjectName-->' + sObjectName);
            //to get the Object name
            //search all the object and get the object name, and create a object instance
            sObject s = Schema.getGlobalDescribe().get(ge.name).newSObject();
            for(String str : mapList.keySet()){
                //saving the field name
                String strFieldName = str;
                //svaing the value from map
                String value = mapList.get(str);
                //putting the key(field) & values in object
                s.put(strFieldName,value);
                System.debug('Complete Object-->' + s);
            }
            sObjList.add(s);
        }
        System.debug('List to insert-->' + sObjList);
        if(sObjList.size()>0){
            insert sObjList;
            update insertedList;
            
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}