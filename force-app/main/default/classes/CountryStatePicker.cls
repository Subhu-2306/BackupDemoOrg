public with sharing class CountryStatePicker {

// Variables to store country and state selected by user
    public String city { get; set; }
    public String country {get; set;}   

    // Generates country dropdown from country settings
    public List<SelectOption> getCountriesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        

        // Find all the countries in the custom setting
        Map<String, Country__c> countries = Country__c.getAll();
        
        // Sort them by name
        List<String> countryNames = new List<String>();
        countryNames.addAll(countries.keySet());
        countryNames.sort();
        
        // Create the Select Options.
        for (String countryName : countryNames) {
            Country__c country = countries.get(countryName);
            options.add(new SelectOption(country.Country_Name__c, country.Name));
        }
        return options;
    }
    
    // To generate the states picklist based on the country selected by user.
    public List<SelectOption> getStatesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        // Find all the states we have in custom settings.
        Map<String, City__c> allstates = City__c.getAll();

        // Filter states that belong to the selected country
        Map<String, City__c> states = new Map<String, City__c>();
        for(City__c state : allstates.values()) {
            if (state.Country__c == this.country) {
                states.put(state.name, state);
            }
        }
        
        // Sort the states based on their names
        List<String> stateNames = new List<String>();
        stateNames.addAll(states.keySet());
        stateNames.sort();
        
        // Generate the Select Options based on the final sorted list
        for (String stateName : stateNames) {
            City__c state = states.get(stateName);
            options.add(new SelectOption(state.City_Name__c, state.name));
        }
        
        // If no states are found, just say not required in the dropdown.
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        return options;
    }
}