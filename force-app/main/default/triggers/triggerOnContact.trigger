trigger triggerOnContact on Contact (after insert, after update, before insert, before update) {
    if(Trigger.isAfter && Trigger.isInsert || Trigger.isUpdate){
        CopyAdd.autoCopyAdd(Trigger.New);
    }
}