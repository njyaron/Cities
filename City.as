package 
{

	import flash.display.MovieClip;
	import flash.events.Event;

	public class City extends Entity
	{
		private var attackedBy:Array = new Array();

		public function City()
		{
			this.hp = Utils.initLargeCityHP;
			//this.addEventListener(Event.ENTER_FRAME, hitTest);
			this.addEventListener(Event.ENTER_FRAME,attacking);

		}

		public function createSoldier(s:Soldier)
		{
			stage.addChild(s);
			s.x = this.x;
			s.y = this.y;
			s.gotoDestination(Utils.cityArray[Utils.superCityId], this);
		}
		public function cityDestroyed(attacker:Soldier)
		{
			//TODO: Implement cityDestroyed
		}
		
		private function attacking(e:Event)
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
						s.removeHP(this.attackDamage/60);
						available = true;
					}
					else
					{
						//attackedBy.
					}
				}
				if (!available)
				{
					isAttacked = false;
				}
			}
		}
		
		public function attacked(s:Soldier)
		{
			this.attackedBy.push(s);
			if (! this.isAttacked)
			{
				this.isAttacked = true;
			}
		}
	}

}
