package {

	public class City {

		private var hp: Number;
		private var damage: Number;
		private var regen: Number;
		private var user;
		private var soldierCount: Number;
		private var attackedThisFrame;
		private var ID;
		private var isLargeCity;

		public function City(ID, user, largeCity: Boolean, fictive:Boolean) {
			if (largeCity) {
				this.hp = Utils.initLargeCityHP;
				this.damage = Utils.initLargeCityAttackDamage; //check this exists
				this.regen = Utils.initLargeCityRegen;
			} else {
				this.hp = Utils.initSmallCityHP;
				this.damage = Utils.initSmallCityAttackDamage; //check this exists
				this.regen = Utils.initSmallCityRegen;
			}
			this.isLargeCity = largeCity;
			this.soldierCount = 0;
			this.user = user;
			this.ID = ID;
			if(!fictive){
			this.addEventListener(Event.ENTER_FRAME, regenerateHealth);
			this.addEventListener(Event.ENTER_FRAME, resetFrameAttack);
						this.addEventListener(MouseEvent.MOUSE_CLICK, selectCity);
			}	
		}

		public function getUser() {
			return this.user;
		}

		public function getX {
			return this.x;
		}

		public function getY {
			return this.y;
		}
		public function getDamage() {
			return this.damage;
		}
		
		public function getIsLargeCity(){
			return isLargeCity;
		}

		public function attacked(damage: Number, attacker: Soldier) {
			this.attackedThisFrame = true;
			this.hp -= damage;
			if (this.hp < 0) { //change owner if HP is negative
				this.user = attacker.getUser();
			}
		}

		public function reinforcement(reinforcer: Soldier) {
			this.hp += Utils.largeCityReinforcementHPFactor * reinforcer.hp;
		}

		private function regenerateHealth(e) {
			this.hp += this.regen;
		}

		private function resetFrameAttack() {
			this.attackedThisFrame = false;
		}
		public functon isDead() {
			return this.hp < 0;
		}

		private function selectCity() {
			player.setDestination(this);
		}
	}

}