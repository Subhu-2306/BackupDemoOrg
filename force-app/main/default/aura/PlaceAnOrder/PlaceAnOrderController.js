({
    // Method to be called on the component initialization
    doInit : function(component, event, helper) {
        helper.fetchConHelper(null, component);
    },
    
    // Method to perform search on Contacts
    searchContacts : function(component, event, helper) {
        var searchValue = component.find("searchField").get("v.value");
        //console.log(searchValue);
        helper.fetchConHelper(searchValue, component);
    },
    
    handleRowAction : function(component, event, helper){
        //console.log("inside handle row action");
        var cols = [
            { label: 'Order ID', fieldName: 'Name', type: 'button',
             typeAttributes: {
                 label: { fieldName: 'Name' },
                 name: 'Order_ID__c'
             },
            },
            { label: 'Order Date', fieldName: 'Order_Date__c', type: 'date'},
            { label: 'Status', fieldName: 'Status__c', type: 'text'},
            { label: 'Cancel Order', type: 'button',
             typeAttributes: {
                 iconName: 'utility:delete',
                 name: 'delete',
                 iconAlternativeText: 'Priority'
             },
            }
        ];
        component.set('v.myOrderColumns', cols);
        helper.handleRow(component, event, helper);
    },
    
    handleOrderAction : function(component, event, helper) {
        var reOrdercols = [
            { label: 'Order Date', fieldName: 'Order_Date__c', type: 'date'},
            { label: 'Status', fieldName: 'Status__c', type: 'text'},
            { label: 'Order Name', fieldName: 'Name', type: 'text'},
            { label: 'Paid in Advance', fieldName: 'Paid_in_Advance__c', type: 'Checkbox'}
        ];
        component.set("v.myreOrderColumns", reOrdercols);
        helper.orderAction(component, event, helper);
    },
    
    newOrderClick : function(component, event, helper) {  
        var modalFade1 = component.find('eventPopId');    
        component.find("eventPopId").submitDR(modalFade1);
    },
    
    reOrderClick : function(component, event, helper) {
        helper.reOrder(component, event, helper);
    }
})