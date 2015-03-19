package 
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Soldier extends MovieClip
	{

		private var dead:Boolean = false;
		private var soldierSpeed:Number;
		private var Attack:Number;
		private var hp:Number;
		private var owner:Number;
		private var hasDestination:Boolean;
		public var destination:City;
		private var attacking:Boolean;
		private var attackWho = null;
		private var attackClass:Class = null;
		private var attacked:Boolean;

		public function GoToDestination()
		{
			//NotImplemented
		}
		public function Soldier()
		{

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
		private function startAttack(attackWho)
		{
			this.attacking = true;
			this.destination.Attacked(this);
			this.attackWho = attackWho;
			this.attackClass = flash.utils.getDefinitionByName(flash.utils.getQualifiedClassName(yourObject)) as Class;// Don't ask... gives me the type of object
			this.addEventListener(Event.ENTER_FRAME, Attack);
		}
		private function Attack(e:Event)
		{

			if (this.attackClass == City)
			{
				this.attackWho.removeHP(this.soldierAttack);
			}
		}
		public function isDead():Boolean
		{
			return dead;
		}
		public function removeHP(ammount:Number, attacker:Object)
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
				this.removeEventListener(Event.ENTER_FRAME, Attack);
			}
		}

	}
}