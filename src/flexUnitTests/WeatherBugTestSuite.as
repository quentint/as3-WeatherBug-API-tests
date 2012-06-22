package flexUnitTests {
	import flexUnitTests.net.tw.web.weatherBug.WeatherBugLoadForecastTest;
	import flexUnitTests.net.tw.web.weatherBug.WeatherBugLoadLiveWeatherTest;
	import flexUnitTests.net.tw.web.weatherBug.WeatherBugSearchLocationsTest;
	import flexUnitTests.net.tw.web.weatherBug.WeatherBugServiceTest;
	import flexUnitTests.net.tw.web.weatherBug.helpers.LocationHelperTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class WeatherBugTestSuite {
		public var serviceTest:WeatherBugServiceTest;
		public var searchLocationsTest:WeatherBugSearchLocationsTest;
		public var loadLiveWeatherTest:WeatherBugLoadLiveWeatherTest;
		public var loadForecastTest:WeatherBugLoadForecastTest;
		public var locationHelperTest:LocationHelperTest;
	}
}