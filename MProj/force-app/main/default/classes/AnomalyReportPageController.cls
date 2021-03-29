public without sharing class AnomalyReportPageController {
    List<Anomaly__c> anomalies;
    Map<String,Integer> Toronto = new Map<String,Integer>();
    Map<String,Integer> Vancuver = new Map<String,Integer>();
    Map<String,Integer> Montreal = new Map<String,Integer>();
    String StartDate;
    String EndDate;
    Integer TorontoHumidity;
    Integer TorontoPressure;
    Integer TorontoTemperature;
    Integer VancuverHumidity;
    Integer VancuverPressure;
    Integer VancuverTemperature;
    Integer MontrealHumidity;
    Integer MontrealPressure;
    Integer MontrealTemperature;
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
		anomalies = [SELECT City_Name__c , Type__c FROM Anomaly__c ];
        AggregateResult data = [SELECT MIN(CreatedDate) min, MAX(CreatedDate) max from Anomaly__c];
        StartDate = String.valueOf(data.get('min'));
 
        for(Anomaly__c anomaly:anomalies) {
            switch on anomaly.City_Name__c {
                when 'Toronto' {
                    putAnom(Toronto,anomaly.Type__c);
                }
                
                when 'Montreal' {
                    putAnom(Montreal,anomaly.Type__c);
                }
                when 'Vancouver' {
                    putAnom(Vancuver,anomaly.Type__c);
                }
            }
         }
        TorontoHumidity = Toronto.get('Humidity Anomaly');
        TorontoPressure = Toronto.get('Pressure Anomaly');
        TorontoTemperature = Toronto.get('Temperature Anomaly');
        VancuverHumidity = Vancuver.get('Humidity Anomaly');
        VancuverPressure = Vancuver.get('Pressure Anomaly');
        VancuverTemperature = Vancuver.get('Temperature Anomaly');
        MontrealHumidity = Vancuver.get('Humidity Anomaly');
        MontrealPressure = Montreal.get('Pressure Anomaly');
        MontrealTemperature = Montreal.get('Temperature Anomaly');
        
        
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
    public Integer getVancuverHumidity() {
        return VancuverHumidity;
    }
    public Integer getVancuverPressure() {
        return VancuverPressure;
    }
    public Integer getVancuverTemperature() {
        return VancuverTemperature;
    }
    public Integer getMontrealHumidity() {
        return MontrealHumidity;
    }
    public Integer getMontrealPressure() {
        return MontrealPressure;
    }
    public Integer getMontrealTemperature() {
        return MontrealTemperature;
    }
    public String getStartDate() {
        return StartDate;
    }
}