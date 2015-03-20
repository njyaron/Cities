package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;


	public class BuySoldier extends SimpleButton {
		//public var srcCity:City;
		//public var destCity:City;
		private var PlayerID;
		private var user
		public function BuySoldier(user:User) {
			this.PlayerID = PlayerID;
			this.addEventListener(MouseEvent.CLICK, generateSoldier);
			//this.srcCity = src;
			//this.destCity = dest;
			this.user = user;
		}
		
		private function generateSoldier(e: MouseEvent): void {
			var ownerCity = Utils.getCapitalOfOwner(this.PlayerID);
			var s:Soldier = new Soldier(ownerCity,user.getDestination());
			stage.addChild(s);
			/*s.x = this.srcCity.x;// + (this.srcCity.width - s.width)/2;
			s.y = this.srcCity.y;// + (this.srcCity.height - s.height)/2;
			s.gotoDestination(destCity, this.srcCity);*/
		}
	}

}