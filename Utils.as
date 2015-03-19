package  {
	
	public class Utils {
		
		public static const initLargeCityHP:Number = 100;
		public static const initSmallCityHP:Number = 50;
		public static const initLargeCityAttack:Number = 10;
		public static const initSmallCityAttack:Number = 5;
		public static const initLargeCityRegen:Number = 1;
		public static const initSmallCityRegen:Number = 1;
		
		
		public function hitTest(a:DisplayObject,b:DisplayObject)
		{
			return a.hitTest(b);
		}

	}
	
	
}
