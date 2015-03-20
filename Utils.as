package  {
	
	import flash.display.*;
	
	public class Utils {
		
		public static const initLargeCityHP:Number = 100;
		public static const initSmallCityHP:Number = 50;
		public static const initLargeCityAttack:Number = 10;
		public static const initSmallCityAttack:Number = 5;
		public static const initLargeCityRegen:Number = 1;
		public static const initSmallCityRegen:Number = 1;
		public static const cityCount: Number = 9;
		public static const superCityId: Number = cityCount;
		public static const cityArray: Array = new Array(); //TOADD id to city mapping
		public static const pathArray: Array = new Array();
		public static const directions:direction_utils;
		public static const moneyTimer = 1000;	
		
		public static function hitTest(a:DisplayObject,b:DisplayObject)
		{
			return a.hitTestObject(b);
		}
		public static function cmp(a:Number, b:Number)
		{
				if (a>b)
					return 1;
				if (b>a) 
					return -1;
				return 0;
		}
		public static function getCapitalOfOwner(OwnerID:Number)
		{
			return OwnerID*2;
		}

	}
	

}
