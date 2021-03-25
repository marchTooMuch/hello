@isTest
public class AnomalyDetectorTest {
    @isTest static void	testPressureAnomaly() {
        Anomaly_Range_Configuration__c arc = new Anomaly_Range_Configuration__c(Max_Pressure__c = 1007, Min_Pressure__c=1002);
        List<Weather__c> weathers = new List<Weather__c>();
        AnomalyDetector ad = new AnomalyDetector(arc);
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Pressure__c = 2000));
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Pressure__c = 1));
        insert weathers;
        List<Weather__c> weathers2 = [SELECT Pressure__c, ID FROM Weather__c WHERE City__c = 'a04090000032B93AAE'];
        List<Anomaly__c> anomalies = ad.detectAnomaly(weathers2);
        System.assertEquals('Pressure Anomaly', anomalies[1].Type__c);
        System.assertEquals('Pressure Anomaly', anomalies[0].Type__c);
        delete weathers2;
    }
     @isTest static void	testHumidityAnomaly() {
        Anomaly_Range_Configuration__c arc = new Anomaly_Range_Configuration__c(Max_Humidity__c = 105, Min_Humidity__c=102);
        List<Weather__c> weathers = new List<Weather__c>();
        AnomalyDetector ad = new AnomalyDetector(arc);
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Humidity__c = 200));
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Humidity__c = 1));
        insert weathers;
        List<Weather__c> weathers2 = [SELECT Pressure__c, ID FROM Weather__c WHERE City__c = 'a04090000032B93AAE'];
        List<Anomaly__c> anomalies = ad.detectAnomaly(weathers2);
        System.assertEquals('Humidity Anomaly', anomalies[1].Type__c);
        System.assertEquals('Humidity Anomaly', anomalies[0].Type__c);
        delete weathers2;
    }
    @isTest static void	testTemperatureAnomaly() {
        Anomaly_Range_Configuration__c arc = new Anomaly_Range_Configuration__c(Max_Temperature__c = 288, MIn_Temperature__c=282);
        List<Weather__c> weathers = new List<Weather__c>();
        AnomalyDetector ad = new AnomalyDetector(arc);
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Temperature__c = 200));
        weathers.add(new Weather__c( City__c = 'a04090000032B93AAE', Temperature__c = 1));
        insert weathers;
        List<Weather__c> weathers2 = [SELECT Pressure__c, ID FROM Weather__c WHERE City__c = 'a04090000032B93AAE'];
        List<Anomaly__c> anomalies = ad.detectAnomaly(weathers2);
        System.assertEquals('Temperature Anomaly', anomalies[1].Type__c);
        System.assertEquals('Temperature Anomaly', anomalies[0].Type__c);
        delete weathers2;
    }
    
}