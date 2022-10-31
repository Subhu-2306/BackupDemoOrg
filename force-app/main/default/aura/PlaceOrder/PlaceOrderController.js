({
    handleClick: function (component, event, helper) {
      /*  helper.simulateServerRequest(
            $A.getCallback(function handleServerResponse(serverResponse) {
                cmp.set('v.options', serverResponse.colors);
                cmp.set('v.selectedValue', serverResponse.selectedColorId);
            })
        );*/
        
        var CustomerName= component.find("cname").get("v.value");
        var Street= component.find("ostreet").get("v.value");
        var City= component.find("ocity").get("v.value");
        var State= component.find("ostate").get("v.value");
        var Country= component.find("ocountry").get("v.value");
        var PinCode= component.find("opincode").get("v.value");
        var FoodItem= component.find("fi").get("v.value");
        var Quantity= component.find("quant").get("v.value");
       
                //alert(CustomerName+Street+City+State+Country+PinCode+FoodItem+Quantity);
        
        var action = component.get("c.placeOrder");
        action.setParams({
            cname: CustomerName,
            ostreet:Street,
            ocity:City,
            ostate:State,
            ocountry:Country,
            opincode:PinCode,
            quant:Quantity,
            fi:FoodItem
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            alert("from server"+ a.getReturnValue());
        });
        $A.enqueueAction(action);
        },
    
    clear: function(component, event, helper) {
        component.find('fi').forEach(function(f) {
            f.reset();
        });
    }
    
});