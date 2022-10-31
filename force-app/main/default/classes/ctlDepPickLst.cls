public class ctlDepPickLst {
    public String country {get;set;}
    public String City {get;set;}

    public List<SelectOption> getCountries()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- Select ---'));        
        options.add(new SelectOption('US','United States'));
        options.add(new SelectOption('IN','India'));
        options.add(new SelectOption('FR','France'));
        options.add(new SelectOption('IT','Italy'));
        return options;
    } 
    
    public List<SelectOption> getCities()
    {
        List<SelectOption> options = new List<SelectOption>();
        if(country == 'US')
        {       
            options.add(new SelectOption('NY','Ney York'));
            options.add(new SelectOption('MI','Miami'));
            options.add(new SelectOption('WDC','Washington DC'));
        }
        else if(country == 'IN')
        {       
            options.add(new SelectOption('ND','New Delhi'));
            options.add(new SelectOption('MU','Mumbai'));
            options.add(new SelectOption('PU','Pune'));
            options.add(new SelectOption('KL','Kolkata'));
        }
        else if(country == 'FR')
        {       
            options.add(new SelectOption('PA','Paris'));
            options.add(new SelectOption('LY','Lyon'));
        }
        else if(country == 'IT')
        {       
            options.add(new SelectOption('MN','Milan'));
            options.add(new SelectOption('RO','Rome'));
        }
        else
        {
            options.add(new SelectOption('None','--- Select ---'));
        }      
        return options;
    }       
}