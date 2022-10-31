public without sharing class UserController 
{
    public List<Country__c> UserTemp = new List<Country__c>();
    public List<City__c> city = new List<City__c>();
    public UserController()
    {
    
    }
    
    public List<SelectOption> UserList
    {
        get
        {
            UserTemp = [SELECT Id, Name, Country_Name__c FROM Country__c];
            
            UserList = new List<SelectOption>();
            
            for(Country__c temp : UserTemp)
            {
                UserList.add(new SelectOption(temp.Id, temp.Name));
            }
            return UserList;
        }
        set;
    }
    
     public List<SelectOption> CityList
    {
        get
        {
            city = [SELECT Name, City_Name__c, Country__c, Id FROM City__c];
            
            CityList = new List<SelectOption>();
            
            for(City__c c: city)
            {
                CityList.add(new SelectOption(c.Id, c.City_Name__c));
            }
            return CityList;
        }
        set;
    }
}