public with sharing class AnomalyDetector {

    public Anomaly_Range_Configuration__c anomalyRandeSetting;
    public AnomalyDetector() {
        this.anomalyRandeSetting = Anomaly_Range_Configuration__c.getOrgDefaults();
    }

    public List<Anomaly__c> detectAnomaly(Weather__c weather){
        List<Anomaly__c> anomaliesToSave = new List<Anomaly__c>();
        Anomaly__c anom;
        Anomaly__c anom2;
        Anomaly__c anom3;
        
        if(weather.Humidity__c>=anomalyRandeSetting.Max_Humidity__c
           ||weather.Humidity__c<=anomalyRandeSetting.Min_Humidity__c) {
               if(weather.City__c == 'a04090000030xTYAAY') {
                anom = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Toronto', Reported__c = false, Type__c = 'Humidity Anomaly',Weather__c = weather.Id);
               } 
               else if(weather.City__c == 'a04090000030xTZAAY') {
                anom = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Vancouver', Reported__c = false, Type__c = 'Humidity Anomaly',Weather__c = weather.Id);
               } else if(weather.City__c == 'a04090000030xTaAAI') {
                anom = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Montreal', Reported__c = false, Type__c = 'Humidity Anomaly',Weather__c = weather.Id);
               }
               anomaliesToSave.add(anom);
           }
        if(weather.Pressure__c>=anomalyRandeSetting.Max_Pressure__c
           ||weather.Pressure__c<=anomalyRandeSetting.Min_Pressure__c) {
               if(weather.City__c == 'a04090000030xTYAAY') {
                anom2 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Toronto', Reported__c = false, Type__c = 'Pressure Anomaly',Weather__c = weather.Id);
               } 
               else if(weather.City__c == 'a04090000030xTZAAY') {
                anom2 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Vancouver', Reported__c = false, Type__c = 'Pressure Anomaly',Weather__c = weather.Id);
               } else if(weather.City__c == 'a04090000030xTaAAI') {
                anom2 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Montreal', Reported__c = false, Type__c = 'Pressure Anomaly',Weather__c = weather.Id);
               }
               	anomaliesToSave.add(anom2);
        }
        if(weather.Max_Temp__c>=anomalyRandeSetting.Max_Temperature__c
           ||weather.Min_Temp__c<=anomalyRandeSetting.Min_Temperature__c) {
               if(weather.City__c == 'a04090000030xTYAAY') {
                anom3 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Toronto', Reported__c = false, Type__c = 'Temperature Anomaly',Weather__c = weather.Id);
               } 
               else if(weather.City__c == 'a04090000030xTZAAY') {
                anom3 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Vancouver', Reported__c = false, Type__c = 'Temperature Anomaly',Weather__c = weather.Id);
               } else if(weather.City__c == 'a04090000030xTaAAI') {
                anom3 = new Anomaly__c(City__c = weather.City__c, City_Name__c = 'Montreal', Reported__c = false, Type__c = 'Temperature Anomaly',Weather__c = weather.Id);
               }
               	anomaliesToSave.add(anom3);
        }
        
        //Code here 
        //Compare weather fields with custom setting fields to define if some anomaly exist and add to the List.
        return anomaliesToSave;
    }
}