package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;


	public class BuySoldier extends SimpleButton {
		public var srcCity:City;
		public var destCity:City;
		public function BuySoldier(src:City, dest:City) {
			this.addEventListener(MouseEvent.CLICK, generateSoldier);
			this.srcCity = src;
			this.destCity = dest;
		}
		function generateSoldier(e: MouseEvent): void {
			var s:Soldier = new Soldier();
			stage.addChild(s);
			s.x = this.srcCity.x;// + (this.srcCity.width - s.width)/2;
			s.y = this.srcCity.y;// + (this.srcCity.height - s.height)/2;
			s.GotoDestination(destCity, this.srcCity);
		}
	}

}