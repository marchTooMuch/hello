public class SheduleJob implements Schedulable {
    public static String CRON_EXP = '0 0 8 * * ? *';
    public static void execute(SchedulableContext ctx) {
        OpenWeatherCalloutService owcs = new OpenWeatherCalloutService();
        owcs.getWeatherFromOpenWeather();
    }
    public static void job() {
        System.schedule('Open weather callout service',CRON_EXP, new SheduleJob());
    }
}