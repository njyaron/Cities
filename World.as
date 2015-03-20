package {

	public class World {
		//Utils.patharray
		//Utils.cityarray
		public function World() {
			this.addEventListener(Event.ENTER_FRAME, runCollisions);
		}

		public function runCollisions(e){
			calculateColisionsInPath();
			calculateCollisionsAroundCity();
		}
		
		public function calculateCollisionsInPath() {
			for (var i = 0; i < pathArray.length; i++) {
				var sorted = pathArray[i].getSortedLocations();
				for (var j = 1; j < sorted.length; j++) {
					if (sorted[j].user != sorted[j - 1].user) { //If we run into someone owned by the enemy
						for (var k = j - 1; Utils.hitTest(sorted[k], sorted[j]); k--) {
							sorted[j].attacked(sorted[k].damage);
						}
						if (Utils.hitTest(sorted[j - 1], sorted[j])) {
							sorted[j - 1].attacked(sorted[j].damage);
						}
					}
				}
			}
		}

		public function calculateCollisionsAroundCity() {
			for (var i = 0; i < cityArray.length; i += 2) {
				var paths = getAdjacentPathFromCity(cityArray[i]);
				for (var j = 0; j < paths.length; j++) {
					for (var k = 0; k < paths[j].length; k++) {
						if (Utils.hitTest(paths[j][k], cityArray[i])) {
							paths[j][k].attacked(cityArray[i].getDamage());
							cityArray[i].attacked(paths[j][k].getDamage());
						}
					}
				}
			}
		}

		private function getAdjacentPathFromCity(c: City) { //Return an array of paths linked to a city
			trace("getAdjacentPathFromCity not implemented");
		}

	}

}