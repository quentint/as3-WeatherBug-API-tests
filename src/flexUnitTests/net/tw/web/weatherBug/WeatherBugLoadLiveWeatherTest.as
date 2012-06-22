package flexUnitTests.net.tw.web.weatherBug
{
	import flexUnitTests.utils.SuiteUtils;
	
	import flexunit.framework.Assert;
	
	import net.tw.web.weatherBug.WeatherBugService;
	import net.tw.web.weatherBug.loaders.LiveWeatherLoader;
	import net.tw.web.weatherBug.signals.LiveWeatherLoaded;
	import net.tw.web.weatherBug.signals.LocationsLoaded;
	import net.tw.web.weatherBug.vo.LatLng;
	import net.tw.web.weatherBug.vo.LiveWeather;
	import net.tw.web.weatherBug.vo.LocationType;
	import net.tw.web.weatherBug.vo.UnitType;
	import net.tw.web.weatherBug.vo.WeatherBugServiceSettings;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.core.isA;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.number.greaterThanOrEqualTo;
	import org.hamcrest.number.isNumber;
	import org.hamcrest.object.equalTo;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;
	import org.osflash.signals.utils.proceedOnSignal;
	
	public class WeatherBugLoadLiveWeatherTest {
		
		protected var service:WeatherBugService;
		
		[Before]
		public function setUp():void {
			service=SuiteUtils.createWeatherBugService();
		}
		
		[After]
		public function tearDown():void {
			service=null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void {}
		
		[AfterClass]
		public static function tearDownAfterClass():void {}
		
		[Test(async)]
		public function testLoadLiveWeatherForZipCode():void {
			var lwl:LiveWeatherLoader=service.loadLiveWeatherForZipCode('64732');
			proceedOnSignal(this, lwl.loaded, SuiteUtils.ASYNC_TIMEOUT);
		}
		
		[Test(async)]
		public function testLoadLiveWeatherForZipCode_values_are_correct():void {
			var lwl:LiveWeatherLoader=service.loadLiveWeatherForZipCode('64732');
			handleSignal(this, lwl.loaded, check_testLoadLiveWeather_values_are_correct, SuiteUtils.ASYNC_TIMEOUT);
		}
		protected function check_testLoadLiveWeather_values_are_correct(e:SignalAsyncEvent, data:Object):void {
			var liveWeather:LiveWeather=e.args[0];
			
			assertThat(liveWeather.unitType, isNumber());
			
			assertThat(liveWeather.condition.length, greaterThan(0));
			
			assertThat(liveWeather.icon.length, greaterThan(0));
			assertThat(liveWeather.icon.indexOf('/'), equalTo(-1));
			assertThat(liveWeather.conditionCode, greaterThan(0));
			
			assertTrue(liveWeather.date<new Date());
			
			assertThat(liveWeather.humidity, greaterThan(0));
			assertThat(liveWeather.humidityHigh, greaterThan(0));
			assertThat(liveWeather.humidityLow, greaterThan(0));
			assertThat(liveWeather.humidityRate, isNumber());
			
			assertThat(liveWeather.moonPhase, isNumber());
			
			assertThat(liveWeather.pressure, greaterThanOrEqualTo(0));
			assertThat(liveWeather.pressureHigh, greaterThanOrEqualTo(0));
			assertThat(liveWeather.pressureLow, greaterThanOrEqualTo(0));
			assertThat(liveWeather.pressureRate, isNumber());
			
			assertThat(liveWeather.temperature, isNumber());
			assertThat(liveWeather.temperatureHigh, isNumber());
			assertThat(liveWeather.temperatureLow, isNumber());
			assertThat(liveWeather.temperatureRate, isNumber());
			
			assertThat(liveWeather.sourceLocationType, isA(String));
			if (liveWeather.sourceLocationType==LocationType.GEOLOCATION) {
				assertThat(liveWeather.sourceLocation, isA(LatLng));
			} else {
				assertThat(liveWeather.sourceLocation, isA(String));
			}
		}
		
		/*[Test(async)]
		public function testLoadLiveWeatherForZipCode_units_are_correct():void {
			service.settings.unitType=UnitType.METRIC_SYSTEM;
			var lwl:LiveWeatherLoader=service.loadLiveWeatherForZipCode('64732');
			handleSignal(this, lwl.loaded, check_testLoadLiveWeatherForZipCode_units_are_correct, SuiteUtils.ASYNC_TIMEOUT);
		}
		protected function check_testLoadLiveWeatherForZipCode_units_are_correct(e:SignalAsyncEvent, data:Object):void {
			var liveWeather:LiveWeather=e.args[0];
			assertThat(liveWeather.unitType, equalTo(UnitType.METRIC_SYSTEM));
		}*/
		
		
		[Test(async)]
		public function testLoadLiveWeatherForCityCode():void {
			// Bordeaux, France
			var lwl:LiveWeatherLoader=service.loadLiveWeatherForCityCode('62285');
			proceedOnSignal(this, lwl.loaded, SuiteUtils.ASYNC_TIMEOUT);
		}
		
		[Test(async)]
		public function testLoadLiveWeatherForGeolocation():void {
			// Bordeaux, France
			var lwl:LiveWeatherLoader=service.loadLiveWeatherForGeolocation(new LatLng(44.8536097, -0.5678739));
			proceedOnSignal(this, lwl.loaded, SuiteUtils.ASYNC_TIMEOUT);
		}
		
		[Test(async)]
		public function testLoadLiveWeatherForGeolocation_values():void {
			// Bordeaux, France
			handleSignal(this, service.liveWeatherLoaded, check_testLoadLiveWeather_values_are_correct, SuiteUtils.ASYNC_TIMEOUT);
			service.loadLiveWeatherForGeolocation(new LatLng(44.8536097, -0.5678739));
		}
	}
}