({
	PlaceOrder : function(component, event, helper) {
		var Street= component.find("Street").get("v.value");
        var City= component.find("City").get("v.value");
        var State= component.find("State").get("v.value");
        var Country= component.find("Country").get("v.value");
        var PinCode= component.find("PINCode").get("v.value");
       
        var action = component.get("c.placeOrder");
        action.setParams({
            Street:Street,
            City:City,
            State:State,
            Country:Country,
            PINCode:PinCode
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            alert("from server"+ a.getReturnValue());
        });
        $A.enqueueAction(action);
        }
})