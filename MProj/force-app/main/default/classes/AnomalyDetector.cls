public with sharing class AnomalyDetector {
    Privet Bobdan
    public Anomaly_Range_Configuration__c anomalyRandeSetting;
    public AnomalyDetector() {
        this.anomalyRandeSetting = Anomaly_Range_Configuration__c.getOrgDefaults();
    }

    public  List<Anomaly__c> detectAnomaly(List<Weather__c> weathers) {
        Set<ID> weathersId = new Set<ID>();
        for(Weather__c weather:weathers) {
            weathersId.add(weather.Id);
        }
        List<Anomaly__c> anomaliesToSave = new List<Anomaly__c>();
       List <Weather__c> weathers2 = [SELECT Humidity__c, City__c, City__r.Name, Pressure__c, Temperature__c, ID FROM Weather__c 
                               WHERE ID IN:  weathersId ];
        for(Weather__c weather: weathers2) {
            if(weather.Humidity__c>=anomalyRandeSetting.Max_Humidity__c||weather.Humidity__c<=anomalyRandeSetting.Min_Humidity__c) {
            	Anomaly__c anomaly = new Anomaly__c(City__c=weather.City__c,City_Name__c = weather.City__r.Name,
                                                    Reported__c = false, Weather__c = weather.Id, Type__c = 'Humidity Anomaly');
                anomaliesToSave.add(anomaly);
            }
             if(weather.Pressure__c>=anomalyRandeSetting.Max_Pressure__c||weather.Pressure__c<=anomalyRandeSetting.Min_Pressure__c) {
            	Anomaly__c anomaly = new Anomaly__c(City__c=weather.City__c,City_Name__c = weather.City__r.Name,
                                                    Reported__c = false, Weather__c = weather.Id, Type__c = 'Pressure Anomaly');
                anomaliesToSave.add(anomaly);
            }
            if(weather.Temperature__c>=anomalyRandeSetting.Max_Temperature__c||weather.Temperature__c<=anomalyRandeSetting.MIn_Temperature__c) {
            	Anomaly__c anomaly = new Anomaly__c(City__c=weather.City__c,City_Name__c = weather.City__r.Name,
                                                    Reported__c = false, Weather__c = weather.Id, Type__c = 'Temperature Anomaly');
                anomaliesToSave.add(anomaly);
            }
            
        }
        return anomaliesToSave;
     }
}