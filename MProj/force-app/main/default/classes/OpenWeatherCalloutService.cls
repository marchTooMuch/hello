public class OpenWeatherCalloutService {
    List<City__c> cities = [SELECT ID,City_Code__c from City__c];
    private String EndPoint =  'https://api.openweathermap.org/data/2.5/weather';
    private String key = '6ef111d958cbcb3a7cfcbfad41b64b03';
    Map<String,City__c> cityCodeToMap = new Map<String,City__c>();
    public OpenWeatherCalloutService() {
        for(City__c city:cities) {
			cityCodeToMap.put(city.City_Code__c,city);            
        }        
    }
    public void getWeatherFromOpenWeather() {
        List<Weather__c> weathers = new List<Weather__c>();
        for(City__c city: cityCodeToMap.values()) {
            Weather__c w = makeCallout(city.City_Code__c);
            if(w!=null) {
				weathers.add(w);                
            }
        }
        insert weathers;
    }
    public Weather__c makeCallout(String cityCode) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(EndPoint+'?id='+cityCode+'&appid='+key);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200) {
            String responseBody = response.getBody();
            return deserialize(responseBody,cityCode);
        } else {
            return null;
        }
    }
    public Weather__c deserialize(String responseBody, String cityCode) {
        Wind wind;
        Clouds clouds;
        OpenWeatherResponse response = (OpenWeatherResponse)JSON.deserialize(responseBody, OpenWeatherResponse.class);
        if(response.clouds != null && response.wind != null) {
             return new Weather__c(
            City__c = cityCodeToMap.get(cityCode).ID,
            Visibility__c = response.visibility,
            Temperature__c = response.main.temp,
            Temp_Feels_Like__c = response.main.feels_like,
            Max_Temp__c = response.main.temp_max,
            Min_Temp__c = response.main.temp_min,
            Pressure__c = response.main.pressure,
            Humidity__c = response.main.humidity,
            Cloudiness__c = response.clouds.all,
            Wind_speed__c = response.Wind.speed
        );
        } else {
            return new Weather__c(
            City__c = cityCodeToMap.get(cityCode).ID,
            Visibility__c = response.visibility,
            Temperature__c = response.main.temp,
            Temp_Feels_Like__c = response.main.feels_like,
            Max_Temp__c = response.main.temp_max,
            Min_Temp__c = response.main.temp_min,
            Pressure__c = response.main.pressure,
            Humidity__c = response.main.humidity
        );
        }
        
    }   
    public class OpenWeatherResponse {
    	public Main main;
        public Integer visibility;
        public Clouds clouds;
        public Wind wind;
	}
    public class Main {
        public Decimal temp;
        public Decimal feels_like;
        public Decimal temp_min;
        public Decimal temp_max;
        public Decimal pressure;
        public Decimal humidity;
    }
    public class Clouds {
        public Integer all;
    }
    public class Wind {
        public Decimal speed;
    }
}