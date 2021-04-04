public class AnimalsCallouts {
    public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            Map<String,Object> result = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>)  result.get('animals');
            System.debug('Received the following animals:');
            for(Object obj:animals) {
                System.debug(obj);
            }
        }
        return response;
    }
    public static HttpResponse makePostCollout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()!=201) {
            System.debug( 'The status code returned was not expected: ' +
                        response.getStatusCode() + ' ' + response.getStatus());
            
        } else {
            System.debug(response.getBody());
        }
        return response;        
    }
}