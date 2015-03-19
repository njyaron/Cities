package  {
	
	import flash.display.MovieClip;
	import fl.motion.easing.Circular;
	import flash.events.Event;
	
	public class Soldier extends MovieClip {
		
		private function cmp(a:Number, b:Number)
		{
				if (a>b)
					return 1;
				if (b>a) 
					return -1;
				return 0;
		
		}
		
		private var speed: Number;
		private var attack: Number;
		private var hp: Number;
		private var owner: Number;
		private var destPath : Array;
		
		public function GotoDestination(dest:City) {
			//destPath = getPathFromCity(dest);
			this.destPath = [dest];
		}
		public function Soldier() {
			this.addEventListener(Event.ENTER_FRAME, MoveSoldier);
			this.speed = 1;
		}
		private function MoveSoldier(e) {
			var next:City = destPath[destPath.length - 1];
			this.y += cmp(next.y, this.y) * speed;
			this.x += cmp(next.x, this.x) * speed;			
		}
	}
	
}
