public with sharing class WeatherTriggerHandler {

    public static void handleBeforeInsert(List<Weather__c> newList){}

    public static void handleAfterInsert(List<Weather__c> newList) {
        Anomaly__c a = new Anomaly__c();
		AnomalyDetector ad = new AnomalyDetector();
        for(Weather__c weather:newList) {
            List<Anomaly__c> l = new List<Anomaly__c>();
            l = ad.detectAnomaly(weather);
            if(!l.isEmpty()) {
                insert l;
            }
	        }
        //Code here 
        //Use AnomalyDetector to detect an anomaly
        //Use SOQL to get City record information
        //insert Anomalies
        //update City
    }

    public static void handleBeforeUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleAfterUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleBeforeDelete(List<Weather__c> oldList){}

    public static void handleAfterDelete(List<Weather__c> oldList){}
}
