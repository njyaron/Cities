package 
{

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Soldier extends Entity
	{
		private var speed:Number;
		private var attack:Number;
		private var hasDestination:Boolean;
		public var destination:City;

		public function Soldier()
		{
			super(); //run default constructor
			this.addEventListener(Event.ENTER_FRAME,Move);
			this.speed = 1; //TO IMPORVE - if we have more soldier
		}
		
		public function gotoDestination(dest:City, src:City) {
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

		private function move(e)
		{
			var next:City = destPath[destPath.length - 1];
			this.y +=  utils.cmp(next.y,this.y) * this.speed;
			this.x +=  utils.cmp(next.x,this.x) * this.speed;

		}
		
		override public function kill():void //THIS IS OVERRIGHT!!!
		{
			super.kill(); //run super Kill function
			if (this.hasEventListener(Event.ENTER_FRAME))
			{
				this.removeEventListener(Event.ENTER_FRAME,Move);
			}
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
			this.destination.attacked(this);
			this.attackWho = attackWho;
			this.attackClass = flash.utils.getDefinitionByName(flash.utils.getQualifiedClassName(attackWho)) as Class;// Don't ask... gives me the type of object
			this.addEventListener(Event.ENTER_FRAME,attack);
		}

	}
}
