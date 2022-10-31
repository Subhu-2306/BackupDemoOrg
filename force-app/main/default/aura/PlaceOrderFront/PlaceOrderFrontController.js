({
    reset: function(cmp, event, helper) {
        cmp.find('field').forEach(function(f) {
            f.reset();
        });
    },
    handleChange : function(component, event, helper) {
        var lookupId = event.getParam("value")[0];
    },
    
    handleSuccess : function(component, event, helper) {
        var record = event.getParam("response");
        console.log("handle success record " + record);
        var apiName = record.apiName; // returns "Case"
        console.log("api name " + apiName);
        var caseId = record.id; // returns the Id of the new record
        console.log("case id " + caseId);
        //Show the success toast message
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title":"Success",
            "type":"success",
            "message":"Order Placed successfully.",                        
        });
        toastEvent.fire();
    },
    closewin : function(component, event, helper){
        window.close();
    },
    
    openEventPopup : function(component, event, helper) {
		var modalFade = component.find('modalFade');
        var modalBackdrop = component.find('modalBackdrop');
        
        $A.util.addClass(modalFade,'slds-fade-in-open');
        $A.util.addClass(modalBackdrop,'slds-backdrop_open');
	},
    
    closeEventPopup : function(component, event, helper) {
		var modalFade = component.find('modalFade');
        var modalBackdrop = component.find('modalBackdrop');
        
        $A.util.removeClass(modalFade,'slds-fade-in-open');
        $A.util.removeClass(modalBackdrop,'slds-backdrop_open');
	}
})