package flexUnitTests.net.tw.web.weatherBug.helpers {
	import flexunit.framework.Assert;
	
	import net.tw.web.weatherBug.helpers.LocationHelper;
	import net.tw.web.weatherBug.vo.LatLng;
	import net.tw.web.weatherBug.vo.Location;
	import net.tw.web.weatherBug.vo.LocationType;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	
	public class LocationHelperTest {		
		[Before]
		public function setUp():void {}
		
		[After]
		public function tearDown():void {}
		
		[BeforeClass]
		public static function setUpBeforeClass():void {}
		
		[AfterClass]
		public static function tearDownAfterClass():void {}
		
		[Test]
		public function testLocationMatchesSource_LatLng_true():void {
			assertThat(LocationHelper.locationMatchesSource(new LatLng(11, 22), LocationType.GEOLOCATION, new LatLng(11, 22)), isTrue());
		}
		[Test]
		public function testLocationMatchesSource_LatLng_wrong_values():void {
			assertThat(LocationHelper.locationMatchesSource(new LatLng(11, 22), LocationType.GEOLOCATION, new LatLng(11, 11)), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_LatLng_wrong_type_1():void {
			assertThat(LocationHelper.locationMatchesSource(new LatLng(11, 22), LocationType.GEOLOCATION, 'string'), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_LatLng_wrong_type_2():void {
			assertThat(LocationHelper.locationMatchesSource('string', LocationType.GEOLOCATION, new LatLng(11, 22)), isFalse());
		}
		
		[Test]
		public function testLocationMatchesSource_Location_zipCode_true():void {
			var l1:Location=new Location();
			l1.zipCode='zipCode';
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.ZIP_CODE, 'zipCode'), isTrue());
		}
		[Test]
		public function testLocationMatchesSource_Location_zipCode_wrong_value():void {
			var l1:Location=new Location();
			l1.zipCode='zipCode1';
			var l2:Location=new Location();
			l2.zipCode='zipCode2';
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.ZIP_CODE, l2), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_Location_zipCode_wrong_type_1():void {
			var l1:Location=new Location();
			l1.zipCode='zipCode';
			var l2:Location=new Location();
			l2.zipCode=l1.zipCode;
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.ZIP_CODE, l2), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_Location_zipCode_wrong_type_2():void {
			var l1:Location=new Location();
			l1.zipCode='zipCode1';
			var l2:LatLng=new LatLng(1, 1);
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.ZIP_CODE, l2), isFalse());
		}
		
		[Test]
		public function testLocationMatchesSource_Location_cityCode_true():void {
			var l1:Location=new Location();
			l1.cityCode='cityCode';
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.CITY_CODE, 'cityCode'), isTrue());
		}
		[Test]
		public function testLocationMatchesSource_Location_cityCode_wrong_value():void {
			var l1:Location=new Location();
			l1.cityCode='cityCode1';
			var l2:Location=new Location();
			l2.cityCode='cityCode2';
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.CITY_CODE, l2), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_Location_cityCode_wrong_type_1():void {
			var l1:Location=new Location();
			l1.cityCode='cityCode';
			var l2:Location=new Location();
			l2.cityCode=l1.cityCode;
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.CITY_CODE, l2), isFalse());
		}
		[Test]
		public function testLocationMatchesSource_Location_cityCode_wrong_type_2():void {
			var l1:Location=new Location();
			l1.cityCode='cityCode';
			var l2:LatLng=new LatLng(1, 1);
			assertThat(LocationHelper.locationMatchesSource(l1, LocationType.CITY_CODE, l2), isFalse());
		}
	}
}