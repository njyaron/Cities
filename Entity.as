package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;

	public class Entity extends MovieClip
	{
		protected var dead:Boolean = false;
		protected var attackDamage:Number;
		protected var hp:Number;
		protected var user:Number;
		protected var isAttacking:Boolean;
		protected var attackWho = null;
		protected var attackClass:Class = null;
		protected var isAttacked:Boolean;

		public function Entity()
		{
		}

		
		private function attack(e:Event)
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
				kill();
			}
		}
		public function kill():void
		{
			this.dead = true;
			if (this.hasEventListener(Event.ENTER_FRAME))
			{
				this.removeEventListener(Event.ENTER_FRAME,attack);
			}
		}

	}
}
