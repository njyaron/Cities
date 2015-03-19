package  {
	
	import flash.display.MovieClip;

	public class City extends MovieClip {
		
		private var cityHP: Number; 
		private var cityAttack: Number;
		private var owner: Number;
		
		public function City() {
			this.cityHP = Constants.initLargeCityHP;
			
			// constructor code
		}
		
		public function CreateSoldier(s:Soldier){
			stage.addChild(s);
			s.x = this.x;
			s.y = this.y;
			s.GoToDestination();
		}
	}
	
}
