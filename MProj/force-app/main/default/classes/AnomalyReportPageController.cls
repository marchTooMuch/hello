public without sharing class AnomalyReportPageController {
    List<Anomaly__c> anomalies;
    Map<String,Integer> Toronto = new Map<String,Integer>();
    Map<String,Integer> Vancuver = new Map<String,Integer>();
    Map<String,Integer> Montreal = new Map<String,Integer>();
    Integer a = 4;
    Integer TorontoHumidity;
    Integer TorontoPressure;
    Integer TorontoTemperature;
    
    AnomalyReportPageController arpc {get;set;}
    public AnomalyReportPageController() {
        Toronto.put('Temperature Anomaly', 0);
        Toronto.put('Humidity Anomaly', 0);
        Toronto.put('Pressure Anomaly', 0);
        Vancuver.put('Temperature Anomaly', 0);
        Vancuver.put('Humidity Anomaly', 0);
        Vancuver.put('Pressure Anomaly', 0);
        Montreal.put('Temperature Anomaly', 0);
        Montreal.put('Humidity Anomaly', 0);
        Montreal.put('Pressure Anomaly', 0);
        
		anomalies = [SELECT City_Name__c , Type__c FROM Anomaly__c 
                    WHERE Reported__c = false];
        for(Anomaly__c anomaly:anomalies) {
            switch on anomaly.City_Name__c {
                when 'Toronto' {
                    putAnom(Toronto,anomaly.Type__c);
                }
                
                when 'Montreal' {
                    putAnom(Montreal,anomaly.Type__c);
                }
                when 'Vancuver' {
                    putAnom(Vancuver,anomaly.Type__c);
                }
            }
         }
        TorontoHumidity = Toronto.get('Humidity Anomaly');
        TorontoPressure = Toronto.get('Pressure Anomaly');
        TorontoTemperature = Toronto.get('Temperature Anomaly');
    }
    public void putAnom(Map<String,Integer> m,String s) {
        Integer a = 0;
        switch on s {
            when 'Temperature Anomaly' {
                a = m.get('Temperature Anomaly');
                m.put('Temperature Anomaly',++a);
            }
            when 'Humidity Anomaly' {
                a = m.get('Humidity Anomaly');
                m.put('Humidity Anomaly',++a);
            }
            when 'Pressure Anomaly' {
                a = m.get('Pressure Anomaly');
                m.put('Pressure Anomaly',++a);
            }
        }
    }
    public Integer getTorontoHumidity() {
        return TorontoHumidity;
    }
    public Integer getTorontoPressure() {
        return TorontoPressure;
    }
    public Integer getTorontoTemperature() {
        return TorontoTemperature;
    }
}