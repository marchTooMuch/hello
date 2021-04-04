public class ScheduleJob implements Schedulable{
    public void execute(SchedulableContext scx) {
        new OpenWeatherCalloutService().getWeatherFromOpenWeather();
    }
}