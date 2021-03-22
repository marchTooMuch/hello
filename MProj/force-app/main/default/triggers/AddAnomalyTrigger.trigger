trigger AddAnomalyTrigger on Weather__c (after insert) {
	WeatherTriggerHandler.handleAfterInsert(Trigger.new);
}