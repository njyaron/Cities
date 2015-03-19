package 
{

	import flash.display.MovieClip;
	import flash.events.Event;

	public class City extends MovieClip
	{


<<<<<<< HEAD
	public class Utils extends MovieClip {
		
		private var cityHP: Number; 
		private var cityAttack: Number;
		private var owner: Number;
		public var id: Number;
		
		public function City() {
			this.cityHP = Constants.initLargeCityHP;
			
=======
		private var hp:Number;
		private var attack:Number;//per second
		private var owner:Number;
		private var isAttacked:Boolean;
		private var attackedBy:Array = new Array();

		public function City()
		{
			this.hp = Constants.initLargeCityHP;
			this.addEventListener(Event.ENTER_FRAME,Attacking);
			//this.addEventListener(Event.ENTER_FRAME, hitTest);
>>>>>>> e1653ca19fdd30aeebc5fe92cac4632ffc24be49
			// constructor code
		}

		public function CreateSoldier(s:Soldier)
		{
			stage.addChild(s);
			s.x = this.x;
			s.y = this.y;
			s.GoToDestination();
		}
		/*public function hitTest(e:Event)
		{
		}*/
		public function removeHP(ammount:Number, attacker:Soldier)
		{
			this.HP -=  ammount;
			if (this.HP <= 0)
			{
				cityDestroyed(attacker);
			}
		}
		public function cityDestroyed(attacker:Soldier)
		{
			//TODO: Implement cityDestroyed
		}
		public function Attacked(s:Soldier)
		{
			this.attackedBy.push(s);
			if (! this.isAttacked)
			{
				this.isAttacked = true;
			}
		}
		private function Attacking(e:Event)
		{
			//TODO: set frame to attack frame;
			if (isAttacked)
			{
				var available:Boolean = false;
				for (var i:Number = 0; i < attackedBy.length; i++)
				{
					var s:Soldier = attackedBy[i];
					if (! s.isDead())
					{
						s.removeHP(this.attack/60);
						available = true;
					}
					else
					{
						//attackedBy.
					}
				}
				if (! availble)
				{
					isAttacked = false;
				}
			}
		}
	}

}
