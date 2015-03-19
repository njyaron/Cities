package 
{

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Soldier extends MovieClip
	{
		private var dead:Boolean = false;
		private var soldierSpeed:Number;
		private var speed:Number;
		private var attack:Number;
		private var hp:Number;
		private var owner:Number;
		private var hasDestination:Boolean;
		public var destination:City;
		private var attacking:Boolean;
		private var attackWho = null;
		private var attackClass:Class = null;
		private var attacked:Boolean;


		public function GotoDestination(dest:City, src:City) {
			this.destPath = [dest];
			if (dest != Utils.superCityId)
			{
				var d = dest.id, s = src.id, n = utils.cityCount;
				var sign = 1;
				if ( (d-s+n)%n > (s-d+n)%n ) 
					sign = -1;
				while ( Math.abs(d-s) > 1)
				{
					if ( d%2==1) 
						d += sign;
					else
						d += 2*sign;
					this.destPath.push( Utils.cityArray[d] );
				}
			}
		}
		public function Soldier()
		{
			this.addEventListener(Event.ENTER_FRAME,MoveSoldier);
			this.speed = 1;
		}

		private function hitTest(e:Event)
		{
			if (hasDestination)
			{
				if (utils.hitTest(this,destination))
				{
					if (! attacking)
					{
						startAttack(destination);
					}
				}
				else if (false)
				{

				}
			}
		}
		private function MoveSoldier(e)
		{
			var next:City = destPath[destPath.length - 1];
			this.y +=  utils.cmp(next.y,this.y) * this.speed;
			this.x +=  utils.cmp(next.x,this.x) * this.speed;

		}
		private function startAttack(attackWho)
		{
			this.attacking = true;
			this.destination.Attacked(this);
			this.attackWho = attackWho;
			this.attackClass = flash.utils.getDefinitionByName(flash.utils.getQualifiedClassName(yourObject)) as Class;// Don't ask... gives me the type of object
			this.addEventListener(Event.ENTER_FRAME,Attack);
		}
		private function Attack(e:Event)
		{

			if (this.attackClass == City)
			{
				this.attackWho.removeHP(this.attack);
			}
		}
		public function isDead():Boolean
		{
			return dead;
		}
		public function removeHP(ammount:Number,attacker:Object)
		{
			this.hp -=  ammount;
			if (this.hp <= 0)
			{
				Kill();
			}
		}
		public function Kill():void
		{
			this.dead = true;
			if (this.hasEventListener(Event.ENTER_FRAME))
			{
				this.removeEventListener(Event.ENTER_FRAME,Attack);
				this.removeEventListener(Event.ENTER_FRAME,MoveSoldier);
			}
		}

	}
}
