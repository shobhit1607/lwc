public class FieldSetController {
    @AuraEnabled
    public static FieldSetForm getForm(Id recordId, String objectName, String fieldSetName) {
        FieldSetForm form = new FieldSetForm();        
        form.Fields = getFields(recordId, objectName, fieldSetName);
        
        return form;
    }
    
    private static List<String> getFields(Id recordId, String objectName, String fieldSetName) {
        Schema.SObjectType objectType = null;
        
        if (recordId != null) {
            objectType = recordId.getSobjectType();
        }
        else if (String.isNotBlank(objectName)) {
            objectType = Schema.getGlobalDescribe().get(objectName);
        }
        
        Schema.DescribeSObjectResult objectDescribe = objectType.getDescribe();
        Map<String, Schema.FieldSet> fieldSetMap = objectDescribe.fieldSets.getMap();
        Schema.FieldSet fieldSet = fieldSetMap.get(fieldSetName);
        List<Schema.FieldSetMember> fieldSetMembers = fieldSet.getFields();
        
        List<String> fields = new List<String>();
        for (Schema.FieldSetMember fsm : fieldSetMembers) {

            fields.add(fsm.getFieldPath());
        }
        
        return fields;
    }
    
    public class FieldSetForm {
        @AuraEnabled
        public List<String> fields { get; set; }
        
        public FieldSetForm() {
            fields = new List<String>();
        }
    }
}