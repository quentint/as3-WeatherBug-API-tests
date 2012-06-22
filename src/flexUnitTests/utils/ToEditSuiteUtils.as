package flexUnitTests.utils {
	import net.tw.web.weatherBug.WeatherBugService;
	import net.tw.web.weatherBug.signals.ForecastLoadFailed;
	import net.tw.web.weatherBug.signals.ForecastLoaded;
	import net.tw.web.weatherBug.signals.LiveWeatherLoadFailed;
	import net.tw.web.weatherBug.signals.LiveWeatherLoaded;
	import net.tw.web.weatherBug.signals.LocationsLoadFailed;
	import net.tw.web.weatherBug.signals.LocationsLoaded;
	import net.tw.web.weatherBug.vo.WeatherBugServiceSettings;

	public class ToEditSuiteUtils {
		
		public static const ASYNC_TIMEOUT:uint=2500;
		
		public static function createWeatherBugService():WeatherBugService {
			// Get you key here: http://weather.weatherbug.com/desktop-weather/api.html
			var service:WeatherBugService=new WeatherBugService(new WeatherBugServiceSettings('XXX'));
			
			service.locationsLoaded=new LocationsLoaded();
			service.locationsLoadFailed=new LocationsLoadFailed();
			
			service.liveWeatherLoaded=new LiveWeatherLoaded();
			service.liveWeatherLoadFailed=new LiveWeatherLoadFailed();
			
			service.forecastLoaded=new ForecastLoaded();
			service.forecastLoadFailed=new ForecastLoadFailed();
			
			return service;
		}
	}
}