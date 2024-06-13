public with sharing class ContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return [SELECT id, Name, Title, Email from Contact];
    }
}